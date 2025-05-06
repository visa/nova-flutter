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
// import 'package:demo/layout/adaptive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'codeviewer/code_displayer.dart';

// import 'package:google_tag_manager/google_tag_manager.dart' as gtm if(dart.library.html) 'other lib';
class CodeDisplay extends StatelessWidget {
  const CodeDisplay({
    required this.code,
    required this.copyLabel,
    required this.exampleName,
    required this.componentName,
    Key? key,
  }) : super(key: key);

  final CodeDisplayer code;
  final String exampleName, componentName;
  final String copyLabel;

  @override
  Widget build(BuildContext context) {
    // final isDesktop = isDisplayDesktop(context);

    final _richTextCode = code(context);
    final _plainTextCode = _richTextCode.toPlainText();

    void _showSnackBarOnCopySuccess(dynamic result) {
      ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.success,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            hasClose: true,
            title: "Success",
            description: "Copied to clipboard.",
            flagState: FlagState.success,
            onClosePressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          )));
    }

    void _showSnackBarOnCopyFailure(Object exception) {
      ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.error,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            hasClose: true,
            title: "Error",
            description: "Failed to copy to clipboard.",
            flagState: FlagState.error,
            onClosePressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          )));
    }

    void _onClick() async {
      // gtm.pushEvent('gtm.click',
      //     data: {'gtm.elementId': 'copy_code_${componentName}_$exampleName'});
      await Clipboard.setData(ClipboardData(text: _plainTextCode)).then(_showSnackBarOnCopySuccess).catchError(_showSnackBarOnCopyFailure);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Code snippet', style: defaultVTheme.textStyles.bodyText2),
            Column(
              children: [
                VButton(
                  style: VButtonStyle(
                    backgroundColorActive: Colors.transparent,
                    backgroundColorDisabled: Colors.transparent,
                    foregroundColorActive: VColors.defaultActive,
                    foregroundColorDisabled: VColors.defaultDisabled,
                    overlayColorPressed: VColors.defaultSurfaceLowlight,
                  ),
                  onPressed: _onClick,
                  child: Icon(
                    Icons.copy_rounded,
                    color: VColors.defaultActive,
                    semanticLabel: "Copy $copyLabel code",
                  ),
                ),
                Text("Copy", style: defaultVTheme.textStyles.uiLabelSmall),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SelectableText.rich(
            _richTextCode,
            textDirection: TextDirection.ltr,
          ),
        ),
      ],
    );
  }
}
