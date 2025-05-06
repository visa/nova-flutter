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
// Visa Nova Flutter Demo Checkbox Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/widgets/visa_checkbox/models/nested_indeterminate_controller.dart';
import 'package:visa_nova_flutter/widgets/visa_checkbox/models/nested_indeterminate_item.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';
import 'package:flutter/gestures.dart';

// ignore_for_file: unnecessary_null_comparison

String pizzaError = "Error: Select one or more options and resubmit.";

class Checkboxes extends StatefulWidget {
  const Checkboxes({Key? key}) : super(key: key);

  @override
  State<Checkboxes> createState() => _CheckboxesState();
}

class _CheckboxesState extends State<Checkboxes> {
  late bool? _parentValue1, _parentValue2;
  late List<String> _children1, _children2;
  late List<bool> _childrenValue1, _childrenValue2;
  bool displayError = false;

  void _manageTristate1(int index, bool value) {
    setState(() {
      if (value) {
        // selected
        _childrenValue1[index] = true;
        // Checking if all other children are also selected
        if (_childrenValue1.contains(false)) {
          // No. Parent -> indeterminate.
          _parentValue1 = null;
        } else {
          // Yes. Select all.
          _checkAll1(true);
        }
      } else {
        // unselected
        _childrenValue1[index] = false;
        // Checking if all other children are also unselected
        if (_childrenValue1.contains(true)) {
          // No. Parent -> indeterminate.
          _parentValue1 = null;
        } else {
          // Yes. Unselect all.
          _checkAll1(false);
        }
      }
    });
  }

  void _manageTristate2(int index, bool value) {
    setState(() {
      if (value) {
        // selected
        _childrenValue2[index] = true;
        // Checking if all other children are also selected
        if (_childrenValue2.contains(false)) {
          // No. Parent -> indeterminate.
          _parentValue2 = null;
        } else {
          // Yes. Select all.
          _checkAll2(true);
        }
      } else {
        // unselected
        _childrenValue2[index] = false;
        // Checking if all other children are also unselected
        if (_childrenValue2.contains(true)) {
          // No. Parent -> indeterminate.
          _parentValue2 = null;
        } else {
          // Yes. Unselect all.
          _checkAll2(false);
        }
      }
    });
  }

  void _checkAll1(bool value) {
    setState(() {
      _parentValue1 = value;

      for (int i = 0; i < _children1.length; i++) {
        _childrenValue1[i] = value;
      }
    });
  }

