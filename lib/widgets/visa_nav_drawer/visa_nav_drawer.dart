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
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

// VNavDrawerStyle using ThemeExtension

class VNavDrawerStyle extends ThemeExtension<VNavDrawerStyle> {
  const VNavDrawerStyle({
    this.backgroundColor,
    this.selectedTileIndicatorColor,
    this.selectedTileColor,
    this.splashColor,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.borderRadius,
  });

  final Color? backgroundColor,
      selectedTileIndicatorColor,
      selectedTileColor,
      splashColor;

  final TextStyle? selectedLabelStyle, unselectedLabelStyle;

  final double? borderRadius;

  @override
  VNavDrawerStyle copyWith({
    Color? backgroundColor,
    Color? selectedTileIndicatorColor,
    Color? selectedTileColor,
    Color? splashColor,
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
    double? borderRadius,
  }) =>
      VNavDrawerStyle(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        selectedTileIndicatorColor:
            selectedTileIndicatorColor ?? this.selectedTileIndicatorColor,
        selectedTileColor: selectedTileColor ?? this.selectedTileColor,
        splashColor: splashColor ?? this.splashColor,
        selectedLabelStyle: selectedLabelStyle ?? this.selectedLabelStyle,
        unselectedLabelStyle: unselectedLabelStyle ?? this.unselectedLabelStyle,
        borderRadius: borderRadius ?? this.borderRadius,
      );

  @override
  VNavDrawerStyle lerp(ThemeExtension<VNavDrawerStyle>? other, double t) {
    if (other is! VNavDrawerStyle) {
      return this;
    }

    return VNavDrawerStyle(
      backgroundColor: Color.lerp(
        backgroundColor,
        other.backgroundColor,
        t,
      ),
      selectedTileIndicatorColor: Color.lerp(
        selectedTileIndicatorColor,
        other.selectedTileIndicatorColor,
        t,
      ),
      selectedTileColor:
          Color.lerp(selectedTileColor, other.selectedTileColor, t),
      splashColor: Color.lerp(splashColor, other.splashColor, t),
      selectedLabelStyle: selectedLabelStyle ?? other.selectedLabelStyle,
      unselectedLabelStyle: selectedLabelStyle ?? other.unselectedLabelStyle,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
    );
  }
}

class VNavDrawerSection {
  final String title;
  final List<VNavDrawerItem> items;

  VNavDrawerSection({
    required this.title,
    required this.items,
  });
}

class VNavDrawerItem {
  final String label;
  final Widget? icon;

  VNavDrawerItem({
    required this.label,
    this.icon,
  });
}

class VNavDrawer extends StatelessWidget {
  final List<VNavDrawerSection> vNavDrawerSections;
  final int currentIndex;
  final Function(int) onTap;
  final VNavDrawerStyle? style;
  final Widget? bottomItems;
  final Widget? header;
  final VExt? vExt;

  const VNavDrawer({
    super.key,
    required this.vNavDrawerSections,
    this.currentIndex = 0,
    required this.onTap,
    this.style,
    this.bottomItems,
    this.header,
    this.vExt,
  });

  @override
  Widget build(BuildContext context) {
    int globalIndex = 0;
    final dynamic defaultStyle;
    if (vExt == null || vExt is VDef) {
      defaultStyle = Theme.of(context).brightness == Brightness.dark
          ? getDefaultColorSchemeDark()!
          : getDefaultColorScheme()!;
    } else {
      defaultStyle = Theme.of(context).brightness == Brightness.dark
          ? getAltColorSchemeDark()!
          : getAltColorScheme()!;
    }
    final backgroundColor = style?.backgroundColor ?? defaultStyle?.surface1;
    final borderRadius =
        style?.borderRadius ?? defaultStyle?.vNavDrawerProperties.borderRadius;
    vNavDrawerSections.fold(
      0,
      (previousValue, section) => previousValue + section.items.length,
    );

    return Drawer(
      surfaceTintColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      backgroundColor: backgroundColor,
      child: Column(
        children: [
          if (header != null) header!,
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                for (int sectionIndex = 0;
                    sectionIndex < vNavDrawerSections.length;
                    sectionIndex++) ...[
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 12, 40, 11.5),
                    child: Semantics(
                      header: true,
                      child: Text(
                        vNavDrawerSections[sectionIndex].title,
                        style: defaultVTheme.textStyles.overline.copyWith(
                          color: VColors.defaultTextSubtle,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  for (int itemIndex = 0;
                      itemIndex < vNavDrawerSections[sectionIndex].items.length;
                      itemIndex++, globalIndex++) ...[
                    Semantics(
                      label:
                          "${itemIndex + 1} out of ${vNavDrawerSections[sectionIndex].items.length}",
                      child: VNavDrawerItems(
                        label: vNavDrawerSections[sectionIndex]
                            .items[itemIndex]
                            .label,
                        icon: vNavDrawerSections[sectionIndex]
                            .items[itemIndex]
                            .icon,
                        currentIndex: currentIndex,
                        index: globalIndex,
                        onTap: onTap,
                        style: style,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ]
                ],
              ],
            ),
          ),
          if (bottomItems != null) bottomItems!,
        ],
      ),
    );
  }
}

class VNavDrawerItems extends StatelessWidget {
  final String label;
  final Widget? icon;
  final int? currentIndex;
  final int index;
  final Function(int) onTap;
  final VNavDrawerStyle? style;
  final VExt? vExt;

  const VNavDrawerItems({
    super.key,
    required this.label,
    this.icon,
    this.currentIndex,
    required this.index,
    required this.onTap,
    this.style,
    this.vExt,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;

    defaultStyle = getDefaultColorScheme()!;

    Color? selectedTileIndicatorColor =
        style?.selectedTileIndicatorColor ?? defaultStyle?.activeHover;
    Color? selectedTileColor =
        style?.selectedTileColor ?? defaultStyle?.surface3;
    Color? splashColor = style?.splashColor ?? defaultStyle?.surfaceLowlight;
    TextStyle? selectedLabelStyle = style?.selectedLabelStyle ??
        defaultStyle?.vNavDrawerProperties?.selectedLabelStyle;
    TextStyle? unselectedLabelStyle = style?.unselectedLabelStyle ??
        defaultStyle?.vNavDrawerProperties?.unselectedLabelStyle;

    return IntrinsicHeight(
      child: Row(
        children: [
          currentIndex == index
              ? Container(
                  width: 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: selectedTileIndicatorColor),
                )
              : const SizedBox(
                  width: 2,
                ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Theme(
              data: ThemeData(highlightColor: Colors.transparent),
              child: Semantics(
                label: "Link",
                child: ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
                  horizontalTitleGap: 13,
                  focusColor: Colors.transparent,
                  selectedTileColor: selectedTileColor,
                  splashColor: splashColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  visualDensity: const VisualDensity(vertical: -2),
                  title: Row(
                    children: [
                      if (icon != null) icon!,
                      const SizedBox(width: 10),
                      Text(
                        label,
                        style: currentIndex == index
                            ? selectedLabelStyle
                            : unselectedLabelStyle,
                      ),
                    ],
                  ),
                  selected: currentIndex == index,
                  onTap: () {
                    // Update the state of the app
                    onTap(index);
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
