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
// Visa Nova Flutter Demo Toggle Page
import 'package:demo/utilities.dart';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/svg_content.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';

class TogglePage extends StatefulWidget {
  const TogglePage({Key? key}) : super(key: key);

  @override
  State<TogglePage> createState() => _TogglePageState();
}

class _TogglePageState extends State<TogglePage> {
  final List<bool> demoExampleIsSelected = <bool>[
    true,
    false,
    false,
  ];
  final List<bool> demoExampleIsSelectedDisabled = <bool>[
    false,
    false,
    false,
  ];
  List<String> demoExampleToggleListItems = <String>[
    "CSS",
    "Angular",
    "Flutter",
  ];
  List<Color> demoExampleColors = [
    VColors.negativeText,
    VColors.defaultActive,
    VColors.alternateActive,
    Colors.limeAccent,
    Colors.teal,
    Colors.purple,
  ];
  List<String> demoExampleColorsName = [
    "Red",
    "Blue",
    "Yellow",
    "Lime",
    "Teal",
    "Purple",
  ];

  List<bool> demoExampleColorTypeBool = [
    true,
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> demoExampleType = [
    "Inactive toggle button",
    "Active toggle button",
    "Bottom bar",
    "Fill shadow",
  ];

  List<bool> demoExampleTypeBool = [
    true,
    false,
    false,
    false,
  ];
  Color exampleSelectedColor = VColors.defaultActive;
  Color exampleUnselectedColor = VColors.defaultActive;
  Color exampleBottomBarColor = VColors.defaultActive;
  Color exampleFillShadow = VColors.defaultSurface3;

  TextStyle selectedStyle = defaultVTheme.textStyles.uiLabelActive;
  TextStyle unSelectedStyle = defaultVTheme.textStyles.uiLabel;

  List<String> demoExampleTextTypeSematicLabel = [
    "Body text",
    "Medium",
    "UI label active",
    "Headline 3",
  ];

  List<bool> demoExampleTextTypeSematicLabelBool = [
    true,
    false,
    false,
    false,
  ];

  int demoExampleTextTypeIndex = 0;

  bool toggleAxis = true;
  bool isToggleDisabled = false;
  int selectedIndex = 0;
  int selectedExampleIndex = 0;
  int colorExampleIndex = 0;
  int selectedTextTypeIndex = 0;
  double sliderCount = 0;
  double toggleHeight = 50;
  double toggleWidth = 5;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  TextStyle _style() {
    if (demoExampleTextTypeIndex == 0) {
      return defaultVTheme.textStyles.bodyText1;
    }
    if (demoExampleTextTypeIndex == 1) {
      return defaultVTheme.textStyles.buttonMedium;
    }
    if (demoExampleTextTypeIndex == 2) {
      return defaultVTheme.textStyles.uiLabelActive;
    }
    if (demoExampleTextTypeIndex == 3) {
      return defaultVTheme.textStyles.headline3;
    }
    return defaultVTheme.textStyles.uiLabelActive;
  }

  @override
  Widget build(BuildContext context) {
    setPageTitle('Toggle', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Toggle"),
        drawer: const MyDrawer(pageTitle: "Toggle"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SemanticHeader(
                  title: "Single-select toggle buttons",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Semantics(
                  header: true,
                  child: Text(
                    "Single-select toggles",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                const Divider(),
                const VToggleDefault(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VToggleDefault,
                  componentName: 'Toggle',
                  exampleName: 'Single_select_toggles',
                  copyLabel: "Single select toggles",
                ),
                const SizedBox(
                  height: 20,
                ),
                /*
                // ! New Addition
                Semantics(
                  header: true,
                  child: Text(
                    "Single-select toggles with label",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                const Divider(),
                const VToggleDefaultWithLabel(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VToggleDefaultWithLabel,
                  componentName: 'Toggle',
                  exampleName: 'Single_select_toggles_with_label',
                  copyLabel: "Single select toggles with label",
                ),
                const SizedBox(
                  height: 20,
                ),
                // ! END
                */
                Semantics(
                  header: true,
                  child: Text(
                    "Single-select toggles with leading icon",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                const Divider(),
                const VToggleWithLeadingIcons(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VToggleWithLeadingIcon,
                  componentName: 'Toggle',
                  exampleName: 'Single _elect_toggles_With_Leading_Icon',
                  copyLabel: "Single select toggles with leading icon",
                ),
                const SizedBox(
                  height: 20,
                ),
                Semantics(
                  header: true,
                  child: Text(
                    "Single-select toggles with trailing icon",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                const Divider(),
                const VToggleWithTrailingIcon(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VToggleWithTrailingIcon,
                  componentName: 'Toggle',
                  exampleName: 'Single_select_toggles_With_Trailing_Icon',
                  copyLabel: "Single select toggles with trailing icon",
                ),
                const SizedBox(
                  height: 20,
                ),
                Semantics(
                  header: true,
                  child: Text(
                    "Single-select toggles with icon only",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                const Divider(),
                const VToggleIconOnly(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VToggleIconOnly,
                  componentName: 'Toggle',
                  exampleName: 'Single_select_toggles_With_Icon_Only',
                  copyLabel: "Single select toggles icon only",
                ),
                const SizedBox(
                  height: 20,
                ),
                Semantics(
                  header: true,
                  child: Text(
                    "Disabled toggles",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                const Divider(),
                const VToggleDisabled(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VToggleDisabled,
                  componentName: 'Toggle',
                  exampleName: 'Disabled_Toggle',
                  copyLabel: "Toggle disabled",
                ),
                smallHeight(),
                /*
                //! New Addition
                Semantics(
                  header: true,
                  child: Text(
                    "Disabled and active toggles",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                const Divider(),
                const VToggleDisabledAndActive(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VToggleDisabledAndActive,
                  componentName: 'Toggle',
                  exampleName: 'Disabled_And_Active_Toggle',
                  copyLabel: "Toggle disabled and active",
                ),
                // ! END
                */
                const Divider(),
                SemanticHeader(
                  title: "Multi-select toggle buttons",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                largeHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Multi-select toggles",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                const Divider(),
                const VToggleMultiSelect(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VToggleMultiSelect,
                  componentName: 'Toggle',
                  exampleName: 'Multiselect_Toggle',
                  copyLabel: "Multi select",
                ),
                /*
                //! New Addition
                Semantics(
                  header: true,
                  child: Text(
                    "Multi-select toggles with label",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                const Divider(),
                const VToggleMultiSelectWithLabel(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VToggleMultiSelectWithLabel,
                  componentName: 'Toggle',
                  exampleName: 'Multiselect_Toggle',
                  copyLabel: "Multi select",
                ),
                //!
                */
                const Divider(),
                Semantics(
                  header: true,
                  child: Text(
                    "Standalone multi-select toggle",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                const Divider(),
                smallHeight(),
                const VToggleStandAlone(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VToggleStandAlone,
                  componentName: 'Toggle',
                  exampleName: 'Stand_alone_Toggle',
                  copyLabel: "Stand alone select",
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Semantics(
                      header: true,
                      child: Text(
                        "Toggle demo example",
                        style: defaultVTheme.textStyles.headline4,
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                              "Axis: ${toggleAxis ? "horizontal" : "vertical"}"),
                        ),
                        VSwitch(
                          switchValue: toggleAxis,
                          onPressed: () {
                            setState(() {
                              toggleAxis = !toggleAxis;
                            });
                          },
                        ),
                      ],
                    ),
                    const Divider(),
                    MergeSemantics(
                      child: Column(
                        children: [
                          Text(
                            "Border radius",
                            style: defaultVTheme.textStyles.uiLabelLarge,
                          ),
                          Slider(
                            value: sliderCount,
                            min: 0,
                            max: 100,
                            onChanged: (double num) {
                              setState(() {
                                sliderCount = num;
                              });
                            },
                            thumbColor: VColors.defaultActive,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    MergeSemantics(
                      child: Column(
                        children: [
                          Text(
                            "Height",
                            style: defaultVTheme.textStyles.uiLabelLarge,
                          ),
                          Slider(
                            value: toggleHeight,
                            min: 50,
                            max: 100,
                            onChanged: (double num) {
                              setState(() {
                                toggleHeight = num;
                              });
                            },
                            thumbColor: VColors.defaultActive,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    MergeSemantics(
                      child: Column(
                        children: [
                          Text(
                            "Width",
                            style: defaultVTheme.textStyles.uiLabelLarge,
                          ),
                          Slider(
                            value: toggleWidth,
                            min: 5,
                            max: MediaQuery.of(context).size.width / 3,
                            onChanged: (double num) {
                              setState(() {
                                toggleWidth = num;
                              });
                            },
                            thumbColor: VColors.defaultActive,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ToggleButtons(
                          children:
                              List.generate(demoExampleType.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    demoExampleType[index],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: selectedExampleIndex == index
                                            ? VColors.defaultActive
                                            : Colors.transparent,
                                      ),
                                      height: 5,
                                      width: 5,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                          isSelected: demoExampleTypeBool,
                          renderBorder: false,
                          selectedColor: VColors.defaultActive,
                          color: Colors.black,
                          fillColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: (index) {
                            selectedExampleIndex = index;
                            setState(
                              () {
                                for (int buttonIndex = 0;
                                    buttonIndex < demoExampleTypeBool.length;
                                    buttonIndex++) {
                                  for (int buttonIndex = 0;
                                      buttonIndex < demoExampleTypeBool.length;
                                      buttonIndex++) {
                                    if (buttonIndex == index) {
                                      demoExampleTypeBool[buttonIndex] = true;
                                    } else {
                                      demoExampleTypeBool[buttonIndex] = false;
                                    }
                                  }
                                }
                              },
                            );
                          }),
                    ),
                    SemanticHeader(
                      title: "Colors",
                      style: defaultVTheme.textStyles.uiLabelLarge,
                    ),
                    smallHeight(),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ToggleButtons(
                          children:
                              List.generate(demoExampleColors.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: demoExampleColors[index],
                                      border: Border.all(
                                        width: 2,
                                        color: colorExampleIndex == index
                                            ? Colors.black
                                            : Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    width: 44,
                                    height: 44,
                                  ),
                                  Text(
                                    demoExampleColorsName[index],
                                  )
                                ],
                              ),
                            );
                          }),
                          isSelected: demoExampleColorTypeBool,
                          renderBorder: false,
                          selectedColor: VColors.defaultActive,
                          color: Colors.black,
                          fillColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: (_index) {
                            colorExampleIndex = _index;

                            setState(() {
                              colorExampleIndex = _index;
                              // Reset all to false
                              demoExampleColorTypeBool = List<bool>.filled(
                                  demoExampleColorTypeBool.length, false);
                              // Set the selected index to true
                              demoExampleColorTypeBool[_index] = true;
                              switch (selectedExampleIndex) {
                                case 0:
                                  exampleUnselectedColor =
                                      demoExampleColors[_index];
                                  break;
                                case 1:
                                  exampleSelectedColor =
                                      demoExampleColors[_index];
                                  break;
                                case 2:
                                  exampleBottomBarColor =
                                      demoExampleColors[_index];
                                  break;
                                case 3:
                                  exampleFillShadow = demoExampleColors[_index];
                                  break;
                              }
                            });
                          },
                        )),
                    const Divider(),
                    SemanticHeader(
                      title: "Font type",
                      style: defaultVTheme.textStyles.uiLabelLarge,
                    ),
                    smallHeight(),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ToggleButtons(
                          children: List.generate(
                              demoExampleTextTypeSematicLabel.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    demoExampleTextTypeSematicLabel[index],
                                    style: demoExampleTextTypeIndex == index
                                        ? _style()
                                        : defaultVTheme
                                            .textStyles.uiLabelActive,
                                    semanticsLabel:
                                        "${demoExampleTextTypeSematicLabel[index]}, font type",
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: demoExampleTextTypeIndex == index
                                          ? VColors.defaultActive
                                          : Colors.transparent,
                                    ),
                                    height: 5,
                                    width: 15,
                                  )
                                ],
                              ),
                            );
                          }),
                          isSelected: demoExampleTextTypeSematicLabelBool,
                          renderBorder: false,
                          selectedColor: VColors.defaultActive,
                          color: Colors.grey,
                          fillColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: (_index) {
                            setState(() {
                              demoExampleTextTypeIndex = _index;
                              selectedStyle = _style();
                              demoExampleTextTypeSematicLabelBool =
                                  List<bool>.filled(
                                      demoExampleTextTypeSematicLabelBool
                                          .length,
                                      false);
                              demoExampleTextTypeSematicLabelBool[_index] =
                                  true;
                            });
                          },
                        )),
                    const Divider(),
                    VToggle(
                      axis: toggleAxis ? Axis.horizontal : Axis.vertical,
                      isSelected: demoExampleIsSelected,
                      toggleListItems: List.generate(
                          demoExampleToggleListItems.length, (index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              demoExampleToggleListItems[index],
                              style: index == selectedIndex &&
                                      demoExampleIsSelected[index]
                                  ? selectedStyle.copyWith(
                                      color: isToggleDisabled
                                          ? VColors.disabled
                                          : VColors.defaultText,
                                    )
                                  : unSelectedStyle.copyWith(
                                      color: isToggleDisabled
                                          ? VColors.disabled
                                          : VColors.defaultText,
                                    ),
                            ),
                          ],
                        );
                      }),
                      style: VToggleStyle(
                        borderRadius: sliderCount,
                        height: toggleHeight,
                        minimumWidth: toggleWidth,
                        selectedBorderColor: exampleSelectedColor,
                        unselectedBorderColor: exampleUnselectedColor,
                        bottomBarColor: exampleBottomBarColor,
                        toggleFillColor: exampleFillShadow,
                      ),
                      onPressed: (p0) {
                        setState(() {
                          selectedIndex = p0;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN VToggleDefault

class VToggleDefault extends StatefulWidget {
  const VToggleDefault({Key? key}) : super(key: key);

  @override
  State<VToggleDefault> createState() => _VToggleDefaultState();
}

class _VToggleDefaultState extends State<VToggleDefault> {
  final List<bool> isSelected = <bool>[
    false,
    true,
    false,
  ];
  List<String> toggleListItems = <String>[
    "Label 1",
    "Label 2",
    "Label 3",
  ];
  final Axis axis = Axis.horizontal;
  bool isToggleDisabled = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return VToggle(
      axis: axis,
      isSelected: isSelected,
      toggleListItems: List.generate(toggleListItems.length, (index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              toggleListItems[index],
              style: index == selectedIndex && isSelected[index]
                  ? defaultVTheme.textStyles.uiLabelActive.copyWith(
                      color: isToggleDisabled
                          ? VColors.disabled
                          : VColors.defaultText,
                    )
                  : defaultVTheme.textStyles.uiLabel.copyWith(
                      color: isToggleDisabled
                          ? VColors.disabled
                          : VColors.defaultText,
                    ),
            ),
          ],
        );
      }),
      isDisabled: isToggleDisabled,
      onPressed: isToggleDisabled
          ? null
          : (p0) {
              setState(() {
                selectedIndex = p0;
              });
            },
    );
  }
}

// END

// BEGIN VToggleDefaultWithLabel

class VToggleDefaultWithLabel extends StatefulWidget {
  const VToggleDefaultWithLabel({Key? key}) : super(key: key);

  @override
  State<VToggleDefaultWithLabel> createState() =>
      _VToggleDefaultWithLabelState();
}

class _VToggleDefaultWithLabelState extends State<VToggleDefaultWithLabel> {
  final List<bool> isSelected = <bool>[
    false,
    true,
    false,
  ];
  List<String> toggleListItems = <String>[
    "Label 1",
    "Label 2",
    "Label 3",
  ];
  final Axis axis = Axis.horizontal;
  bool isToggleDisabled = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return VToggle(
      topLabel: Text(
        "Label",
        style: defaultVTheme.textStyles.baseTextStyle,
      ),
      axis: axis,
      isSelected: isSelected,
      toggleListItems: List.generate(toggleListItems.length, (index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              toggleListItems[index],
              style: index == selectedIndex && isSelected[index]
                  ? defaultVTheme.textStyles.uiLabelActive.copyWith(
                      color: isToggleDisabled
                          ? VColors.disabled
                          : VColors.defaultText,
                    )
                  : defaultVTheme.textStyles.uiLabel.copyWith(
                      color: isToggleDisabled
                          ? VColors.disabled
                          : VColors.defaultText,
                    ),
            ),
          ],
        );
      }),
      isDisabled: isToggleDisabled,
      onPressed: isToggleDisabled
          ? null
          : (p0) {
              setState(() {
                selectedIndex = p0;
              });
            },
    );
  }
}

// END

// BEGIN VToggleWithLeadingIcon

class VToggleWithLeadingIcons extends StatefulWidget {
  const VToggleWithLeadingIcons({Key? key}) : super(key: key);

  @override
  State<VToggleWithLeadingIcons> createState() =>
      _VToggleWithLeadingIconsState();
}

class _VToggleWithLeadingIconsState extends State<VToggleWithLeadingIcons> {
  final List<bool> isSelected = <bool>[
    true,
    false,
    false,
  ];
  List<String> toggleListItems = <String>[
    "Label 1",
    "Label 2",
    "Label 3",
  ];
  List<String> toggleListIcons = <String>[
    VIcons.mapDirectionsAltLow,
    VIcons.viewListLow,
    VIcons.viewGridLow,
  ];
  final Axis axis = Axis.horizontal;
  bool isToggleDisabled = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return VToggle(
      axis: axis,
      isSelected: isSelected,
      toggleListItems: List.generate(toggleListItems.length, (index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VIcon(
              svgIcon: toggleListIcons[index],
              iconColor:
                  isToggleDisabled ? VColors.disabled : VColors.defaultActive,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              toggleListItems[index],
              style: index == selectedIndex && isSelected[index]
                  ? defaultVTheme.textStyles.uiLabelActive.copyWith(
                      color: isToggleDisabled
                          ? VColors.disabled
                          : VColors.defaultText,
                    )
                  : defaultVTheme.textStyles.uiLabel.copyWith(
                      color: isToggleDisabled
                          ? VColors.disabled
                          : VColors.defaultText,
                    ),
            ),
          ],
        );
      }),
      isDisabled: isToggleDisabled,
      onPressed: isToggleDisabled
          ? null
          : (p0) {
              setState(() {
                selectedIndex = p0;
              });
            },
    );
  }
}

// END

// BEGIN VToggleWithTrailingIcon
class VToggleWithTrailingIcon extends StatefulWidget {
  const VToggleWithTrailingIcon({Key? key}) : super(key: key);

  @override
  State<VToggleWithTrailingIcon> createState() =>
      _VToggleWithTrailingIconState();
}

class _VToggleWithTrailingIconState extends State<VToggleWithTrailingIcon> {
  final List<bool> isSelected = <bool>[
    false,
    true,
    false,
  ];
  List<String> toggleListItems = <String>[
    "Label 1",
    "Label 2",
    "Label 3",
  ];
  List<String> toggleListIcons = <String>[
    VIcons.mapDirectionsAltLow,
    VIcons.viewListLow,
    VIcons.viewGridLow,
  ];
  final Axis axis = Axis.horizontal;
  bool isToggleDisabled = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return VToggle(
      axis: axis,
      isSelected: isSelected,
      toggleListItems: List.generate(toggleListItems.length, (index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              toggleListItems[index],
              style: index == selectedIndex && isSelected[index]
                  ? defaultVTheme.textStyles.uiLabelActive.copyWith(
                      color: isToggleDisabled
                          ? VColors.disabled
                          : VColors.defaultText,
                    )
                  : defaultVTheme.textStyles.uiLabel.copyWith(
                      color: isToggleDisabled
                          ? VColors.disabled
                          : VColors.defaultText,
                    ),
            ),
            const SizedBox(
              width: 8,
            ),
            VIcon(
              svgIcon: toggleListIcons[index],
              iconColor:
                  isToggleDisabled ? VColors.disabled : VColors.defaultActive,
            ),
          ],
        );
      }),
      isDisabled: isToggleDisabled,
      onPressed: isToggleDisabled
          ? null
          : (p0) {
              setState(() {
                selectedIndex = p0;
              });
            },
    );
  }
}

// END

// BEGIN VToggleIconOnly
class VToggleIconOnly extends StatefulWidget {
  const VToggleIconOnly({Key? key}) : super(key: key);

  @override
  State<VToggleIconOnly> createState() => _VToggleIconOnlyState();
}

class _VToggleIconOnlyState extends State<VToggleIconOnly> {
  final List<bool> isSelected = <bool>[
    false,
    false,
    true,
  ];

  List<String> toggleListItems = <String>[
    VIcons.mapDirectionsAltLow,
    VIcons.viewListLow,
    VIcons.viewGridLow,
  ];

  List<String> toggleIconsSemanticLabel = <String>[
    "Map location",
    "View list",
    "View grid",
  ];
  final Axis axis = Axis.horizontal;
  bool isToggleDisabled = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return VToggle(
      axis: axis,
      isSelected: isSelected,
      toggleListItems: List.generate(toggleListItems.length, (index) {
        return Semantics(
          value: toggleIconsSemanticLabel[index],
          label: "",
          child: VIcon(
            iconHeight: 21,
            iconWidth: 21,
            svgIcon: toggleListItems[index],
            iconColor:
                isToggleDisabled ? VColors.disabled : VColors.defaultActive,
          ),
        );
      }),
      isDisabled: isToggleDisabled,
      onPressed: isToggleDisabled
          ? null
          : (p0) {
              setState(() {
                selectedIndex = p0;
              });
            },
    );
  }
}

// END

// BEGIN VToggleMultiSelect
class VToggleMultiSelect extends StatefulWidget {
  const VToggleMultiSelect({Key? key}) : super(key: key);

  @override
  State<VToggleMultiSelect> createState() => _VToggleMultiSelectState();
}

class _VToggleMultiSelectState extends State<VToggleMultiSelect> {
  final List<bool> isSelected = <bool>[
    true,
    false,
    true,
  ];

  List<String> toggleListItems = <String>[
    VIcons.mapDirectionsAltLow,
    VIcons.viewListLow,
    VIcons.viewGridLow,
  ];

  List<String> toggleIconsSemanticLabel = <String>[
    "Map location",
    "View list",
    "View grid",
  ];
  final Axis axis = Axis.horizontal;
  bool isToggleDisabled = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return VToggle(
      axis: axis,
      isSelected: isSelected,
      toggleListItems: List.generate(toggleListItems.length, (index) {
        return Semantics(
          value: toggleIconsSemanticLabel[index],
          label: "",
          child: VIcon(
            iconHeight: 21,
            iconWidth: 21,
            svgIcon: toggleListItems[index],
            iconColor:
                isToggleDisabled ? VColors.disabled : VColors.defaultActive,
          ),
        );
      }),
      isDisabled: isToggleDisabled,
      onPressed: isToggleDisabled
          ? null
          : (p0) {
              setState(() {
                selectedIndex = p0;
              });
            },
    );
  }
}

// END

// BEGIN VToggleMultiSelectWithLabel
class VToggleMultiSelectWithLabel extends StatefulWidget {
  const VToggleMultiSelectWithLabel({Key? key}) : super(key: key);

