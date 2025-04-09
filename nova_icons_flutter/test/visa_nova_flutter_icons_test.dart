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

void extractSvgContent(String folderPath, String outputFilePath) {
  Directory dir = Directory(folderPath);
  StringBuffer buffer = StringBuffer();

  dir.listSync().forEach((file) {
    if (file is File && file.path.endsWith('.svg')) {
      // Read the SVG file
      String svgContent = file.readAsStringSync();

      // Remove newlines and quotes from the SVG content
      svgContent = svgContent.replaceAll('\n', '').replaceAll('\'', '\\\'');

      // Write the SVG content as a string to the buffer
      buffer.writeln(
          'const String ${_getVariableName(file.path)} = \'$svgContent\';');
    }
  });

  // Write the buffer to the output file
  File output = File(outputFilePath);
  output.writeAsStringSync(buffer.toString());
}

String _getVariableName(String path) {
  // Get the filename without the extension
  String filename = path.split('/').last.split('.').first;

  // Remove hyphens and convert to camel case
  List<String> words = filename.split('-');
  String variableName = words[0];
  for (int i = 1; i < words.length; i++) {
    variableName += words[i][0].toUpperCase() + words[i].substring(1);
  }

  return variableName;
}

void main() {
  test();
}

test() {
  extractSvgContent('assets/', 'lib/svg_content.dart');
}
