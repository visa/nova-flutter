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
// Visa Nova Flutter Demo Dialog Page
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:flutter/material.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class Dialogs extends StatelessWidget {
  const Dialogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    setPageTitle('Dialog', context);
    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Dialog"),
        drawer: const MyDrawer(pageTitle: "Dialog"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SemanticHeader(
                    title: "Default dialog",
                  ),
                  smallHeight(),
                  const VDialogInformational(),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VDialogInformational,
                    componentName: 'Dialog',
                    exampleName: 'Informational_Dialog',
                    copyLabel: "Show informational dialog",
                  ),
                  smallHeight(),
                  const SemanticHeader(
                    title: "Success dialog",
                  ),
                  smallHeight(),
                  const VDialogSuccess(),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VDialogSuccess,
                    componentName: 'Dialog',
                    exampleName: 'Success_Dialog',
                    copyLabel: "Show success dialog",
                  ),
                  smallHeight(),
                  const SemanticHeader(
                    title: "Warning dialog",
                  ),
                  smallHeight(),
                  const VDialogWarning(),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VDialogWarning,
                    componentName: 'Dialog',
                    exampleName: 'Warning_Dialog',
                    copyLabel: "Show warning dialog",
                  ),
                  smallHeight(),
                  const SemanticHeader(
                    title: "Error dialog",
                  ),
                  smallHeight(),
                  const VDialogError(),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VDialogError,
                    componentName: 'Dialog',
                    exampleName: 'Error_Dialog',
                    copyLabel: "Show error dialog",
                  ),
                  smallHeight(),
                  const SemanticHeader(
                    title: "Touring tips dialog",
                  ),
                  smallHeight(),
                  showDialogNested(context),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.showDialogNested,
                    componentName: 'Dialog',
                    exampleName: 'Nested_Dialog',
                    copyLabel: "Show nested dialog",
                  ),
                ]),
          ),
        ),
      ),
    );
  }

// BEGIN showDialogNested
  VButton showDialogNested(BuildContext context) {
    return VButton(
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
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return VDialogNested(
              pages: [
                VDialogNestedContent(
                  pageNumberBackgroundColor: VColors.defaultSurfaceHighlight,
                  title: "Touring tips dialog",
                  subtitle: "Touring tips instructions",
                  description:
                      "This is required text that describes the dialog title in more detail.",
                  pageNumber: "1",
                ),
                VDialogNestedContent(
                  pageNumberBackgroundColor: VColors.defaultSurfaceHighlight,
                  title: "Touring tips dialog",
                  subtitle: "Touring tips instructions",
                  description:
                      "This is required text that describes the dialog title in more detail.",
                  pageNumber: "2",
                ),
                VDialogNestedContent(
                  pageNumberBackgroundColor: VColors.defaultSurfaceHighlight,
                  title: "Touring tips dialog",
                  subtitle: "Touring tips instructions",
                  description:
                      "This is required text that describes the dialog title in more detail.",
                  pageNumber: "3",
                ),
                VDialogNestedContent(
                  pageNumberBackgroundColor: VColors.defaultSurfaceHighlight,
                  title: "Touring tips dialog",
                  subtitle: "Touring tips instructions",
                  description:
                      "This is required text that describes the dialog title in more detail.",
                  pageNumber: "4",
                ),
              ],
            );
          },
        );
      },
      child: const Text("Open touring tips dialog"),
    );
  }
}
// END

// BEGIN VDialogSuccess
class VDialogSuccess extends StatelessWidget {
  const VDialogSuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
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
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.white,
                child: const VDialogContent(
                  hasX: true,
                  dialogState: DialogState.success,
                  title: "Success title",
                  description:
                      "This is required text that describes the dialog title in more detail.",
                  dismissText: "Close",
                ),
              );
            });
      },
      child: const Text("Open success dialog"),
    );
  }
}
// END

// BEGIN VDialogError
class VDialogError extends StatelessWidget {
  const VDialogError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
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
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.white,
                child: const VDialogContent(
                  hasX: true,
                  dialogState: DialogState.error,
                  title: "Error title",
                  description:
                      "This is required text that describes the dialog title in more detail.",
                  dismissText: "Close",
                ),
              );
            });
      },
      child: const Text("Open error dialog"),
    );
  }
}
// END

// BEGIN VDialogWarning
class VDialogWarning extends StatelessWidget {
  const VDialogWarning({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
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
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.white,
                child: const VDialogContent(
                  hasX: true,
                  dialogState: DialogState.warning,
                  title: "Warning title",
                  description:
                      "This is required text that describes the dialog title in more detail.",
                  dismissText: "Close",
                ),
              );
            });
      },
      child: const Text("Open warning dialog"),
    );
  }
}
// END

// BEGIN VDialogInformational
class VDialogInformational extends StatelessWidget {
  const VDialogInformational({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
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
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.white,
                child: VDialogContent(
                  hasX: true,
                  dialogState: DialogState.normal,
                  title: "Default title",
                  description:
                      "This is required text that describes the dialog title in more detail.",
                  dialogAction: () {},
                  actionText: "Primary action",
                  dismissText: "Close",
                ),
              );
            });
      },
      child: const Text("Open default dialog"),
    );
  }
}
// END