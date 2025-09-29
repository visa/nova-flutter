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
// START GENAI
import 'dart:io';

void main() {
  final dir = Directory('Generic/');

  final files = dir.listSync().where((file) => file.path.endsWith('.svg'));

  final output = StringBuffer('class VIconsGeneric {\n');

  for (final file in files) {
    final fileName = file.path.split('/').last.split('.').first;
    final parts = fileName.split(', ');
    final name = parts[1].split('=')[1];

    // Convert hyphen-separated name to camelCase
    final formattedName = name.split('-').map((part) {
      return part[0].toUpperCase() + part.substring(1).toLowerCase();
    }).join();
    // Make the first letter of the name lowercase
    final camelCaseName =
        formattedName[0].toLowerCase() + formattedName.substring(1);

    final size = parts[2].split('=')[1];

    String suffix = "";
    if (size == 'tiny') {
      suffix = 'Tiny';
    } else if (size == 'low') {
      suffix = 'Low';
    } else if (size == 'high') {
      suffix = 'High';
    } else if (size == 'Tiny') {
      suffix = 'Tiny';
    } else if (size == 'Low') {
      suffix = 'Low';
    } else if (size == 'High') {
      suffix = 'High';
    }

    final fullContent = File(file.path).readAsStringSync();
    // Skip the first 16 lines (license header)
    final lines = fullContent.split('\n');
    final contentWithoutLicense = lines.length > 16 ? lines.skip(16).join('\n') : fullContent;
    final content = contentWithoutLicense.replaceAll('\n', '');

    output.writeln('static const $camelCaseName$suffix = \'$content\';');
  }

  output.writeln('}');

  final outputFile = File('svg_content_generic_new.dart');
  outputFile.writeAsStringSync(output.toString());
}

// END GENAI
