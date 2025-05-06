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
// Visa Nova Flutter Demo Radio Page
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

enum Group1 { g1l1, g1l2, g1l3 }

enum Group2 { g2l1, g2l2, g2l3 }

String errorMessage =
    "This is required text that describes the error in more detail.";

class Radios extends StatefulWidget {
  const Radios({Key? key}) : super(key: key);

  @override
  State<Radios> createState() => _RadiosState();
}

class _RadiosState extends State<Radios> {
  Group1? _group1;
  Group2? _group2;
  bool displayError = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Radio', context);
    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Radio"),
        drawer: const MyDrawer(pageTitle: "Radio"),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// Primary Radios
                SemanticHeader(
                    title: "Radio button groups",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? VColors.defaultTextDark
                            : VColors.defaultText)),
                smallHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Radio button group",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                visaRadioGroup(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.visaRadioGroup,
                  componentName: 'Radio',
                  exampleName: 'Radio_Group',
                  copyLabel: "Default radio group",
                ),
                const Divider(),
                Semantics(
                  header: true,
                  child: Text(
                    "Radio button group with error",
                    style: defaultVTheme.textStyles.headline3,
                    textAlign: TextAlign.start,
                  ),
                ),
                visaRadioGroupValidation(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.visaRadioGroupValidation,
                  componentName: 'Radio',
                  exampleName: 'Radio_Group_With_Validation',
                  copyLabel: "Radio group with validation",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// BEGIN visaRadioGroupValidation
  Column visaRadioGroupValidation() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 5),
            child: Text(
              '* indicates a required field',
              style: defaultVTheme.textStyles.uiLabel,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Text(
              '* Group label',
              style: defaultVTheme.textStyles.uiLabel
                  .copyWith(color: displayError ? VColors.negativeText : null),
            ),
          ),
          VRadio<Group2>(
              style: VRadioStyle(
                  fillColor: displayError
                      ? VColors.negativeGraphics
                      : VColors.defaultActive),
              title: "Label 1",
              value: Group2.g2l1,
              groupValue: _group2,
              onChanged: (Group2? value) {
                setState(() {
                  _group2 = value;
                });
              }),
          VRadio<Group2>(
              style: VRadioStyle(
                  fillColor: displayError
                      ? VColors.negativeGraphics
                      : VColors.defaultActive),
              title: "Label 2",
              value: Group2.g2l2,
              groupValue: _group2,
              onChanged: (Group2? value) {
                setState(() {
                  _group2 = value;
                });
              }),
          VRadio<Group2>(
              style: VRadioStyle(
                  fillColor: displayError
                      ? VColors.negativeGraphics
                      : VColors.defaultActive),
              title: "Label 3",
              value: Group2.g2l3,
              groupValue: _group2,
              onChanged: (Group2? value) {
                setState(() {
                  _group2 = value;
                });
              }),
          const SizedBox(
            height: 5,
          ),
          ExcludeSemantics(
            child: Visibility(
              visible: displayError,
              child: Text.rich(
                  TextSpan(style: defaultVTheme.textStyles.uiLabel, children: [
                const WidgetSpan(
                    child: VIcon(
                  svgIcon: VIcons.errorTiny,
                  iconWidth: 18,
                  iconHeight: 18,
                  iconColor: VColors.negativeGraphics,
                )),
                const WidgetSpan(
                    child: Padding(padding: EdgeInsets.only(left: 5))),
                TextSpan(
                    text: errorMessage,
                    style: const TextStyle(color: VColors.negativeText))
              ])),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          VButton(
            onPressed: () async {
              if (_group2 != null) {
                setState(() {
                  displayError = false;
                });
              } else {
                setState(() {
                  displayError = true;
                });
                SemanticsService.announce(errorMessage, TextDirection.ltr);
              }
            },
            child: const Text("Submit"),
          )
        ]);
  }
// END

// BEGIN visaRadioGroup
  Column visaRadioGroup() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 5),
          child: Text('Group label', style: defaultVTheme.textStyles.uiLabel),
        ),
        VRadio<Group1>(
            title: "Label 1",
            subtitle:
                "This is optional text that describes the label in more detail",
            value: Group1.g1l1,
            groupValue: _group1,
            onChanged: (Group1? value) {
              setState(() {
                _group1 = value;
              });
            }),
        VRadio<Group1>(
            title: "Label 2",
            subtitle:
                "This is optional text that describes the label in more detail",
            value: Group1.g1l2,
            groupValue: _group1,
            onChanged: (Group1? value) {
              setState(() {
                _group1 = value;
              });
            }),
        VRadio<Group1>(
            title: "Label 3",
            subtitle:
                "This is optional text that describes the label in more detail",
            value: Group1.g1l3,
            groupValue: _group1,
            onChanged: (Group1? value) {
              setState(() {
                _group1 = value;
              });
            }),
      ],
    );
  }
// END
}
