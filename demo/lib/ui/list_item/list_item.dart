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
// Visa Nova Flutter Demo ListItem Page
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/shared/size_helper.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

enum Number { one, two }

enum ListRadio { oneDayShipping }

class _ListItemState extends State<ListItem> {
  bool _isPressed = false;
  bool switchVal = true;
  bool isBoxChecked = false;
  String? isRadioEnabled;
  bool isDisabled = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('List Item', context);
    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "List Item"),
        drawer: const MyDrawer(pageTitle: "List Item"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SemanticHeader(
                  title: "List items as links",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                largeHeight(),
                //! One line list item ---
                SemanticHeader(
                  title: "One line list item",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                smallHeight(),
                VListItemOneLine(
                  pressed: () {
                    setState(() {
                      _isPressed = !_isPressed;
                    });
                  },
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemOneLine,
                  componentName: 'List_Item',
                  exampleName: 'One_Line_List_Item',
                  copyLabel: "One Line List Item",
                ),
                smallHeight(),

                SemanticHeader(
                  title: "One line, two column list item as a link",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                mediumHeight(),
                VListItemDefault(
                  pressed: () {
                    setState(() {
                      _isPressed = !_isPressed;
                    });
                  },
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemDefault,
                  componentName: 'List_Item',
                  exampleName: 'Default_List_Item',
                  copyLabel: "Default",
                ),
                smallHeight(),
                //!
                SemanticHeader(
                  title: "Two line list item as a link",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                smallHeight(),
                //!
                VListItemWithSecondary(
                  pressed: () {
                    setState(() {
                      _isPressed = !_isPressed;
                    });
                  },
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemWithSecondary,
                  componentName: 'List_Item',
                  exampleName: 'Default_List_Item_With_Secondary',
                  copyLabel: "Default listitem with secondary text",
                ),
                smallHeight(),
                //!
                SemanticHeader(
                  title: "Three line tem as a link",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                smallHeight(),
                //!
                VListItemTertiary(
                  pressed: () {
                    setState(() {
                      _isPressed = !_isPressed;
                    });
                  },
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemTertiary,
                  componentName: 'List_Item',
                  exampleName: 'Default_List_Item_With_Tertiary',
                  copyLabel: "Default listitem with tertiary text",
                ),
                smallHeight(),
                //!
                SemanticHeader(
                  title: "List item as a link with leading icon",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                mediumHeight(),
                const VListItemExampleDefault(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemExampleDefault,
                  componentName: 'List_Item',
                  exampleName: 'Default_List_Item_With_Icon',
                  copyLabel: "Default listitem with icon",
                ),
                smallHeight(),
                //!
                /*SemanticHeader(
                  title: "Read-only default listitem",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                mediumHeight(),
                const VListItemExampleReadOnly(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemExampleReadOnly,
                  componentName: 'List_Item',
                  exampleName: 'Read_Only_Default_List_Item_Example',
                  copyLabel: "Read-only default listitem",
                ),
                smallHeight(),*/
                //!
                const H3Header(
                  text:
                      "Disabled list item as a link with leading icon", //!"Disabled default listitem",
                ),
                mediumHeight(),
                VListItemDisabled(
                  isDisabled: isDisabled,
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemDisabled,
                  componentName: 'List_Item',
                  exampleName: 'Disabled_Default_List_Item',
                  copyLabel: "Disabled default listitem",
                ),
                smallHeight(),
                //! Leading avatar list item
                //! Leading Card art list item
                //! Leading image list item
                //! Indicator line list  item
                //! Trailing icon list item
                //! Trailing icon with background list item??
                //! Trailing avatar list item
                //! Trailing Card art list item
                //! Trailing image list item
                //! ------
                const H3Header(
                  text: "Trailing icon list item",
                ),
                smallHeight(),
                const VListItemTrailingIcon(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemTrailingIcon,
                  componentName: 'List_Item',
                  exampleName: 'Trailing_Icon_List_Item',
                  copyLabel: "Trailing Icon List Item",
                ),
                smallHeight(),
                const H3Header(
                  text: "Trailing avatar list item",
                ),

                smallHeight(),
                const VListItemTrailingAvatar(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemTrailingAvatar,
                  componentName: 'List_Item',
                  exampleName: 'Trailing_Avatar_List_Item',
                  copyLabel: "Trailing Avatar List Item",
                ),
                smallHeight(),

                SemanticHeader(
                  title: "List item as link",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                const Divider(),
                largeHeight(),
                /*const H3Header(
                  text: "Default list item as link",
                ),*/
                const H3Header(
                  text: "Disabled list item as link",
                ),

                smallHeight(),
                VListItemDefaultDisabled(
                  isDisabled: isDisabled,
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemDefaultDisabled,
                  componentName: 'List_Item',
                  exampleName: 'Trailing_Avatar_List_Item',
                  copyLabel: "Trailing Avatar List Item",
                ),
                smallHeight(),

                const H3Header(
                  text: "Disabled leading avatar list item as link",
                ),
                smallHeight(),
                const VListItemImageDisabled(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemImageDisabled,
                  componentName: 'List_Item',
                  exampleName: 'Trailing_Disabled_Avatar_List_Item',
                  copyLabel: "Trailing Disabled Avatar List Item",
                ),
                smallHeight(),
                /*const H3Header(
                  text: "Disabled card art list item as link",
                ),
                const H3Header(
                  text: "Disabled card art with number  list item as link",
                ),
                smallHeight(),*/
                SemanticHeader(
                  title: "List item as a switch",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                const Divider(),
                largeHeight(),
                mediumHeight(),
                const H3Header(text: "Default list item as a switch"),
                smallHeight(),
                VListItemExampleSwitch(
                  value: switchVal,
                  switchToggle: () {
                    setState(() {
                      switchVal = !switchVal;
                    });
                  },
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemExampleSwitch,
                  componentName: 'List_Item',
                  exampleName: 'List_Item_With_Switch',
                  copyLabel: "Listitem with switch",
                ),
                smallHeight(),
                //!
                SemanticHeader(
                  title: "List item as a checkbox",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                const Divider(),
                largeHeight(),
                //!
                SemanticHeader(
                  title: "Default list item as a checkbox",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                mediumHeight(),
                VListItemExampleCheckBox(
                  boxCheck: (_) {
                    setState(() {
                      isBoxChecked = !isBoxChecked;
                    });
                  },
                  pressed: () {
                    setState(() {
                      isBoxChecked = !isBoxChecked;
                    });
                  },
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemExampleCheckBox,
                  componentName: 'List_Item',
                  exampleName: 'List_Item_With_Checkbox_Example',
                  copyLabel: "List: checkbox",
                ),
                smallHeight(),
                //!
                SemanticHeader(
                  title: "List items as radio buttons",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                const Divider(),
                largeHeight(),
                SemanticHeader(
                  title: "Default list item as a radio button",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                mediumHeight(),
                const VListItemExampleRadioWithTitle(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemExampleRadioWithTitle,
                  componentName: 'List_Item',
                  exampleName: 'List_Item_With_Radio_Example',
                  copyLabel: "List: radio with title",
                ),
                smallHeight(),
                //!
                SemanticHeader(
                  title: "List item with subtitle as a radio button",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                //!
                mediumHeight(),
                const VListItemExampleRadioWithTitleAndSubtitle(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment:
                      CodeSegments.VListItemExampleRadioWithTitleAndSubtitle,
                  componentName: 'List_Item',
                  exampleName: 'List_Item_With_Radio_Example',
                  copyLabel: "List: radio with title and subtitle",
                ),
                smallHeight(),
                //!
                SemanticHeader(
                  title: "List item with image",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                smallHeight(),
                const VListItemImage(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemImage,
                  componentName: 'List_Item',
                  exampleName: 'List_Item_With_Image_Example',
                  copyLabel: "List: image",
                ),
                smallHeight(),
                SemanticHeader(
                  title: "Custom list items",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                const Divider(),
                largeHeight(),
                SemanticHeader(
                  title: "Transaction list item",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                mediumHeight(),
                const VListItemExampleTransaction(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemExampleTransaction,
                  componentName: 'List_Item',
                  exampleName: 'Transaction_list_item',
                  copyLabel: "Transaction list item",
                ),
                smallHeight(),
                //!
                SemanticHeader(
                  title: "Account list item as a link",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                mediumHeight(),
                const VListItemExampleAccount(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VListItemExampleAccount,
                  componentName: 'List_Item',
                  exampleName: 'Account_List_Item_As_Link',
                  copyLabel: "Account List Item As Link",
                ),
                smallHeight(),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN VListItemExampleRadioWithTitle
class VListItemExampleRadioWithTitle extends StatefulWidget {
  const VListItemExampleRadioWithTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<VListItemExampleRadioWithTitle> createState() =>
      _VListItemExampleRadioWithTitleState();
}

class _VListItemExampleRadioWithTitleState
    extends State<VListItemExampleRadioWithTitle> {
  Number? _number;
  Number radioChanged(Number? value) {
    setState(() {
      _number = value;
    });
    return _number!;
  }

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: VListItem(
          hasCheck: _number != null ? true : false,
          style: const VListItemStyle(
            borderRadius: 10,
          ),
          child: VRadio<Number>(
            title: "Label",
            value: Number.one,
            groupValue: _number,
            onChanged: radioChanged,
          ),
          onTap: () {
            radioChanged(Number.one);
            if (_number != null) {
              SemanticsService.announce(
                "checked",
                TextDirection.ltr,
              );
            } else {
              SemanticsService.announce(
                "not checked",
                TextDirection.ltr,
              );
            }
          }),
    );
  }
}
// END

// BEGIN VListItemExampleRadioWithTitleAndSubtitle
class VListItemExampleRadioWithTitleAndSubtitle extends StatefulWidget {
  const VListItemExampleRadioWithTitleAndSubtitle({
    Key? key,
  }) : super(key: key);

  @override
  State<VListItemExampleRadioWithTitleAndSubtitle> createState() =>
      _VListItemExampleRadioWithTitleAndSubtitleState();
}

class _VListItemExampleRadioWithTitleAndSubtitleState
    extends State<VListItemExampleRadioWithTitleAndSubtitle> {
  Number? _number;
  Number radioChanged(Number? value) {
    setState(() {
      _number = value;
    });
    return _number!;
  }

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: VListItem(
          hasCheck: _number != null ? true : false,
          style: const VListItemStyle(
            borderRadius: 10,
          ),
          child: VRadio<Number>(
            title: "Label",
            subtitle:
                "This is optional text that describes the label in more detail.",
            value: Number.one,
            groupValue: _number,
            onChanged: radioChanged,
          ),
          onTap: () {
            radioChanged(Number.one);
            if (_number != null) {
              SemanticsService.announce(
                "checked",
                TextDirection.ltr,
              );
            } else {
              SemanticsService.announce(
                "not checked",
                TextDirection.ltr,
              );
            }
          }),
    );
  }
}
// END

// BEGIN VListItemExampleCheckBox
class VListItemExampleCheckBox extends StatefulWidget {
  const VListItemExampleCheckBox({
    Key? key,
    required this.boxCheck,
    required this.pressed,
  }) : super(key: key);

  final Function(bool?)? boxCheck;
  final Function()? pressed;

  @override
  State<VListItemExampleCheckBox> createState() =>
      _VListItemExampleCheckBoxState();
}

class _VListItemExampleCheckBoxState extends State<VListItemExampleCheckBox> {
  bool isBoxChecked = false;
  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: VListItem(
        style: const VListItemStyle(
          borderRadius: 10,
        ),
        hasCheck: isBoxChecked,
        child: VCheckboxTile(
          title: "Label",
          isChecked: isBoxChecked,
        ),
        onTap: () {
          widget.pressed;
          setState(() {
            isBoxChecked = !isBoxChecked;
          });
          if (isBoxChecked) {
            SemanticsService.announce(
              "checked",
              TextDirection.ltr,
            );
          } else {
            SemanticsService.announce(
              "not checked",
              TextDirection.ltr,
            );
          }
        },
      ),
    );
  }
}
// END

// BEGIN VListItemExampleAccount
class VListItemExampleAccount extends StatelessWidget {
  const VListItemExampleAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: VListItem(
        leadingPadding: const EdgeInsets.only(
          right: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.zero,
              height: 58,
              width: 5,
              decoration: BoxDecoration(
                color: VColors.defaultActive,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset(
                "assets/images/visa_card_image.png",
                semanticLabel: "Visa image",
                height: 25,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(".... 1111", style: defaultVTheme.textStyles.overline),
                const SizedBox(
                  height: 2,
                ),
                Text("Digital Bank Card",
                    style: defaultVTheme.textStyles.uiLabel),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("\$1,234.56", style: defaultVTheme.textStyles.subtitle3),
              ],
            ),
          ],
        ),
        hasTrailingIcon: true,
        onTap: () {},
      ),
    );
  }
}
// END

// BEGIN VListItemExampleTransaction
class VListItemExampleTransaction extends StatelessWidget {
  const VListItemExampleTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VListItem(
      isReadOnly: true,
      onDidGainAccessibilityFocus: () {
        SemanticsService.announce(
          "Merchant name -\$14.56. Running balance \$1234.56.",
          TextDirection.ltr,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const VIcon(
            svgIcon: VIcons.accountLow,
            iconHeight: 24,
            iconWidth: 24,
            iconColor: VColors.defaultSubtle,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Merchant name",
                  style: defaultVTheme.textStyles.baseTextStyle),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("-\$14.56", style: defaultVTheme.textStyles.subtitle3),
              Text(
                "\$1,234.56",
                style: defaultVTheme.textStyles.uiLabel
                    .copyWith(color: VColors.defaultSubtle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// END

// BEGIN VListItemExampleSwitch
class VListItemExampleSwitch extends StatelessWidget {
  const VListItemExampleSwitch(
      {Key? key, required this.value, required this.switchToggle})
      : super(key: key);

  final bool value;
  final Function()? switchToggle;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: VListItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Label", style: defaultVTheme.textStyles.baseTextStyle),
            VSwitch(switchValue: value, onPressed: switchToggle)
          ],
        ),
        onTap: switchToggle,
      ),
    );
  }
}
// END

// BEGIN VListItemDisabled
class VListItemDisabled extends StatelessWidget {
  const VListItemDisabled({
    Key? key,
    required this.isDisabled,
  }) : super(key: key);

  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: VListItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VIcon(
              svgIcon: VIcons.securityLow,
              iconHeight: 24,
              iconWidth: 24,
              iconColor:
                  isDisabled ? VColors.defaultDisabled : VColors.defaultActive,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Label",
                  style: defaultVTheme.textStyles.baseTextStyle.copyWith(
                    color: isDisabled
                        ? VColors.defaultDisabled
                        : VColors.defaultText,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
        hasTrailingIcon: true,
        onTap: isDisabled ? null : () {},
      ),
    );
  }
}
// END

// BEGIN VListItemExampleReadOnly
class VListItemExampleReadOnly extends StatelessWidget {
  const VListItemExampleReadOnly({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: VListItem(
          hasTrailingIcon: true,
          isReadOnly: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VIcon(
                svgIcon: VIcons.securityLow,
                iconHeight: 24,
                iconWidth: 24,
                iconColor: VColors.defaultActiveSubtle.withOpacity(0.50),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Security settings",
                      style: defaultVTheme.textStyles.baseTextStyle),
                ],
              ),
              const Spacer(),
            ],
          ),
          onDidGainAccessibilityFocus: () {
            SemanticsService.announce(
              "Security settings. read only",
              TextDirection.ltr,
            );
          }),
    );
  }
}
// END

// BEGIN VListItemExampleDefault
class VListItemExampleDefault extends StatelessWidget {
  const VListItemExampleDefault({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VListItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VIcon(
            svgIcon: VIcons.securityLow,
            iconHeight: 24,
            iconWidth: 24,
            iconColor: VColors.defaultActiveSubtle.withOpacity(0.50),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Label", style: defaultVTheme.textStyles.baseTextStyle),
            ],
          ),
          const Spacer(),
        ],
      ),
      hasTrailingIcon: true,
      onTap: () {},
    );
  }
}
// END

// BEGIN VListItemTertiary
class VListItemTertiary extends StatelessWidget {
  const VListItemTertiary({
    Key? key,
    required this.pressed,
  }) : super(key: key);

  final Function()? pressed;

  @override
  Widget build(BuildContext context) {
    return VListItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "L1 Label (required)",
                style: defaultVTheme.textStyles.uiLabelLarge,
              ),
              Text(
                "L2 Label (optional)",
                style: defaultVTheme.textStyles.uiLabel,
              ),
              Text(
                "L3 Label (optional)",
                style: defaultVTheme.textStyles.uiLabelSmall,
              )
            ],
          ),
        ],
      ),
      hasTrailingIcon: true,
      onTap: pressed,
      isThreeLine: true,
    );
  }
}
// END