  void _checkAll2(bool value) {
    setState(() {
      _parentValue2 = value;

      for (int i = 0; i < _children2.length; i++) {
        _childrenValue2[i] = value;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _parentValue1 = false;
    _parentValue2 = false;

    _children1 = [
      'L2 label 1',
      'L2 label 2',
      'L2 label 3',
      'L2 label 4',
    ];

    _children2 = [
      'L2 label 1',
      'L2 label 2',
      'L2 label 3',
      'L2 label 4',
    ];

    /*
    * There are four children, so there should be a list of 4 bool values to
    * manage their states. This generates and assigns the
    * _childrenValue = [false, false, false, false].
    * */
    _childrenValue1 = List.generate(_children1.length, (index) => false);
    _childrenValue2 = List.generate(_children2.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    setPageTitle('Checkbox', context);
    return PopScope(
        onPopInvoked: (didPop) {
          ScaffoldMessenger.of(context).clearSnackBars();
        },
        child: Scaffold(
          key: _key,
          appBar: CustomAppBar(globalKey: _key, title: "Checkbox"),
          drawer: const MyDrawer(pageTitle: "Checkbox"),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// Default checkboxes
                  SemanticHeader(
                      title: "Default checkboxes",
                      style: defaultVTheme.textStyles.headline2.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? VColors.defaultTextDark
                              : VColors.defaultText)),
                  const ExampleWidget(
                    title: "Checkbox with error",
                    child: VCheckboxValidation(),
                    codeSegment: CodeSegments.VCheckboxValidation,
                  ),
                  const ExampleWidget(
                    title: "Checkbox with label and link",
                    child: VTermsAndConditionsExample(),
                    codeSegment: CodeSegments.VTermsAndConditionsExample,
                  ),
                  const ExampleWidget(
                    title: "Checkbox with label and inline link",
                    child: VTermsAndConditionsWithInlineLinkExample(),
                    codeSegment:
                        CodeSegments.VTermsAndConditionsWithInlineLinkExample,
                  ),
                  const Divider(),

                  /// Indeterminate checkboxes
                  SemanticHeader(
                      title: "Indeterminate checkboxes",
                      style: defaultVTheme.textStyles.headline2.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? VColors.defaultTextDark
                              : VColors.defaultText)),
                  smallHeight(),
                  const ExampleWidget(
                    title: "Indeterminate checkbox",
                    subtitle:
                        "This standalone indeterminate checkbox is for developer example only.\nTo see an accessible indeterminate checkbox in action, view the checkbox Set with Validation below.",
                    child: VCheckboxIndeterminate(),
                    codeSegment: CodeSegments.VCheckboxIndeterminate,
                  ),
                  const ExampleWidget(
                    title: "Disabled indeterminate Checkbox",
                    child: VCheckboxIndeterminateDisabled(),
                    codeSegment: CodeSegments.VCheckboxIndeterminateDisabled,
                  ),
                  const Divider(),

                  /// Checkbox groups
                  SemanticHeader(
                      title: "Checkbox groups",
                      style: defaultVTheme.textStyles.headline2.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? VColors.defaultTextDark
                              : VColors.defaultText)),
                  const ExampleWidget(
                    title: "Checkbox group",
                    subtitle: "Group label",
                    child: VCheckboxMultipleSelect(),
                    codeSegment: CodeSegments.VCheckboxMultipleSelect,
                  ),
                  const ExampleWidget(
                    title: "Single select checkbox group with descriptions",
                    subtitle: "Group label",
                    child: VCheckboxWithSubtitleStateful(),
                    codeSegment: CodeSegments.VCheckboxWithSubtitleStateful,
                  ),
                  ExampleWidget(
                    title: "Indeterminate checkbox group",
                    child: visaCheckboxSetIndeterminate(),
                    codeSegment: CodeSegments.visaCheckboxSetIndeterminate,
                  ),
                  ExampleWidget(
                    title: "Error indeterminate checkbox group",
                    child: visaCheckboxSetValidation(),
                    codeSegment: CodeSegments.visaCheckboxSetValidation,
                  ),
                  const ExampleWidget(
                    title: "Error nested indeterminate checkbox group",
                    child: VNestedIndeterminateCheckboxes(),
                    codeSegment: CodeSegments.visaNestedIndeterminateCheckboxes,
                  ),
                  const Divider(),

                  /// Custom checkbox groups
                  SemanticHeader(
                      title: "Custom checkbox groups",
                      style: defaultVTheme.textStyles.headline2.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? VColors.defaultTextDark
                              : VColors.defaultText)),
                  const ExampleWidget(
                    title: "Checkbox group with various label alignments",
                    subtitle: "Group label",
                    child: VCheckboxAlignExample(),
                    codeSegment: CodeSegments.VCheckboxAlignExample,
                  ),
                  const ExampleWidget(
                    title:
                        "Checkbox group with icon, description, and trailing checkbox",
                    subtitle: "Group label",
                    child: VTrailingCheckboxWithSecondaryAndSubtitle(),
                    codeSegment:
                        CodeSegments.VTrailingCheckboxWithSecondaryAndSubtitle,
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
        ));
  }

// BEGIN visaCheckboxSetValidation
  ListView visaCheckboxSetValidation() {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 5),
          child: Text('Group label', style: defaultVTheme.textStyles.uiLabel),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Text(
            'Select one or more options',
            style: defaultVTheme.textStyles.uiLabel
                .copyWith(color: displayError ? VColors.negativeText : null),
          ),
        ),
        VNestedCheckboxTile(
          tristate: true,
          label: 'L1 label 1',
          value: _parentValue2,
          valueChanged: (value) {
            if (value != null) {
              // Checked/Unchecked
              _checkAll2(value);
            } else {
              // Tristate
              _checkAll2(true);
            }
          },
          checkboxType: CheckboxType.parent,
          style: VCheckboxStyle(
            borderColor:
                displayError ? VColors.negativeGraphics : VColors.defaultActive,
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: _children2.length,
          itemBuilder: (context, index) => VNestedCheckboxTile(
            style: VCheckboxStyle(
              borderColor: displayError
                  ? VColors.negativeGraphics
                  : VColors.defaultActive,
            ),
            label: _children2[index],
            value: _childrenValue2[index],
            valueChanged: (value) {
              _manageTristate2(index, value);
            },
            checkboxType: CheckboxType.child,
          ),
        ),
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
                // errorIcon18 is different from errorIcon, using in validation only
                svgIcon: VIcons.errorTiny,
                iconColor: VColors.negativeGraphics,
              )),
              const WidgetSpan(
                  child: Padding(padding: EdgeInsets.only(left: 5))),
              TextSpan(
                  text: pizzaError,
                  style: const TextStyle(color: VColors.negativeText))
            ])),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        VButton(
          onPressed: () async {
            if (_parentValue2 != false) {
              setState(() {
                displayError = false;
              });
            } else {
              setState(() {
                displayError = true;
              });
              SemanticsService.announce(pizzaError, TextDirection.ltr);
            }
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
// END

// BEGIN visaCheckboxSetIndeterminate
  ListView visaCheckboxSetIndeterminate() {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 5),
          child: Text(
            'Group label',
            style: defaultVTheme.textStyles.uiLabel,
          ),
        ),
        VNestedCheckboxTile(
          tristate: true,
          label: 'L1 label 1',
          value: _parentValue1,
          valueChanged: (value) {
            if (value != null) {
              // Checked/Unchecked
              _checkAll1(value);
            } else {
              // Tristate
              _checkAll1(true);
            }
          },
          checkboxType: CheckboxType.parent,
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _children1.length,
          itemBuilder: (context, index) => VNestedCheckboxTile(
            label: _children1[index],
            value: _childrenValue1[index],
            valueChanged: (value) {
              _manageTristate1(index, value);
            },
            checkboxType: CheckboxType.child,
          ),
        ),
      ],
    );
  }
}
// END

