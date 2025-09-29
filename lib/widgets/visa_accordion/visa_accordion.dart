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
// Visa accordion constructor
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// VAccordionStyle using ThemeExtension
class VAccordionStyle extends ThemeExtension<VAccordionStyle> {
  const VAccordionStyle({
    this.headerTextColorDefault,
    this.headerOpenColor,
    this.headerClosedColor,
    this.headerTextPressedDownColor,
    this.headerBackgroundSplash,
    this.boldHeaderContainerColor,
    this.borderColor,
    this.iconColorDefault,
    this.iconPressedColor,
    this.iconColorDown,
    this.iconColorDisabled,
    this.disabledTextColor,
    this.headerBoldTextStyleBold,
    this.headerTextStyleSubtle,
    this.borderDisabledColor,
    this.borderSubtleColor,
    this.subtleHeaderContainerColor,
    this.bodySubtleColor,
    this.inkWellSplashColor,
    this.subtleHeaderBackgroundSplash,
    this.subtleDividerColor,
    this.dividerDefaultColor,
    this.subtleBottomCardColor,
    this.bottomDefaultCardColor,
    this.leadingIconColor,
    this.subtleBorderRadius,
    this.headerBorderRadius,
    this.borderRadius,
    this.headerTextStyle,
    this.bodyTextStyle,
  });

  final Color? headerTextColorDefault,
      headerOpenColor,
      headerClosedColor,
      headerTextPressedDownColor,
      headerBackgroundSplash,
      boldHeaderContainerColor,
      borderColor,
      iconColorDefault,
      iconColorDown,
      iconColorDisabled,
      iconPressedColor,
      disabledTextColor,
      borderDisabledColor,
      borderSubtleColor,
      subtleHeaderContainerColor,
      bodySubtleColor,
      inkWellSplashColor,
      subtleHeaderBackgroundSplash,
      subtleDividerColor,
      dividerDefaultColor,
      subtleBottomCardColor,
      bottomDefaultCardColor,
      leadingIconColor;
  final double? subtleBorderRadius, headerBorderRadius, borderRadius;
  final TextStyle? headerBoldTextStyleBold,
      headerTextStyleSubtle,
      headerTextStyle,
      bodyTextStyle;

  @override
  VAccordionStyle copyWith({
    Color? headerColorDefault,
    headerTextPressedDownColor,
    headerTextColorDefault,
    headerOpenColor,
    headerClosedColor,
    headerPressedDownColor,
    headerBackgroundSplash,
    boldHeaderContainerColor,
    borderColor,
    iconColorDefault,
    iconColorDown,
    iconColorDisabled,
    iconPressedColor,
    disabledColor,
    borderDisabledColor,
    borderSubtleColor,
    subtleHeaderContainerColor,
    bodySubtleColor,
    inkWellSplashColor,
    subtleHeaderBackgroundSplash,
    subtleDividerColor,
    dividerDefaultColor,
    subtleBottomCardColor,
    bottomDefaultCardColor,
    leadingIconColor,
    double? subtleBorderRadius,
    headerBorderRadius,
    borderRadius,
    TextStyle? headerBoldTextStyleBold,
    headerTextStyleSubtle,
    headerTextStyle,
    bodyTextStyle,
  }) =>
      VAccordionStyle(
        headerTextColorDefault:
            headerTextColorDefault ?? this.headerTextColorDefault,
        headerOpenColor: headerOpenColor ?? this.headerOpenColor,
        headerClosedColor: headerClosedColor ?? this.headerClosedColor,
        headerTextPressedDownColor:
            headerTextPressedDownColor ?? this.headerTextPressedDownColor,
        headerBackgroundSplash:
            headerBackgroundSplash ?? this.headerBackgroundSplash,
        boldHeaderContainerColor:
            boldHeaderContainerColor ?? this.boldHeaderContainerColor,
        borderColor: borderColor ?? this.borderColor,
        iconColorDefault: iconColorDefault ?? this.iconColorDefault,
        iconColorDown: iconColorDown ?? this.iconColorDown,
        iconColorDisabled: iconColorDisabled ?? this.iconColorDisabled,
        iconPressedColor: iconPressedColor ?? this.iconPressedColor,
        disabledTextColor: disabledTextColor ?? this.disabledTextColor,
        borderDisabledColor: borderDisabledColor ?? this.borderDisabledColor,
        borderSubtleColor: borderSubtleColor ?? this.borderSubtleColor,
        subtleHeaderContainerColor:
            subtleHeaderContainerColor ?? this.subtleHeaderContainerColor,
        bodySubtleColor: bodySubtleColor ?? this.bodySubtleColor,
        inkWellSplashColor: inkWellSplashColor ?? this.inkWellSplashColor,
        subtleHeaderBackgroundSplash:
            subtleHeaderBackgroundSplash ?? this.subtleHeaderBackgroundSplash,
        subtleDividerColor: subtleDividerColor ?? this.subtleDividerColor,
        dividerDefaultColor: dividerDefaultColor ?? this.dividerDefaultColor,
        subtleBottomCardColor:
            subtleBottomCardColor ?? this.subtleBottomCardColor,
        bottomDefaultCardColor:
            bottomDefaultCardColor ?? this.bottomDefaultCardColor,
        leadingIconColor: leadingIconColor ?? this.leadingIconColor,
        headerBoldTextStyleBold:
            headerBoldTextStyleBold ?? this.headerBoldTextStyleBold,
        headerTextStyleSubtle:
            headerTextStyleSubtle ?? this.headerTextStyleSubtle,
        headerTextStyle: headerTextStyle ?? this.headerTextStyle,
        bodyTextStyle: bodyTextStyle ?? this.bodyTextStyle,
        subtleBorderRadius: subtleBorderRadius ?? this.subtleBorderRadius,
        headerBorderRadius: headerBorderRadius ?? this.headerBorderRadius,
        borderRadius: borderRadius ?? this.borderRadius,
      );

