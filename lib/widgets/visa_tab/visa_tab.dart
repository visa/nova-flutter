// Copyright (c) 2025 Visa, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and
// limitations under the License.
//
// Visa Tab Bar and Tab

import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

// VTabBarStyle using ThemeExtension
class VTabBarStyle extends ThemeExtension<VTabBarStyle> {
  const VTabBarStyle(
      {this.labelColor,
      this.unselectedLabelColor,
      this.overlayColor,
      this.overlayColorPressed,
      this.indicatorWeight,
      this.indicatorColor,
      this.labelStyle,
      this.unselectedLabelStyle,
      this.unselectedBackgroundColor,
      this.selectedBackgroundColor});

  final Color? labelColor,
      unselectedLabelColor,
      unselectedBackgroundColor,
      selectedBackgroundColor,
      overlayColor,
      overlayColorPressed,
      indicatorColor;
  final double? indicatorWeight;
  final TextStyle? labelStyle, unselectedLabelStyle;

  @override
  VTabBarStyle copyWith({
    Color? labelColor,
    Color? unselectedLabelColor,
    Color? overlayColor,
    Color? overlayColorPressed,
    Color? indicatorColor,
    Color? unselectedBackgroundColor,
    Color? selectedBackgroundColor,
    double? indicatorWeight,
    double? bottomOpacity,
    TextStyle? labelStyle,
    TextStyle? unselectedLabelStyle,
  }) =>
      VTabBarStyle(
        labelColor: labelColor ?? this.labelColor,
        unselectedLabelColor: unselectedLabelColor ?? this.unselectedLabelColor,
        overlayColor: overlayColor ?? this.overlayColor,
        overlayColorPressed: overlayColorPressed ?? this.overlayColorPressed,
        unselectedBackgroundColor:
            unselectedBackgroundColor ?? this.unselectedBackgroundColor,
        selectedBackgroundColor:
            selectedBackgroundColor ?? this.selectedBackgroundColor,
        indicatorWeight: indicatorWeight ?? this.indicatorWeight,
        indicatorColor: indicatorColor ?? this.indicatorColor,
        labelStyle: labelStyle ?? this.labelStyle,
        unselectedLabelStyle: unselectedLabelStyle ?? this.unselectedLabelStyle,
      );

  @override
  VTabBarStyle lerp(ThemeExtension<VTabBarStyle>? other, double t) {
    if (other is! VTabBarStyle) {
      return this;
    }

    return VTabBarStyle(
      labelColor: Color.lerp(labelColor, other.labelColor, t),
      unselectedLabelColor:
          Color.lerp(unselectedLabelColor, other.unselectedLabelColor, t),
      overlayColor: Color.lerp(overlayColor, other.overlayColor, t),
      overlayColorPressed:
          Color.lerp(overlayColorPressed, other.overlayColorPressed, t),
      unselectedBackgroundColor: Color.lerp(
          unselectedBackgroundColor, other.unselectedBackgroundColor, t),
      selectedBackgroundColor:
          Color.lerp(selectedBackgroundColor, other.selectedBackgroundColor, t),
      indicatorWeight: lerpDouble(indicatorWeight, other.indicatorWeight, t),
      indicatorColor: Color.lerp(indicatorColor, other.indicatorColor, t),
      labelStyle: labelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
    );
  }
}

class VTabBar extends StatefulWidget implements PreferredSizeWidget {
  const VTabBar({
    Key? key,
    required this.vTabs,
    this.style,
    this.vExt,
    this.controller,
  }) : super(key: key);

  final List<Widget> vTabs;
  final VTabBarStyle? style;
  final VExt? vExt;
  final TabController? controller;

  @override
  State<VTabBar> createState() => _VTabBarState();

  @override
  Size get preferredSize {
    double maxHeight = 46.0;
    for (final Widget item in vTabs) {
      if (item is PreferredSizeWidget) {
        final double itemHeight = item.preferredSize.height;
        maxHeight = math.max(itemHeight, maxHeight);
      }
    }
    // Think about how to add indicator weight here...
    return Size.fromHeight(maxHeight + 2);
  }

  bool get vTabHasTextAndIcon {
    for (final Widget item in vTabs) {
      if (item is PreferredSizeWidget) {
        if (item.preferredSize.height == 72.0) {
          return true;
        }
      }
    }
    return false;
  }
}

class _VTabBarState extends State<VTabBar> {
  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (widget.vExt == null || widget.vExt is VDef) {
      defaultStyle = Theme.of(context).brightness == Brightness.dark
          ? getDefaultColorSchemeDark()!
          : getDefaultColorScheme()!;
    } else {
      defaultStyle = Theme.of(context).brightness == Brightness.dark
          ? getAltColorSchemeDark()!
          : getAltColorScheme()!;
    }
    final labelColor = widget.style?.labelColor ?? defaultStyle?.text;
    final unselectedLabelColor =
        widget.style?.unselectedLabelColor ?? defaultStyle?.textSubtle;
    final overlayColor =
        widget.style?.overlayColor ?? defaultStyle?.surfaceLowlight;
    final overlayColorPressed =
        widget.style?.overlayColorPressed ?? defaultStyle?.surfaceLowlight;
    final unselectedBackgroundColor =
        widget.style?.unselectedBackgroundColor ?? defaultStyle?.surface1;
    final selectedBackgroundColor =
        widget.style?.selectedBackgroundColor ?? defaultStyle?.surface1;
    final indicatorWeight = widget.style?.indicatorWeight ??
        defaultStyle?.vTabBarProperties?.indicatorWeight;
    final indicatorColor =
        widget.style?.indicatorColor ?? defaultStyle?.activeHover;
    final labelStyle =
        widget.style?.labelStyle ?? defaultStyle?.vTabBarProperties?.labelStyle;
    final unselectedLabelStyle = widget.style?.unselectedLabelStyle ??
        defaultStyle?.vTabBarProperties?.unselectedLabelStyle;

    return VMatTabBar(
      controller: widget.controller,
      labelStyle: labelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor,
      vTabs: widget.vTabs,
      indicatorWeight: indicatorWeight!,
      indicatorColor: indicatorColor,
      overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return overlayColorPressed!;
        }
        return overlayColor!;
      }),
      unselectedBackgroundColor: unselectedBackgroundColor,
      selectedBackgroundColor: selectedBackgroundColor,
    );
  }
}

class VTab extends StatelessWidget implements PreferredSizeWidget {
  const VTab({
    super.key,
    this.text,
    this.icon,
    this.child,
    this.height,
  });

  final String? text;
  final Widget? child;
  final Widget? icon;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return VMatTab(
      text: text,
      icon: icon,
      height: height,
      child: child,
    );
  }

  @override
  Size get preferredSize {
    if (height != null) {
      return Size.fromHeight(height!);
    } else if ((text != null || child != null) && icon != null) {
      return const Size.fromHeight(72.0);
    } else {
      return const Size.fromHeight(46.0);
    }
  }
}
