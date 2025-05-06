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
import 'package:demo/codeviewer/code_colors.dart';
import 'package:demo/codeviewer/code_style.dart';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:demo/code_display.dart';

class ShowCodeAccordion extends StatelessWidget {
  const ShowCodeAccordion({
    required this.copyLabel,
    required this.codeSegment,
    required this.exampleName,
    required this.componentName,
    Key? key,
  }) : super(key: key);
  final TextSpan Function(BuildContext) codeSegment;
  final String exampleName, componentName;
  final String copyLabel;

  @override
  Widget build(BuildContext context) {
    return VAccordion(
      title: "Show code",
      body: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: CodeStyle(
            baseStyle: defaultVTheme.textStyles.bodyText3
                .copyWith(color: CodeColors.baseStyle),
            numberStyle: defaultVTheme.textStyles.bodyText3
                .copyWith(color: CodeColors.numberStyle),
            commentStyle: defaultVTheme.textStyles.bodyText3
                .copyWith(color: CodeColors.commentStyle),
            keywordStyle: defaultVTheme.textStyles.bodyText3
                .copyWith(color: CodeColors.keywordStyle),
            stringStyle: defaultVTheme.textStyles.bodyText3
                .copyWith(color: CodeColors.stringStyle),
            punctuationStyle: defaultVTheme.textStyles.bodyText3
                .copyWith(color: CodeColors.punctuationStyle),
            classStyle: defaultVTheme.textStyles.bodyText3
                .copyWith(color: CodeColors.classStyle),
            constantStyle: defaultVTheme.textStyles.bodyText3
                .copyWith(color: CodeColors.constantStyle),
            child: CodeDisplay(
              code: codeSegment,
              copyLabel: copyLabel,
              componentName: componentName,
              exampleName: exampleName,
            ),
          ),
        ),
      ),
    );
  }
}
