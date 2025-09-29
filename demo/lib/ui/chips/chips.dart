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
// Visa Nova Flutter Demo Chip Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class ChipsPage extends StatefulWidget {
  const ChipsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChipsPage> createState() => _ChipsPageState();
}

class _ChipsPageState extends State<ChipsPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Chips', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Chips"),
        drawer: const MyDrawer(pageTitle: "Chips"),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SemanticHeader(
                    title: "Selection chips",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                      fontWeight: VFontWeight.semiBold,
                    ),
                  ),
                  largeHeight(),
                  SemanticHeader(
                    title: "Default selection chip",
                    style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  smallHeight(),
                  const VDefaultChip(),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.DefaultChip,
                    componentName: 'Chip',
                    exampleName: 'Default_Chip',
                    copyLabel: "Default chip",
                  ),
                  smallHeight(),
                  smallHeight(),
                  SemanticHeader(
                    title: "Selected selection chip",
                    style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  const VDefaultChipSelected(),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.DefaultChipSelected,
                    componentName: 'Chip',
                    exampleName: 'Selected_Chip',
                    copyLabel: "Default chip selected",
                  ),
                  smallHeight(),
                  smallHeight(),
                  smallHeight(),
                  SemanticHeader(
                    title: "Multi-line selection chip",
                    style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  smallHeight(),
                  const VMultilineSelectionChip(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VMultilineSelectionChip,
                    componentName: 'Chip',
                    exampleName: 'Multiline_Selection_Chip',
                    copyLabel: "Multi-line selection chip",
                  ),
                  smallHeight(),
                  smallHeight(),
                  SemanticHeader(
                    title: "Disabled selected chip",
                    style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  smallHeight(),
                  const VDefaultChipDisabledUnselected(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.DefaultChipDisabledUnselected,
                    componentName: 'Chip',
                    exampleName: 'Disabled_Unselected_Chip',
                    copyLabel: "Default disabled chip: unselected",
                  ),
                  smallHeight(),
                  smallHeight(),
                  smallHeight(),
                  SemanticHeader(
                    title: "Selected disabled selection chip",
                    style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  const VDefaultChipDisabledSelected(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.DefaultChipDisabledSelected,
                    componentName: 'Chip',
                    exampleName: 'Disabled_Selected_Chip',
                    copyLabel: "Default disabled chip: selected",
                  ),
                  smallHeight(),
                  // ! Read only chips have been removed from the design system
                  /*smallHeight(),
                  smallHeight(),
                  SemanticHeader(
                    title: "Default chip read only: unselected",
                  style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  const VDefaultChipReadOnlyUnselected(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.DefaultChipReadOnlyUnselected,
                    componentName: 'Chip',
                    exampleName: 'ReadOnly_Unselected_Chip',
                    copyLabel: "Default chip read only: unselected",
                  ),
                  smallHeight(),
                  smallHeight(),
                  smallHeight(),
                  SemanticHeader(
                    title: "Default chip read only: selected",
                  style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  const VDefaultChipReadOnlySelected(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.DefaultChipReadOnlySelected,
                    componentName: 'Chip',
                    exampleName: 'ReadOnly_Selected_Chip',
                    copyLabel: "Default chip read only: selected",
                  ),
                  smallHeight(),
                  smallHeight(),*/
                  smallHeight(),
                  const VDivider(
                    dividerType: VDividerType.decorative,
                  ),
                  smallHeight(),
                  SemanticHeader(
                    title: "Removable chips",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                      fontWeight: VFontWeight.semiBold,
                    ),
                  ),
                  smallHeight(),
                  smallHeight(),
                  SemanticHeader(
                    title: "Default removable chip",
                    style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  const VDefaultChipRemovableStandard(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.DefaultChipRemovableStandard,
                    componentName: 'Chip',
                    exampleName: 'Removable_Standard_Chip',
                    copyLabel: "Default standard chip",
                  ),
                  smallHeight(),
                  smallHeight(),
                  SemanticHeader(
                    title: "Removable chip with icon",
                    style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  const VDefaultChipRemovableStandardWithIcon(),
                  const ShowCodeAccordion(
                    codeSegment:
                        CodeSegments.DefaultChipRemovableStandardWithIcon,
                    componentName: 'Chip',
                    exampleName: 'Removable_Standard_Chip_With_Icon',
                    copyLabel: "Standard chip with icon",
                  ),
                  smallHeight(),
                  smallHeight(),
                  SemanticHeader(
                    title: "Removable chip with avatar",
                    style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  const VDefaultChipRemovableStandardWithAvatar(),
                  const ShowCodeAccordion(
                    codeSegment:
                        CodeSegments.DefaultChipRemovableStandardWithAvatar,
                    componentName: 'Chip',
                    exampleName: 'Removable_Standard_Chip_With_Avatar',
                    copyLabel: "Standard chip with avatar",
                  ),
                  smallHeight(),
                  smallHeight(),
                  //! Waiting on design for read only chips to be renamed
                  SemanticHeader(
                    title: "Static removable chip",
                    style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  const VDefaultChipRemovableStandardReadOnly(),
                  const ShowCodeAccordion(
                    codeSegment:
                        CodeSegments.DefaultChipRemovableStandardReadOnly,
                    componentName: 'Chip',
                    exampleName: 'Removable_Standard_ReadOnly_Chip',
                    copyLabel: "Standard chip read only",
                  ),
                  smallHeight(),
                  smallHeight(),
                  SemanticHeader(
                    title: "Disabled removable chip",
                    style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  const VDefaultChipRemovableStandardDisabled(),
                  const ShowCodeAccordion(
                    codeSegment:
                        CodeSegments.DefaultChipRemovableStandardDisabled,
                    componentName: 'Chip',
                    exampleName: 'Removable_Standard_Disable_Chip',
                    copyLabel: "Standard chip disabled",
                  ),

                  smallHeight(),
                  SemanticHeader(
                    title: "Compact removable chip ",
                    style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  const VDefaultChipRemovableCompact(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.DefaultChipRemovableCompact,
                    componentName: 'Chip',
                    exampleName: 'Removable_Compact_Chip',
                    copyLabel: "Default compact chip ",
                  ),
                  smallHeight(),
                  smallHeight(),
                  SemanticHeader(
                    title: "Compact removable chip with icon ",
                    style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  const VDefaultChipRemovableCompactWithIcon(),
                  const ShowCodeAccordion(
                    codeSegment:
                        CodeSegments.DefaultChipRemovableCompactWithIcon,
                    componentName: 'Chip',
                    exampleName: 'Removable_Compact_Chip_With_Icon',
                    copyLabel: "Compact chip with icon ",
                  ),
                  smallHeight(),
                  smallHeight(),
                  SemanticHeader(
                    title: "Compact removable chip with avatar ",
                    style: defaultVTheme.textStyles.headline3.copyWith(),
                  ),
                  const VDefaultChipRemovableCompactWithAvatar(),
                  const ShowCodeAccordion(
                    codeSegment:
                        CodeSegments.DefaultChipRemovableCompactWithAvatar,
                    componentName: 'Chip',
                    exampleName: 'Removable_Compact_Chip_With_Avatar',
                    copyLabel: "Compact chip with avatar ",
                  ),
                  smallHeight(),
                  const SizedBox(height: 20)
                ],
              ),
            )),
      ),
    );
  }
}

// BEGIN DefaultChip
class VDefaultChip extends StatefulWidget {
  const VDefaultChip({Key? key}) : super(key: key);

  @override
  State<VDefaultChip> createState() => _VDefaultChipState();
}

class _VDefaultChipState extends State<VDefaultChip> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return VChipsSelection(
      chipLabel: "Label",
      isSelected: isSelected,
      onSelected: (p0) {
        setState(() {
          isSelected = p0;
        });
      },
    );
  }
}
// END

