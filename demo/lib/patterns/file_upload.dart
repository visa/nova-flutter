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
import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

class FileUploadPage extends StatefulWidget {
  const FileUploadPage({super.key});

  @override
  State<FileUploadPage> createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final List<String> _mockFiles = [];

  void _mockFileSelection() {
    String nextFileName = _getNextFileName();
    setState(() {
      _mockFiles.add(nextFileName);
    });
  }

  String _getNextFileName() {
    int fileCount = _mockFiles.length;
    if (fileCount < 26) {
      String alphabet = String.fromCharCode(65 + fileCount);
      return 'File $alphabet.pdf';
    } else {
      return 'File Z.pdf';
    }
  }

  void _removeFile(int index) {
    setState(() {
      _mockFiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    setPageTitle('File upload', context);

    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "File upload"),
        drawer: const MyDrawer(pageTitle: "File upload"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload files',
                style: defaultVTheme.textStyles.subtitle1,
              ),
              const SizedBox(height: 10),
              Text(
                'Choose one or more files. Accepted file types are [X], [X], and [X] up to [X file size].',
                style: defaultVTheme.textStyles.uiLabelSmall,
              ),
              const SizedBox(height: 20),
              VButton(
                child: const Text(
                  "Select file(s)",
                ),
                onPressed: _mockFileSelection,
                style: VButtonStyle(
                  backgroundColorActive: VColors.transparent,
                  backgroundColorDisabled: VColors.transparent,
                  foregroundColorActive: VColors.defaultActive,
                  foregroundColorDisabled: VColors.disabled,
                  overlayColorFocused: VColors.defaultSurfaceLowlight,
                  overlayColorPressed: VColors.defaultSurfaceLowlight,
                  borderSideActive: const BorderSide(
                    color: VColors.defaultActive,
                    style: BorderStyle.solid,
                  ),
                  borderSideDisabled: BorderSide(
                    color: VColors.defaultDisabled,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _mockFiles.length,
                  itemBuilder: (context, index) {
                    final fileName = _mockFiles[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: VColors.defaultBorder,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: VListItem(
                            style: const VListItemStyle(
                              borderRadius: 8,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  const VIcon(
                                    svgIcon: VIcons.documentPdfLow,
                                    iconHeight: 24,
                                    iconWidth: 24,
                                    iconColor: VColors.defaultActive,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          fileName,
                                          style:
                                              defaultVTheme.textStyles.uiLabel,
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text("9.2MB",
                                            style: defaultVTheme
                                                .textStyles.uiLabelSmall
                                                .copyWith(
                                              color: VColors.defaultTextSubtle,
                                            )),
                                      ],
                                    ),
                                  ),
                                  VIconButton(
                                    style: VButtonStyle(
                                      minimumSize: const Size(46, 46),
                                      backgroundColorActive:
                                          VColors.transparent,
                                      backgroundColorDisabled:
                                          VColors.transparent,
                                      foregroundColorActive:
                                          VColors.defaultActive,
                                      foregroundColorDisabled: VColors.disabled,
                                      overlayColorFocused:
                                          VColors.defaultSurfaceLowlight,
                                      overlayColorPressed:
                                          VColors.defaultSurfaceLowlight,
                                      borderSideDisabled: BorderSide(
                                        color: VColors.defaultDisabled,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    onPressed: () => _removeFile(index),
                                    icon: const VIcon(
                                      svgIcon: VIcons.deleteTiny,
                                      iconColor: VColors.defaultActive,
                                      iconHeight: 16,
                                      iconWidth: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