// BEGIN visaNestedIndeterminateCheckboxes
class VNestedIndeterminateCheckboxes extends StatefulWidget {
  const VNestedIndeterminateCheckboxes({
    Key? key,
  }) : super(key: key);
  @override
  State<VNestedIndeterminateCheckboxes> createState() =>
      _VNestedIndeterminateCheckboxesState();
}

class _VNestedIndeterminateCheckboxesState
    extends State<VNestedIndeterminateCheckboxes> {
  List<VNestedCheckboxItem> selected = [];
  bool isError = false;
  NestedCheckboxController nestedCheckboxController =
      NestedCheckboxController();
  final List<VNestedCheckboxItem> nestedCheckboxList = [
    VNestedCheckboxItem(label: 'L1 label 1', id: "l1_label_1", children: [
      VNestedCheckboxItem(label: 'L2 label 1', id: "l2_label_1", children: [
        VNestedCheckboxItem(label: 'L3 label 1', id: "l3_label_1"),
        VNestedCheckboxItem(label: 'L3 label 2', id: "l3_label_2"),
        VNestedCheckboxItem(label: 'L3 label 3', id: "l3_label_3")
      ]),
      VNestedCheckboxItem(label: 'L2 label 2', id: "l2_label_2", children: [
        VNestedCheckboxItem(label: 'L3 label 4', id: "l3_label_4"),
        VNestedCheckboxItem(label: 'L3 label 5', id: "l3_label_5")
      ]),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text('Group label', style: defaultVTheme.textStyles.uiLabel),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 5),
            child: Text(
              'Select one or more options',
              style: defaultVTheme.textStyles.uiLabel,
            ),
          ),
          NestedCheckbox(
            controller: nestedCheckboxController,
            options: nestedCheckboxList,
            selectedValues: selected,
            setSelectedValues: (List<VNestedCheckboxItem> newValues) {
              setState(() {
                if (isError) isError = false;
                selected = newValues;
              });
            },
            style: VCheckboxStyle(
                borderColor:
                    isError ? VColors.negativeGraphics : VColors.defaultActive),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
              'Selected options: ${selected.map((object) => object.label).toList()}'),
          const SizedBox(
            height: 10,
          ),
          ExcludeSemantics(
            child: Visibility(
              visible: isError,
              child: Text.rich(TextSpan(
                  style: defaultVTheme.textStyles.uiLabel,
                  children: const [
                    WidgetSpan(
                      child: VIcon(
                        svgIcon: VIcons.errorTiny,
                        iconColor: VColors.negativeText,
                      ),
                    ),
                    WidgetSpan(
                        child: Padding(padding: EdgeInsets.only(left: 5))),
                    TextSpan(
                        text: "Error: Select one or more options and resubmit.",
                        style: TextStyle(color: VColors.negativeText))
                  ])),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          VButton(
              child: Text("Submit",
                  style: defaultVTheme.textStyles.buttonMedium
                      .copyWith(color: VColors.defaultSurface1)),
              onPressed: () async {
                print('${nestedCheckboxController.getAllSelectedItems()}');
                if (selected.isEmpty) {
                  setState(() {
                    isError = true;
                  });
                  SemanticsService.announce(
                      "Error: Select one or more options and resubmit.",
                      TextDirection.ltr);
                } else {
                  setState(() {
                    selected.clear();
                    isError = false;
                  });
                  nestedCheckboxController.clearValues();
                }
              })
        ]);
  }
}
// END

