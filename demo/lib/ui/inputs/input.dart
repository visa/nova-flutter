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
// Visa Nova Flutter Demo Input Page
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final defaultController = TextEditingController();
  final trailingController = TextEditingController();
  final leadingController = TextEditingController();
  final obscureController = TextEditingController();
  final multiLinesController = TextEditingController();
  final multiLinesControllerWithCharacterCount = TextEditingController();
  final enforcedLengthController = TextEditingController();
  final noEnforcedLengthController = TextEditingController();
  final otpController = TextEditingController();
  final flexHeightNoLimController = TextEditingController();
  final flexHeightController = TextEditingController();
  final flexWithScrollController = TextEditingController();
  final disabledController = TextEditingController();
  final validatorController = TextEditingController();
  final prefixController = TextEditingController();
  final readOnlyController = TextEditingController();
  final inlineController = TextEditingController();
  final suffixController = TextEditingController();
  final retroController = TextEditingController();
  final inLineLabelController = TextEditingController();

  bool obscureText = true;
  bool hasFocus = false;
  bool hasError = false;
  bool isDisabled = false;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    readOnlyController.text = "Read-only input example";
  }

  @override
  Widget build(BuildContext context) {
    setPageTitle('Input', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Input"),
        drawer: const MyDrawer(pageTitle: "Input"),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Adjusting height using contentPadding
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SemanticHeader(
                      title: "Single-line inputs",
                      style: defaultVTheme.textStyles.headline3,
                    ),
                  ),
                  largeHeight(),

                  const H3Header(
                    text: "Default input",
                  ),
                  smallHeight(),
                  VInputDefault(
                    controller: defaultController,
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputDefault,
                    componentName: 'Input',
                    exampleName: 'Default_Input',
                    copyLabel: "Default input",
                  ),
                  smallHeight(),
                  //!

                  const H3Header(
                    text: "Input with initial value ",
                  ),
                  smallHeight(),
                  const VInputWithInitialLabel(),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputWithInitialLabel,
                    componentName: 'Input',
                    exampleName: 'Input_With_Initial_Value',
                    copyLabel: "Input with initial value",
                  ),
                  //!
                  smallHeight(),
                  const H3Header(
                    text: "Input with inline messaging",
                  ),

                  smallHeight(),
                  VInputWithInlineMessage(inlineController: inlineController),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputWithInlineMessage,
                    copyLabel: "Input with inline messaging",
                    componentName: 'Input',
                    exampleName: 'Input_With_Inline_Message',
                  ),
                  smallHeight(),
                  const H3Header(
                    text: "Input with clear text button",
                  ),

                  smallHeight(),
                  VInputWithTrailingIcon(
                    controller: trailingController,
                    trailingOnPressed: () {
                      trailingController.clear();
                    },
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputWithTrailingIcon,
                    componentName: 'Input',
                    exampleName: 'Input_With_Trailing_Icon',
                    copyLabel: "Input with clear text button",
                  ),
                  smallHeight(),
                  const H3Header(
                    text: "Read-only example text",
                  ),

                  smallHeight(),
                  VInputReadOnly(
                    readOnlyController: readOnlyController,
                  ),

                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputReadOnly,
                    copyLabel: "Read-only input",
                    componentName: 'Input',
                    exampleName: 'ReadOnly_Input',
                  ),
                  smallHeight(),
                  const H3Header(
                    text: "Disabled input",
                  ),

                  smallHeight(),
                  VInputDisabled(
                    controller: disabledController,
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputDisabled,
                    componentName: 'Input',
                    exampleName: 'Disabled_Input',
                    copyLabel: "Disabled input",
                  ),
                  smallHeight(),
                  const H3Header(
                    text: "Input with error",
                  ),

                  smallHeight(),
                  VInputValidation(
                    controller: validatorController,
                  ),
                  smallHeight(),

                  const SizedBox(
                    height: 10,
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputValidation,
                    componentName: 'Input',
                    exampleName: 'Validation_Input',
                    copyLabel: "Input with error",
                  ),
                  smallHeight(),

                  const H3Header(
                    text: "Input with prefix",
                  ),
                  smallHeight(),

                  VInputPrefix(
                    controller: prefixController,
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputPrefix,
                    componentName: 'Input',
                    exampleName: 'Input_With_Prefix',
                    copyLabel: "Input with prefix",
                  ),
                  smallHeight(),
                  const H3Header(
                    text: "Input with suffix",
                  ),

                  smallHeight(),
                  VInputSuffix(
                    controller: suffixController,
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputSuffix,
                    componentName: 'Input',
                    exampleName: 'Input_With_Suffix',
                    copyLabel: "Input with suffix",
                  ),
                  smallHeight(),

                  const H3Header(
                    text: "Input with masked field",
                  ),
                  smallHeight(),
                  VInputWithObscure(
                    controller: obscureController,
                    obscureText: obscureText,
                    pressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                      SemanticsService.announce(
                          obscureText ? "show password" : "hide password",
                          TextDirection.ltr);
                      SemanticsService.announce(
                          obscureText ? "show password" : "hide password",
                          TextDirection.ltr);
                    },
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputWithObscure,
                    componentName: 'Input',
                    exampleName: 'Input_With_Obscure',
                    copyLabel: "Input with masked field",
                  ),
                  const H3Header(
                    text: "Input with leading icon",
                  ),
                  smallHeight(),

                  VInputWithLeadingIcon(
                    controller: leadingController,
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputWithLeadingIcon,
                    componentName: 'Input',
                    exampleName: 'Input_With_Leading_Icon',
                    copyLabel: "Input with leading icon",
                  ),
                  smallHeight(),
                  const H3Header(
                    text: "One-time passcode input",
                  ),

                  smallHeight(),
                  VInputWithOTP(
                    controller: otpController,
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputWithOTP,
                    componentName: 'Input',
                    exampleName: 'Input_With_One_Time_Password',
                    copyLabel: "One-time passcode input",
                  ),
                  largeHeight(),

                  const VDivider(),
                  smallHeight(),
                  SemanticHeader(
                    title: "Multi-line inputs",
                    style: defaultVTheme.textStyles.headline2,
                  ),

                  largeHeight(),
                  const H3Header(
                    text: "Native textarea with resize property",
                  ),

                  smallHeight(),
                  VInputWithFlexHeightNoLimit(
                    controller: flexHeightController,
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputWithFlexHeightNoLimit,
                    componentName: 'Input',
                    exampleName: 'Textarea_With_Auto_Resize',
                    copyLabel: "Native textarea with resize property",
                  ),
                  smallHeight(),
                  const H3Header(
                    text: "Textarea with fixed height",
                  ),

                  smallHeight(),
                  VInputWithScrollAndFlexHeight(
                    controller: flexWithScrollController,
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputWithScrollAndFlexHeight,
                    componentName: 'Input',
                    exampleName: 'Fixed_Height_Textarea',
                    copyLabel: "Textarea with fixed height",
                  ),
                  smallHeight(),

                  const H3Header(
                    text: "Textarea with fixed height and resize property",
                  ),

                  smallHeight(),

                  VInputWithMultiLines(
                    controller: multiLinesController,
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputWithMultiLines,
                    componentName: 'Input',
                    exampleName: 'Fixed_Height_Textarea_With_Resize_Property',
                    copyLabel: "Textarea with fixed height and resize property",
                  ),
                  smallHeight(),
                  const H3Header(
                    text: "Textarea with fixed height and character counter",
                  ),

                  smallHeight(),
                  VInputWithMultiLinesWithCharacterCount(
                    controller: multiLinesControllerWithCharacterCount,
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment:
                        CodeSegments.VInputWithMultiLinesWithCharacterCount,
                    componentName: 'Input',
                    exampleName: 'Fixed_Height_Textarea_With_Character_Counter',
                    copyLabel:
                        "Textarea with fixed height and character counter",
                  ),

                  smallHeight(),
                  SemanticHeader(
                    title: "Custom inputs",
                    style: defaultVTheme.textStyles.headline2,
                  ),

                  largeHeight(),
                  const H3Header(
                    text: "Input with custom label and border color",
                  ),

                  smallHeight(),
                  VInputRetro(retroController: retroController),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputRetro,
                    componentName: 'Input',
                    exampleName: 'Input_with_custom_label_and_border_color',
                    copyLabel: "Input with custom label and border color",
                  ),
                  smallHeight(),
                  const SizedBox(
                    height: 30,
                  ),
                  const H3Header(
                    text: "Input with inline label and message",
                  ),

                  smallHeight(),
                  VInputWithInlineLabel(
                      inLineLabelController: inLineLabelController),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VInputWithInlineLabel,
                    componentName: 'Input',
                    exampleName: 'Input_With_Inline_Label_And_Message',
                    copyLabel: "Input with inline label and message",
                  ),
                  largeHeight(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN VInputValidation
class VInputValidation extends StatefulWidget {
  const VInputValidation({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<VInputValidation> createState() => _VInputValidationState();
}

class _VInputValidationState extends State<VInputValidation> {
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VInput(
          myLocalController: widget.controller,
          hasError: hasError,
          topLabelText: "Label (required)",
          keyboardType: TextInputType.emailAddress,
          errorText:
              "This is required text that describes the error in more detail.",
        ),
        smallHeight(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            VButton(
              onPressed: () {
                if (widget.controller.text.trim().isEmpty) {
                  setState(() {
                    hasError = true;
                  });
                  SemanticsService.announce(
                    "Error. Please select a programming language",
                    TextDirection.ltr,
                  );
                } else {
                  setState(() {
                    hasError = false;
                  });
                }
              },
              child: const Text("Submit"),
            ),
            const SizedBox(
              width: 20,
            ),
            VButton(
              onPressed: () {
                setState(() {
                  hasError = false;
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
      ],
    );
  }
}
// END

// BEGIN VInputDisabled
class VInputDisabled extends StatefulWidget {
  const VInputDisabled({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<VInputDisabled> createState() => _VInputDisabledState();
}

class _VInputDisabledState extends State<VInputDisabled> {
  bool isDisabled = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VInput(
          myLocalController: widget.controller,
          isEnabled: !isDisabled,
          topLabelText: "Label (required)",
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
      ],
    );
  }
}
// END

// BEGIN VInputWithScrollAndFlexHeight
class VInputWithScrollAndFlexHeight extends StatelessWidget {
  const VInputWithScrollAndFlexHeight({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return VInput(
      myLocalController: controller,
      topLabelText: "Label (required)",
      maxNumOfLines: 3,
      expand: true,
      showScrollbar: true,
    );
  }
}
// END

// BEGIN VInputWithFlexHeightNoLimit
class VInputWithFlexHeightNoLimit extends StatelessWidget {
  const VInputWithFlexHeightNoLimit({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return VInput(
      flexHeight: true,
      myLocalController: controller,
      topLabelText: "Label (required)",
      expand: true,
    );
  }
}
// END

// BEGIN VInputWithOTP
class VInputWithOTP extends StatelessWidget {
  const VInputWithOTP({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return VInput(
      showScrollbar: false,
      style: const VInputStyle(inputContainerHeight: 56),
      myLocalController: controller,
      topLabelText: "Label",
      alignText: TextAlign.center,
      keyboardType: TextInputType.number,
      textSize: 32,
      letterSpacing: 4,
      cursorHeight: 30,
      inputSemanticReadout:
          controller.text.isEmpty ? null : controller.text.split("").toString(),
    );
  }
}
// END

// BEGIN VInputWithMultiLinesWithCharacterCount
class VInputWithMultiLinesWithCharacterCount extends StatelessWidget {
  const VInputWithMultiLinesWithCharacterCount({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return VInput(
      showScrollbar: true,
      myLocalController: controller,
      topLabelText: "Label (required)",
      maxNumOfLines: 5,
      expand: true,
      textLength: 200,
    );
  }
}
// END

// BEGIN VInputWithMultiLines
class VInputWithMultiLines extends StatelessWidget {
  const VInputWithMultiLines({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return VInput(
      flexHeight: true,
      showScrollbar: true,
      myLocalController: controller,
      topLabelText: "Label (required)",
      minNumOfLines: 3,
      expand: true,
    );
  }
}
// END

// BEGIN VInputWithObscure
class VInputWithObscure extends StatelessWidget {
  const VInputWithObscure({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.pressed,
    this.trailingSemanticLabel,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final Function()? pressed;
  final String? trailingSemanticLabel;

  @override
  Widget build(BuildContext context) {
    return VInput(
      myLocalController: controller,
      // initialValue: "Password",
      hideText: obscureText,
      trailingSvgIcon:
          obscureText ? VIcons.passwordShowLow : VIcons.passwordHideLow,
      topLabelText: "Label (required)",
      onPressed: pressed,
      isTrailing: true,
      trailingSemanticLabel: "show password",
      style: const VInputStyle(trailingIconColor: VColors.defaultActive),
    );
  }
}
// END

// BEGIN VInputWithLeadingIcon
class VInputWithLeadingIcon extends StatelessWidget {
  const VInputWithLeadingIcon({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return VInput(
      myLocalController: controller,
      leadingSvgIcon: VIcons.accountLow,
      topLabelText: "Label (required)",
      isLeading: true,
    );
  }
}
// END

// BEGIN VInputWithTrailingIcon
class VInputWithTrailingIcon extends StatefulWidget {
  const VInputWithTrailingIcon({
    Key? key,
    required this.controller,
    this.trailingOnPressed,
  }) : super(key: key);

  final TextEditingController controller;
  final Function()? trailingOnPressed;

  @override
  _VInputWithTrailingIconState createState() => _VInputWithTrailingIconState();
}

class _VInputWithTrailingIconState extends State<VInputWithTrailingIcon> {
  bool isFocused = false;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateState);
  }

  void _updateState() {
    setState(() {});
    isFocused = true;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VInput(
      myLocalController: widget.controller,
      topLabelText: "Label (required)",
      isTrailing: true,
      onPressed: widget.trailingOnPressed,
      isFocused: isFocused,
      appearOnFocus: true,
      suffix: widget.controller.text.isNotEmpty
          ? InkWell(
              onTap: () {
                widget.controller.clear();
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Semantics(
                  label: "clear text input",
                  child: Container(
                    color: Colors.transparent,
                    height: 44,
                    width: 44,
                    child: VIcon(
                      iconFit: BoxFit.none,
                      svgIcon: VIcons.clearAltTiny,
                      iconColor: VColors.defaultActiveSubtle.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
      onTapOutside: (p0) {
        setState(() {
          isFocused = false;
        });
      },
    );
  }
}
// END

// BEGIN VInputDefault
class VInputDefault extends StatelessWidget {
  const VInputDefault({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return VInput(
      myLocalController: controller,
      topLabelText: "Label (required)",
      inputAction: TextInputAction.send,
    );
  }
}
// END

// BEGIN VInputPrefix
class VInputPrefix extends StatelessWidget {
  const VInputPrefix({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return VInput(
      myLocalController: controller,
      topLabelText: "Label (required)",
      isPrefix: true,
      keyboardType: TextInputType.number,
      prefix: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          "\$",
          style: defaultVTheme.textStyles.bodyText2.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
// END

// BEGIN VInputSuffix
class VInputSuffix extends StatelessWidget {
  const VInputSuffix({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return VInput(
      myLocalController: controller,
      topLabelText: "Label (required)",
      isSuffix: true,
      keyboardType: TextInputType.number,
      suffix: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          "%",
          style: defaultVTheme.textStyles.bodyText2.copyWith(
            fontWeight: FontWeight.bold,
            height: 0,
          ),
        ),
      ),
    );
  }
}
// END

// BEGIN VInputReadOnly
class VInputReadOnly extends StatefulWidget {
  const VInputReadOnly({
    super.key,
    required this.readOnlyController,
  });

  final TextEditingController readOnlyController;

  @override
  State<VInputReadOnly> createState() => _VInputReadOnlyState();
}

class _VInputReadOnlyState extends State<VInputReadOnly> {
  bool isReadonly = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VInput(
          topLabelText: "Label (required)",
          myLocalController: widget.readOnlyController,
          isReadOnly: isReadonly,
        ),
        const SizedBox(
          height: 5,
        ),
        VCheckboxTile(
          title: "Mark input as read-only",
          isChecked: isReadonly,
          onChanged: (value) => setState(() {
            isReadonly = value!;
          }),
        ),
      ],
    );
  }
}
// END

// BEGIN VInputWithInlineMessage
class VInputWithInlineMessage extends StatelessWidget {
  const VInputWithInlineMessage({
    super.key,
    required this.inlineController,
  });

  final TextEditingController inlineController;

  @override
  Widget build(BuildContext context) {
    return VInput(
      topLabelText: "Label (required)",
      myLocalController: inlineController,
      hasInlineMessage: true,
      inlineMessage: Text(
        "This is an optional text that describes the label in more detail.",
        style: defaultVTheme.textStyles.uiLabel,
      ),
    );
  }
}
// END

// BEGIN VInputRetro
class VInputRetro extends StatelessWidget {
  const VInputRetro({
    super.key,
    required this.retroController,
  });

  final TextEditingController retroController;

  @override
  Widget build(BuildContext context) {
    return VInput(
      topLabelText: "Label",
      myLocalController: retroController,
      style: const VInputStyle(
        topLabelTextStyle: TextStyle(
          fontStyle: FontStyle.italic,
          letterSpacing: 1.3,
        ),
        topLabelFocusedTextColor: VColors.positiveText,
        borderDefaultColor: VColors.warningText,
        borderFocusedColor: VColors.negativeSurface,
        bottomBarColor: VColors.negativeText,
        borderRadius: 0,
      ),
    );
  }
}
// END

// BEGIN VInputWithInlineLabel
class VInputWithInlineLabel extends StatelessWidget {
  const VInputWithInlineLabel({
    super.key,
    required this.inLineLabelController,
  });

  final TextEditingController inLineLabelController;

  @override
  Widget build(BuildContext context) {
    return VInput(
      topLabelText: "Label (required)",
      myLocalController: inLineLabelController,
      isLabelInLine: true,
      inlineMessage: Text(
        "This is optional text that describes the label in more detail.",
        style: defaultVTheme.textStyles.uiLabel,
      ),
      hasInlineMessage: true,
    );
  }
}
// END

// BEGIN VInputWithInitialLabel
class VInputWithInitialLabel extends StatelessWidget {
  const VInputWithInitialLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VInput(
      topLabelText: "Label (required)",
      hasInlineMessage: true,
      initialValue: "Initial value",
    );
  }
}
// END