  @override
  State<VToggleMultiSelectWithLabel> createState() =>
      _VToggleMultiSelectWithLabelState();
}

class _VToggleMultiSelectWithLabelState
    extends State<VToggleMultiSelectWithLabel> {
  final List<bool> isSelected = <bool>[
    true,
    false,
    true,
  ];

  List<String> toggleListItems = <String>[
    VIcons.transitAirplaneLow,
    VIcons.transitTrainLow,
    VIcons.transitCarLow,
  ];

  List<String> toggleIconsSemanticLabel = <String>[
    "Transit airplane",
    "Transit train",
    "Transit car",
  ];
  final Axis axis = Axis.horizontal;
  bool isToggleDisabled = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return VToggle(
      topLabel: Text(
        "Label",
        style: defaultVTheme.textStyles.baseTextStyle,
      ),
      axis: axis,
      isSelected: isSelected,
      toggleListItems: List.generate(toggleListItems.length, (index) {
        return Semantics(
          value: toggleIconsSemanticLabel[index],
          label: "",
          child: VIcon(
            iconHeight: 21,
            iconWidth: 21,
            svgIcon: toggleListItems[index],
            iconColor:
                isToggleDisabled ? VColors.disabled : VColors.defaultActive,
          ),
        );
      }),
      isDisabled: isToggleDisabled,
      onPressed: isToggleDisabled
          ? null
          : (p0) {
              setState(() {
                selectedIndex = p0;
              });
            },
    );
  }
}

