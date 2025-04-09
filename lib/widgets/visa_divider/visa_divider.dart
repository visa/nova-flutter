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
// Visa divider constructor
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

enum VDividerType {
  section,
  decorative,
  standard,
}

// VDividerStyle using ThemeExtension
class VDividerStyle extends ThemeExtension<VDividerStyle> {
  const VDividerStyle({
    this.dividerColor,
    this.thickness,
    this.height,
    this.indent,
    this.endIndent,
  });

  final Color? dividerColor;
  final double? thickness, height, indent, endIndent;

  @override
  VDividerStyle copyWith({
    Color? backgroundColor,
    double? thickness,
    height,
    indent,
    endIndent,
  }) =>
      VDividerStyle(
        dividerColor: backgroundColor ?? this.dividerColor,
        thickness: thickness ?? this.thickness,
        height: height ?? this.height,
        indent: indent ?? this.indent,
        endIndent: endIndent ?? this.endIndent,
      );

  @override
  VDividerStyle lerp(ThemeExtension<VDividerStyle>? other, double t) {
    if (other is! VDividerStyle) {
      return this;
    }

    return VDividerStyle(
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t),
      height: lerpDouble(height, other.height, t),
      thickness: lerpDouble(thickness, other.thickness, t),
      indent: lerpDouble(indent, other.indent, t),
      endIndent: lerpDouble(endIndent, other.endIndent, t),
    );
  }
}

class VDivider extends StatelessWidget {
  const VDivider({
    Key? key,
    // BEGIN properties
    this.height,
    this.indent,
    this.endIndent,
    this.dividerType = VDividerType.standard,
    this.style,
    this.vExt,
    // END
  }) : super(key: key);

  final double? height, indent, endIndent;
  final VDividerType dividerType;
  final VDividerStyle? style;
  final VExt? vExt;

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (vExt == null || vExt is VDef) {
      defaultStyle = Theme.of(context).brightness == Brightness.dark ? getDefaultColorSchemeDark()! : getDefaultColorScheme()!;
    } else {
      defaultStyle = Theme.of(context).brightness == Brightness.dark ? getAltColorSchemeDark()! : getAltColorScheme()!;
    }
    final height = style?.height ?? defaultStyle.vDividerProperties?.height;
    final indent = style?.indent ?? defaultStyle.vDividerProperties?.indent;
    final endIndent = style?.endIndent ?? defaultStyle.vDividerProperties?.endIndent;
    Color getDividerColor() {
      switch (dividerType) {
        case VDividerType.section:
          return style?.dividerColor ?? defaultStyle.active;
        case VDividerType.decorative:
          return style?.dividerColor ?? defaultStyle.border;
        default:
          return style?.dividerColor ?? defaultStyle.activeSubtle.withOpacity(0.5);
      }
    }

    double getDividerThickness(dividerType) {
      if (dividerType == VDividerType.section) {
        return style?.thickness ?? (defaultStyle.vDividerProperties?.thickness + 1.0);
      } else {
        return style?.thickness ?? defaultStyle.vDividerProperties?.thickness;
      }
    }

    return Divider(
      height: height,
      thickness: getDividerThickness(dividerType),
      indent: indent,
      endIndent: endIndent,
      color: getDividerColor(),
    );
  }
}
