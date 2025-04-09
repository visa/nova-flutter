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
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// VAppBarStyle using ThemeExtension
class VSelectStyle extends ThemeExtension<VSelectStyle> {
  const VSelectStyle({
    this.backgroundColor,
    this.splashColor,
    this.iconColor,
    this.borderColor,
    this.dropDownBorderColor,
    this.bottomBarColor,
    this.labelTextColor,
    this.buttonTextColor,
    this.validateTextColor,
    this.errorIconColor,
    this.dropdownColor,
    this.borderErrorColor,
    this.headerTitleTextStyle,
    this.labelTextStyle,
    this.validateTextStyle,
    this.borderRadius,
    this.dropDownElevation,
    this.dropDownBorderRadius,
    this.buttonHeight,
    this.buttonWidth,
    this.dropdownWidth,
  });

  final Color? backgroundColor,
      splashColor,
      iconColor,
      borderColor,
      dropDownBorderColor,
      bottomBarColor,
      labelTextColor,
      buttonTextColor,
      validateTextColor,
      errorIconColor,
      dropdownColor,
      borderErrorColor;
  final double? borderRadius,
      dropDownElevation,
      dropDownBorderRadius,
      buttonHeight,
      buttonWidth,
      dropdownWidth;
  final TextStyle? headerTitleTextStyle, labelTextStyle, validateTextStyle;

  @override
  VSelectStyle copyWith({
    Color? backgroundColor,
    splashColor,
    iconColor,
    dropDownBorderColor,
    bottomBarColor,
    borderColor,
    labelTextColor,
    buttonTextColor,
    validateTextColor,
    errorIconColor,
    dropdownColor,
    borderErrorColor,
    TextStyle? headerTitleTextStyle,
    labelTextStyle,
    validateTextStyle,
    double? borderRadius,
    dropDownElevation,
    dropDownBorderRadius,
    buttonHeight,
    buttonWidth,
    dropdownWidth,
  }) =>
      VSelectStyle(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        splashColor: splashColor ?? this.splashColor,
        iconColor: iconColor ?? this.iconColor,
        dropDownBorderColor: dropDownBorderColor ?? this.dropDownBorderColor,
        bottomBarColor: bottomBarColor ?? this.bottomBarColor,
        borderColor: borderColor ?? this.borderColor,
        labelTextColor: labelTextColor ?? this.labelTextColor,
        buttonTextColor: buttonTextColor ?? this.buttonTextColor,
        validateTextColor: validateTextColor ?? this.validateTextColor,
        errorIconColor: errorIconColor ?? this.errorIconColor,
        dropdownColor: dropdownColor ?? this.dropdownColor,
        borderErrorColor: borderErrorColor ?? this.borderErrorColor,
        borderRadius: borderRadius ?? this.borderRadius,
        dropDownElevation: dropDownElevation ?? this.dropDownElevation,
        dropDownBorderRadius: dropDownBorderRadius ?? this.dropDownBorderRadius,
        buttonHeight: buttonHeight ?? this.buttonHeight,
        buttonWidth: buttonWidth ?? this.buttonWidth,
        dropdownWidth: dropdownWidth ?? this.dropdownWidth,
        headerTitleTextStyle: headerTitleTextStyle ?? this.headerTitleTextStyle,
      );

