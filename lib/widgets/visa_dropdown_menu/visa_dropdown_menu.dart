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
// Visa dropdown menu constructor

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// VDropdownIconStyle using ThemeExtension
class VDropdownIconStyle extends ThemeExtension<VDropdownIconStyle> {
  const VDropdownIconStyle({
    this.dropDownColor,
    this.dropdownBorderColor,
    this.backgroundSplashColor,
    this.buttonDefaultColor,
    this.defaultSecButtonColor,
    this.defaultIconColor,
    this.disabledButtonColor,
    this.disabledIconColor,
    this.isSecDisabledBorderColor,
    this.isSecDisabledButtonColor,
    this.isSecTappedButtonColor,
    this.tappedButtonColor,
    this.isSecDefaultBorderColor,
    this.disabledBorderColor,
    this.defaultBorderColor,
    this.isSecDisabledIconColor,
    this.isSecDefaultIconColor,
    this.dropdownTextStyle,
    this.dropdownBorderRadius,
    this.bigIconSize,
    this.defaultIconSize,
  });

  final Color? dropDownColor,
      dropdownBorderColor,
      backgroundSplashColor,
      isSecDisabledButtonColor,
      disabledButtonColor,
      isSecTappedButtonColor,
      tappedButtonColor,
      buttonDefaultColor,
      defaultSecButtonColor,
      isSecDisabledBorderColor,
      isSecDefaultBorderColor,
      disabledBorderColor,
      defaultBorderColor,
      isSecDisabledIconColor,
      isSecDefaultIconColor,
      disabledIconColor,
      defaultIconColor;
  final double? dropdownBorderRadius, bigIconSize, defaultIconSize;
  final TextStyle? dropdownTextStyle;

  @override
  VDropdownIconStyle copyWith({
    Color? dropDownColor,
    dropdownBorderColor,
    backgroundSplashColor,
    isSecDisabledButtonColor,
    disabledButtonColor,
    isSecTappedButtonColor,
    tappedButtonColor,
    buttonDefaultColor,
    defaultSecButtonColor,
    isSecDisabledBorderColor,
    disabledIconColor,
    isSecDefaultBorderColor,
    defaultIconColor,
    disabledBorderColor,
    isSecDisabledIconColor,
    isSecDefaultIconColor,
    defaultBorderColor,
    double? dropdownBorderRadius,
    bigIconSize,
    defaultIconSize,
    TextStyle? dropdownTextStyle,
  }) =>
      VDropdownIconStyle(
        backgroundSplashColor: backgroundSplashColor ?? this.backgroundSplashColor,
        dropdownBorderColor: dropdownBorderColor ?? this.dropdownBorderColor,
        dropDownColor: dropDownColor ?? this.dropDownColor,
        isSecDisabledButtonColor: isSecDisabledButtonColor ?? this.isSecDisabledButtonColor,
        disabledButtonColor: disabledButtonColor ?? this.disabledButtonColor,
        isSecTappedButtonColor: isSecTappedButtonColor ?? this.isSecTappedButtonColor,
        tappedButtonColor: tappedButtonColor ?? this.tappedButtonColor,
        buttonDefaultColor: buttonDefaultColor ?? this.buttonDefaultColor,
        defaultSecButtonColor: defaultSecButtonColor ?? this.defaultSecButtonColor,
        isSecDisabledBorderColor: isSecDisabledBorderColor ?? this.isSecDisabledBorderColor,
        disabledIconColor: disabledIconColor ?? this.disabledIconColor,
        defaultIconColor: defaultIconColor ?? this.defaultIconColor,
        isSecDefaultBorderColor: isSecDefaultBorderColor ?? this.isSecDefaultBorderColor,
        disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
        defaultBorderColor: defaultBorderColor ?? this.defaultBorderColor,
        isSecDisabledIconColor: isSecDisabledIconColor ?? this.isSecDisabledIconColor,
        isSecDefaultIconColor: isSecDefaultIconColor ?? this.isSecDefaultIconColor,
        dropdownTextStyle: dropdownTextStyle ?? this.dropdownTextStyle,
        dropdownBorderRadius: dropdownBorderRadius ?? this.dropdownBorderRadius,
        bigIconSize: bigIconSize ?? this.bigIconSize,
        defaultIconSize: defaultIconSize ?? this.defaultIconSize,
      );