// BEGIN DefaultChipSelected
class VDefaultChipSelected extends StatelessWidget {
  const VDefaultChipSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsSelection(
      chipLabel: "Label",
      isSelected: true,
      onSelected: (_) {},
    );
  }
}
// END

// BEGIN DefaultChipDisabledUnselected
class VDefaultChipDisabledUnselected extends StatelessWidget {
  const VDefaultChipDisabledUnselected({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const VChipsSelection(
      chipLabel: "Label",
      isSelected: false,
      isDisabled: true,
      onSelected: null,
    );
  }
}
// END

// BEGIN DefaultChipDisabledSelected
class VDefaultChipDisabledSelected extends StatelessWidget {
  const VDefaultChipDisabledSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VChipsSelection(
      chipLabel: "Label",
      isSelected: true,
      isDisabled: true,
      onSelected: null,
    );
  }
}
// END

// BEGIN DefaultChipReadOnlyUnselected

class VDefaultChipReadOnlyUnselected extends StatelessWidget {
  const VDefaultChipReadOnlyUnselected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsSelection(
      chipLabel: "Label",
      isSelected: false,
      isReadOnly: true,
      onSelected: (_) {},
    );
  }
}
// END

// BEGIN DefaultChipReadOnlySelected
class VDefaultChipReadOnlySelected extends StatelessWidget {
  const VDefaultChipReadOnlySelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsSelection(
      chipLabel: "Label",
      isSelected: true,
      isReadOnly: true,
      onSelected: (_) {},
    );
  }
}
// END

