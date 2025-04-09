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
// Visa Nova Flutter Progress

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// VProgressStyle using ThemeExtension
class VProgressStyle extends ThemeExtension<VProgressStyle> {
  const VProgressStyle({
    this.backgroundColor,
    this.color,
    this.circularLabelTextStyle,
    this.linearRadius,
    this.circularSize,
    this.successColor,
  });

  final Color? backgroundColor, color, successColor;
  final TextStyle? circularLabelTextStyle;
  final double? linearRadius, circularSize;

  @override
  VProgressStyle copyWith({
    Color? backgroundColor,
    Color? color,
    Color? successColor,
    TextStyle? circularLabelTextStyle,
    double? linearRadius,
    double? circularSize,
  }) =>
      VProgressStyle(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        color: color ?? this.color,
        circularLabelTextStyle:
            circularLabelTextStyle ?? this.circularLabelTextStyle,
        linearRadius: linearRadius ?? this.linearRadius,
        circularSize: circularSize ?? this.circularSize,
        successColor: successColor ?? this.successColor,
      );

  @override
  VProgressStyle lerp(ThemeExtension<VProgressStyle>? other, double t) {
    if (other is! VProgressStyle) {
      return this;
    }

    return VProgressStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      color: Color.lerp(color, other.color, t),
      circularLabelTextStyle:
          circularLabelTextStyle ?? other.circularLabelTextStyle,
      linearRadius: lerpDouble(linearRadius, other.linearRadius, t),
      circularSize: lerpDouble(circularSize, other.circularSize, t),
      successColor: Color.lerp(successColor, other.successColor, t),
    );
  }
}

class VProgressLinear extends StatelessWidget {
  const VProgressLinear({
    Key? key,
    this.style,
    this.vExt,
    this.value,
  }) : super(key: key);

  final VProgressStyle? style;
  final VExt? vExt;
  final double? value;

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
    final backgroundColor = style?.backgroundColor ?? defaultStyle.surface3;
    final color = style?.color ?? defaultStyle.active;
    final linearRadius =
        style?.linearRadius ?? defaultStyle.vProgressProperties?.linearRadius;
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(linearRadius),
      ),
      child: LinearProgressIndicator(
        minHeight: 4,
        backgroundColor: backgroundColor,
        color: color,
        value: value,
      ),
    );
  }
}

class VProgressCircular extends StatelessWidget {
  const VProgressCircular({
    Key? key,
    this.style,
    this.vExt,
    this.value,
  }) : super(key: key);

  final VProgressStyle? style;
  final VExt? vExt;
  final double? value;

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (vExt == null || vExt is VDef) {
      defaultStyle = getDefaultColorScheme()!;
    } else {
      defaultStyle = getAltColorScheme()!;
    }
    Color? backgroundColor = style?.backgroundColor ?? defaultStyle.surface3;
    Color? color = style?.color ?? defaultStyle.active;
    TextStyle? circularLabelTextStyle = style?.circularLabelTextStyle ??
        defaultStyle.vProgressProperties?.circularLabelTextStyle;
    double circularSize =
        style?.circularSize ?? defaultStyle.vProgressProperties?.circularSize;
    return SizedBox(
      height: circularSize,
      child: MergeSemantics(
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: circularSize,
                width: circularSize,
                child: VCircularProgressIndicator(
                  strokeWidth: 5,
                  backgroundColor: backgroundColor,
                  color: color,
                  value: value,
                ),
              ),
            ),
            if (value != null)
              ExcludeSemantics(
                child: Center(
                  child: Text(
                    "${(value! * 100).round()}%",
                    style: circularLabelTextStyle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class VProgressGaugeBig extends StatelessWidget {
  const VProgressGaugeBig({
    Key? key,
    this.style,
    this.vExt,
    this.value,
    this.icon,
  }) : super(key: key);

  final VProgressStyle? style;
  final VExt? vExt;
  final double? value;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    final messageStyle = getMessageColorScheme()!;
    if (vExt == null || vExt is VDef) {
      defaultStyle = getDefaultColorScheme()!;
    } else {
      defaultStyle = getAltColorScheme()!;
    }
    Color? backgroundColor = style?.backgroundColor ?? defaultStyle.surface3;
    Color? color = style?.color ?? defaultStyle.active;
    Color? successColor = style?.successColor ?? messageStyle.positiveGraphics;
    return SizedBox(
      height: 128,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 128,
              width: 128,
              child: VCircularProgressIndicator(
                strokeWidth: 5,
                backgroundColor: backgroundColor,
                color: value == 1.0 ? successColor : color,
                value: value,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 105,
              width: 105,
              decoration: BoxDecoration(
                color: value == 1.0 ? successColor : color,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.5),
                child: icon ??
                    VIcon(
                      iconHeight: 48,
                      iconWidth: 48,
                      svgIcon: value == 1.0
                          ? VIcons.successHigh
                          : VIcons.fileUploadHigh,
                      iconColor: VColors.defaultSurface1,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VProgressGaugeSmall extends StatelessWidget {
  const VProgressGaugeSmall({
    Key? key,
    this.style,
    this.vExt,
    this.value,
    this.icon,
  }) : super(key: key);

  final VProgressStyle? style;
  final VExt? vExt;
  final double? value;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    final messageStyle = getMessageColorScheme()!;
    if (vExt == null || vExt is VDef) {
      defaultStyle = getDefaultColorScheme()!;
    } else {
      defaultStyle = getAltColorScheme()!;
    }
    Color? backgroundColor = style?.backgroundColor ?? defaultStyle.surface3;
    Color? color = style?.color ?? defaultStyle.active;
    Color? successColor = style?.successColor ?? messageStyle.positiveGraphics;
    return SizedBox(
      height: 74,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 74,
              width: 74,
              child: VCircularProgressIndicator(
                strokeWidth: 5,
                backgroundColor: backgroundColor,
                color: value == 1.0 ? successColor : color,
                value: value,
                semanticsLabel: 'Gauge progress indicator',
              ),
            ),
          ),
          Center(
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: value == 1.0 ? successColor : color,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: icon ??
                    VIcon(
                      iconHeight: 16,
                      iconWidth: 16,
                      svgIcon: value == 1.0
                          ? VIcons.checkmarkTiny
                          : VIcons.fileUploadTiny,
                      iconColor: VColors.defaultSurface1,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