// BEGIN VListItemWithSecondary
class VListItemWithSecondary extends StatelessWidget {
  const VListItemWithSecondary({
    Key? key,
    required this.pressed,
  }) : super(key: key);
  final Function()? pressed;
  @override
  Widget build(BuildContext context) {
    return VListItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "L1 Label (required)",
                style: defaultVTheme.textStyles.uiLabelLarge,
              ),
              Text(
                "L2 Label (optional)",
                style: defaultVTheme.textStyles.uiLabel,
              ),
            ],
          ),
        ],
      ),
      hasTrailingIcon: true,
      onTap: pressed,
    );
  }
}
// END

// BEGIN VListItemDefault
class VListItemDefault extends StatelessWidget {
  const VListItemDefault({
    Key? key,
    required this.pressed,
  }) : super(key: key);

  final Function()? pressed;

  @override
  Widget build(BuildContext context) {
    return VListItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "L1 Label (required)",
            style: defaultVTheme.textStyles.uiLabelLarge,
          ),
          Text(
            "Label",
            style: defaultVTheme.textStyles.uiLabelLarge,
          ),
        ],
      ),
      hasTrailingIcon: true,
      onTap: pressed,
    );
  }
}
// END

// BEGIN VListItemOneLine
class VListItemOneLine extends StatelessWidget {
  const VListItemOneLine({
    Key? key,
    required this.pressed,
  }) : super(key: key);

