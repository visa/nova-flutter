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
// Visa Nova Flutter Demo Wizard Page
import 'package:demo/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/ui/getting_started/getting_started.dart';

class WizardPage extends StatefulWidget {
  const WizardPage({super.key});

  @override
  State<WizardPage> createState() => _WizardPageState();
}

class _WizardPageState extends State<WizardPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    setPageTitle("Wizard", context);
    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
          key: _key,
          appBar: CustomAppBar(globalKey: _key, title: "Wizard"),
          drawer: const MyDrawer(
            pageTitle: "Wizard",
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  VButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WizardWidget(),
                        ),
                      );
                    },
                    child: const Text('Start wizard'),
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    copyLabel: "Example of wizard",
                    codeSegment: CodeSegments.VWizard,
                    exampleName: "Wizard",
                    componentName: "Wizard",
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class WizardWidget extends StatefulWidget {
  const WizardWidget({super.key});

  @override
  State<WizardWidget> createState() => _WizardWidgetState();
}

class _WizardWidgetState extends State<WizardWidget> {
  int currentIndex = 0;
  bool hasError = false;
  TextEditingController myLocalController1 = TextEditingController();
  TextEditingController myLocalController2 = TextEditingController();
  TextEditingController myLocalController3 = TextEditingController();
  String saveMessage = "";

  List<Widget> getFields() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: VInput(
          hasError: hasError,
          myLocalController: myLocalController1,
          errorText:
              "This is required text that describes the error in more detail.",
          topLabelText: "Label (required)",
          inputAction: TextInputAction.send,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: VInput(
          hasError: hasError,
          myLocalController: myLocalController2,
          errorText:
              "This is required text that describes the error in more detail.",
          topLabelText: "Label (required)",
          inputAction: TextInputAction.send,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: VInput(
          hasError: hasError,
          myLocalController: myLocalController3,
          errorText:
              "This is required text that describes the error in more detail.",
          topLabelText: "Label (required)",
          inputAction: TextInputAction.send,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          largeHeight(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " 1. Step 1 label",
                style: defaultVTheme.textStyles.headline4,
              ),
              Semantics(
                label: "edit",
                child: InkWell(
                  child: Container(
                    width: 44,
                    height: 44,
                    padding: const EdgeInsets.all(13.5),
                    child: const VIcon(
                      svgIcon: VIcons.editTiny,
                      iconColor: VColors.defaultActive,
                      iconHeight: 17,
                      iconWidth: 17,
                    ),
                  ),
                  onTap: () => goToPage(0),
                ),
              ),
            ],
          ),
          largeHeight(),
          Text("Label: ${myLocalController1.text}"),
          largeHeight(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " 2. Step 2 label",
                style: defaultVTheme.textStyles.headline4,
              ),
              Semantics(
                label: "edit",
                child: InkWell(
                  child: Container(
                    width: 44,
                    height: 44,
                    padding: const EdgeInsets.all(13.5),
                    child: const VIcon(
                      svgIcon: VIcons.editTiny,
                      iconColor: VColors.defaultActive,
                      iconHeight: 17,
                      iconWidth: 17,
                    ),
                  ),
                  onTap: () => goToPage(1),
                ),
              ),
            ],
          ),
          largeHeight(),
          Text("Label: ${myLocalController2.text}"),
          largeHeight(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " 3. Step 3 label",
                style: defaultVTheme.textStyles.headline4,
              ),
              Semantics(
                label: "edit",
                child: InkWell(
                  child: Container(
                    width: 44,
                    height: 44,
                    padding: const EdgeInsets.all(13.5),
                    child: const VIcon(
                      svgIcon: VIcons.editTiny,
                      iconColor: VColors.defaultActive,
                      iconHeight: 17,
                      iconWidth: 17,
                    ),
                  ),
                  onTap: () => goToPage(2),
                ),
              ),
            ],
          ),
          largeHeight(),
          Text("Label: ${myLocalController3.text}"),
          largeHeight(),
          largeHeight(),
        ],
      ),
    ];
  }

  void nextField() {
    var currentField = getFields()[currentIndex];
    if (currentField is Padding) {
      var child = currentField.child;
      if (child is VInput) {
        var controller = child.myLocalController;
        if (controller == null || controller.text.isEmpty) {
          setState(() {
            hasError = true;
          });
          SemanticsService.announce(
              "Error: This is required text that describes the error in more detail.",
              TextDirection.ltr);
          return;
        }
      }
    }

    setState(() {
      currentIndex = (currentIndex + 1) % getFields().length;
      hasError = false;
      saveMessage = "";
    });
  }

  void saveButton() {
    var currentField = getFields()[currentIndex];
    if (currentField is Padding) {
      var child = currentField.child;
      if (child is VInput) {
        var controller = child.myLocalController;
        if (controller == null || controller.text.isEmpty) {
          setState(() {
            hasError = true;
            saveMessage = "";
          });
          return;
        }
      }
    }

    setState(() {
      // currentIndex = (currentIndex + 1) % getFields().length;
      hasError = false;
      saveMessage = "Changes have been saved.";
    });
  }

  void goToPage(int pageNumber) {
    setState(() {
      currentIndex = pageNumber;
    });
  }

  void previousField() {
    setState(() {
      currentIndex =
          (currentIndex - 1 + getFields().length) % getFields().length;
      hasError = false;
    });
  }

  void submit() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SuccessPage()),
    );
  }

  @override
  void dispose() {
    myLocalController1.dispose();
    myLocalController2.dispose();
    myLocalController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(
        title: Text('Step ' + (currentIndex + 1).toString() + ' label'),
        leading: currentIndex == 0 ? const SizedBox.shrink() : null,
        backButtonAction: previousField,
        actionList: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 4, 16, 4),
            child: Semantics(
              label: "close",
              button: true,
              child: InkWell(
                customBorder: const CircleBorder(),
                splashColor: VColors.defaultSurfaceLowlight,
                child: Container(
                  width: 44,
                  height: 44,
                  padding: const EdgeInsets.all(10),
                  child: const ExcludeSemantics(
                    child: VIcon(
                      svgIcon: VIcons.closeLow,
                      iconHeight: 24,
                      iconWidth: 24,
                    ),
                  ),
                ),
                onTap: () {
                  currentIndex == 0
                      ? Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WizardPage(),
                          ),
                          (Route<dynamic> route) => false,
                        )
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.white,
                              child: VDialogContent(
                                hasX: true,
                                dialogState: DialogState.warning,
                                title: "Exit form?",
                                description:
                                    "This is required text that describes the dialog title in more detail.",
                                dismissText: "Cancel",
                                actionText: "Exit",
                                dialogAction: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WizardPage()),
                                    (Route<dynamic> route) => false,
                                  );
                                },
                              ),
                            );
                          });
                },
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            VWizardDefault(
              currentStep: currentIndex + 1,
              totalSteps: getFields().length,
              hasErrors: hasError,
              child: getFields()[currentIndex],
            ),
            largeHeight(),
            if (currentIndex < getFields().length - 1)
              VButton(
                child: const Text("Save"),
                onPressed: saveButton,
                style: VButtonStyle(
                  minimumSize: const Size(double.infinity, 46),
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
            largeHeight(),
            VButton(
              style: const VButtonStyle(
                minimumSize: Size(double.infinity, 46),
              ),
              onPressed:
                  currentIndex == getFields().length - 1 ? submit : nextField,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentIndex == getFields().length - 1 ? "Submit" : "Next",
                    style: defaultVTheme.textStyles.uiLabel.copyWith(
                      color: VColors.defaultSurface1,
                      fontWeight: VFontWeight.semiBold,
                      fontSize: 13,
                    ),
                  ),
                  smallWidth(),
                  currentIndex == getFields().length - 1
                      ? const SizedBox()
                      : const VIcon(
                          svgIcon: VIcons.arrowRightLow,
                          iconColor: VColors.defaultSurface1,
                          iconHeight: 17,
                          iconWidth: 17,
                        ),
                ],
              ),
            ),
            largeHeight(),
            if (saveMessage.isNotEmpty)
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    saveMessage,
                    style: defaultVTheme.textStyles.baseTextStyle,
                  )),
          ],
        ),
      ),
    );
  }
}

