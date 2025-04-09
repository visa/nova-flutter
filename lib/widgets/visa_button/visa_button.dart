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
// Visa button constructor
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

// VButtonStyle using ThemeExtension
class VButtonStyle extends ThemeExtension<VButtonStyle> {
  const VButtonStyle({
    this.backgroundColorDisabled,
    this.backgroundColorActive,
    this.foregroundColorDisabled,
    this.foregroundColorActive,
    this.overlayColorPressed,
    this.overlayColorFocused,
    this.shadowColor,
    this.elevation,
    this.borderRadiusActive,
    this.borderRadiusDisabled,
    this.minimumSize,
    this.borderSideActive,
    this.borderSideDisabled,
    this.padding,
  });

  final Color? backgroundColorDisabled,
      backgroundColorActive,
      foregroundColorDisabled,
      foregroundColorActive,
      overlayColorPressed,
      overlayColorFocused,
      shadowColor;
  final double? elevation, borderRadiusActive, borderRadiusDisabled;
  final Size? minimumSize;
  final BorderSide? borderSideActive, borderSideDisabled;
  final EdgeInsetsGeometry? padding;

  @override
  VButtonStyle copyWith({
    Color? backgroundColorDisabled,
    Color? backgroundColorActive,
    Color? foregroundColorDisabled,
    Color? foregroundColorActive,
    Color? overlayColorPressed,
    Color? overlayColorFocused,
    Color? shadowColor,
    double? elevation,
    double? borderRadiusActive,
    double? borderRadiusDisabled,
    Size? minimumSize,
    TextStyle? buttonTextStyle,
    BorderSide? borderSideActive,
    BorderSide? borderSideDisabled,
    EdgeInsetsGeometry? padding,
  }) =>
      VButtonStyle(
        backgroundColorDisabled:
            backgroundColorDisabled ?? this.backgroundColorDisabled,
        backgroundColorActive:
            backgroundColorActive ?? this.backgroundColorActive,
        foregroundColorDisabled:
            foregroundColorDisabled ?? this.foregroundColorDisabled,
        foregroundColorActive:
            foregroundColorActive ?? this.foregroundColorActive,
        overlayColorPressed: overlayColorPressed ?? this.overlayColorPressed,
        overlayColorFocused: overlayColorFocused ?? this.overlayColorFocused,
        shadowColor: shadowColor ?? this.shadowColor,
        elevation: elevation ?? this.elevation,
        minimumSize: minimumSize ?? this.minimumSize,
        borderRadiusActive: borderRadiusActive ?? this.borderRadiusActive,
        borderRadiusDisabled: borderRadiusDisabled ?? this.borderRadiusDisabled,
        borderSideActive: borderSideActive ?? this.borderSideActive,
        borderSideDisabled: borderSideDisabled ?? this.borderSideDisabled,
        padding: padding ?? this.padding,
      );

  @override
  VButtonStyle lerp(ThemeExtension<VButtonStyle>? other, double t) {
    if (other is! VButtonStyle) {
      return this;
    }

    return VButtonStyle(
      backgroundColorDisabled:
          Color.lerp(backgroundColorDisabled, other.backgroundColorDisabled, t),
      backgroundColorActive:
          Color.lerp(backgroundColorActive, other.backgroundColorActive, t),
      foregroundColorDisabled:
          Color.lerp(foregroundColorDisabled, other.foregroundColorDisabled, t),
      foregroundColorActive:
          Color.lerp(foregroundColorActive, other.foregroundColorActive, t),
      overlayColorPressed:
          Color.lerp(overlayColorPressed, other.overlayColorPressed, t),
      overlayColorFocused:
          Color.lerp(overlayColorFocused, other.overlayColorFocused, t),
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      minimumSize: minimumSize ?? other.minimumSize,
      borderRadiusActive:
          lerpDouble(borderRadiusActive, other.borderRadiusActive, t),
      borderRadiusDisabled:
          lerpDouble(borderRadiusDisabled, other.borderRadiusDisabled, t),
      borderSideActive: borderSideActive ?? other.borderSideActive,
      borderSideDisabled: borderSideDisabled ?? other.borderSideDisabled,
      padding: padding ?? other.padding,
    );
  }
}