// END

// BEGIN VToggleStandAlone
class VToggleStandAlone extends StatefulWidget {
  const VToggleStandAlone({Key? key}) : super(key: key);

  @override
  State<VToggleStandAlone> createState() => _VToggleStandAloneState();
}

class _VToggleStandAloneState extends State<VToggleStandAlone> {
  final List<bool> isSelected = <bool>[
    false,
  ];

  List<String> toggleListItems = <String>[
    VIcons.mapDirectionsAltLow,
  ];

  List<String> toggleIconsSemanticLabel = <String>[
    "Map location",
  ];
  final Axis axis = Axis.horizontal;
  bool isToggleDisabled = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return VToggle(
      axis: axis,
      isSelected: isSelected,
      toggleListItems: List.generate(toggleListItems.length, (index) {
        return Semantics(
          value: toggleIconsSemanticLabel[index],
          label: "",
          child: VIcon(
            iconHeight: 21,
            iconWidth: 21,
            svgIcon: toggleListItems[index],
            iconColor:
                isToggleDisabled ? VColors.disabled : VColors.defaultActive,
          ),
        );
      }),
      isDisabled: isToggleDisabled,
      onPressed: isToggleDisabled
          ? null
          : (p0) {
              setState(() {
                selectedIndex = p0;
              });
            },
    );
  }
}