  @override
  VSelectStyle lerp(ThemeExtension<VSelectStyle>? other, double t) {
    if (other is! VSelectStyle) {
      return this;
    }

    return VSelectStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      splashColor: Color.lerp(splashColor, other.splashColor, t),
      dropdownColor: Color.lerp(dropdownColor, other.dropdownColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      dropDownBorderColor:
          Color.lerp(dropDownBorderColor, other.dropDownBorderColor, t),
      bottomBarColor: Color.lerp(bottomBarColor, other.bottomBarColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      labelTextColor: Color.lerp(labelTextColor, other.labelTextColor, t),
      buttonTextColor: Color.lerp(buttonTextColor, other.buttonTextColor, t),
      validateTextColor:
          Color.lerp(validateTextColor, other.validateTextColor, t),
      errorIconColor: Color.lerp(errorIconColor, other.errorIconColor, t),
      borderErrorColor: Color.lerp(borderErrorColor, other.borderErrorColor, t),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
      dropDownBorderRadius:
          lerpDouble(dropDownBorderRadius, other.dropDownBorderRadius, t),
      buttonHeight: lerpDouble(buttonHeight, other.buttonHeight, t),
      dropDownElevation:
          lerpDouble(dropDownElevation, other.dropDownElevation, t),
      buttonWidth: lerpDouble(buttonWidth, other.buttonWidth, t),
      dropdownWidth: lerpDouble(dropdownWidth, other.dropdownWidth, t),
      headerTitleTextStyle: headerTitleTextStyle,
      labelTextStyle: labelTextStyle,
      validateTextStyle: validateTextStyle,
    );
  }
}

class VSelect extends StatefulWidget {
  VSelect({
    Key? key,
    required this.itemBuilder,
    this.buttonText,
    this.isDisabled = false,
    this.icons,
    this.onSelected,
    this.onCanceled,
    this.validate = false,
    this.validateText = "An error occurred",
    this.inLineMessage,
    this.headerLabel,
    this.isReadOnly = false,
    this.focusNode,
    this.isInline = false,
    this.style,
    this.vExt,
    this.mainAxisAlignment,
    this.showErrorMessage = false,
    this.showErrorIcon = false,
    this.semanticsLabel,
    this.onDidGainAccessibilityFocus,
    this.position = PopupMenuPosition.under,
    this.offset = const Offset(0, 10),
    this.semanticReadout,
  }) : super(key: key);

  // BEGIN Properties
  final bool isDisabled;
  final Icon? icons;
  final void Function(dynamic)? onSelected;
  final void Function()? onCanceled;
  final bool validate, isReadOnly, showErrorMessage, showErrorIcon;
  final String validateText;
  final String? headerLabel;
  final FocusNode? focusNode;
  final bool isInline;
  Widget? buttonText;
  final VSelectStyle? style;
  final MainAxisAlignment? mainAxisAlignment;
  final String? semanticsLabel;
  final Widget? inLineMessage;
  final void Function()? onDidGainAccessibilityFocus;
  final VExt? vExt;
  final PopupMenuPosition? position;
  final Offset offset;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  final String? semanticReadout;
  // END

  @override
  State<VSelect> createState() => _VSelectState();
}

class _VSelectState extends State<VSelect> {
  final GlobalKey<PopupMenuButtonState> _popUpButtonKey =
      GlobalKey<PopupMenuButtonState>();
  bool isTapped = false;
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    final messageStyle = getMessageColorScheme()!;
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
    final dropDownElevation = widget.style?.dropDownElevation ??
        defaultStyle.vSelectProperties?.dropDownElevation;
    final buttonHeight = widget.style?.buttonHeight ??
        defaultStyle.vSelectProperties?.buttonHeight;
    final borderRadius = widget.style?.borderRadius ??
        defaultStyle.vSelectProperties?.borderRadius;
    final buttonWidth = widget.style?.buttonWidth ??
        defaultStyle.vSelectProperties?.buttonWidth;
    final dropDownWidth = widget.style?.dropdownWidth ??
        defaultStyle.vSelectProperties?.dropdownWidth;
    final dropDownBorderRadius = widget.style?.dropDownBorderRadius ??
        defaultStyle.vSelectProperties?.dropDownBorderRadius;
    final dropDownBorderColor =
        widget.style?.dropDownBorderColor ?? defaultStyle.border;
    final splashColor =
        widget.style?.splashColor ?? defaultStyle.surfaceLowlight;
    final dropdownColor = widget.style?.dropdownColor ?? defaultStyle.surface3;
    final errorIconColor =
        widget.style?.errorIconColor ?? messageStyle.negativeGraphics;
    final validateTextColor =
        widget.style?.validateTextColor ?? messageStyle.negativeText;
    final headerTextStyle = widget.style?.headerTitleTextStyle ??
        defaultStyle.vSelectProperties?.headerTextStyle;
    final labelTextStyle = widget.style?.labelTextStyle ??
        defaultStyle.vSelectProperties?.labelTextStyle;
    final validateTextStyle = widget.style?.validateTextStyle ??
        defaultStyle.vSelectProperties?.validateTextStyle;

