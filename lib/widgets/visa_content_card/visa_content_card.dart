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
// Visa Content card constructor

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

// VContentCardStyle using ThemeExtension
class VContentCardStyle extends ThemeExtension<VContentCardStyle> {
  const VContentCardStyle({
    this.borderColor,
    this.backgroundColor,
    this.bottomBarColor,
    this.borderRadius,
    this.elevation,
  });

  final Color? borderColor, backgroundColor, bottomBarColor;
  final double? borderRadius, elevation;

  @override
  VContentCardStyle copyWith({
    Color? borderColor,
    backgroundColor,
    bottomBarColor,
    double? borderRadius,
    elevation,
  }) =>
      VContentCardStyle(
        borderColor: borderColor ?? this.borderColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        bottomBarColor: bottomBarColor ?? this.bottomBarColor,
        borderRadius: borderRadius ?? this.borderRadius,
        elevation: elevation ?? this.elevation,
      );

  @override
  VContentCardStyle lerp(ThemeExtension<VContentCardStyle>? other, double t) {
    if (other is! VContentCardStyle) {
      return this;
    }

    return VContentCardStyle(
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      bottomBarColor: Color.lerp(bottomBarColor, other.bottomBarColor, t),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
      elevation: lerpDouble(elevation, other.elevation, t),
    );
  }
}

class VContentCard extends StatefulWidget {
  const VContentCard({
    Key? key,
    required this.child,
    this.padding,
    this.hasBottomBar = false,
    this.onTap,
    this.isDisabled = false,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    this.width,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.style,
    this.vExt,
  }) : super(key: key);

  // BEGIN Properties
  final Widget child;
  final EdgeInsets? padding;
  final bool hasBottomBar, isDisabled;
  final double? width;
  final Function()? onTap;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final Function()? onTapDown;
  final void Function()? onTapUp;
  final void Function()? onTapCancel;
  final VContentCardStyle? style;
  final VExt? vExt;

  // END

  @override
  State<VContentCard> createState() => _VContentCardState();
}

class _VContentCardState extends State<VContentCard> {
  bool isPressed = false;
  final double _bottomBarHeight = 2;

  bool onInteraction(val) {
    setState(() {
      isPressed = !isPressed;
    });
    return isPressed;
  }

  double bottomBarVisible() {
    if (widget.hasBottomBar && widget.onTap != null && isPressed && !widget.isDisabled) {
      return 4;
    }
    if (widget.hasBottomBar && widget.onTap == null) {
      return 4;
    }
    return _bottomBarHeight;
  }

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (widget.vExt == null || widget.vExt is VDef) {
      defaultStyle = Theme.of(context).brightness == Brightness.dark ? getDefaultColorSchemeDark()! : getDefaultColorScheme()!;
    } else {
      defaultStyle = Theme.of(context).brightness == Brightness.dark ? getAltColorSchemeDark()! : getAltColorScheme()!;
    }
    final borderColor = widget.style?.borderColor ?? defaultStyle.border;
    final backgroundColor = widget.style?.backgroundColor ?? defaultStyle.surface1;
    final borderRadius = widget.style?.borderRadius ?? defaultStyle.vContentCardProperties.borderRadius;
    final elevation = widget.style?.elevation ?? defaultStyle.vContentCardProperties.elevation;
    Color? bottomBarColor() {
      if (!widget.hasBottomBar) {
        return widget.style?.bottomBarColor ?? defaultStyle.transparent;
      }
      if (isPressed && widget.onTap != null) {
        return widget.style?.bottomBarColor ?? defaultStyle.activePressed;
      }
      return widget.style?.bottomBarColor ?? defaultStyle.active;
    }

    return GestureDetector(
        onTapCancel: widget.onTap != null
            ? () {
                widget.onTapCancel?.call();
                onInteraction(isPressed);
              }
            : null,
        onTapDown: widget.onTap != null
            ? ((_) {
                widget.onTapDown?.call();
                onInteraction(isPressed);
              })
            : null,
        onTapUp: widget.onTap != null
            ? (_) {
                widget.onTapUp?.call();
                onInteraction(isPressed);
              }
            : null,
        onTap: widget.onTap,
        child: Card(
          elevation: elevation,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor!,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          color: backgroundColor,
          child: Container(
            width: widget.width,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: bottomBarColor()!,
                ),
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Column(
              mainAxisSize: widget.mainAxisSize ?? MainAxisSize.max,
              mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
              crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: widget.padding ?? const EdgeInsets.all(24),
                  child: widget.child,
                ),
                // Divider(
                //   height: 0,
                //   color: bottomBarColor(),
                //   thickness: bottomBarVisible(),
                // )
              ],
            ),
          ),
        )
        /*SizedBox(
        width: widget.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius!),
          child: Card(
            elevation: elevation,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor!),
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
            color: backgroundColor,
            child: Column(
              mainAxisSize: widget.mainAxisSize ?? MainAxisSize.max,
              mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
              crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: widget.padding ?? const EdgeInsets.all(24),
                  child: widget.child,
                ),
                Divider(
                  height: 0,
                  color: bottomBarColor(),
                  thickness: bottomBarVisible(),
                )
              ],
            ),
          ),
        ),
      ),*/
        );
  }
}