// BEGIN VCheckboxValidation
class VCheckboxValidation extends StatelessWidget {
  const VCheckboxValidation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VCheckboxValidationTile(
      style: const VCheckboxStyle(),
      errorMessage:
          "This is required text that describes the error in more detail.",
      label: "Label (required)",
      validationButtonText: "Submit",
    );
  }
}
// END

// BEGIN VCheckboxIndeterminateDisabled
class VCheckboxIndeterminateDisabled extends StatelessWidget {
  const VCheckboxIndeterminateDisabled({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VCheckboxTile(
      title: "Label",
      titleStyle: defaultVTheme.textStyles.uiLabelLarge
          .copyWith(color: VColors.disabled),
      tristate: true,
      isChecked: null,
      isDisabled: true,
    );
  }
}
// END

// BEGIN VCheckboxIndeterminate
class VCheckboxIndeterminate extends StatelessWidget {
  const VCheckboxIndeterminate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VCheckboxTile(
      title: "Label",
      titleStyle: defaultVTheme.textStyles.uiLabelLarge,
      tristate: true,
      isChecked: null,
    );
  }
}
// END

// BEGIN VCheckboxMultipleSelect
class VCheckboxMultipleSelect extends StatefulWidget {
  const VCheckboxMultipleSelect({
    Key? key,
  }) : super(key: key);
  @override
  State<VCheckboxMultipleSelect> createState() =>
      _VCheckboxMultipleSelectState();
}

class _VCheckboxMultipleSelectState extends State<VCheckboxMultipleSelect> {
  List<Map<String, dynamic>> dataList = [
    {"title": "Label 1"},
    {"title": "Label 2"},
    {"title": "Label 3"},
    {"title": "Label 4"},
    {"title": "Label 5"}
  ];

  List selectedOptions = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: dataList.length,
          itemBuilder: (context, index) => VCheckboxTile(
            isChecked: selectedOptions.contains(dataList[index]),
            onChanged: (value) {
              setState(() {
                value!
                    ? selectedOptions.add(dataList[index])
                    : selectedOptions.remove(dataList[index]);
              });
            },
            title: dataList[index]["title"],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
            'Selected options: ${selectedOptions.map((object) => object["title"]).toList()}')
      ],
    );
  }
}
// END

// BEGIN VCheckboxWithSubtitleStateful
class VCheckboxWithSubtitleStateful extends StatefulWidget {
  const VCheckboxWithSubtitleStateful({
    Key? key,
  }) : super(key: key);
  @override
  State<VCheckboxWithSubtitleStateful> createState() =>
      _VCheckboxWithSubtitleStateful();
}

