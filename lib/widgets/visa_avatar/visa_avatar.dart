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
// Visa Avatar constructor

import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

// VAvatarStyle using ThemeExtension
class VAvatarStyle extends ThemeExtension<VAvatarStyle> {
  const VAvatarStyle({
    this.splashColor,
    this.backgroundColor,
    this.borderColor,
    this.foregroundColor,
    this.borderRadius,
    this.radius,
    this.verticalAvatarBorderRadius,
    this.verticalHighLightColor,
  });

  final Color? splashColor,
      borderColor,
      backgroundColor,
      foregroundColor,
      verticalHighLightColor;
  final double? borderRadius, radius, verticalAvatarBorderRadius;

  @override
  VAvatarStyle copyWith({
    Color? splashColor,
    borderColor,
    backgroundColor,
    foregroundColor,
    verticalHighLightColor,
    double? borderRadius,
    radius,
    verticalAvatarBorderRadius,
  }) =>
      VAvatarStyle(
        splashColor: splashColor ?? this.splashColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        borderColor: borderColor ?? this.borderColor,
        foregroundColor: foregroundColor ?? this.foregroundColor,
        borderRadius: borderRadius ?? this.borderRadius,
        verticalHighLightColor:
            verticalHighLightColor ?? this.verticalHighLightColor,
        verticalAvatarBorderRadius:
            verticalAvatarBorderRadius ?? this.verticalAvatarBorderRadius,
        radius: radius ?? this.radius,
      );

  @override
  VAvatarStyle lerp(ThemeExtension<VAvatarStyle>? other, double t) {
    if (other is! VAvatarStyle) {
      return this;
    }

    return VAvatarStyle(
      splashColor: Color.lerp(splashColor, other.splashColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t),
      verticalHighLightColor:
          Color.lerp(verticalHighLightColor, other.verticalHighLightColor, t),
      borderRadius: borderRadius,
      radius: radius,
      verticalAvatarBorderRadius: verticalAvatarBorderRadius,
    );
  }
}

class VAvatarProfile extends StatelessWidget {
  const VAvatarProfile({
    Key? key,
    // BEGIN properties
    this.backgroundImage,
    this.foregroundImage,
    this.onBackgroundImageError,
    this.child,
    this.onForegroundImageError,
    this.semanticLabel,
    this.hadBorder = false,
    this.style,
    this.vExt,
    // END
  }) : super(key: key);

  final ImageProvider<Object>? backgroundImage, foregroundImage;
  final void Function(Object, StackTrace?)? onBackgroundImageError,
      onForegroundImageError;
  final Widget? child;
  final String? semanticLabel;
  final bool hadBorder;
  final VAvatarStyle? style;
  final VExt? vExt;

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
    final backgroundColor = style?.backgroundColor ?? defaultStyle.active;
    final borderColor = style?.borderColor ?? defaultStyle.active;
    final foregroundColor = style?.foregroundColor ?? defaultStyle.active;
    final radius = style?.radius ?? defaultStyle.vAvatarProperties?.radius;
    final borderRadius =
        style?.borderRadius ?? defaultStyle.vAvatarProperties?.borderRadius;

    return Semantics(
      label: semanticLabel,
      image: backgroundImage != null,
      child: Container(
        decoration: hadBorder
            ? BoxDecoration(
                border: Border.all(
                  color: borderColor!,
                ),
                borderRadius: BorderRadius.circular(borderRadius!),
              )
            : null,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          backgroundImage: backgroundImage,
          foregroundImage: foregroundImage,
          onBackgroundImageError: onBackgroundImageError,
          onForegroundImageError: onForegroundImageError,
          child: ExcludeSemantics(
            child: child,
          ),
        ),
      ),
    );
  }
}

class VAvatarVertical extends StatelessWidget {
  const VAvatarVertical({
    Key? key,
    // BEGIN properties
    required this.child,
    this.leading,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onTap,
    this.style,
    this.vExt,
    // END
  }) : super(key: key);

  final Widget child;
  final Widget? leading;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final VoidCallback? onTapCancel, onTap;
  final VAvatarStyle? style;
  final VExt? vExt;

  double? getHeight() => (onTap != null && leading == null) ? 48.0 : null;

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (vExt == null || vExt is VDef) {
      defaultStyle = getDefaultColorScheme()!;
    } else {
      defaultStyle = getAltColorScheme()!;
    }
    Color? verticalHighLightColor =
        style?.verticalHighLightColor ?? defaultStyle.surfaceLowlight;
    // double? verticalAvatarBorderRadius = style?.verticalAvatarBorderRadius ??
    //     defaultStyle.vAvatarProperties?.verticalAvatarBorderRadius;

    return IntrinsicWidth(
      stepHeight: getHeight(),
      child: Semantics(
        button: onTap != null,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTapDown: onTapDown,
          onTapUp: onTapUp,
          onTapCancel: onTapCancel,
          onTap: onTap,
          highlightColor: verticalHighLightColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(13, 14, 18, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ?? const SizedBox.shrink(),
                if (leading != null)
                  const SizedBox(
                    width: 10,
                  ),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