    Color? borderColor() {
      if (widget.validate) {
        return widget.style?.borderErrorColor ?? messageStyle.negativeGraphics;
      }
      if (widget.isDisabled) {
        return widget.style?.borderColor ?? defaultStyle.disabled;
      }
      if (widget.isReadOnly) {
        return widget.style?.borderColor ?? defaultStyle.border;
      }
      if (isTapped) {
        return widget.style?.borderColor ?? defaultStyle.activePressed;
      }
      return widget.style?.borderColor ?? defaultStyle.activeSubtle;
    }

    Color? buttonTextColor() {
      if (widget.isDisabled) {
        return widget.style?.buttonTextColor ?? defaultStyle.disabled;
      }
      return widget.style?.buttonTextColor ?? defaultStyle.text;
    }

    Color? bottomBar() {
      if (widget.validate && isOpen) {
        return widget.style?.bottomBarColor ?? messageStyle.negativeGraphics;
      }
      if (isOpen) {
        return widget.style?.borderColor ?? defaultStyle.activePressed;
      }
      return widget.style?.borderColor ?? defaultStyle.transparent;
    }

    Color? textLabelColor() {
      if (widget.validate) {
        return widget.style?.validateTextColor ?? messageStyle.negativeText;
      }
      if (widget.isReadOnly) {
        return widget.style?.labelTextColor ?? defaultStyle.textSubtle;
      }
      if (widget.isDisabled) {
        return widget.style?.labelTextColor ?? defaultStyle.disabled;
      }
      return widget.style?.labelTextColor ?? defaultStyle.text;
    }

    Color? iconColor() {
      if (widget.isReadOnly || widget.isDisabled) {
        return widget.style?.iconColor ?? defaultStyle.disabled;
      }
      return widget.style?.iconColor ?? defaultStyle.active;
    }

    double width() {
      if (dropDownWidth == null && buttonWidth == null) {
        return MediaQuery.of(context).size.width;
      }
      if (dropDownWidth != null) {
        return dropDownWidth;
      }
      return buttonWidth;
    }