class _VCheckboxWithSubtitleStateful
    extends State<VCheckboxWithSubtitleStateful> {
  String selectedOption = "";
  List<Map<String, dynamic>> dataList = [
    {
      "title": "Label 1",
      "subtitle":
          "This is optional text that describes the label in more detail.",
    },
    {
      "title": "Label 2",
      "subtitle":
          "This is optional text that describes the label in more detail.",
    },
    {
      "title": "Label 3",
      "subtitle":
          "This is optional text that describes the label in more detail.",
    },
    {
      "title": "Label 4",
      "subtitle":
          "This is optional text that describes the label in more detail.",
    },
    {
      "title": "Label 5",
      "subtitle":
          "This is optional text that describes the label in more detail.",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: dataList.length,
          itemBuilder: (context, index) => VCheckboxTile(
            isChecked: selectedOption == dataList[index]["title"],
            onChanged: (value) {
              setState(() {
                selectedOption = value! ? dataList[index]["title"] : "";
              });
            },
            title: dataList[index]["title"],
            subtitle: dataList[index]["subtitle"],
          ),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Text('Selected option: $selectedOption')
      ],
    );
  }
}
// END

// BEGIN VCheckboxAlignExample
class VCheckboxAlignExample extends StatefulWidget {
  const VCheckboxAlignExample({
    Key? key,
  }) : super(key: key);
  @override
  State<VCheckboxAlignExample> createState() => _VCheckboxAlignExampleState();
}

class _VCheckboxAlignExampleState extends State<VCheckboxAlignExample> {
  String selectedOption = "";
  List<Map<String, dynamic>> dataList = [
    {
      "title": "Top-aligned label",
      "subtitle":
          "This is optional text that describes the label in more detail.",
      "align": CrossAxisAlignment.start
    },
    {
      "title": "Center-aligned label",
      "subtitle":
          "This is optional text that describes the label in more detail.",
      "align": CrossAxisAlignment.center
    },
    {
      "title": "Bottom-aligned label",
      "subtitle":
          "This is optional text that describes the label in more detail.",
      "align": CrossAxisAlignment.end
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: dataList.length,
      itemBuilder: (context, index) => VCheckboxTile(
        title: dataList[index]["title"],
        subtitle: dataList[index]["subtitle"],
        isChecked: dataList[index]["title"] == selectedOption,
        style: VCheckboxStyle(
          crossAxisAlignment: dataList[index]["align"],
        ),
        onChanged: (value) {
          setState(() {
            selectedOption = value == true ? dataList[index]["title"] : "";
          });
        },
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 5,
        );
      },
    );
  }
}
// END

// BEGIN VTrailingCheckboxWithSecondaryAndSubtitle
class VTrailingCheckboxWithSecondaryAndSubtitle extends StatefulWidget {
  const VTrailingCheckboxWithSecondaryAndSubtitle({
    Key? key,
  }) : super(key: key);
  @override
  State<VTrailingCheckboxWithSecondaryAndSubtitle> createState() =>
      _VTrailingCheckboxWithSecondaryAndSubtitleState();
}

class _VTrailingCheckboxWithSecondaryAndSubtitleState
    extends State<VTrailingCheckboxWithSecondaryAndSubtitle> {
  List dataList = [
    {
      "title": "Label 1",
      "subtitle":
          "This is optional text that describes the label in more detail.",
      "controlAffinity": ListTileControlAffinity.trailing,
      "secondary": const VIcon(
        svgIcon: VIcons.globalHigh,
        iconWidth: 32,
        iconHeight: 32,
      )
    },
    {
      "title": "Label 2",
      "subtitle":
          "This is optional text that describes the label in more detail.",
      "controlAffinity": ListTileControlAffinity.trailing,
      "secondary": const VIcon(
        svgIcon: VIcons.globalHigh,
        iconWidth: 32,
        iconHeight: 32,
      )
    },
    {
      "title": "Label 3",
      "subtitle":
          "This is optional text that describes the label in more detail.",
      "controlAffinity": ListTileControlAffinity.trailing,
      "secondary": const VIcon(
        svgIcon: VIcons.globalHigh,
        iconWidth: 32,
        iconHeight: 32,
      )
    }
  ];
  String selectedOption = "";
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: dataList.length,
      itemBuilder: (context, index) => VCheckboxTile(
        title: dataList[index]['title'],
        subtitle: dataList[index]['subtitle'],
        isChecked: selectedOption == dataList[index]['title'],
        controlAffinity: dataList[index]['controlAffinity'],
        secondary: dataList[index]['secondary'],
        onChanged: (value) {
          setState(() {
            selectedOption = value == true ? dataList[index]["title"] : "";
          });
        },
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 5,
        );
      },
    );
  }
}
// END