  @override
  VAccordionStyle lerp(ThemeExtension<VAccordionStyle>? other, double t) {
    if (other is! VAccordionStyle) {
      return this;
    }

    return VAccordionStyle(
      headerTextColorDefault:
          Color.lerp(headerTextColorDefault, other.headerTextColorDefault, t),
      headerOpenColor: Color.lerp(headerOpenColor, other.headerOpenColor, t),
      headerClosedColor:
          Color.lerp(headerClosedColor, other.headerClosedColor, t),
      headerTextPressedDownColor: Color.lerp(
          headerTextPressedDownColor, other.headerTextPressedDownColor, t),
      headerBackgroundSplash:
          Color.lerp(headerBackgroundSplash, other.headerBackgroundSplash, t),
      boldHeaderContainerColor: Color.lerp(
          boldHeaderContainerColor, other.boldHeaderContainerColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      iconColorDefault: Color.lerp(iconColorDefault, other.iconColorDefault, t),
      iconColorDown: Color.lerp(iconColorDown, other.iconColorDown, t),
      iconColorDisabled:
          Color.lerp(iconColorDisabled, other.iconColorDisabled, t),
      iconPressedColor: Color.lerp(iconPressedColor, other.iconPressedColor, t),
      disabledTextColor:
          Color.lerp(disabledTextColor, other.disabledTextColor, t),
      borderSubtleColor:
          Color.lerp(borderSubtleColor, other.borderSubtleColor, t),
      subtleHeaderContainerColor: Color.lerp(
          subtleHeaderContainerColor, other.subtleHeaderContainerColor, t),
      bodySubtleColor: Color.lerp(bodySubtleColor, other.bodySubtleColor, t),
      inkWellSplashColor:
          Color.lerp(inkWellSplashColor, other.inkWellSplashColor, t),
      subtleHeaderBackgroundSplash: Color.lerp(
          subtleHeaderBackgroundSplash, other.subtleHeaderBackgroundSplash, t),
      subtleDividerColor:
          Color.lerp(subtleDividerColor, other.subtleDividerColor, t),
      dividerDefaultColor:
          Color.lerp(dividerDefaultColor, other.dividerDefaultColor, t),
      subtleBottomCardColor:
          Color.lerp(subtleBottomCardColor, other.subtleBottomCardColor, t),
      bottomDefaultCardColor:
          Color.lerp(bottomDefaultCardColor, other.bottomDefaultCardColor, t),
      leadingIconColor: Color.lerp(leadingIconColor, other.leadingIconColor, t),
      headerBoldTextStyleBold: headerBoldTextStyleBold,
      headerTextStyleSubtle: headerTextStyleSubtle,
      headerTextStyle: headerTextStyle,
      bodyTextStyle: bodyTextStyle,
      headerBorderRadius:
          lerpDouble(headerBorderRadius, other.headerBorderRadius, t),
      subtleBorderRadius:
          lerpDouble(subtleBorderRadius, other.subtleBorderRadius, t),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
    );
  }
}

class VAccordion extends StatefulWidget {
  const VAccordion({
    Key? key,
    required this.title,
    required this.body,
    this.isEnabled = true,
    this.isSubtle = true,
    this.width,
    this.trailing,
    this.leadingSvgIcon,
    this.badgeStatus,
    this.style,
    this.vExt,
  }) : super(key: key);

