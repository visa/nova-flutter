// Copyright (c) 2025 Visa, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and
// limitations under the License.
//
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// VLinkStyle using ThemeExtension
class VLinkStyle extends ThemeExtension<VLinkStyle> {
  const VLinkStyle({
    this.splashColor,
    this.iconColor,
    this.defaultColor,
    this.pressedColor,
    this.tapUpColor,
    this.disabledColor,
    this.titleTextStyle,
    this.underlineColor,
  });

  final Color? splashColor,
      iconColor,
      defaultColor,
      pressedColor,
      tapUpColor,
      disabledColor,
      underlineColor;
  final TextStyle? titleTextStyle;

  @override
  VLinkStyle copyWith({
    Color? splashColor,
    Color? iconColor,
    Color? defaultColor,
    Color? pressedColor,
    Color? tapUpColor,
    Color? disabledColor,
    underlineColor,
    TextStyle? titleTextStyle,
  }) =>
      VLinkStyle(
        splashColor: splashColor ?? this.splashColor,
        iconColor: iconColor ?? this.iconColor,
        defaultColor: defaultColor ?? this.defaultColor,
        pressedColor: pressedColor ?? this.pressedColor,
        tapUpColor: tapUpColor ?? this.tapUpColor,
        disabledColor: disabledColor ?? this.disabledColor,
        underlineColor: underlineColor ?? this.underlineColor,
        titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      );

  @override
  VLinkStyle lerp(ThemeExtension<VLinkStyle>? other, double t) {
    if (other is! VLinkStyle) {
      return this;
    }

    return VLinkStyle(
      splashColor: Color.lerp(splashColor, other.splashColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      tapUpColor: Color.lerp(tapUpColor, other.tapUpColor, t),
      pressedColor: Color.lerp(pressedColor, other.pressedColor, t),
      defaultColor: Color.lerp(defaultColor, other.defaultColor, t),
      disabledColor: Color.lerp(disabledColor, other.disabledColor, t),
      underlineColor: Color.lerp(underlineColor, other.underlineColor, t),
      titleTextStyle: titleTextStyle,
    );
  }
}

class VLink extends StatefulWidget {
  const VLink({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isUnderlined = false,
    this.isLeadingIcon = false,
    this.isTrailingIcon = false,
    this.rtl = false,
    this.semSortKey,
    this.semanticLabel,
    this.touchArea,
    this.linkFontSize,
    this.linkFontWeight,
    this.trailingIcon,
    this.leadingIcon,
    this.style,
    this.vExt,
  }) : super(key: key);

  // BEGIN Properties
  final String title;
  final bool isUnderlined;
  final bool rtl;
  final VoidCallback? onPressed;
  final bool isLeadingIcon;
  final bool isTrailingIcon;
  final SemanticsSortKey? semSortKey;
  final String? semanticLabel;
  final double? touchArea, linkFontSize;
  final Widget? trailingIcon, leadingIcon;
  final FontWeight? linkFontWeight;
  final VLinkStyle? style;
  final VExt? vExt;

  // END
  @override
  State<VLink> createState() => _VLinkState();
}

class _VLinkState extends State<VLink> {
  bool isPressed = false;
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
    final splashColor =
        widget.style?.splashColor ?? defaultStyle.surfaceLowlight;
    final titleTextStyle = widget.style?.titleTextStyle ??
        defaultStyle.vLinkProperties?.titleTextStyle;
    Color linkColor() {
      if (widget.onPressed == null) {
        return widget.style?.disabledColor ?? defaultStyle.disabled;
      }
      if (isPressed) {
        return widget.style?.pressedColor ?? defaultStyle.activePressed;
      }
      return widget.style?.defaultColor ?? defaultStyle.active;
    }

    return GestureDetector(
      excludeFromSemantics: true,
      onTap: widget.onPressed,
      child: MergeSemantics(
        child: Directionality(
          textDirection: widget.rtl ? TextDirection.rtl : TextDirection.ltr,
          child: Semantics(
            sortKey: widget.semSortKey,
            value: "link",
            enabled: widget.onPressed != null,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: widget.touchArea ?? 20),
              child: InkWell(
                onTap: widget.onPressed,
                onTapUp: (_) {
                  setState(() {
                    isPressed = false;
                  });
                },
                onTapDown: (_) {
                  setState(() {
                    isPressed = true;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    isPressed = false;
                  });
                },
                splashColor: widget.onPressed != null ? splashColor : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.isLeadingIcon)
                      widget.leadingIcon ??
                          VIcon(
                            svgIcon: VIcons.arrowBackTiny,
                            iconColor: linkColor(),
                          ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: widget.isLeadingIcon ? 5 : 0,
                          right: widget.isTrailingIcon ? 5 : 0,
                        ),
                        child: Text(
                          widget.title,
                          textDirection: widget.rtl
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          semanticsLabel: widget.semanticLabel,
                          style: titleTextStyle?.copyWith(
                            color: linkColor(),
                            decorationColor:
                                widget.style?.underlineColor ?? linkColor(),
                            fontSize: widget.linkFontSize,
                            fontWeight: widget.linkFontWeight,
                            decoration: widget.isUnderlined
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    if (widget.isTrailingIcon)
                      widget.trailingIcon ??
                          VIcon(
                            svgIcon: VIcons.chevronLinkTiny,
                            iconColor: linkColor(),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