  @override
  VDropdownIconStyle lerp(ThemeExtension<VDropdownIconStyle>? other, double t) {
    if (other is! VDropdownIconStyle) {
      return this;
    }

    return VDropdownIconStyle(
      dropdownBorderColor: Color.lerp(dropdownBorderColor, other.dropdownBorderColor, t),
      backgroundSplashColor: Color.lerp(backgroundSplashColor, other.backgroundSplashColor, t),
      dropDownColor: Color.lerp(dropDownColor, other.dropDownColor, t),
      isSecDisabledButtonColor: Color.lerp(isSecDisabledButtonColor, other.isSecDisabledButtonColor, t),
      disabledButtonColor: Color.lerp(disabledButtonColor, other.disabledButtonColor, t),
      isSecTappedButtonColor: Color.lerp(isSecTappedButtonColor, other.isSecTappedButtonColor, t),
      tappedButtonColor: Color.lerp(tappedButtonColor, other.tappedButtonColor, t),
      buttonDefaultColor: Color.lerp(buttonDefaultColor, other.buttonDefaultColor, t),
      isSecDisabledBorderColor: Color.lerp(isSecDisabledBorderColor, other.isSecDisabledBorderColor, t),
      disabledIconColor: Color.lerp(disabledIconColor, other.disabledIconColor, t),
      defaultIconColor: Color.lerp(defaultIconColor, other.defaultIconColor, t),
      defaultSecButtonColor: Color.lerp(defaultSecButtonColor, other.defaultSecButtonColor, t),
      isSecDefaultBorderColor: Color.lerp(isSecDefaultBorderColor, other.isSecDefaultBorderColor, t),
      disabledBorderColor: Color.lerp(disabledBorderColor, other.disabledBorderColor, t),
      defaultBorderColor: Color.lerp(defaultBorderColor, other.defaultBorderColor, t),
      isSecDisabledIconColor: Color.lerp(isSecDisabledIconColor, other.isSecDisabledIconColor, t),
      isSecDefaultIconColor: Color.lerp(isSecDefaultIconColor, other.isSecDefaultIconColor, t),
      dropdownBorderRadius: lerpDouble(dropdownBorderRadius, other.dropdownBorderRadius, t),
      bigIconSize: lerpDouble(bigIconSize, other.bigIconSize, t),
      defaultIconSize: lerpDouble(defaultIconSize, other.defaultIconSize, t),
      dropdownTextStyle: dropdownTextStyle,
    );
  }
}

class VDropdownIcon extends StatefulWidget {
  const VDropdownIcon({
    Key? key,
    required this.itemBuilder,
    this.isDisabled = false,
    this.icons,
    this.isIconBig = false,
    required this.onSelected,
    this.onCanceled,
    this.isSecTheme = false,
    this.style,
    this.vExt,
    this.position = PopupMenuPosition.under,
    this.offset = const Offset(0, 10),
  }) : super(key: key);

  // BEGIN Properties
  final bool isDisabled;
  final Widget? icons;
  final bool isIconBig, isSecTheme;
  final void Function(dynamic) onSelected;
  final void Function()? onCanceled;
  final VDropdownIconStyle? style;
  final VExt? vExt;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  final PopupMenuPosition? position;
  final Offset offset;
  // END

  @override
  State<VDropdownIcon> createState() => _VDropdownIconState();
}

