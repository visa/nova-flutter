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
// Visa Nova Flutter Demo Select Page
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class Select extends StatefulWidget {
  const Select({Key? key}) : super(key: key);

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  List<String> options = const [
    'Option A',
    'Option B',
    'Option C',
    'Option D',
    'Option E',
  ];
  String defaultHint = ("");
  String? defaultOption;
  String readOnlyHint = "Option A";
  String? readOnlyOption;
  String disabledHint = ("Option A");
  String? disabledOption;
  String errorHint = ("");
  String? errorOption;
  String inLineHint = ("");
  String? inLineOption;
  String inLineMessageHint = "";
  String? inLineMessageOption;
  bool switchBool = true;
  bool isReadOnly = true;
  bool isDisabled = true;
  bool checkValidate = false;
  final focusNode = FocusNode();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Select', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Select"),
        drawer: const MyDrawer(pageTitle: "Select"),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SemanticHeader(title: "Default select"),
                    ],
                  ),
                  smallHeight(),
                  VSelectDefault(
                    defaultHint: Text(
                      defaultHint,
                      style: defaultVTheme.textStyles.bodyText2,
                    ),
                    itemBuilder: (BuildContext context) {
                      return options.map((String item) {
                        return PopupMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: defaultVTheme.textStyles.bodyText2,
                          ),
                        );
                      }).toList();
                    },
                    pressed: ((p0) {
                      setState(() {
                        defaultHint = p0;
                      });
                    }),
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VSelectDefault,
                    componentName: 'Select',
                    exampleName: 'Default_Select',
                    copyLabel: "Default select",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SemanticHeader(title: "Select with inline label"),
                    ],
                  ),
                  smallHeight(),
                  VSelectInline(
                    isInline: true,
                    inLineHint: Text(
                      inLineHint,
                      style: defaultVTheme.textStyles.bodyText2,
                    ),
                    itemBuilder: (BuildContext context) {
                      return options.map((String item) {
                        return PopupMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: defaultVTheme.textStyles.bodyText2,
                          ),
                        );
                      }).toList();
                    },
                    pressed: ((p0) {
                      setState(() {
                        inLineHint = p0;
                      });
                    }),
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VSelectInline,
                    componentName: 'Select',
                    exampleName: 'Select_with_inline_label',
                    copyLabel: "Select with inline label",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SemanticHeader(title: "Select with inline message"),
                    ],
                  ),
                  smallHeight(),
                  VSelectWithInLineMessage(
                      inLineHint: Text(
                        inLineMessageHint,
                        style: defaultVTheme.textStyles.bodyText2,
                      ),
                      itemBuilder: (BuildContext context) {
                        return options.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: defaultVTheme.textStyles.bodyText2,
                            ),
                          );
                        }).toList();
                      },
                      pressed: ((p0) {
                        setState(() {
                          inLineMessageHint = p0;
                        });
                      })),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VSelectWithInLineMessage,
                    componentName: 'Select',
                    exampleName: 'Select_with_inline_message',
                    copyLabel: "Select with inline message",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  //-
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SemanticHeader(title: "Select with error"),
                    ],
                  ),
                  smallHeight(),
                  VSelectError(
                    checkValidate: checkValidate,
                    errorHint: Text(
                      errorHint,
                      style: defaultVTheme.textStyles.bodyText2,
                    ),
                    itemBuilder: (BuildContext context) {
                      return options.map((String item) {
                        return PopupMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: defaultVTheme.textStyles.bodyText2,
                          ),
                        );
                      }).toList();
                    },
                    pressed: ((p0) {
                      setState(() {
                        errorHint = p0;
                        errorOption = p0;
                      });
                    }),
                  ),
                  smallHeight(),
                  smallHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VButton(
                        onPressed: () {
                          if (errorOption == null) {
                            setState(() {
                              checkValidate = true;
                            });
                            SemanticsService.announce(
                              "Error. Please select a programming language",
                              TextDirection.ltr,
                            );
                          } else {
                            setState(() {
                              checkValidate = false;
                            });
                          }
                          if (checkValidate) focusNode.requestFocus();
                        },
                        child: const Text("Submit"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      VButton(
                        onPressed: () {
                          setState(() {
                            checkValidate = false;
                            errorOption = null; // Resetting the errorOption
                            errorHint = "";
                          });
                          SemanticsService.announce(
                            "Reset the error",
                            TextDirection.ltr,
                          );
                        },
                        child: const Text("Reset"),
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
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VSelectError,
                    componentName: 'Select',
                    exampleName: 'Error_Select',
                    copyLabel: "Error select",
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  //-
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SemanticHeader(title: "Read-only select"),
                    ],
                  ),
                  smallHeight(),
                  VSelectReadOnly(
                    readOnlyHint: Text(
                      readOnlyHint,
                      style: defaultVTheme.textStyles.bodyText2,
                    ),
                    itemBuilder: (BuildContext context) {
                      return options.map((String item) {
                        return PopupMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: defaultVTheme.textStyles.bodyText2,
                          ),
                        );
                      }).toList();
                    },
                    isReadOnly: isReadOnly,
                    readOnlyOption: readOnlyOption,
                    pressed: ((p0) {
                      setState(() {
                        readOnlyHint = p0;
                      });
                    }),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  VCheckboxTile(
                    title: "Mark input as read-only",
                    isChecked: isReadOnly,
                    onChanged: (value) => setState(() {
                      isReadOnly = value!;
                    }),
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VSelectReadOnly,
                    componentName: 'Select',
                    exampleName: 'Read_Only_Select',
                    copyLabel: "Read only select",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SemanticHeader(title: "Disabled select"),
                    ],
                  ),
                  smallHeight(),
                  VSelectDisabled(
                    disabledHint: Text(
                      disabledHint,
                      style: defaultVTheme.textStyles.bodyText2.copyWith(
                        color:
                            isDisabled ? VColors.disabled : VColors.defaultText,
                      ),
                    ),
                    itemBuilder: (BuildContext context) {
                      return options.map((String item) {
                        return PopupMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: defaultVTheme.textStyles.bodyText2,
                          ),
                        );
                      }).toList();
                    },
                    disabledOption: disabledOption,
                    isDisabled: isDisabled,
                    pressed: ((p0) {
                      setState(() {
                        disabledHint = p0;
                      });
                    }),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  VCheckboxTile(
                    title: "Mark input as disabled",
                    isChecked: isDisabled,
                    onChanged: (value) => setState(() {
                      isDisabled = value!;
                    }),
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VSelectDisabled,
                    componentName: 'Select',
                    exampleName: 'Disabled_Select',
                    copyLabel: "Disabled select",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN VSelectInline

class VSelectInline extends StatelessWidget {
  const VSelectInline({
    Key? key,
    required this.inLineHint,
    required this.itemBuilder,
    required this.pressed,
    this.isInline = false,
  }) : super(key: key);

  final Widget inLineHint;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  final Function(dynamic)? pressed;
  final bool isInline;

  @override
  Widget build(BuildContext context) {
    return VSelect(
      itemBuilder: itemBuilder,
      isInline: isInline,
      onSelected: pressed,
      buttonText: (inLineHint),
      headerLabel: "Label (required)",
      style: VSelectStyle(buttonWidth: MediaQuery.of(context).size.width / 2),
    );
  }
}
// END

// BEGIN VSelectError
class VSelectError extends StatelessWidget {
  const VSelectError({
    Key? key,
    required this.checkValidate,
    required this.errorHint,
    required this.itemBuilder,
    required this.pressed,
    this.errorFocusNode,
  }) : super(key: key);

  final bool checkValidate;
  final Widget errorHint;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  final Function(dynamic)? pressed;
  final FocusNode? errorFocusNode;
  @override
  Widget build(BuildContext context) {
    return VSelect(
      itemBuilder: itemBuilder,
      validate: checkValidate,
      focusNode: errorFocusNode,
      headerLabel: "Label (required)",
      buttonText: (errorHint),
      onSelected: pressed,
      validateText:
          "This is required text that describes the error in more detail.",
      showErrorIcon: checkValidate,
      showErrorMessage: checkValidate,
    );
  }
}
// END

// BEGIN VSelectDisabled
class VSelectDisabled extends StatelessWidget {
  const VSelectDisabled({
    Key? key,
    required this.disabledHint,
    required this.itemBuilder,
    required this.disabledOption,
    required this.isDisabled,
    required this.pressed,
  }) : super(key: key);

  final Widget disabledHint;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  final String? disabledOption;
  final bool isDisabled;
  final Function(dynamic)? pressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSelect(
          itemBuilder: itemBuilder,
          isDisabled: isDisabled,
          headerLabel: "Label (required)",
          buttonText: (disabledHint),
          onSelected: pressed,
        ),
      ],
    );
  }
}
// END

