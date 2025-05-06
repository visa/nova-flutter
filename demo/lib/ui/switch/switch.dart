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
// Visa Nova Flutter Demo Switch Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({Key? key}) : super(key: key);

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool switchValueExample1 = true;
  bool switchValueExample2 = false;
  bool switchValueDescription = true;
  bool switchValueDescription2 = false;
  bool disabled = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Switch', context);
    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Switch"),
        drawer: const MyDrawer(pageTitle: "Switch"),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SemanticHeader(
                    title: "Default switches",
                    style: defaultVTheme.textStyles.headline3.copyWith(
                      fontWeight: VFontWeight.semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SemanticHeader(
                    title: "Default switch",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  VSwitchDefaultExample(
                    value: switchValueExample1,
                    pressed: () {
                      setState(() {
                        switchValueExample1 = !switchValueExample1;
                      });
                    },
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VSwitchDefaultExample,
                    componentName: 'Switch',
                    exampleName: 'Switch_Example_One',
                    copyLabel: "Default switch on",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //!
                  const Divider(),
                  const SemanticHeader(
                    title: "Switch with description ",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      VisaExampleWithDescription(
                        value: switchValueDescription,
                        pressed: () {
                          setState(() {
                            switchValueDescription = !switchValueDescription;
                          });
                        },
                      ),
                    ],
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VisaExampleWithDescription,
                    componentName: 'Switch',
                    exampleName: 'Switch_With_Description',
                    copyLabel: "Switch with description on",
                  ),
                  /*Column(
                    children: [
                      VisaExampleWithDescription2(
                        value: switchValueDescription2,
                        pressed: () {
                          setState(() {
                            switchValueDescription2 = !switchValueDescription2;
                          });
                        },
                      ),
                    ],
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VisaExampleWithDescription2,
                    componentName: 'Switch',
                    exampleName: 'Switch_With_Description_Two',
                    copyLabel: "Switch with description off",
                  ),*/
                  smallHeight(),
                  const SizedBox(
                    height: 20,
                  ),

                  smallHeight(),
                  const Divider(),
                  const SemanticHeader(
                    title: "Disabled switch",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  VSwitchExampleTwo(
                    disabled: disabled,
                    value: switchValueExample2,
                    pressed: disabled
                        ? null
                        : () {
                            setState(() {
                              switchValueExample2 = !switchValueExample2;
                            });
                          },
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VSwitchExampleTwo,
                    componentName: 'Switch',
                    exampleName: 'Switch_Example_Two',
                    copyLabel: "Default switch off",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SemanticHeader(
                    title: "Disabled switch on",
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  VSwitchExampleOne(
                    disabled: disabled,
                    value: true,
                    pressed: disabled
                        ? null
                        : () {
                            setState(() {
                              switchValueExample2 = !switchValueExample2;
                            });
                          },
                  ),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VSwitchExampleOne,
                    componentName: 'Switch',
                    exampleName: 'Disabled_Switch_On',
                    copyLabel: "Disabled switch ON",
                  ),
                  smallHeight(),
                  const Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN VisaExampleWithDescription

class VisaExampleWithDescription extends StatelessWidget {
  const VisaExampleWithDescription({
    Key? key,
    required this.value,
    required this.pressed,
  }) : super(key: key);

  final bool value;
  final Function()? pressed;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Label",
                        style: defaultVTheme.textStyles.baseTextStyle.copyWith(
                          color: VColors.defaultText,
                        ),
                      ),
                      smallHeight(),
                      Text(
                        "This is optional text that can be used to describe the label in more detail.",
                        style: defaultVTheme.textStyles.bodyText3.copyWith(
                          color: VColors.defaultSubtle,
                        ),
                      )
                    ],
                  ),
                ),
                VSwitch(
                  switchValue: value,
                  onPressed: pressed,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// END

// BEGIN VisaExampleWithDescription2

class VisaExampleWithDescription2 extends StatelessWidget {
  const VisaExampleWithDescription2({
    Key? key,
    required this.value,
    required this.pressed,
  }) : super(key: key);

  final bool value;
  final Function()? pressed;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Label",
                        style: defaultVTheme.textStyles.baseTextStyle.copyWith(
                          color: VColors.defaultText,
                        ),
                      ),
                      smallHeight(),
                      Text(
                        "This is optional text that can be used to describe the label in more detail.",
                        style: defaultVTheme.textStyles.bodyText3.copyWith(
                          color: VColors.defaultSubtle,
                        ),
                      )
                    ],
                  ),
                ),
                VSwitch(
                  switchValue: value,
                  onPressed: pressed,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// END

// BEGIN VSwitchExampleTwo
class VSwitchExampleTwo extends StatelessWidget {
  const VSwitchExampleTwo(
      {Key? key,
      required this.value,
      required this.pressed,
      required this.disabled})
      : super(key: key);

  final bool value;
  final bool disabled;
  final Function()? pressed;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Label",
              style: defaultVTheme.textStyles.baseTextStyle.copyWith(
                color:
                    !disabled ? VColors.defaultText : VColors.defaultDisabled,
              ),
            ),
            VSwitch(
              switchValue: value,
              onPressed: pressed,
              isDisabled: disabled,
            )
          ],
        ),
      ),
    );
  }
}
// END

// BEGIN VSwitchExampleOne
class VSwitchExampleOne extends StatelessWidget {
  const VSwitchExampleOne(
      {Key? key,
      required this.value,
      required this.pressed,
      required this.disabled})
      : super(key: key);

  final bool value;
  final bool disabled;
  final Function()? pressed;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Label",
              style: defaultVTheme.textStyles.baseTextStyle.copyWith(
                color:
                    !disabled ? VColors.defaultText : VColors.defaultDisabled,
              ),
            ),
            VSwitch(
              switchValue: value,
              onPressed: pressed,
              isDisabled: disabled,
            ),
          ],
        ),
      ),
    );
  }
}
// END

// BEGIN VSwitchDefaultExample
class VSwitchDefaultExample extends StatelessWidget {
  const VSwitchDefaultExample({
    Key? key,
    required this.value,
    required this.pressed,
  }) : super(key: key);

  final bool value;

  final Function()? pressed;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Label",
              style: defaultVTheme.textStyles.baseTextStyle
                  .copyWith(color: VColors.defaultText),
            ),
            VSwitch(
              switchValue: value,
              onPressed: pressed,
            ),
          ],
        ),
      ),
    );
  }
}
// END

// BEGIN VSwitchDisabledOff
class VSwitchDisabledOff extends StatelessWidget {
  const VSwitchDisabledOff({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VSwitch(
      switchValue: false,
      onPressed: null,
      isDisabled: true,
    );
  }
}
// END

// BEGIN VSwitchDisabledOn
class VSwitchDisabledOn extends StatelessWidget {
  const VSwitchDisabledOn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VSwitch(
      onPressed: null,
      switchValue: true,
      isDisabled: true,
    );
  }
}
// END

// BEGIN VSwitchDefaultOff
class VSwitchDefaultOff extends StatelessWidget {
  const VSwitchDefaultOff({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VSwitch(
      switchValue: false,
      onPressed: () {},
    );
  }
}
// END

// BEGIN VSwitchDefaultOn
class VSwitchDefaultOn extends StatelessWidget {
  const VSwitchDefaultOn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VSwitch(
      switchValue: true,
      onPressed: () {},
    );
  }
}
// END