    return widget.isInline
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.headerLabel != null
                  ? Padding(
                      padding:
                          EdgeInsets.only(right: 8, top: buttonHeight! / 3.0),
                      child: Text(
                        widget.headerLabel!,
                        style: headerTextStyle!.copyWith(
                          color: textLabelColor(),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                width: width(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Semantics(
                      onDidGainAccessibilityFocus:
                          widget.onDidGainAccessibilityFocus ??
                              () {
                                SemanticsService.announce(
                                  (widget.isDisabled
                                      ? "Collapsed. ${widget.headerLabel}.${widget.buttonText}. popup disabled"
                                      : widget.semanticReadout ??
                                          "Collapsed. ${widget.headerLabel}.${widget.buttonText}. popup button. double tap to activate"),
                                  TextDirection.ltr,
                                );
                              },
                      excludeSemantics: true,
                      child: Focus(
                        focusNode: widget.focusNode,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(borderRadius!),
                          child: IntrinsicWidth(
                            child: Column(
                              children: [
                                PopupMenuButton(
                                  constraints: BoxConstraints(
                                    minWidth: width(),
                                  ),
                                  color: dropdownColor,
                                  tooltip: widget.buttonText.toString(),
                                  key: _popUpButtonKey,
                                  enabled: isTapped,
                                  splashRadius: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        dropDownBorderRadius!),
                                    side: BorderSide(
                                      color: dropDownBorderColor!,
                                    ),
                                  ),
                                  position: widget.position,
                                  itemBuilder: widget.itemBuilder,
                                  offset: widget.offset,
                                  onCanceled: widget.isDisabled
                                      ? null
                                      : () {
                                          widget.onCanceled;
                                          setState(() {
                                            isTapped = false;
                                            isOpen = false;
                                          });
                                        },
                                  onSelected: widget.isDisabled
                                      ? null
                                      : ((value) {
                                          widget.onSelected != null
                                              ? widget.onSelected!(value)
                                              : null;
                                          setState(() {
                                            isTapped = false;
                                            isOpen = false;
                                          });
                                        }),
                                  child: GestureDetector(
                                    onTap: widget.isDisabled ||
                                            widget.isReadOnly == true
                                        ? null
                                        : (() {
                                            setState(() {
                                              isTapped = true;
                                              isOpen = true;
                                            });
                                            _popUpButtonKey.currentState!
                                                .showButtonMenu();
                                          }),
                                    onTapDown: widget.isDisabled ||
                                            widget.isReadOnly == true
                                        ? null
                                        : ((_) {
                                            setState(() {
                                              isTapped = true;
                                              isOpen = false;
                                            });
                                          }),
                                    onTapUp: widget.isDisabled ||
                                            widget.isReadOnly == true
                                        ? null
                                        : (_) {
                                            setState(() {
                                              isTapped = true;
                                              isOpen = _popUpButtonKey
                                                  .currentState!.mounted;
                                            });
                                          },
                                    onTapCancel: widget.isDisabled
                                        ? null
                                        : () {
                                            setState(() {
                                              isTapped = false;
                                              isOpen = false;
                                            });
                                          },
                                    child: IntrinsicWidth(
                                      stepWidth: width(),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              width: 1.0,
                                              color: borderColor()!,
                                            ),
                                            left: BorderSide(
                                              width: 1.0,
                                              color: borderColor()!,
                                            ),
                                            right: BorderSide(
                                              width: 1.0,
                                              color: borderColor()!,
                                            ),
                                            bottom: BorderSide(
                                              width: (isOpen) ? 2.0 : 1.0,
                                              color: borderColor()!,
                                            ),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              borderRadius),
                                        ),
                                        constraints: BoxConstraints(
                                          minHeight: buttonHeight!,
                                          maxWidth: buttonWidth ??
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  widget.mainAxisAlignment ??
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: widget.buttonText !=
                                                          null
                                                      ? ExcludeSemantics(
                                                          excluding: true,
                                                          child:
                                                              widget.buttonText,
                                                        )
                                                      : Text(
                                                          "Option",
                                                          semanticsLabel: widget
                                                              .semanticsLabel,
                                                          style: labelTextStyle!
                                                              .copyWith(
                                                            color:
                                                                buttonTextColor(),
                                                          ),
                                                          maxLines: 3,
                                                        ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                  ),
                                                  child: RotatedBox(
                                                    quarterTurns:
                                                        !isOpen ? 0 : 2,
                                                    child: VIcon(
                                                      svgIcon: VIcons
                                                          .chevronDownTiny,
                                                      iconWidth: 16,
                                                      iconHeight: 16,
                                                      iconColor: iconColor(),
                                                      iconFit: BoxFit.none,
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
                                if (isTapped)
                                  Divider(
                                    thickness: 2,
                                    height: 0,
                                    color: bottomBar(),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // if (widget.showErrorMessage /*|| widget.validate*/)
                    Visibility(
                      visible: widget.showErrorMessage,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: widget.showErrorIcon,
                              child: VIcon(
                                svgIcon: VIcons.errorTiny,
                                iconHeight: 18,
                                iconWidth: 18,
                                iconColor: widget.validate
                                    ? errorIconColor
                                    : textLabelColor(),
                              ),
                            ),
                            SizedBox(
                              width: widget.showErrorIcon ? 5 : 0,
                            ),
                            Flexible(
                              child: Text(
                                widget.validateText,
                                style: validateTextStyle!.copyWith(
                                  color:
                                      widget.validate && widget.showErrorMessage
                                          ? validateTextColor
                                          : textLabelColor(),
                                ),
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    widget.inLineMessage ?? const SizedBox()
                  ],
                ),
              ),
            ],
          )
        : SizedBox(
            width: width(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.headerLabel != null
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          widget.headerLabel!,
                          style: headerTextStyle!.copyWith(
                            color: textLabelColor(),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Semantics(
                      onDidGainAccessibilityFocus:
                          widget.onDidGainAccessibilityFocus ??
                              () {
                                SemanticsService.announce(
                                  (widget.isDisabled
                                      ? "Collapsed. ${widget.headerLabel}.${widget.buttonText}. popup disabled"
                                      : widget.semanticReadout ??
                                          "Collapsed. ${widget.headerLabel}.${widget.buttonText}. popup button. double tap to activate"),
                                  TextDirection.ltr,
                                );
                              },
                      excludeSemantics: true,
                      child: Focus(
                        focusNode: widget.focusNode,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(borderRadius!)),
                          child: IntrinsicWidth(
                            child: Column(
                              children: [
                                PopupMenuButton(
                                  constraints: BoxConstraints(
                                    minWidth: width(),
                                  ),
                                  color: dropdownColor,
                                  elevation: dropDownElevation,
                                  tooltip: widget.buttonText.toString(),
                                  key: _popUpButtonKey,
                                  enabled: isTapped,
                                  splashRadius: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        dropDownBorderRadius!),
                                    side: BorderSide(
                                      color: dropDownBorderColor!,
                                    ),
                                  ),
                                  position: widget.position,
                                  itemBuilder: widget.itemBuilder,
                                  offset: widget.offset,
                                  onCanceled: widget.isDisabled
                                      ? null
                                      : () {
                                          widget.onCanceled;
                                          setState(() {
                                            isTapped = false;
                                            isOpen = false;
                                          });
                                        },
                                  onSelected: widget.isDisabled
                                      ? null
                                      : ((value) {
                                          widget.onSelected != null
                                              ? widget.onSelected!(value)
                                              : null;
                                          setState(() {
                                            isTapped = false;
                                            isOpen = false;
                                          });
                                        }),
                                  child: GestureDetector(
                                    onTap: widget.isDisabled ||
                                            widget.isReadOnly == true
                                        ? null
                                        : (() {
                                            setState(() {
                                              isTapped = true;
                                              isOpen = true;
                                            });
                                            _popUpButtonKey.currentState!
                                                .showButtonMenu();
                                          }),
                                    onTapDown: widget.isDisabled ||
                                            widget.isReadOnly == true
                                        ? null
                                        : ((_) {
                                            setState(() {
                                              isTapped = true;
                                              isOpen = false;
                                            });
                                          }),
                                    onTapUp: widget.isDisabled ||
                                            widget.isReadOnly == true
                                        ? null
                                        : (_) {
                                            setState(() {
                                              isTapped = true;
                                              isOpen = _popUpButtonKey
                                                  .currentState!.mounted;
                                            });
                                          },
                                    onTapCancel: widget.isDisabled
                                        ? null
                                        : () {
                                            setState(() {
                                              isTapped = false;
                                              isOpen = false;
                                            });
                                          },
                                    child: IntrinsicWidth(
                                      stepWidth: width(),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              width: 1.0,
                                              color: borderColor()!,
                                            ),
                                            left: BorderSide(
                                              width: 1.0,
                                              color: borderColor()!,
                                            ),
                                            right: BorderSide(
                                              width: 1.0,
                                              color: borderColor()!,
                                            ),
                                            bottom: BorderSide(
                                              width: (isOpen) ? 2.0 : 1.0,
                                              color: borderColor()!,
                                            ),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              borderRadius),
                                        ),
                                        constraints: BoxConstraints(
                                          minHeight: buttonHeight!,
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  widget.mainAxisAlignment ??
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: widget.buttonText !=
                                                          null
                                                      ? ExcludeSemantics(
                                                          excluding: true,
                                                          child:
                                                              widget.buttonText,
                                                        )
                                                      : Text(
                                                          "Option",
                                                          semanticsLabel: widget
                                                              .semanticsLabel,
                                                          style: labelTextStyle!
                                                              .copyWith(
                                                            color:
                                                                buttonTextColor(),
                                                          ),
                                                        ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  child: RotatedBox(
                                                    quarterTurns:
                                                        !isOpen ? 0 : 2,
                                                    child: VIcon(
                                                      svgIcon: VIcons
                                                          .chevronDownTiny,
                                                      iconWidth: 16,
                                                      iconHeight: 16,
                                                      iconColor: iconColor(),
                                                      iconFit: BoxFit.none,
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
                                if (isTapped)
                                  Divider(
                                    thickness: 2,
                                    height: 0,
                                    color: bottomBar(),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: widget.showErrorMessage,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: widget.showErrorIcon,
                              child: VIcon(
                                svgIcon: VIcons.errorTiny,
                                iconHeight: 18,
                                iconWidth: 18,
                                iconColor: widget.validate
                                    ? errorIconColor
                                    : textLabelColor(),
                              ),
                            ),
                            SizedBox(
                              width: widget.showErrorIcon ? 5 : 0,
                            ),
                            Flexible(
                              child: Text(
                                widget.validateText,
                                style: validateTextStyle!.copyWith(
                                  color:
                                      widget.validate && widget.showErrorMessage
                                          ? validateTextColor
                                          : textLabelColor(),
                                ),
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    widget.inLineMessage ?? const SizedBox()
                  ],
                )
              ],
            ),
          );
  }
}
