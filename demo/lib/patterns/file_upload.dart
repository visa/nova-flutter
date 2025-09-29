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
// Visa Nova Flutter Demo File Upload Page

// BEGIN FileUploadPage
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/main.dart';

enum FileStatus { uploading, success, idle }

class FileUploadStatus {
  final String fileName;
  FileStatus status;
  FileUploadStatus(
      {required this.fileName, this.status = FileStatus.uploading});
}

String truncateFileName(String fileName, int maxLength) {
  if (fileName.length <= maxLength) {
    return fileName;
  }
  int extensionIndex = fileName.lastIndexOf('.');
  if (extensionIndex == -1 || extensionIndex == 0) {
    return fileName.substring(0, maxLength);
  }
  String extension = fileName.substring(extensionIndex);
  String nameWithoutExtension = fileName.substring(0, extensionIndex);
  int charsToShow = maxLength - extension.length - 3; // 3 for the ellipsis
  if (charsToShow <= 0) {
    return fileName.substring(0, maxLength);
  }
  int frontChars = (charsToShow / 2).ceil();
  int backChars = (charsToShow / 2).floor();
  return nameWithoutExtension.substring(0, frontChars) +
      '...' +
      nameWithoutExtension.substring(nameWithoutExtension.length - backChars) +
      extension;
}

class FileUploadPage extends StatefulWidget {
  const FileUploadPage({super.key});

  @override
  State<FileUploadPage> createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final List<FileUploadStatus> _mockFiles = [];

  void _mockFileSelection() {
    String nextFileName = _getNextFileName();
    setState(() {
      _mockFiles.add(FileUploadStatus(fileName: nextFileName));
    });
    int index = _mockFiles.length - 1;
    // Simulate progress (uploading -> success -> idle)
    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        if (index < _mockFiles.length) {
          _mockFiles[index].status = FileStatus.success;
        }
      });
      Timer(const Duration(seconds: 2), () {
        if (!mounted) return;
        setState(() {
          if (index < _mockFiles.length) {
            _mockFiles[index].status = FileStatus.idle;
          }
        });
      });
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
      onPopInvokedWithResult: (bool didPop, Object? result) {
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
                'Choose one or more files, up to [X file size] each. Accepted file types are [X], [X], and [X].',
                style: defaultVTheme.textStyles.uiLabelSmall,
              ),
              const SizedBox(height: 20),
              VButton(
                child: const Text(
                  "Select file(s)",
                ),
                onPressed: _mockFileSelection,
                style: VButtonStyle(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
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
                  itemCount: _mockFiles.length + 1, // +1 for error tile at end
                  itemBuilder: (context, index) {
                    if (index < _mockFiles.length) {
                      // Regular file list items
                      final fileStatus = _mockFiles[index];
                      final fileName = fileStatus.fileName;
                      final truncatedFileName = truncateFileName(fileName, 34);
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
                          child: VListItem(
                            // onTap: () {},
                            style: const VListItemStyle(
                              borderRadius: 8,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
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
                                          truncatedFileName,
                                          style:
                                              defaultVTheme.textStyles.uiLabel,
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          "9.2MB",
                                          style: defaultVTheme
                                              .textStyles.uiLabelSmall
                                              .copyWith(
                                            color: VColors.defaultTextSubtle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  _buildStatusWidget(fileStatus.status),
                                  Semantics(
                                    label: 'Remove file',
                                    excludeSemantics: true,
                                    button: true,
                                    enabled: true,
                                    child: VIconButton(
                                      style: VButtonStyle(
                                        minimumSize: const Size(44, 44),
                                        backgroundColorActive:
                                            VColors.transparent,
                                        backgroundColorDisabled:
                                            VColors.transparent,
                                        foregroundColorActive:
                                            VColors.defaultActive,
                                        foregroundColorDisabled:
                                            VColors.disabled,
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
                                        iconHeight: 20,
                                        iconWidth: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      // Last item: error tile
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: FileUploadErrorTile(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusWidget(FileStatus status) {
    switch (status) {
      case FileStatus.uploading:
        return const Padding(
          padding: EdgeInsets.only(right: 22.0),
          child: SizedBox(
            height: 20,
            width: 20,
            child: VCircularProgressIndicator(
              value: null,
              strokeWidth: 2,
              color: VColors.defaultActive,
            ),
          ),
        );
      case FileStatus.success:
        return const Padding(
          padding: EdgeInsets.only(right: 22.0),
          child: VIcon(
            svgIcon: VIcons.successTiny,
            iconColor: VColors.positiveGraphics,
            iconHeight: 20,
            iconWidth: 20,
          ),
        );
      case FileStatus.idle:
        return const SizedBox(width: 22); // empty space for alignment
    }
  }
}

// Error ListTile Widget
class FileUploadErrorTile extends StatelessWidget {
  const FileUploadErrorTile({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 6.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: VColors.negativeGraphics, // red border
              width: 1,
            ),
          ),
          child: VListItem(
            onTap: () {},
            style: const VListItemStyle(
              borderRadius: 8,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("File X.pdf",
                            style: defaultVTheme.textStyles.uiLabel),
                        const SizedBox(height: 2),
                        Text(
                          "9.2MB",
                          style: defaultVTheme.textStyles.uiLabelSmall.copyWith(
                            color: VColors.defaultTextSubtle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Semantics(
                      label: 'Re-upload file',
                      excludeSemantics: true,
                      button: true,
                      enabled: true,
                      child: VIconButton(
                        style: VButtonStyle(
                          minimumSize: const Size(44, 44),
                          backgroundColorActive: VColors.transparent,
                          backgroundColorDisabled: VColors.transparent,
                          foregroundColorActive: VColors.defaultActive,
                          foregroundColorDisabled: VColors.disabled,
                          overlayColorFocused: VColors.defaultSurfaceLowlight,
                          overlayColorPressed: VColors.defaultSurfaceLowlight,
                          borderSideDisabled: BorderSide(
                            color: VColors.defaultDisabled,
                            style: BorderStyle.solid,
                          ),
                        ),
                        onPressed: () {},
                        icon: const VIcon(
                          svgIcon: VIcons.reloadTiny,
                          iconColor: VColors.defaultActive,
                          iconHeight: 20,
                          iconWidth: 20,
                        ),
                      ),
                    ),
                  ),
                  Semantics(
                    label: 'Remove file',
                    excludeSemantics: true,
                    button: true,
                    enabled: true,
                    child: VIconButton(
                      style: VButtonStyle(
                        minimumSize: const Size(44, 44),
                        backgroundColorActive: VColors.transparent,
                        backgroundColorDisabled: VColors.transparent,
                        foregroundColorActive: VColors.defaultActive,
                        foregroundColorDisabled: VColors.disabled,
                        overlayColorFocused: VColors.defaultSurfaceLowlight,
                        overlayColorPressed: VColors.defaultSurfaceLowlight,
                        borderSideDisabled: BorderSide(
                          color: VColors.defaultDisabled,
                          style: BorderStyle.solid,
                        ),
                      ),
                      onPressed: () {},
                      icon: const VIcon(
                        svgIcon: VIcons.deleteTiny,
                        iconColor: VColors.defaultActive,
                        iconHeight: 20,
                        iconWidth: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            const VIcon(
              svgIcon: VIcons.errorTiny,
              iconColor: VColors.negativeGraphics,
            ),
            const SizedBox(width: 4),
            Text(
              "Error: This is mandatory text describing the error.",
              style: defaultVTheme.textStyles.uiLabelSmall.copyWith(
                color: VColors.negativeText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
// END