// BEGIN VTermsAndConditionsExample
class VTermsAndConditionsExample extends StatefulWidget {
  const VTermsAndConditionsExample({
    Key? key,
  }) : super(key: key);
  @override
  State<VTermsAndConditionsExample> createState() =>
      _VTermsAndConditionsExampleState();
}

class _VTermsAndConditionsExampleState
    extends State<VTermsAndConditionsExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return VCheckboxTile(
      title: "Label",
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: InkWell(
            child: const Wrap(
              children: <Widget>[
                Text(
                  'Destination label',
                  style: TextStyle(
                    color: VColors.primaryActive,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                VIcon(
                  svgIcon: VIcons.maximizeTiny,
                  iconWidth: 16,
                  iconHeight: 16,
                ),
              ],
            ),
            onTap: () {}),
      ),
      style: const VCheckboxStyle(crossAxisAlignment: CrossAxisAlignment.start),
      isChecked: isChecked,
      onChanged: (value) => setState(() {
        isChecked = value!;
      }),
    );
  }
}
// END

// BEGIN VTermsAndConditionsWithInlineLinkExample
class VTermsAndConditionsWithInlineLinkExample extends StatefulWidget {
  const VTermsAndConditionsWithInlineLinkExample({
    Key? key,
  }) : super(key: key);
  @override
  State<VTermsAndConditionsWithInlineLinkExample> createState() =>
      _VTermsAndConditionsWithInlineLinkExampleState();
}

class _VTermsAndConditionsWithInlineLinkExampleState
    extends State<VTermsAndConditionsWithInlineLinkExample> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    /** The RichText widget does not automatically adjust its size with the system's font size setting, so we need to manually adjust the font size */
    double textScaleFactor = MediaQuery.textScalerOf(context).scale(1);
    return VCheckboxTile(
      isChecked: isChecked,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'This is a label with an ',
              style: defaultVTheme.textStyles.uiLabelLarge
                  .copyWith(height: 1, fontSize: 16 * textScaleFactor),
            ),
            TextSpan(
              text: 'inline link',
              style: defaultVTheme.textStyles.uiLabelLarge.copyWith(
                  color: VColors.primaryActive,
                  decoration: TextDecoration.underline,
                  fontSize: 16 * textScaleFactor),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(
              text: ' to another page',
              style: defaultVTheme.textStyles.uiLabelLarge
                  .copyWith(height: 1, fontSize: 16 * textScaleFactor),
            )
          ],
        ),
      ),
      style: const VCheckboxStyle(crossAxisAlignment: CrossAxisAlignment.start),
      onChanged: (value) => setState(() {
        isChecked = value!;
      }),
    );
  }
}
// END

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({
    Key? key,
    required this.title,
    required this.child,
    required this.codeSegment,
    this.showTitle = true,
    this.subtitle,
  }) : super(key: key);

  final Widget child;
  final String title;
  final TextSpan Function(BuildContext) codeSegment;
  final String? subtitle;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Padding(
            padding: EdgeInsets.fromLTRB(
                0, subtitle == null ? 12 : 0, 0, subtitle == null ? 12 : 0),
            child: Semantics(
              header: true,
              child: Text(
                title,
                style: defaultVTheme.textStyles.headline3,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: Text(
              subtitle!,
              style: defaultVTheme.textStyles.uiLabel,
            ),
          ),
        child,
        smallHeight(),
        ShowCodeAccordion(
          codeSegment: codeSegment,
          componentName: 'Checkbox',
          exampleName: title.replaceAll(" ", "_"),
          copyLabel: title,
        ),
        smallHeight(),
      ],
    );
  }
}