class _VDropdownIconState extends State<VDropdownIcon> {
  final GlobalKey<PopupMenuButtonState> _popUpButtonKey = GlobalKey<PopupMenuButtonState>();
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (widget.vExt == null || widget.vExt is VDef) {
      defaultStyle = Theme.of(context).brightness == Brightness.dark ? getDefaultColorSchemeDark()! : getDefaultColorScheme()!;
    } else {
      defaultStyle = Theme.of(context).brightness == Brightness.dark ? getAltColorSchemeDark()! : getAltColorScheme()!;
    }
    final backgroundSplashColor = widget.style?.backgroundSplashColor ?? defaultStyle.surfaceLowlight;
    final dropdownBorderColor = widget.style?.dropdownBorderColor ?? defaultStyle.border;
    final isSecDisabledButtonColor = widget.style?.isSecDisabledButtonColor ?? defaultStyle.surface1;
    final disabledButtonColor = widget.style?.disabledButtonColor ?? defaultStyle.disabled;
    final buttonDefaultColor = widget.style?.buttonDefaultColor ?? defaultStyle.active;
    final defaultSecButtonColor = widget.style?.defaultSecButtonColor ?? defaultStyle.surface1;
    final isSecTappedButtonColor = widget.style?.isSecTappedButtonColor ?? defaultStyle.surfaceHighlight;
    final tappedButtonColor = widget.style?.tappedButtonColor ?? defaultStyle.activePressed;
    final isSecDisabledBorderColor = widget.style?.isSecDisabledBorderColor ?? defaultStyle.disabled;
    final disabledBorderColor = widget.style?.disabledBorderColor ?? defaultStyle.transparent;
    final isSecDefaultBorderColor = widget.style?.isSecDefaultBorderColor ?? defaultStyle.active;
    final defaultBorderColor = widget.style?.defaultBorderColor ?? defaultStyle.active;
    final isSecDisabledIconColor = widget.style?.isSecDisabledIconColor ?? defaultStyle.disabled;
    final disabledIconColor = widget.style?.disabledIconColor ?? defaultStyle.surface1;
    final isSecDefaultIconColor = widget.style?.isSecDefaultIconColor ?? defaultStyle.disabled;
    final defaultIconColor = widget.style?.defaultIconColor ?? defaultStyle.surface1;
    final dropdownBorderRadius = widget.style?.dropdownBorderRadius ?? defaultStyle.vDropdownIconProperties?.dropdownBorderRadius;
    final bigIconSize = widget.style?.dropdownBorderRadius ?? defaultStyle.vDropdownIconProperties?.bigIconSize;
    final defaultIconSize = widget.style?.defaultIconSize ?? defaultStyle.vDropdownIconProperties?.defaultIconSize;
    final dropdownTextStyle = widget.style?.dropdownTextStyle ?? defaultStyle.vDropdownIconProperties?.dropdownTextStyle;
    final dropDownColor = widget.style?.dropDownColor ?? defaultStyle.surface1;

    double? listPosition() => widget.isIconBig ? bigIconSize! : defaultIconSize!;

    Color? buttonColor() {
      if (widget.isDisabled) {
        return widget.isSecTheme ? isSecDisabledButtonColor : disabledButtonColor;
      }
      if (isTapped) {
        return widget.isSecTheme ? isSecTappedButtonColor : tappedButtonColor;
      }
      return widget.isSecTheme ? defaultSecButtonColor : buttonDefaultColor;
    }

    Color? borderColor() {
      if (widget.isDisabled) {
        return widget.isSecTheme ? isSecDisabledBorderColor : disabledBorderColor;
      }
      return widget.isSecTheme ? isSecDefaultBorderColor : defaultBorderColor;
    }

    Color? iconColor() {
      if (widget.isDisabled) {
        return widget.isSecTheme ? isSecDisabledIconColor : disabledIconColor;
      }
      return widget.isSecTheme ? isSecDefaultIconColor : defaultIconColor;
    }