  // BEGIN Properties
  final String title;
  final Widget body;
  final bool isEnabled;
  final bool isSubtle;
  final double? width;
  final Widget? trailing;
  final String? leadingSvgIcon;
  final String? badgeStatus;
  final VAccordionStyle? style;
  final VExt? vExt;
  // END
  @override
  State<VAccordion> createState() => _VAccordionState();
}

class _VAccordionState extends State<VAccordion> {
  bool isDown = false;
  bool isOpen = false;

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
    final headerBackgroundSplash =
        widget.style?.headerBackgroundSplash ?? defaultStyle.surfaceLowlight;
    final boldHeaderContainerColor =
        widget.style?.boldHeaderContainerColor ?? defaultStyle.surface1;
    final borderDisabledColor =
        widget.style?.borderDisabledColor ?? defaultStyle.transparent;
    final borderSubtleColor =
        widget.style?.borderSubtleColor ?? defaultStyle.transparent;
    final subtleHeaderContainerColor =
        widget.style?.subtleHeaderContainerColor ?? defaultStyle.transparent;
    final bodySubtleColor =
        widget.style?.bodySubtleColor ?? defaultStyle.transparent;
    final inkWellSplashColor =
        widget.style?.inkWellSplashColor ?? defaultStyle.transparent;
    final subtleHeaderBackgroundSplash =
        widget.style?.subtleHeaderBackgroundSplash ?? defaultStyle.transparent;
    final iconPressedColor =
        widget.style?.iconPressedColor ?? defaultStyle.activePressed;
    final subtleDividerColor =
        widget.style?.subtleDividerColor ?? defaultStyle.transparent;
    final dividerDefaultColor =
        widget.style?.dividerDefaultColor ?? defaultStyle.border;
    final subtleBottomCardColor =
        widget.style?.subtleBottomCardColor ?? defaultStyle.transparent;
    final bottomDefaultCardColor =
        widget.style?.bottomDefaultCardColor ?? defaultStyle.surface1;
    final leadingIconColor =
        widget.style?.leadingIconColor ?? defaultStyle.active;
    final headerBoldTextStyleBold = widget.style?.headerBoldTextStyleBold ??
        defaultStyle.vAccordionProperties?.headerBoldTextStyle;
    final headerTextStyleSubtle = widget.style?.headerTextStyleSubtle ??
        defaultStyle.vAccordionProperties?.headerSubtleTextStyle;
    final bodyTextStyle = widget.style?.bodyTextStyle ??
        defaultStyle.vAccordionProperties?.bodyTextStyle;
    final headerTextStyle = widget.style?.headerTextStyle ??
        defaultStyle.vAccordionProperties?.headerTextStyle;
    final subtleBorderRadius = widget.style?.subtleBorderRadius ??
        defaultStyle.vAccordionProperties?.subtleBorderRadius;
    final headerBorderRadius = widget.style?.headerBorderRadius ??
        defaultStyle.vAccordionProperties?.headerBorderRadius;
    final borderRadius = widget.style?.borderRadius ??
        defaultStyle.vAccordionProperties?.borderRadius;

    Color borderColor() {
      if (!widget.isEnabled && widget.isSubtle) {
        return borderDisabledColor;
      }
      if (!widget.isEnabled) {
        return widget.style?.disabledTextColor ??
            defaultStyle.disabled.withOpacity(0.2);
      }
      if (widget.isSubtle) {
        return borderSubtleColor!;
      }
      return widget.style?.disabledTextColor ?? defaultStyle.border;
    }

    Color iconColorState() {
      if (!widget.isEnabled && !widget.isSubtle) {
        return widget.style?.iconColorDisabled ?? defaultStyle.disabled;
        // return borderDisabledColor!;
      }
      if (isDown) {
        return iconPressedColor ?? defaultStyle.activePressed;
      }
      if (isOpen) {
        return widget.style?.iconColorDown ?? defaultStyle.activePressed;
      }
      if (!widget.isEnabled) {
        return widget.style?.iconColorDisabled ?? defaultStyle.disabled;
      }
      return widget.style?.iconColorDefault ?? defaultStyle.active;
    }

