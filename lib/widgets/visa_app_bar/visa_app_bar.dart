// Copyright (c) 2025 Visa, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and
// limitations under the License.
//
// Visa AppBar
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// VAppBarStyle using ThemeExtension
class VAppBarStyle extends ThemeExtension<VAppBarStyle> {
  const VAppBarStyle({
    this.backgroundColor,
    this.splashColor,
    this.iconColor,
    this.elevation,
    this.bottomOpacity,
    this.titleTextStyle,
    this.borderRadius,
  });

  final Color? backgroundColor, splashColor, iconColor;
  final double? elevation, bottomOpacity, borderRadius;
  final TextStyle? titleTextStyle;

  @override
  VAppBarStyle copyWith({
    Color? backgroundColor,
    Color? splashColor,
    Color? iconColor,
    double? elevation,
    double? bottomOpacity,
    double? borderRadius,
    TextStyle? titleTextStyle,
  }) =>
      VAppBarStyle(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        splashColor: splashColor ?? this.splashColor,
        iconColor: iconColor ?? this.iconColor,
        elevation: elevation ?? this.elevation,
        bottomOpacity: bottomOpacity ?? this.bottomOpacity,
        borderRadius: borderRadius ?? this.borderRadius,
        titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      );

  @override
  VAppBarStyle lerp(ThemeExtension<VAppBarStyle>? other, double t) {
    if (other is! VAppBarStyle) {
      return this;
    }

    return VAppBarStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      splashColor: Color.lerp(splashColor, other.splashColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      bottomOpacity: lerpDouble(bottomOpacity, other.bottomOpacity, t),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
      titleTextStyle: titleTextStyle,
    );
  }
}

class VAppBar extends StatelessWidget implements PreferredSizeWidget {
  const VAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.actionList,
    this.bottom,
    this.centerTitle = true,
    this.backButtonAction,
    this.style,
    this.vExt,
    this.kToolbarHeight = 60,
  })  : preferredSize = const Size.fromHeight(60),
        super(key: key);

  @override
  final Size preferredSize;
  final Widget? title, leading;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actionList;
  final VoidCallback? backButtonAction;
  final VAppBarStyle? style;
  final VExt? vExt;
  final double kToolbarHeight;

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
    final backgroundColor = style?.backgroundColor ?? defaultStyle.surface1;
    final splashColor = style?.splashColor ?? defaultStyle.surfaceLowlight;
    final iconColor = style?.iconColor;
    final elevation =
        style?.elevation ?? defaultStyle.vAppBarProperties?.elevation;
    final bottomOpacity =
        style?.bottomOpacity ?? defaultStyle.vAppBarProperties?.buttonOpacity;
    final borderRadius =
        style?.borderRadius ?? defaultStyle.vAppBarProperties?.borderRadius;
    final titleTextStyle =
        style?.titleTextStyle ?? defaultStyle.vAppBarProperties?.titleTextStyle;

    return AppBar(
      leadingWidth: 72,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      titleTextStyle: titleTextStyle,
      elevation: elevation,
      bottomOpacity: bottomOpacity!,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      toolbarHeight: kToolbarHeight,
      title: title,
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: leading ??
            Semantics(
              label: "back",
              button: true,
              child: InkWell(
                customBorder: const CircleBorder(),
                splashColor: splashColor,
                onTap: backButtonAction ??
                    () {
                      Navigator.pop(context);
                    },
                // 44dp passes VGAR A11y test but does not pass Android A11y scanner
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: VIcon(
                    svgIcon: VIcons.arrowLeftLow,
                    iconHeight: 16,
                    iconWidth: 16,
                    iconColor: iconColor,
                  ),
                ),
              ),
            ),
      ),
      actions: actionList,
      bottom: bottom,
    );
  }
}