  final Function()? pressed;

  @override
  Widget build(BuildContext context) {
    return VListItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "L1 Label (required)",
            style: defaultVTheme.textStyles.uiLabelLarge,
          ),
        ],
      ),
      hasTrailingIcon: true,
      onTap: pressed,
    );
  }
}
// END

// BEGIN VListItemImage
class VListItemImage extends StatelessWidget {
  const VListItemImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: VListItem(
        onTap: () {},
        leadingPadding: EdgeInsets.zero,
        onDidGainAccessibilityFocus: () {
          SemanticsService.announce(
            "Alex Miller",
            TextDirection.ltr,
          );
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/images/listitemimage.png",
                ),
              ),
            ),
            Text(
              "Alex Miller",
              style: defaultVTheme.textStyles.uiLabelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
// END

// BEGIN VListItemTrailingIcon
class VListItemTrailingIcon extends StatelessWidget {
  const VListItemTrailingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VListItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Label", style: defaultVTheme.textStyles.baseTextStyle),
          VIcon(
            svgIcon: VIcons.securityLow,
            iconHeight: 24,
            iconWidth: 24,
            iconColor: VColors.defaultActiveSubtle.withOpacity(0.50),
          ),
        ],
      ),
      hasTrailingIcon: true,
      onTap: () {},
    );
  }
}
// END