class VButton extends StatelessWidget {
  const VButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.vExt,
    this.style,
  }) : super(key: key);

  final Widget? child;
  final VoidCallback? onPressed;
  final VExt? vExt;
  final VButtonStyle? style;

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

    final backgroundColorDisabled =
        style?.backgroundColorDisabled ?? defaultStyle.disabled;
    final backgroundColorActive =
        style?.backgroundColorActive ?? defaultStyle.active;
    final foregroundColorDisabled =
        style?.foregroundColorDisabled ?? defaultStyle.surface1;
    final foregroundColorActive =
        style?.foregroundColorActive ?? defaultStyle.surface1;
    final overlayColorPressed =
        style?.overlayColorPressed ?? defaultStyle.activePressed;
    final overlayColorFocused = style?.overlayColorFocused;
    final shadowColor = style?.shadowColor ?? defaultStyle.transparent;
    final elevation =
        style?.elevation ?? defaultStyle.vButtonProperties?.elevation;
    final minimumSize =
        style?.minimumSize ?? defaultStyle.vButtonProperties?.minimumSize;
    final borderRadiusActive = style?.borderRadiusActive ??
        defaultStyle.vButtonProperties.borderRadiusActive;
    final borderRadiusDisabled = style?.borderRadiusDisabled ??
        defaultStyle.vButtonProperties.borderRadiusDisabled;
    final borderSideActive = style?.borderSideActive ??
        defaultStyle.vButtonProperties.borderSideActive;
    final borderSideDisabled = style?.borderSideDisabled ??
        defaultStyle.vButtonProperties.borderSideDisabled;
    final EdgeInsetsGeometry scaledPadding = ButtonStyleButton.scaledPadding(
      const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
      const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
      MediaQuery.textScalerOf(context).scale(1),
    );
    EdgeInsetsGeometry padding = style?.padding ?? scaledPadding;

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(padding),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          return states.contains(MaterialState.disabled)
              ? backgroundColorDisabled
              : backgroundColorActive;
        }),
        // Foreground color is the color for text and icon
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          return states.contains(MaterialState.disabled)
              ? foregroundColorDisabled
              : foregroundColorActive;
        }),
        // Overlay color is the color when having action
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return overlayColorPressed;
          }
          if (states.contains(MaterialState.focused)) {
            return overlayColorFocused;
          }
          return null;
        }),
        // Make the button flat
        elevation: MaterialStateProperty.all(elevation),
        // Get rid of shadow
        shadowColor: MaterialStateProperty.all(shadowColor),
        // Figma size requirement
        minimumSize: MaterialStateProperty.all(minimumSize),
        // Figma border requirement
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusDisabled),
              side: borderSideDisabled,
            );
          } else {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusActive),
              side: borderSideActive,
            );
          }
        }),
      ),
      child: child,
    );
  }
}

class VIconButton extends StatelessWidget {
  const VIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.vExt,
    this.style,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget icon;
  final VButtonStyle? style;
  final VExt? vExt;

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (vExt == null || vExt is VDef) {
      defaultStyle = getDefaultColorScheme()!;
    } else {
      defaultStyle = getAltColorScheme()!;
    }

    Color? backgroundColorDisabled =
        style?.backgroundColorDisabled ?? defaultStyle.disabled;
    Color? backgroundColorActive =
        style?.backgroundColorActive ?? defaultStyle.active;
    Color? foregroundColorDisabled =
        style?.foregroundColorDisabled ?? defaultStyle.disabled;
    Color? foregroundColorActive =
        style?.foregroundColorActive ?? defaultStyle.surface1;
    Color? overlayColorPressed =
        style?.overlayColorPressed ?? defaultStyle.activePressed;
    Color? overlayColorFocused =
        style?.overlayColorFocused ?? defaultStyle.surfaceLowlight;
    Color? shadowColor = style?.shadowColor ?? defaultStyle.transparent;
    double? elevation =
        style?.elevation ?? defaultStyle.vButtonProperties?.elevation;
    Size? minimumSize =
        style?.minimumSize ?? defaultStyle.vButtonProperties?.minimumSize;
    BorderSide borderSideActive = style?.borderSideActive ??
        defaultStyle.vButtonProperties.borderSideActive;
    BorderSide borderSideDisabled = style?.borderSideDisabled ??
        defaultStyle.vButtonProperties.borderSideDisabled;
    EdgeInsetsGeometry padding =
        style?.padding ?? defaultStyle.vButtonProperties.padding;

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          return states.contains(MaterialState.disabled)
              ? backgroundColorDisabled
              : backgroundColorActive;
        }),
        // Foreground color is the color for text and icon
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          return states.contains(MaterialState.disabled)
              ? foregroundColorDisabled
              : foregroundColorActive;
        }),
        // Overlay color is the color when having action
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return overlayColorPressed;
          }
          if (states.contains(MaterialState.focused)) {
            return overlayColorFocused;
          }
          return null;
        }),
        // Make the button flat
        elevation: MaterialStateProperty.all(elevation),
        // Get rid of shadow
        shadowColor: MaterialStateProperty.all(shadowColor),
        // Figma size requirement
        minimumSize: MaterialStateProperty.all(minimumSize),
        // Figma border requirement
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return CircleBorder(
              side: borderSideDisabled,
            );
          } else {
            return CircleBorder(
              side: borderSideActive,
            );
          }
        }),
        padding: MaterialStateProperty.all(padding),
      ),
      onPressed: onPressed,
      child: ExcludeSemantics(child: icon),
    );
  }
}