// BEGIN VSelectReadOnly
class VSelectReadOnly extends StatelessWidget {
  const VSelectReadOnly({
    Key? key,
    required this.readOnlyHint,
    required this.itemBuilder,
    required this.readOnlyOption,
    required this.pressed,
    required this.isReadOnly,
  }) : super(key: key);

  final Widget readOnlyHint;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  final String? readOnlyOption;
  final Function(dynamic)? pressed;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSelect(
          itemBuilder: itemBuilder,
          isReadOnly: isReadOnly,
          headerLabel: "Label (required)",
          buttonText: (readOnlyHint),
          onSelected: pressed,
        ),
      ],
    );
  }
}
// END

// BEGIN VSelectDefault
class VSelectDefault extends StatelessWidget {
  const VSelectDefault({
    Key? key,
    required this.defaultHint,
    required this.itemBuilder,
    required this.pressed,
  }) : super(key: key);

  final Widget defaultHint;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  final Function(dynamic)? pressed;

  @override
  Widget build(BuildContext context) {
    return VSelect(
      itemBuilder: itemBuilder,
      headerLabel: "Label (required)",
      onSelected: pressed,
      buttonText: (defaultHint),
    );
  }
}
// END

// BEGIN VSelectWithInLineMessage

class VSelectWithInLineMessage extends StatelessWidget {
  const VSelectWithInLineMessage({
    Key? key,
    required this.inLineHint,
    required this.itemBuilder,
    required this.pressed,
    this.isInline = false,
  }) : super(key: key);

  final Widget inLineHint;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  final Function(dynamic)? pressed;
  final bool isInline;

  @override
  Widget build(BuildContext context) {
    return VSelect(
      itemBuilder: itemBuilder,
      isInline: isInline,
      onSelected: pressed,
      buttonText: (inLineHint),
      headerLabel: "Label (required)",
      inLineMessage: const Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text(
          "This is optional text that describes the label in more detail.",
        ),
      ),
    );
  }
}

// END