// BEGIN VWizard

class VWizardDefault extends StatelessWidget {
  const VWizardDefault(
      {super.key,
      required this.currentStep,
      required this.totalSteps,
      required this.hasErrors,
      required this.child});
  final int currentStep;
  final int totalSteps;
  final bool hasErrors;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return VWizard(
      currentStep: currentStep,
      totalSteps: totalSteps,
      hasError: hasErrors,
      child: child,
    );
  }
}

// END VWizard

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(
        actionList: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 4, 16, 4),
            child: Semantics(
              label: "close",
              button: true,
              child: InkWell(
                customBorder: const CircleBorder(),
                splashColor: VColors.defaultSurfaceLowlight,
                child: Container(
                  width: 44,
                  height: 44,
                  padding: const EdgeInsets.all(10),
                  child: const ExcludeSemantics(
                    child: VIcon(
                      svgIcon: VIcons.closeLow,
                      iconHeight: 24,
                      iconWidth: 24,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const WizardPage()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
          ),
        ],
        leading: const SizedBox.shrink(),
        title: const Text('Confirmation label'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: Column(
            children: [
              Text(
                "Success!",
                style: defaultVTheme.textStyles.headline4,
              ),
              mediumHeight(),
              const VIcon(
                svgIcon: VIcons.successHigh,
                iconColor: VColors.positiveText,
                iconHeight: 48,
                iconWidth: 48,
              ),
              mediumHeight(),
              const Text(
                "This is required text that describes the headline in more detail.",
              ),
              largeHeight(),
              VButton(
                style: const VButtonStyle(
                  minimumSize: Size(double.infinity, 46),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const WizardPage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text(
                  "Primary action",
                  style: defaultVTheme.textStyles.uiLabel.copyWith(
                    color: VColors.defaultSurface1,
                    fontWeight: VFontWeight.semiBold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
