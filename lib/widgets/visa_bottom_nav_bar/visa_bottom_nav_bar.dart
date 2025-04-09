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

// VBottomNavBarStyle using ThemeExtension

class VBottomNavBarStyle extends ThemeExtension<VBottomNavBarStyle> {
  const VBottomNavBarStyle({
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.splashColor,
    this.borderColor,
    this.selectedFontSize,
    this.unselectedFontSize,
    this.selectedIconSize,
    this.unselectedIconSize,
  });

  final Color? backgroundColor,
      selectedItemColor,
      unselectedItemColor,
      selectedTextColor,
      unselectedTextColor,
      splashColor,
      borderColor;

  final double? selectedFontSize,
      unselectedFontSize,
      selectedIconSize,
      unselectedIconSize;

  @override
  VBottomNavBarStyle copyWith({
    Color? backgroundColor,
    Color? selectedItemColor,
    Color? unselectedItemColor,
    Color? selectedTextColor,
    Color? unselectedTextColor,
    Color? splashColor,
    Color? borderColor,
    double? selectedFontSize,
    double? unselectedFontSize,
    double? selectedIconSize,
    double? unselectedIconSize,
  }) =>
      VBottomNavBarStyle(
          backgroundColor: backgroundColor ?? this.backgroundColor,
          selectedItemColor: selectedItemColor ?? this.selectedItemColor,
          unselectedItemColor: unselectedItemColor ?? this.unselectedItemColor,
          selectedTextColor: selectedTextColor ?? this.selectedTextColor,
          unselectedTextColor: unselectedTextColor ?? this.unselectedTextColor,
          splashColor: splashColor ?? this.splashColor,
          borderColor: borderColor ?? this.borderColor,
          selectedFontSize: selectedFontSize ?? this.selectedFontSize,
          unselectedFontSize: unselectedFontSize ?? this.unselectedFontSize,
          selectedIconSize: selectedIconSize ?? this.selectedIconSize,
          unselectedIconSize: unselectedIconSize ?? this.unselectedIconSize);

  @override
  VBottomNavBarStyle lerp(ThemeExtension<VBottomNavBarStyle>? other, double t) {
    if (other is! VBottomNavBarStyle) {
      return this;
    }

    return VBottomNavBarStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      selectedItemColor:
          Color.lerp(selectedItemColor, other.selectedItemColor, t),
      unselectedItemColor:
          Color.lerp(unselectedItemColor, other.unselectedItemColor, t),
      selectedTextColor:
          Color.lerp(selectedTextColor, other.selectedTextColor, t),
      unselectedTextColor:
          Color.lerp(unselectedTextColor, other.unselectedTextColor, t),
      splashColor: Color.lerp(splashColor, splashColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      selectedFontSize: lerpDouble(selectedFontSize, other.selectedFontSize, t),
      unselectedFontSize:
          lerpDouble(unselectedFontSize, other.unselectedFontSize, t),
      selectedIconSize: lerpDouble(selectedIconSize, other.selectedIconSize, t),
      unselectedIconSize:
          lerpDouble(unselectedIconSize, other.unselectedIconSize, t),
    );
  }
}

// Visa Bottom Navigation Bar
class VBottomNavBar extends StatelessWidget {
  final List<VBottomBarItems> visaBottomNavBarItems;
  final int currentIndex;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final Function(int) onTap;
  final LinearGradient? gradient;
  final VBottomNavBarStyle? style;
  final VExt? vExt;

  const VBottomNavBar({
    super.key,
    required this.visaBottomNavBarItems,
    this.currentIndex = 0,
    required this.onTap,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 2,
    this.gradient,
    this.style,
    this.vExt,
  });
  @override
  Widget build(BuildContext context) {
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
    final borderColor = style?.borderColor ?? defaultStyle?.border;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: backgroundColor,
          gradient: gradient,
          border: Border(top: BorderSide(color: borderColor!))),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < visaBottomNavBarItems.length; i++) ...[
              Expanded(
                child: Semantics(
                  selected: i == currentIndex,
                  label: "${i + 1} of ${visaBottomNavBarItems.length}",
                  child: VBottomNavBarItems(
                    icon: visaBottomNavBarItems[i].icon,
                    label: visaBottomNavBarItems[i].label,
                    currentIndex: currentIndex,
                    enableLineIndicator: enableLineIndicator,
                    lineIndicatorWidth: lineIndicatorWidth,
                    index: i,
                    onTap: onTap,
                    style: style,
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

// Visa Bottom Navigation Bar Items
class VBottomBarItems {
  final String icon;
  final String label;

  VBottomBarItems({
    required this.icon,
    required this.label,
  });
}

class VBottomNavBarItems extends StatelessWidget {
  final String icon;
  final String label;
  final int? currentIndex;
  final int index;
  final Function(int) onTap;
  final bool enableLineIndicator;
  final double lineIndicatorWidth;
  final VBottomNavBarStyle? style;

  const VBottomNavBarItems({
    super.key,
    required this.icon,
    required this.label,
    this.currentIndex,
    required this.onTap,
    required this.index,
    this.enableLineIndicator = true,
    this.lineIndicatorWidth = 2,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = getDefaultColorScheme();
    final selectedItemColor = style?.selectedItemColor ?? defaultStyle?.active;
    final unselectedItemColor =
        style?.unselectedItemColor ?? defaultStyle?.subtle;
    final selectedTextColor = style?.selectedTextColor ?? defaultStyle?.text;
    final unselectedTextColor =
        style?.unselectedTextColor ?? defaultStyle?.textSubtle;
    final splashColor = style?.splashColor ?? Colors.transparent;
    final selectedFontSize = style?.selectedFontSize ?? 12;
    final unselectedFontSize = style?.unselectedFontSize ?? 12;
    final selectedIconHeight = style?.selectedIconSize ?? 24;
    final selectedIconWidth = style?.selectedIconSize ?? 24;
    final unselectedIconHeight = style?.unselectedIconSize ?? 24;
    final unselectedIconWidth = style?.unselectedIconSize ?? 24;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onTap(index),
            splashColor: splashColor,
            child: Container(
              decoration: BoxDecoration(
                border: enableLineIndicator
                    ? Border(
                        top: BorderSide(
                        color: currentIndex == index
                            ? selectedItemColor!
                            : Colors.transparent,
                        width: lineIndicatorWidth,
                      ))
                    : null,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  VIcon(
                    svgIcon: icon,
                    iconHeight: currentIndex == index
                        ? selectedIconHeight
                        : unselectedIconHeight,
                    iconWidth: currentIndex == index
                        ? selectedIconWidth
                        : unselectedIconWidth,
                    iconColor: currentIndex == index
                        ? selectedItemColor
                        : unselectedItemColor,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: defaultVTheme.textStyles.uiLabelSmall.copyWith(
                      fontSize: currentIndex == index
                          ? selectedFontSize
                          : unselectedFontSize,
                      color: currentIndex == index
                          ? selectedTextColor
                          : unselectedTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
