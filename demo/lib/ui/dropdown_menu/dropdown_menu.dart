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
// Visa Nova Flutter Demo DropdownMenu Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class DropDownScreen extends StatefulWidget {
  const DropDownScreen({Key? key}) : super(key: key);

  @override
  State<DropDownScreen> createState() => _DropDownScreenState();
}

class _DropDownScreenState extends State<DropDownScreen> {
  List<String> textPopUpMenuItems = [
    "Label 1",
    "Label 2",
    "Label 3",
  ];

  List<String> iconPopUpMenuItems = [
    "Label 1",
    "Label 2",
    "Label 3",
  ];

  List<String> iconItems = [
    VIcons.exportTiny,
    VIcons.fileDownloadTiny,
    VIcons.deleteTiny,
  ];

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Dropdown Menu', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Dropdown menu"),
        drawer: const MyDrawer(pageTitle: "Dropdown menu"),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SemanticHeader(
                      title: "Text button dropdown menus",
                      style: defaultVTheme.textStyles.headline2.copyWith(
                        fontWeight: VFontWeight.semiBold,
                      ),
                    ),
                    const Divider(),
                    smallHeight(),
                    SemanticHeader(
                      title: "Default text button dropdown menu",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropdownMenuTextButtonLeft(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VDropdownMenuTextButtonLeft,
                      componentName: 'Dropdown_Menu',
                      exampleName: 'Default_text_button_dropdown_menu',
                      copyLabel: "Default text button dropdown menu",
                    ),
                    smallHeight(),
                    const Divider(),
                    SemanticHeader(
                      title: "Right-aligned text button dropdown menu",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropdownMenuTextButtonRight(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VDropdownMenuTextButtonRight,
                      componentName: 'Dropdown_Menu',
                      exampleName: 'Right_aligned_text_button_dropdown_menu',
                      copyLabel: "Right-aligned text button dropdown menu",
                    ),
                    smallHeight(),
                    const Divider(),
                    smallHeight(),
                    SemanticHeader(
                      title: "Icon button dropdown menus",
                      style: defaultVTheme.textStyles.headline2.copyWith(
                        fontWeight: VFontWeight.semiBold,
                      ),
                    ),
                    const Divider(),
                    smallHeight(),
                    SemanticHeader(
                      title: "Default icon button dropdown menu",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropDownIconButtonLeft(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VDropDownIconButtonLeft,
                      componentName: 'Dropdown_Menu',
                      exampleName: 'Left_Dropdown_With_Primary_Icon_Button',
                      copyLabel:
                          "Left aligned dropdown menu with small primary icon button",
                    ),
                    const Divider(),
                    smallHeight(),
                    SemanticHeader(
                      title: "Right-aligned icon button dropdown menu",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropDownIconButtonRight(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VDropDownIconButtonRight,
                      componentName: 'Dropdown_Menu',
                      exampleName: 'Right_Dropdown_With_Primary_Icon_Button',
                      copyLabel:
                          "Right aligned dropdown menu with small primary icon button",
                    ),
                    const Divider(),
                    /*smallHeight(),
                    SemanticHeader(
                      title:
                          "Default large icon button dropdown menu with left alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropDownIconButtonLeftBig(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VDropDownIconButtonLeftBig,
                      componentName: 'Dropdown_Menu',
                      exampleName: 'Left_Dropdown_With_Big_Primary_Icon_Button',
                      copyLabel:
                          "Left aligned dropdown menu with large primary icon button",
                    ),
                    smallHeight(),
                    const Divider(),
                    SemanticHeader(
                      title:
                          "Default large icon button dropdown menu with right alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropDownIconButtonRightBig(
                      itemBuilder: (BuildContext context) {
                        return iconPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VDropDownIconButtonRightBig,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Right_Dropdown_With_Big_Primary_Icon_Button',
                      copyLabel:
                          "Right aligned dropdown menu with large primary icon button",
                    ),
                    smallHeight(),
                    const Divider(),
                    SemanticHeader(
                      title:
                          "Default large disabled icon button dropdown menu with left alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropDownIconButtonLeftDisabled(
                      itemBuilder: (BuildContext context) {
                        return iconPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VDropDownIconButtonLeftDisabled,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Left_Disabled_Dropdown_With_Primary_Icon_Button',
                      copyLabel:
                          "Left aligned dropdown menu with primary icon button: disabled state",
                    ),
                    const Divider(),
                    smallHeight(),
                    SemanticHeader(
                      title:
                          "Default large disabled icon button dropdown menu with right alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropDownIconButtonRightDisabled(
                      itemBuilder: (BuildContext context) {
                        return iconPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment:
                          CodeSegments.VDropDownIconButtonRightDisabled,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Right_Disabled_Dropdown_With_Primary_Icon_Button',
                      copyLabel:
                          "Right aligned dropdown menu with primary icon button: disabled state",
                    ),
                    smallHeight(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    smallHeight(),
                    SemanticHeader(
                      title:
                          "Default small secondary icon button dropdown menu with left alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropDownIconButtonLeftSecondary(
                      itemBuilder: (BuildContext context) {
                        return iconPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment:
                          CodeSegments.VDropDownIconButtonLeftSecondary,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Left_Dropdown_With_Secondary_Small_Icon_Button',
                      copyLabel:
                          "Left aligned dropdown menu with small secondary icon button",
                    ),
                    smallHeight(),
                    const Divider(),
                    SemanticHeader(
                      title:
                          "Default small secondary icon button dropdown menu with right alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropDownIconButtonRightSecondary(
                      itemBuilder: (BuildContext context) {
                        return iconPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment:
                          CodeSegments.VDropDownIconButtonRightSecondary,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Right_Dropdown_With_Small_Secondary_Icon_Button',
                      copyLabel:
                          "Right aligned dropdown menu with small secondary icon button",
                    ),
                    smallHeight(),
                    const Divider(),
                    SemanticHeader(
                      title:
                          "Default large secondary icon button dropdown menu with left alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropDownIconButtonLeftBigSecondary(
                      itemBuilder: (BuildContext context) {
                        return iconPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment:
                          CodeSegments.VDropDownIconButtonLeftBigSecondary,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Left_Dropdown_With_Big_Secondary_Icon_Button',
                      copyLabel:
                          "Left aligned dropdown menu with large secondary icon button",
                    ),
                    SemanticHeader(
                      title:
                          "Default large secondary icon button dropdown menu with right alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    VDropDownIconButtonRightBigSecondary(
                      itemBuilder: (BuildContext context) {
                        return iconPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment:
                          CodeSegments.VDropDownIconButtonRightBigSecondary,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Right_Dropdown_With_Big_Secondary_Icon_Button',
                      copyLabel:
                          "Right aligned dropdown menu with large secondary icon button",
                    ),
                    const Divider(),
                    smallHeight(),
                    SemanticHeader(
                      title:
                          "Default large disabled secondary icon button dropdown menu with left alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropDownIconButtonDisabledSecondary(
                      itemBuilder: (BuildContext context) {
                        return iconPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment:
                          CodeSegments.VDropDownIconButtonDisabledSecondary,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Left_Disabled_Dropdown_With_Secondary_Icon_Button',
                      copyLabel:
                          "Left aligned dropdown menu with secondary icon button: disabled state",
                    ),
                    smallHeight(),
                    const Divider(),
                    SemanticHeader(
                      title:
                          "Default large disabled secondary icon button dropdown menu with right alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropDownIconButtonRightBigDisabledSecondary(
                      itemBuilder: (BuildContext context) {
                        return iconPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments
                          .VDropDownIconButtonRightBigDisabledSecondary,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Right_Disable_Dropdown_With_Secondary_Icon_Button',
                      copyLabel:
                          "Right aligned dropdown menu with secondary icon button: disabled state",
                    ),
                    const SizedBox(
                      height: 20,
                    ),*/

                    // const Divider(),
                    /*
                    SemanticHeader(
                      title:
                          "Default large text button dropdown menu with left alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropdownMenuTextButtonLeftBig(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VDropdownMenuTextButtonLeftBig,
                      componentName: 'Dropdown_Menu',
                      exampleName: 'Left_Dropdown_With_Primary_Big_Text_Button',
                      copyLabel:
                          "Left aligned dropdown menu with large primary text button",
                    ),
                    smallHeight(),
                    const Divider(),
                    SemanticHeader(
                      title:
                          "Default large text button dropdown menu with right alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropdownMenuTextButtonRightBig(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VDropdownMenuTextButtonRightBig,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Right_Dropdown_With_Primary_Big_Text_Button',
                      copyLabel:
                          "Right aligned dropdown menu with large primary text button",
                    ),
                    const Divider(),
                    SemanticHeader(
                      title:
                          "Default large disabled text button dropdown menu with left alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropdownMenuTextButtonDisabled(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VDropdownMenuTextButtonDisabled,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Left_Disabled_Dropdown_With_Primary_Text_Button',
                      copyLabel:
                          "Left aligned dropdown menu with primary text button: disabled state",
                    ),
                    smallHeight(),
                    const Divider(),
                    SemanticHeader(
                      title:
                          "Default large disabled text button dropdown menu with right alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropdownMenuTextRightButtonDisabled(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment:
                          CodeSegments.VDropdownMenuTextRightButtonDisabled,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Right_Disabled_Dropdown_With_Primary_Text_Button',
                      copyLabel:
                          "Right aligned dropdown menu with primary text button: disabled state",
                    ),
                    const Divider(),
                    smallHeight(),
                    SemanticHeader(
                      title:
                          "Default secondary text button dropdown menu with left alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropdownMenuTextButtonLeftSecondary(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment:
                          CodeSegments.VDropdownMenuTextButtonLeftSecondary,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Left_Dropdown_With_Small_Secondary_Text_Button',
                      copyLabel:
                          "Left aligned dropdown menu with small secondary text button",
                    ),
                    smallHeight(),
                    const Divider(),
                    SemanticHeader(
                      title:
                          "Default secondary text button dropdown menu with right alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropdownMenuTextButtonRightSecondary(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment:
                          CodeSegments.VDropdownMenuTextButtonRightSecondary,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Right_Dropdown_With_Small_Secondary_Text_Button',
                      copyLabel:
                          "Right aligned dropdown menu with small secondary text button",
                    ),
                    smallHeight(),
                    const Divider(),
                    SemanticHeader(
                      title:
                          "Default large secondary text button dropdown menu with left alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropdownMenuTextButtonLeftBigSecondary(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment:
                          CodeSegments.VDropdownMenuTextButtonLeftBigSecondary,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Left_Dropdown_With_Big_Secondary_Text_Button',
                      copyLabel:
                          "Left aligned dropdown menu with large secondary text button",
                    ),
                    smallHeight(),
                    const Divider(),
                    SemanticHeader(
                      title:
                          "Default large secondary text button dropdown menu with right alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropdownMenuTextButtonRightBigSecondary(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment:
                          CodeSegments.VDropdownMenuTextButtonRightBigSecondary,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Right_Dropdown_With_Big_Secondary_Text_Button',
                      copyLabel:
                          "Right aligned dropdown menu with large secondary text button",
                    ),
                    smallHeight(),
                    const Divider(),
                    SemanticHeader(
                      title:
                          "Default large disabled secondary text button dropdown menu with left alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropdownMenuTextButtonLeftDisabledSecondary(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments
                          .VDropdownMenuTextButtonLeftDisabledSecondary,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Left_Disabled_Dropdown_With_Secondary_Text_Button',
                      copyLabel:
                          "Left aligned dropdown menu with secondary text button: disabled state",
                    ),
                    smallHeight(),
                    const Divider(),
                    SemanticHeader(
                      title:
                          "Default large disabled secondary text button dropdown menu with right alignment",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDropdownMenuTextButtonRightDisabledSecondary(
                      itemBuilder: (BuildContext context) {
                        return textPopUpMenuItems.map((String item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList();
                      },
                    ),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments
                          .VDropdownMenuTextButtonRightDisabledSecondary,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Right_Disabled_Dropdown_With_Secondary_Text_Button',
                      copyLabel:
                          "Right aligned dropdown menu with secondary text button: disabled state",
                    ),
                    smallHeight(),
                    const Divider(
                      thickness: 2,
                    ),*/
                    SemanticHeader(
                      title: "Custom dropdown menu",
                      style: defaultVTheme.textStyles.headline2.copyWith(
                        fontWeight: VFontWeight.semiBold,
                      ),
                    ),
                    const Divider(),
                    smallHeight(),
                    SemanticHeader(
                      title:
                          "Dropdown menu with leading icons and destructive action",
                      style: defaultVTheme.textStyles.headline4,
                    ),
                    smallHeight(),
                    VDrowDownMenuWithLeadingIconsAndDestructiveAction(
                      itemBuilder: (BuildContext context) {
                        return List<PopupMenuEntry<String>>.generate(
                            textPopUpMenuItems.length, (index) {
                          return PopupMenuItem<String>(
                            value: textPopUpMenuItems[index],
                            child: Row(
                              children: [
                                VIcon(
                                  svgIcon: iconItems[index],
                                  iconColor: index == 2
                                      ? VColors.negativeText
                                      : VColors.defaultText,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  textPopUpMenuItems[index],
                                  style: TextStyle(
                                    color: index == 2
                                        ? VColors.negativeText
                                        : VColors.defaultText,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList();
                      },
                    ),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments
                          .VDrowDownMenuWithLeadingIconsAndDestructiveAction,
                      componentName: 'Dropdown_Menu',
                      exampleName:
                          'Dropdown_With_Leading_Icons_And_Destructive_Action',
                      copyLabel:
                          "Dropdown menu with leading icons and destructive action",
                    ),
                    smallHeight(),
                    smallHeight(),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN VDropdownMenuTextButtonRightBigSecondary
class VDropdownMenuTextButtonRightBigSecondary extends StatelessWidget {
  const VDropdownMenuTextButtonRightBigSecondary({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VDropdownTextButton(
          buttonText: "Action",
          isIconBig: true,
          itemBuilder: itemBuilder,
          isSecTheme: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropdownMenuTextButtonRightSecondary
class VDropdownMenuTextButtonRightSecondary extends StatelessWidget {
  const VDropdownMenuTextButtonRightSecondary({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VDropdownTextButton(
          buttonText: "Action",
          itemBuilder: itemBuilder,
          isSecTheme: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropdownMenuTextButtonLeftSecondary
class VDropdownMenuTextButtonLeftSecondary extends StatelessWidget {
  const VDropdownMenuTextButtonLeftSecondary({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VDropdownTextButton(
          buttonText: "Action",
          itemBuilder: itemBuilder,
          isSecTheme: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropdownMenuTextButtonDisabled
class VDropdownMenuTextButtonDisabled extends StatelessWidget {
  const VDropdownMenuTextButtonDisabled({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VDropdownTextButton(
          isDisabled: true,
          buttonText: "Action",
          isIconBig: true,
          itemBuilder: itemBuilder,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropdownMenuTextRightButtonDisabled
class VDropdownMenuTextRightButtonDisabled extends StatelessWidget {
  const VDropdownMenuTextRightButtonDisabled({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VDropdownTextButton(
          isDisabled: true,
          buttonText: "Action",
          isIconBig: true,
          itemBuilder: itemBuilder,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropdownMenuTextButtonRightBig
class VDropdownMenuTextButtonRightBig extends StatelessWidget {
  const VDropdownMenuTextButtonRightBig({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VDropdownTextButton(
          buttonText: "Action",
          isIconBig: true,
          itemBuilder: itemBuilder,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropdownMenuTextButtonRight
class VDropdownMenuTextButtonRight extends StatelessWidget {
  const VDropdownMenuTextButtonRight({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VDropdownTextButton(
          buttonText: "Action",
          itemBuilder: itemBuilder,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropdownMenuTextButtonLeftBigSecondary
class VDropdownMenuTextButtonLeftBigSecondary extends StatelessWidget {
  const VDropdownMenuTextButtonLeftBigSecondary({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VDropdownTextButton(
          buttonText: "Action",
          isIconBig: true,
          itemBuilder: itemBuilder,
          isSecTheme: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropdownMenuTextButtonLeftDisabledSecondary
class VDropdownMenuTextButtonLeftDisabledSecondary extends StatelessWidget {
  const VDropdownMenuTextButtonLeftDisabledSecondary({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VDropdownTextButton(
          buttonText: "Action",
          isIconBig: true,
          isDisabled: true,
          itemBuilder: itemBuilder,
          isSecTheme: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropdownMenuTextButtonRightDisabledSecondary
class VDropdownMenuTextButtonRightDisabledSecondary extends StatelessWidget {
  const VDropdownMenuTextButtonRightDisabledSecondary({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VDropdownTextButton(
          buttonText: "Action",
          isIconBig: true,
          isDisabled: true,
          itemBuilder: itemBuilder,
          isSecTheme: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropdownMenuTextButtonLeftBig
class VDropdownMenuTextButtonLeftBig extends StatelessWidget {
  const VDropdownMenuTextButtonLeftBig({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VDropdownTextButton(
          buttonText: "Action",
          isIconBig: true,
          itemBuilder: itemBuilder,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropdownMenuTextButtonLeft
class VDropdownMenuTextButtonLeft extends StatelessWidget {
  const VDropdownMenuTextButtonLeft({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        VDropdownTextButton(
          buttonText: "Action",
          itemBuilder: itemBuilder,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropDownIconButtonDisabledSecondary
class VDropDownIconButtonDisabledSecondary extends StatelessWidget {
  const VDropDownIconButtonDisabledSecondary({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        VDropdownIcon(
          itemBuilder: itemBuilder,
          isIconBig: true,
          isDisabled: true,
          isSecTheme: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropDownIconButtonRightBigDisabledSecondary
class VDropDownIconButtonRightBigDisabledSecondary extends StatelessWidget {
  const VDropDownIconButtonRightBigDisabledSecondary({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VDropdownIcon(
          itemBuilder: itemBuilder,
          isSecTheme: true,
          isDisabled: true,
          isIconBig: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropDownIconButtonRightBigSecondary
class VDropDownIconButtonRightBigSecondary extends StatelessWidget {
  const VDropDownIconButtonRightBigSecondary({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VDropdownIcon(
          itemBuilder: itemBuilder,
          isSecTheme: true,
          isIconBig: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropDownIconButtonRightSecondary

class VDropDownIconButtonRightSecondary extends StatelessWidget {
  const VDropDownIconButtonRightSecondary({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VDropdownIcon(
          itemBuilder: itemBuilder,
          isSecTheme: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropDownIconButtonLeftBigSecondary
class VDropDownIconButtonLeftBigSecondary extends StatelessWidget {
  const VDropDownIconButtonLeftBigSecondary({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        VDropdownIcon(
          itemBuilder: itemBuilder,
          isIconBig: true,
          isSecTheme: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropDownIconButtonLeftSecondary
class VDropDownIconButtonLeftSecondary extends StatelessWidget {
  const VDropDownIconButtonLeftSecondary({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        VDropdownIcon(
          itemBuilder: itemBuilder,
          isSecTheme: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropDownIconButtonLeftDisabled
class VDropDownIconButtonLeftDisabled extends StatelessWidget {
  const VDropDownIconButtonLeftDisabled({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        VDropdownIcon(
          itemBuilder: itemBuilder,
          isIconBig: true,
          isDisabled: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropDownIconButtonRightDisabled
class VDropDownIconButtonRightDisabled extends StatelessWidget {
  const VDropDownIconButtonRightDisabled({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VDropdownIcon(
          itemBuilder: itemBuilder,
          isIconBig: true,
          isDisabled: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropDownIconButtonRightBig
class VDropDownIconButtonRightBig extends StatelessWidget {
  const VDropDownIconButtonRightBig({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VDropdownIcon(
          itemBuilder: itemBuilder,
          isIconBig: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}

// END
// BEGIN VDropDownIconButtonLeftBig
class VDropDownIconButtonLeftBig extends StatelessWidget {
  const VDropDownIconButtonLeftBig({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        VDropdownIcon(
          itemBuilder: itemBuilder,
          isIconBig: true,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropDownIconButtonRight
class VDropDownIconButtonRight extends StatelessWidget {
  const VDropDownIconButtonRight({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        VDropdownIcon(
          itemBuilder: itemBuilder,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDropDownIconButtonLeft
class VDropDownIconButtonLeft extends StatelessWidget {
  const VDropDownIconButtonLeft({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        VDropdownIcon(
          itemBuilder: itemBuilder,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
// END

// BEGIN VDrowDownMenuWithLeadingIconsAndDestructiveAction
class VDrowDownMenuWithLeadingIconsAndDestructiveAction
    extends StatelessWidget {
  const VDrowDownMenuWithLeadingIconsAndDestructiveAction({
    Key? key,
    required this.itemBuilder,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return VDropdownTextButton(
      itemBuilder: itemBuilder,
      buttonText: "Action",
      onSelected: (p0) => {},
    );
  }
}
// END
