//
//              © 2025 Visa
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//        http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//
import 'dart:io';
import 'package:xml/xml.dart';

void main() {
  // Setup read and write location
  final directory = Directory('Visa');
  final outputDartFile = File('svg_content_new.dart');
  final buffer = StringBuffer();

  // Taking some typos into this too
  String parseSize(String sizeString) {
    if (sizeString.contains('tiny')) return 'Tiny';
    if (sizeString.contains('tIny')) return 'Tiny';
    if (sizeString.contains('low')) return 'Low';
    if (sizeString.contains('default')) return 'Low';
    if (sizeString.contains('high')) return 'High';
    if (sizeString.contains('hIgh')) return 'High';
    if (sizeString.contains('Tiny')) return 'Tiny';
    if (sizeString.contains('TIny')) return 'Tiny';
    if (sizeString.contains('Low')) return 'Low';
    if (sizeString.contains('Default')) return 'Low';
    if (sizeString.contains('High')) return 'High';
    if (sizeString.contains('HIgh')) return 'High';
    return '';
  }

  // Format name to reduce refactor work
  String formatName(String name, String size) {
    name = name.toLowerCase().replaceAllMapped(
        RegExp(r'-(\w)'), (match) => match.group(1)!.toUpperCase());
    final sizeNote = {
      'Tiny': 'Tiny',
      'Low': 'Low',
      'High': 'High',
    }[parseSize(size)];

    if (sizeNote != null) {
      final formattedName =
          '${name[0].toLowerCase()}${name.substring(1)}$sizeNote';
      return '${formattedName[0].toLowerCase()}${formattedName.substring(1)}';
    }
    return '';
  }

  // Helper to remove spaces between tags
  String removeSpaces(String input) {
    return input
        .replaceAllMapped(RegExp(r'(?<=>)[ \t\n\r]*(?=<)'), (match) => "")
        .trim();
  }

  buffer.writeln('class VIcons {');

  for (final file in directory.listSync()) {
    //print('Processing: ${file.path}');
    if (file is File && file.path.endsWith('.svg')) {
      //print('Checking file: ${file.path}');
      final fullContent = file.readAsStringSync();
      // Skip the first 16 lines (license header)
      final lines = fullContent.split('\n');
      final content = lines.length > 16 ? lines.skip(16).join('\n') : fullContent;
      //print('File content: $content');
      final document = XmlDocument.parse(content);

      // Extract name and size from the filename
      final fileName = file.uri.pathSegments.last;
      final nameMatch = RegExp(r'Name=([\w\-]+)').firstMatch(fileName);
      final sizeMatch = RegExp(r'Size=([\w\-]+)').firstMatch(fileName);

      if (nameMatch == null || sizeMatch == null) {
        //print('Could not extract name or size from filename: $fileName');
        continue;
      }

      final nameValue = nameMatch.group(1)!;
      final sizeValue = sizeMatch.group(1)!;
      //print('Icon name extracted: $nameValue');
      //print('Icon size extracted: $sizeValue');

      final formattedName = formatName(nameValue, sizeValue);
      //print('Formatted name: $formattedName');

      // Modify paths if needed
      for (final XmlElement element in document.findAllElements('path')) {
        final pathID = element.getAttribute('id');
        if (pathID == 'path-2') {
          element.setAttribute('fill', '#FCC015');
        } else if (pathID == 'path-1') {
          element.setAttribute('fill', '#1434CB');
        }
      }

      final svgContent = removeSpaces(document.toXmlString(pretty: false));
      buffer.writeln('  static const $formattedName = \'$svgContent\';');

      // Add alt variant
      for (final XmlElement element in document.findAllElements('path')) {
        final pathID = element.getAttribute('id');
        if (pathID == 'path-1') {
          element.setAttribute('fill', '#FFFFFF');
        }
      }
      final altSvgContent = removeSpaces(document.toXmlString(pretty: false));
      buffer.writeln(
          '  static const ${formattedName}Alternate = \'$altSvgContent\';');
    }
  }

  buffer.writeln('}');
  outputDartFile.writeAsStringSync(buffer.toString());
}