// END

// BEGIN VToggleDisabled
class VToggleDisabled extends StatefulWidget {
  const VToggleDisabled({Key? key}) : super(key: key);

  @override
  State<VToggleDisabled> createState() => _VToggleDisabledState();
}

class _VToggleDisabledState extends State<VToggleDisabled> {
  final List<bool> isSelected = <bool>[
    false,
    false,
    false,
  ];
  List<String> toggleListItems = <String>[
    "Label 1",
    "Label 2",
    "Label 3",
  ];
  List<String> toggleListIcons = <String>[
    VIcons.mapDirectionsAltLow,
    VIcons.viewListLow,
    VIcons.viewGridLow,
  ];
  final Axis axis = Axis.horizontal;
  bool isToggleDisabled = true;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return VToggle(
      axis: axis,
      isSelected: isSelected,
      toggleListItems: List.generate(toggleListItems.length, (index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VIcon(
              svgIcon: toggleListIcons[index],
              iconColor:
                  isToggleDisabled ? VColors.disabled : VColors.defaultActive,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              toggleListItems[index],
              style: index == selectedIndex && isSelected[index]
                  ? defaultVTheme.textStyles.uiLabelActive.copyWith(
                      color: isToggleDisabled
                          ? VColors.disabled
                          : VColors.defaultText,
                    )
                  : defaultVTheme.textStyles.uiLabel.copyWith(
                      color: isToggleDisabled
                          ? VColors.disabled
                          : VColors.defaultText,
                    ),
            ),
          ],
        );
      }),
      isDisabled: isToggleDisabled,
      onPressed: isToggleDisabled
          ? null
          : (p0) {
              setState(() {
                selectedIndex = p0;
              });
            },
    );
  }
}
// END