    return Semantics(
      onDidGainAccessibilityFocus: () {
        SemanticsService.announce(
          widget.isDisabled ? "More actions. disabled" : "More actions button",
          TextDirection.ltr,
        );
      },
      child: PopupMenuButton(
        key: _popUpButtonKey,
        enabled: isTapped,
        tooltip: "More actions",
        splashRadius: 0,
        color: dropDownColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dropdownBorderRadius!),
          side: BorderSide(
            color: dropdownBorderColor!,
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
                });
              },
        onSelected: widget.isDisabled
            ? null
            : ((value) {
                widget.onSelected(value);
                setState(() {
                  isTapped = false;
                });
              }),
        child: GestureDetector(
          onTap: widget.isDisabled
              ? null
              : (() {
                  setState(() {
                    isTapped = !isTapped;
                  });
                  _popUpButtonKey.currentState!.showButtonMenu();
                }),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: borderColor()!,
              ),
              color: buttonColor(),
              borderRadius: BorderRadius.circular(100),
            ),
            height: listPosition(),
            width: listPosition(),
            child: Center(
              child: widget.icons ??
                  VIcon(
                    svgIcon: VIcons.optionHorizontalTiny,
                    iconHeight: 24,
                    iconWidth: 24,
                    iconColor: iconColor(),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

// VDropdownTextButtonStyle using ThemeExtension
class VDropdownTextButtonStyle extends ThemeExtension<VDropdownTextButtonStyle> {
  const VDropdownTextButtonStyle(
      {this.dropDownColor,
      this.backgroundSplashColor,
      this.dropdownBorderColor,
      this.buttonDefaultColor,
      this.defaultBorderColor,
      this.bigButtonSize,
      this.defaultButtonSize,
      this.defaultSecButtonColor,
      this.disabledButtonColor,
      this.isSecDisabledBorderColor,
      this.isSecDisabledButtonColor,
      this.isSecTappedButtonColor,
      this.tappedButtonColor,
      this.isSecDefaultBorderColor,
      this.disabledBorderColor,
      this.defaultIconColor,
      this.isSecDefaultIconColor,
      this.isSecDisabledIconColor,
      this.disabledIconColor,
      this.secBackgroundSplashColor,
      this.dropdownTextStyle,
      this.bigIconTextStyle,
      this.smallIconTextStyle,
      this.borderRadius,
      this.dropdownBorderRadius,
      this.defaultFontColor,
      this.disabledFontColor,
      this.isSecDefaultFontColor,
      this.isSecDisabledFontColor});

  final Color? dropDownColor,
      backgroundSplashColor,
      dropdownBorderColor,
      isSecDisabledButtonColor,
      disabledButtonColor,
      isSecTappedButtonColor,
      tappedButtonColor,
      buttonDefaultColor,
      defaultSecButtonColor,
      isSecDisabledBorderColor,
      isSecDefaultBorderColor,
      disabledBorderColor,
      defaultBorderColor,
      defaultIconColor,
      isSecDefaultIconColor,
      isSecDisabledIconColor,
      secBackgroundSplashColor,
      disabledIconColor,
      defaultFontColor,
      disabledFontColor,
      isSecDefaultFontColor,
      isSecDisabledFontColor;
  final double? borderRadius, dropdownBorderRadius, bigButtonSize, defaultButtonSize;
  final TextStyle? dropdownTextStyle, bigIconTextStyle, smallIconTextStyle;

  @override
  VDropdownTextButtonStyle copyWith({
    Color? dropDownColor,
    backgroundSplashColor,
    dropdownBorderColor,
    isSecDisabledButtonColor,
    disabledButtonColor,
    isSecTappedButtonColor,
    tappedButtonColor,
    buttonDefaultColor,
    defaultSecButtonColor,
    isSecDisabledBorderColor,
    isSecDefaultBorderColor,
    disabledBorderColor,
    defaultBorderColor,
    defaultIconColor,
    isSecDefaultIconColor,
    isSecDisabledIconColor,
    disabledIconColor,
    secBackgroundSplashColor,
    defaultFontColor,
    disabledFontColor,
    isSecDefaultFontColor,
    isSecDisabledFontColor,
    double? borderRadius,
    dropdownBorderRadius,
    bigButtonSize,
    defaultButtonSize,
    TextStyle? dropdownTextStyle,
    bigIconTextStyle,
    smallIconTextStyle,
  }) =>
      VDropdownTextButtonStyle(
        backgroundSplashColor: backgroundSplashColor ?? this.backgroundSplashColor,
        dropDownColor: dropDownColor ?? this.dropDownColor,
        dropdownBorderColor: dropdownBorderColor ?? this.dropdownBorderColor,
        isSecDisabledButtonColor: isSecDisabledButtonColor ?? this.isSecDisabledButtonColor,
        disabledButtonColor: disabledButtonColor ?? this.disabledButtonColor,
        isSecTappedButtonColor: isSecTappedButtonColor ?? this.isSecTappedButtonColor,
        tappedButtonColor: tappedButtonColor ?? this.tappedButtonColor,
        buttonDefaultColor: buttonDefaultColor ?? this.buttonDefaultColor,
        defaultSecButtonColor: defaultSecButtonColor ?? this.defaultSecButtonColor,
        isSecDisabledBorderColor: isSecDisabledBorderColor ?? this.isSecDisabledBorderColor,
        isSecDefaultBorderColor: isSecDefaultBorderColor ?? this.isSecDefaultBorderColor,
        disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
        defaultBorderColor: defaultBorderColor ?? this.defaultBorderColor,
        defaultIconColor: defaultIconColor ?? this.defaultIconColor,
        isSecDefaultIconColor: isSecDefaultIconColor ?? this.isSecDefaultIconColor,
        isSecDisabledIconColor: isSecDisabledIconColor ?? this.isSecDisabledIconColor,
        disabledIconColor: disabledIconColor ?? this.disabledIconColor,
        defaultFontColor: defaultFontColor ?? this.defaultFontColor,
        disabledFontColor: disabledFontColor ?? this.disabledFontColor,
        isSecDefaultFontColor: isSecDefaultFontColor ?? this.isSecDefaultFontColor,
        isSecDisabledFontColor: isSecDisabledFontColor ?? this.isSecDisabledFontColor,
        secBackgroundSplashColor: secBackgroundSplashColor ?? this.secBackgroundSplashColor,
        dropdownTextStyle: dropdownTextStyle ?? this.dropdownTextStyle,
        bigIconTextStyle: bigIconTextStyle ?? this.bigIconTextStyle,
        smallIconTextStyle: smallIconTextStyle ?? this.smallIconTextStyle,
        borderRadius: borderRadius ?? this.borderRadius,
        dropdownBorderRadius: dropdownBorderRadius ?? this.dropdownBorderRadius,
        bigButtonSize: bigButtonSize ?? this.bigButtonSize,
        defaultButtonSize: defaultButtonSize ?? this.defaultButtonSize,
      );

  @override
  VDropdownTextButtonStyle lerp(ThemeExtension<VDropdownTextButtonStyle>? other, double t) {
    if (other is! VDropdownTextButtonStyle) {
      return this;
    }

    return VDropdownTextButtonStyle(
      dropDownColor: Color.lerp(dropDownColor, other.dropDownColor, t),
      backgroundSplashColor: Color.lerp(backgroundSplashColor, other.backgroundSplashColor, t),
      dropdownBorderColor: Color.lerp(dropdownBorderColor, other.dropdownBorderColor, t),
      isSecDisabledButtonColor: Color.lerp(isSecDisabledButtonColor, other.isSecDisabledButtonColor, t),
      disabledButtonColor: Color.lerp(disabledButtonColor, other.disabledButtonColor, t),
      isSecTappedButtonColor: Color.lerp(isSecTappedButtonColor, other.isSecTappedButtonColor, t),
      tappedButtonColor: Color.lerp(tappedButtonColor, other.tappedButtonColor, t),
      buttonDefaultColor: Color.lerp(buttonDefaultColor, other.buttonDefaultColor, t),
      defaultSecButtonColor: Color.lerp(defaultSecButtonColor, other.defaultSecButtonColor, t),
      isSecDisabledBorderColor: Color.lerp(isSecDisabledBorderColor, other.isSecDisabledBorderColor, t),
      isSecDefaultBorderColor: Color.lerp(isSecDefaultBorderColor, other.isSecDefaultBorderColor, t),
      disabledBorderColor: Color.lerp(disabledBorderColor, other.disabledBorderColor, t),
      defaultBorderColor: Color.lerp(defaultBorderColor, other.defaultBorderColor, t),
      defaultIconColor: Color.lerp(defaultIconColor, other.defaultIconColor, t),
      isSecDefaultIconColor: Color.lerp(isSecDefaultIconColor, other.isSecDefaultIconColor, t),
      isSecDisabledIconColor: Color.lerp(isSecDisabledIconColor, other.isSecDisabledIconColor, t),
      disabledIconColor: Color.lerp(disabledIconColor, other.disabledIconColor, t),
      defaultFontColor: Color.lerp(defaultFontColor, other.defaultFontColor, t),
      disabledFontColor: Color.lerp(disabledFontColor, other.disabledFontColor, t),
      isSecDefaultFontColor: Color.lerp(isSecDefaultFontColor, other.isSecDefaultFontColor, t),
      isSecDisabledFontColor: Color.lerp(isSecDisabledFontColor, other.isSecDisabledFontColor, t),
      secBackgroundSplashColor: Color.lerp(secBackgroundSplashColor, other.secBackgroundSplashColor, t),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
      dropdownBorderRadius: lerpDouble(dropdownBorderRadius, other.dropdownBorderRadius, t),
      bigButtonSize: lerpDouble(bigButtonSize, other.bigButtonSize, t),
      defaultButtonSize: lerpDouble(defaultButtonSize, other.defaultButtonSize, t),
      dropdownTextStyle: dropdownTextStyle,
      smallIconTextStyle: smallIconTextStyle,
      bigIconTextStyle: bigIconTextStyle,
    );
  }
}

class VDropdownTextButton extends StatefulWidget {
  const VDropdownTextButton({
    Key? key,
    // required this.dropdownOptions,
    required this.itemBuilder,
    required this.buttonText,
    this.isDisabled = false,
    this.icons,
    this.isIconBig = false,
    required this.onSelected,
    this.onCanceled,
    this.isSecTheme = false,
    this.style,
    this.vExt,
    this.position = PopupMenuPosition.under,
    this.offset = const Offset(0, 10),
  }) : super(key: key);

  // BEGIN Properties
  final String buttonText;
  // final List dropdownOptions;
  final bool isDisabled;
  final Widget? icons;
  final bool isIconBig, isSecTheme;
  final void Function(dynamic) onSelected;
  final void Function()? onCanceled;
  final VDropdownTextButtonStyle? style;
  final VExt? vExt;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  final PopupMenuPosition? position;
  final Offset offset;
  // END

  @override
  State<VDropdownTextButton> createState() => _VDropdownTextButtonState();
}

class _VDropdownTextButtonState extends State<VDropdownTextButton> {
  final GlobalKey<PopupMenuButtonState> _popUpButtonKey = GlobalKey<PopupMenuButtonState>();
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (widget.vExt == null || widget.vExt is VDef) {
      defaultStyle = getDefaultColorScheme()!;
    } else {
      defaultStyle = getAltColorScheme()!;
    }
    TextStyle? dropdownTextStyle = widget.style?.dropdownTextStyle ?? defaultStyle.vDropdownTextProperties?.dropdownTextStyle;
    TextStyle? smallIconTextStyle = widget.style?.smallIconTextStyle ?? defaultStyle.vDropdownTextProperties?.smallIconTextStyle;
    TextStyle? bigIconTextStyle = widget.style?.bigIconTextStyle ?? defaultStyle.vDropdownTextProperties?.bigIconTextStyle;
    double? borderRadius = widget.style?.borderRadius ?? defaultStyle.vDropdownTextProperties?.borderRadius;
    double? dropdownBorderRadius = widget.style?.dropdownBorderRadius ?? defaultStyle.vDropdownTextProperties?.dropdownBorderRadius;
    double? bigButtonSize = widget.style?.bigButtonSize ?? defaultStyle.vDropdownTextProperties?.bigButtonSize;
    double? defaultButtonSize = widget.style?.defaultButtonSize ?? defaultStyle.vDropdownTextProperties?.defaultButtonSize;
    Color? backgroundSplashColor = widget.style?.backgroundSplashColor ?? defaultStyle.surfaceLowlight;
    Color? dropdownBorderColor = widget.style?.dropdownBorderColor ?? defaultStyle.border;
    Color? isSecDisabledButtonColor = widget.style?.isSecDisabledButtonColor ?? defaultStyle.surface1;
    Color? disabledButtonColor = widget.style?.disabledButtonColor ?? defaultStyle.disabled;
    Color? buttonDefaultColor = widget.style?.buttonDefaultColor ?? defaultStyle.active;
    Color? defaultSecButtonColor = widget.style?.defaultSecButtonColor ?? defaultStyle.surface1;
    Color? isSecTappedButtonColor = widget.style?.isSecTappedButtonColor ?? defaultStyle.surfaceHighlight;
    Color? tappedButtonColor = widget.style?.tappedButtonColor ?? defaultStyle.activePressed;
    Color? isSecDisabledBorderColor = widget.style?.isSecDisabledBorderColor ?? defaultStyle.disabled;
    Color? disabledBorderColor = widget.style?.disabledBorderColor ?? defaultStyle.transparent;
    Color? isSecDefaultBorderColor = widget.style?.isSecDefaultBorderColor ?? defaultStyle.active;
    Color? defaultBorderColor = widget.style?.defaultBorderColor ?? defaultStyle.active;
    Color? defaultIconColor = widget.style?.defaultIconColor ?? defaultStyle.surface1;
    Color? isSecDefaultIconColor = widget.style?.isSecDefaultIconColor ?? defaultStyle.active;
    Color? isSecDisabledIconColor = widget.style?.isSecDisabledIconColor ?? defaultStyle.disabled;
    Color? disabledIconColor = widget.style?.disabledIconColor ?? defaultStyle.surface1;
    Color? secBackgroundSplashColor = widget.style?.secBackgroundSplashColor ?? defaultStyle.surfaceHighlight;
    Color? defaultFontColor = widget.style?.defaultFontColor ?? defaultStyle.surface1;
    Color? disabledFontColor = widget.style?.disabledFontColor ?? defaultStyle.surface1;
    Color? isSecDefaultFontColor = widget.style?.isSecDefaultFontColor ?? defaultStyle.active;
    Color? isSecDisabledFontColor = widget.style?.isSecDisabledFontColor ?? defaultStyle.disabled;
    Color? dropDownColor = widget.style?.dropDownColor ?? defaultStyle.surface1;

    double? buttonHeight() {
      if (widget.isIconBig) {
        return bigButtonSize;
      }
      return defaultButtonSize;
    }

    Color? buttonColor() {
      if (widget.isDisabled) {
        return widget.isSecTheme ? isSecDisabledButtonColor : disabledButtonColor;
      }
      if (isTapped) {
        return widget.isSecTheme ? isSecTappedButtonColor : tappedButtonColor;
      }

      return widget.isSecTheme ? defaultSecButtonColor : buttonDefaultColor;
    }

    Color? borderColor() {
      if (widget.isDisabled) {
        return widget.isSecTheme ? isSecDisabledBorderColor : disabledBorderColor;
      }
      return widget.isSecTheme ? isSecDefaultBorderColor : defaultBorderColor;
    }

    Color? iconColor() {
      if (widget.isDisabled) {
        return widget.isSecTheme ? isSecDisabledIconColor : disabledIconColor;
      }
      return widget.isSecTheme ? isSecDefaultIconColor : defaultIconColor;
    }

    Color? fontColor() {
      if (widget.isDisabled) {
        return widget.isSecTheme ? isSecDisabledFontColor : disabledFontColor;
      }
      return widget.isSecTheme ? isSecDefaultFontColor : defaultFontColor;
    }

    return Theme(
      data: ThemeData().copyWith(splashColor: widget.isSecTheme ? secBackgroundSplashColor : backgroundSplashColor),
      child: Semantics(
        onDidGainAccessibilityFocus: () {
          SemanticsService.announce(
            widget.isDisabled ? "${widget.buttonText}. disabled" : "${widget.buttonText}. button",
            TextDirection.ltr,
          );
        },
        child: PopupMenuButton(
          tooltip: widget.buttonText,
          key: _popUpButtonKey,
          enabled: isTapped,
          splashRadius: 0,
          color: dropDownColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dropdownBorderRadius!),
            side: BorderSide(
              color: dropdownBorderColor!,
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
                  });
                },
          onSelected: widget.isDisabled
              ? null
              : ((value) {
                  widget.onSelected(value);
                  setState(() {
                    isTapped = false;
                  });
                }),
          child: GestureDetector(
            onTap: widget.isDisabled
                ? null
                : (() {
                    setState(() {
                      isTapped = !isTapped;
                    });
                    _popUpButtonKey.currentState!.showButtonMenu();
                  }),
            child: IntrinsicWidth(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: borderColor()!,
                  ),
                  color: buttonColor(),
                  borderRadius: BorderRadius.circular(
                    borderRadius!,
                  ),
                ),
                height: buttonHeight(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        Text(
                          widget.buttonText,
                          style: widget.isIconBig ? bigIconTextStyle!.copyWith(color: fontColor()) : smallIconTextStyle!.copyWith(color: fontColor()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: RotatedBox(
                            quarterTurns: !isTapped ? 0 : 2,
                            child: VIcon(
                              svgIcon: VIcons.chevronDownTiny,
                              iconWidth: widget.isIconBig ? 22 : 18,
                              iconHeight: widget.isIconBig ? 22 : 18,
                              iconColor: iconColor(),
                              iconFit: BoxFit.contain,
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
      ),
    );
  }
}