// BEGIN VListItemTrailingAvatar
class VListItemTrailingAvatar extends StatelessWidget {
  const VListItemTrailingAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: VListItem(
        onTap: () {},
        // leadingPadding: EdgeInsets.zero,
        onDidGainAccessibilityFocus: () {
          SemanticsService.announce(
            "Alex Miller",
            TextDirection.ltr,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Alex Miller",
              style: defaultVTheme.textStyles.uiLabelLarge,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/images/listitemimage.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// END

// BEGIN VListItemDefaultDisabled
class VListItemDefaultDisabled extends StatelessWidget {
  const VListItemDefaultDisabled({
    Key? key,
    required this.isDisabled,
  }) : super(key: key);

  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: VListItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Label",
              style: defaultVTheme.textStyles.baseTextStyle.copyWith(
                color:
                    isDisabled ? VColors.defaultDisabled : VColors.defaultText,
              ),
            ),
          ],
        ),
        hasTrailingIcon: true,
        onTap: isDisabled ? null : () {},
      ),
    );
  }
}
// END

// BEGIN VListItemImageDisabled
class VListItemImageDisabled extends StatelessWidget {
  const VListItemImageDisabled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: VListItem(
        onTap: null,
        leadingPadding: EdgeInsets.zero,
        onDidGainAccessibilityFocus: () {
          SemanticsService.announce(
            "Alex Miller",
            TextDirection.ltr,
          );
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    VColors.disabled,
                    BlendMode.saturation,
                  ),
                  child: Image.asset(
                    "assets/images/listitemimage.png",
                  ),
                ),
              ),
            ),
            Text(
              "Alex Miller",
              style: defaultVTheme.textStyles.uiLabelLarge
                  .copyWith(color: VColors.defaultDisabled),
            ),
          ],
        ),
      ),
    );
  }
}
// END