// BEGIN VToggleDisabledAndActive
class VToggleDisabledAndActive extends StatefulWidget {
  const VToggleDisabledAndActive({Key? key}) : super(key: key);

  @override
  State<VToggleDisabledAndActive> createState() =>
      _VToggleDisabledAndActiveState();
}

class _VToggleDisabledAndActiveState extends State<VToggleDisabledAndActive> {
  final List<bool> isSelected = <bool>[
    true,
    false,
    false,
  ];

  final List<bool> isItemDisabled = <bool>[
    false,
    false,
    true,
  ];
  List<String> toggleListItems = <String>[
    "Label 1",
    "Label 2",
    "Label 3",
  ];

  List<String> toggleListIcons = <String>[
    VIcons.mapDirectionsAltLow,
    VIcons.viewListLow,
    VIcons.viewGridLow,
  ];
  final Axis axis = Axis.horizontal;
  bool isToggleDisabled = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return VToggle(
      axis: axis,
      isSelected: isSelected,
      disabledItems: isItemDisabled,
      toggleListItems: List.generate(toggleListItems.length, (index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VIcon(
              svgIcon: toggleListIcons[index],
              iconColor: isItemDisabled[index]
                  ? VColors.disabled
                  : VColors.defaultActive,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              toggleListItems[index],
              style: index == selectedIndex && isSelected[index]
                  ? defaultVTheme.textStyles.uiLabelActive.copyWith(
                      color: isItemDisabled[index]
                          ? VColors.disabled
                          : VColors.defaultText,
                    )
                  : defaultVTheme.textStyles.uiLabel.copyWith(
                      color: isItemDisabled[index]
                          ? VColors.disabled
                          : VColors.defaultText,
                    ),
            ),
          ],
        );
      }),
      isDisabled: isToggleDisabled,
      onPressed: isToggleDisabled
          ? null
          : (p0) {
              setState(() {
                selectedIndex = p0;
              });
            },
    );
  }
}
// END