// BEGIN VMultilineSelectionChip
class VMultilineSelectionChip extends StatefulWidget {
  const VMultilineSelectionChip({
    super.key,
  });

  @override
  State<VMultilineSelectionChip> createState() =>
      _VMultilineSelectionChipState();
}

class _VMultilineSelectionChipState extends State<VMultilineSelectionChip> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return VChipsSelection(
      chipLabel: "This is a chip label \nthat wraps on \nmultiple lines",
      isSelected: isSelected,
      onSelected: (p0) {
        setState(() {
          isSelected = p0;
        });
      },
    );
  }
}
// END

// BEGIN DefaultChipRemovableStandard
class VDefaultChipRemovableStandard extends StatelessWidget {
  const VDefaultChipRemovableStandard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsRemovable(
      chipLabel: "Label",
      onDeleted: () {},
      onPressed: () {},
    );
  }
}
// END

// BEGIN DefaultChipRemovableStandardWithIcon
class VDefaultChipRemovableStandardWithIcon extends StatelessWidget {
  const VDefaultChipRemovableStandardWithIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsRemovable(
      chipLabel: "Label",
      leading: const Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: VIcon(
          svgIcon: VIcons.accountTiny,
          iconColor: VColors.defaultActive,
          iconHeight: 20,
          iconWidth: 20,
        ),
      ),
      onDeleted: () {},
      onPressed: () {},
    );
  }
}
// END

// BEGIN DefaultChipRemovableStandardWithAvatar
class VDefaultChipRemovableStandardWithAvatar extends StatelessWidget {
  const VDefaultChipRemovableStandardWithAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsRemovable(
      chipLabel: "Label",
      leading: const Padding(
        padding: EdgeInsets.only(
          left: 5,
        ),
        child: VAvatarProfile(
          style: VAvatarStyle(
            radius: 16,
          ),
          backgroundImage: AssetImage("assets/images/avatarImage.png"),
        ),
      ),
      onDeleted: () {},
      onPressed: () {},
    );
  }
}
// END

// BEGIN DefaultChipRemovableStandardReadOnly
class VDefaultChipRemovableStandardReadOnly extends StatelessWidget {
  const VDefaultChipRemovableStandardReadOnly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsRemovable(
      chipLabel: "Label",
      isReadOnly: true,
      onDeleted: () {},
      onPressed: () {},
    );
  }
}
// END

// BEGIN DefaultChipRemovableStandardDisabled
class VDefaultChipRemovableStandardDisabled extends StatelessWidget {
  const VDefaultChipRemovableStandardDisabled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsRemovable(
      chipLabel: "Label",
      isDisabled: true,
      onDeleted: () {},
    );
  }
}
// END

// BEGIN DefaultChipRemovableCompact
class VDefaultChipRemovableCompact extends StatelessWidget {
  const VDefaultChipRemovableCompact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsRemovable(
      chipLabel: "Label",
      style: VChipRemovableStyle(
        chipLabelTextStyle: defaultVTheme.textStyles.uiLabel,
      ),
      chipsRemovableType: ChipsRemovableType.compactRemovable,
      onDeleted: () {},
      onPressed: () {},
    );
  }
}
// END