    Color textColor() {
      if (!widget.isEnabled) {
        if (widget.isSubtle) {
          return widget.style?.disabledTextColor ?? defaultStyle.disabled;
        }
        return widget.style?.headerTextColorDefault ?? defaultStyle.disabled;
      }
      if (widget.isSubtle) {
        if (isDown) {
          return widget.style?.headerTextPressedDownColor ??
              defaultStyle.activePressed;
        }
        return widget.style?.headerTextColorDefault ?? defaultStyle.active;
      }

      if (isDown) {
        return widget.style?.headerTextPressedDownColor ??
            defaultStyle.activePressed;
      }

      if (!isOpen) {
        return widget.style?.headerTextColorDefault ?? defaultStyle.text;
      }

      return widget.style?.headerTextColorDefault ?? defaultStyle.active;
    }

    TextStyle chooseTextStyle(bool isSubtle) {
      return !isSubtle
          ? headerBoldTextStyleBold?.copyWith(
                color: textColor(),
              ) ??
              bodyTextStyle?.copyWith(
                color: textColor(),
              )
          : headerTextStyleSubtle?.copyWith(
                color: textColor(),
              ) ??
              headerTextStyle?.copyWith(
                color: textColor(),
              );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
        border: Border.all(
          color: borderColor(),
        ),
      ),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(minHeight: 54),
            width: widget.width ?? MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: widget.isSubtle ? subtleHeaderContainerColor : null,
              borderRadius: isOpen && widget.isEnabled
                  ? BorderRadius.vertical(
                      top: Radius.circular(
                        subtleBorderRadius!,
                      ),
                    )
                  : BorderRadius.circular(
                      subtleBorderRadius!,
                    ),
            ),
            child: Card(
              color:
                  widget.isSubtle ? bodySubtleColor : boldHeaderContainerColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: isOpen && widget.isEnabled
                    ? BorderRadius.vertical(
                        top: Radius.circular(
                          headerBorderRadius!,
                        ),
                      )
                    : BorderRadius.circular(
                        headerBorderRadius!,
                      ),
              ),
              margin: EdgeInsets.zero,
              child: Semantics(
                button: true,
                enabled: widget.isEnabled,
                onDidGainAccessibilityFocus: widget.isEnabled
                    ? () {
                        SemanticsService.announce(
                          isOpen
                              ? "${widget.title}. Button. Expanded. ${widget.badgeStatus ?? ""}"
                              : "${widget.title}. Button. Collapsed. ${widget.badgeStatus ?? ""}",
                          TextDirection.ltr,
                        );
                      }
                    : null,
                child: InkWell(
                  borderRadius: isOpen && widget.isEnabled
                      ? const BorderRadius.vertical(
                          top: Radius.circular(8),
                        )
                      : BorderRadius.circular(8),
                  splashColor: inkWellSplashColor,
                  highlightColor: widget.isSubtle
                      ? subtleHeaderBackgroundSplash
                      : headerBackgroundSplash?.withOpacity(0.6),
                  onHighlightChanged: ((value) {
                    setState(() {
                      isDown = value;
                    });
                  }),
                  onTap: widget.isEnabled
                      ? () {
                          setState(() {
                            isOpen = !isOpen;
                          });
                          SemanticsService.announce(
                            isOpen ? "Expanded" : "Collapsed",
                            TextDirection.ltr,
                          );
                        }
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 17,
                              right: 13,
                            ),
                            child: RotatedBox(
                              quarterTurns: isOpen && widget.isEnabled ? 1 : 0,
                              child: VIcon(
                                svgIcon: VIcons.chevronRightTiny,
                                iconColor: iconColorState(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 15,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  widget.leadingSvgIcon != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: VIcon(
                                            svgIcon: widget.leadingSvgIcon!,
                                            iconHeight: 24,
                                            iconWidth: 24,
                                            iconColor: leadingIconColor,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  Expanded(
                                    child: Text(
                                      widget.title,
                                      style: chooseTextStyle(widget.isSubtle),
                                    ),
                                  ),
                                  widget.trailing ?? const SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: isOpen && widget.isEnabled,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.zero,
                  child: Container(
                      height: 1,
                      color: widget.isSubtle
                          ? subtleDividerColor
                          : dividerDefaultColor),
                ),
                Card(
                  color: widget.isSubtle
                      ? subtleBottomCardColor
                      : bottomDefaultCardColor,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(8),
                    ),
                  ),
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: widget.isSubtle ? 36 : 40,
                      bottom: 20,
                      top: 10,
                      right: widget.isSubtle ? 36 : 40,
                    ),
                    child: SizedBox(
                      width: widget.width ?? MediaQuery.of(context).size.width,
                      child: widget.body,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