// BEGIN DefaultChipRemovableCompactWithIcon
class VDefaultChipRemovableCompactWithIcon extends StatelessWidget {
  const VDefaultChipRemovableCompactWithIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsRemovable(
      chipLabel: "Label",
      leading: const Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: VIcon(
          svgIcon: VIcons.accountTiny,
          iconColor: VColors.defaultActive,
          iconHeight: 18,
          iconWidth: 18,
        ),
      ),
      style: VChipRemovableStyle(
        chipLabelTextStyle: defaultVTheme.textStyles.uiLabel,
      ),
      chipsRemovableType: ChipsRemovableType.compactRemovable,
      onDeleted: () {},
      onPressed: () {},
    );
  }
}
// END

// BEGIN DefaultChipRemovableCompactWithAvatar
class VDefaultChipRemovableCompactWithAvatar extends StatelessWidget {
  const VDefaultChipRemovableCompactWithAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsRemovable(
      chipLabel: "Label",
      leading: const Padding(
        padding: EdgeInsets.only(
          left: 5,
        ),
        child: VAvatarProfile(
          style: VAvatarStyle(radius: 12),
          backgroundImage: AssetImage("assets/images/avatarImage.png"),
        ),
      ),
      style: VChipRemovableStyle(
        chipLabelTextStyle: defaultVTheme.textStyles.uiLabel,
      ),
      chipsRemovableType: ChipsRemovableType.compactRemovable,
      onDeleted: () {},
      onPressed: () {},
    );
  }
}
// END

// BEGIN DefaultChipRemovableCompactReadOnly
class VDefaultChipRemovableCompactReadOnly extends StatelessWidget {
  const VDefaultChipRemovableCompactReadOnly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsRemovable(
      chipLabel: "Label",
      style: VChipRemovableStyle(
        chipLabelTextStyle: defaultVTheme.textStyles.uiLabel,
      ),
      chipsRemovableType: ChipsRemovableType.compactRemovable,
      isReadOnly: true,
      onDeleted: () {},
    );
  }
}
// END

// BEGIN DefaultChipRemovableCompactDisabled
class VDefaultChipRemovableCompactDisabled extends StatelessWidget {
  const VDefaultChipRemovableCompactDisabled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsRemovable(
      chipLabel: "Label",
      style: VChipRemovableStyle(
        chipLabelTextStyle: defaultVTheme.textStyles.uiLabel,
      ),
      chipsRemovableType: ChipsRemovableType.compactRemovable,
      onDeleted: () {},
      isDisabled: true,
      onPressed: null,
    );
  }
}

// END
// BEGIN DefaultChipRemovableCompactDisabledWithIcon
class VDefaultChipRemovableCompactDisabledWithIcon extends StatelessWidget {
  const VDefaultChipRemovableCompactDisabledWithIcon({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsRemovable(
      chipLabel: "Label",
      leading: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: VIcon(
          svgIcon: VIcons.walletTiny,
          iconColor: VColors.defaultDisabled,
          iconHeight: 18,
          iconWidth: 18,
        ),
      ),
      style: VChipRemovableStyle(
        chipLabelTextStyle: defaultVTheme.textStyles.uiLabel,
      ),
      chipsRemovableType: ChipsRemovableType.compactRemovable,
      onDeleted: () {},
      isDisabled: true,
      onPressed: () {},
    );
  }
}
// END

// BEGIN DefaultChipRemovableDisabledCompactWithAvatar
class VDefaultChipRemovableDisabledCompactWithAvatar extends StatelessWidget {
  const VDefaultChipRemovableDisabledCompactWithAvatar({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VChipsRemovable(
      style: VChipRemovableStyle(
        chipLabelTextStyle: defaultVTheme.textStyles.uiLabel,
      ),
      chipLabel: "Label",
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 5,
        ),
        child: ExcludeSemantics(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                VColors.defaultDisabled,
                BlendMode.hardLight,
              ),
              child: const VAvatarProfile(
                style: VAvatarStyle(radius: 12),
                backgroundImage: AssetImage("assets/images/avatarImage.png"),
              ),
            ),
          ),
        ),
      ),
      isDisabled: true,
      chipsRemovableType: ChipsRemovableType.compactRemovable,
      onDeleted: () {},
      onPressed: null,
    );
  }
}
// END
