// Copyright (c) 2025 Visa, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and
// limitations under the License.
//
// Visa Flag
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// VFlagStyle using ThemeExtension
class VFlagStyle extends ThemeExtension<VFlagStyle> {
  const VFlagStyle({
    this.infoIconColor,
    this.warningIconColor,
    this.errorIconColor,
    this.successIconColor,
    this.linkTextColor,
    this.linkUnderlineColor,
    this.closeIconColor,
    this.titleTextColor,
    this.descriptionTextColor,
    this.linkTextStyle,
    this.titleTextStyle,
    this.descriptionTextStyle,
    this.closeIconPadding,
    this.linkStyle,
  });

  final Color? infoIconColor,
      warningIconColor,
      errorIconColor,
      successIconColor,
      linkTextColor,
      linkUnderlineColor,
      closeIconColor,
      titleTextColor,
      descriptionTextColor;
  final TextStyle? linkTextStyle, titleTextStyle, descriptionTextStyle;
  final EdgeInsetsGeometry? closeIconPadding;
  final VButtonStyle? linkStyle;

  @override
  VFlagStyle copyWith({
    Color? infoIconColor,
    warningIconColor,
    errorIconColor,
    successIconColor,
    linkTextColor,
    linkUnderlineColor,
    closeIconColor,
    titleTextColor,
    descriptionTextColor,
    TextStyle? linkTextStyle,
    TextStyle? titleTextStyle,
    TextStyle? descriptionTextStyle,
    EdgeInsetsGeometry? closeIconPadding,
    VButtonStyle? linkStyle,
  }) =>
      VFlagStyle(
        infoIconColor: infoIconColor ?? this.infoIconColor,
        warningIconColor: warningIconColor ?? this.warningIconColor,
        errorIconColor: errorIconColor ?? this.errorIconColor,
        successIconColor: successIconColor ?? this.successIconColor,
        linkTextColor: linkTextColor ?? this.linkTextColor,
        linkUnderlineColor: linkUnderlineColor ?? this.linkUnderlineColor,
        closeIconColor: closeIconColor ?? this.closeIconColor,
        titleTextColor: titleTextColor ?? this.titleTextColor,
        descriptionTextColor: descriptionTextColor ?? this.descriptionTextColor,
        linkTextStyle: linkTextStyle ?? this.linkTextStyle,
        titleTextStyle: titleTextStyle ?? this.titleTextStyle,
        descriptionTextStyle: descriptionTextStyle ?? this.descriptionTextStyle,
        closeIconPadding: closeIconPadding ?? this.closeIconPadding,
        linkStyle: linkStyle ?? this.linkStyle,
      );

  @override
  VFlagStyle lerp(ThemeExtension<VFlagStyle>? other, double t) {
    if (other is! VFlagStyle) {
      return this;
    }

    return VFlagStyle(
      infoIconColor: Color.lerp(infoIconColor, other.infoIconColor, t),
      warningIconColor: Color.lerp(warningIconColor, other.warningIconColor, t),
      errorIconColor: Color.lerp(errorIconColor, other.errorIconColor, t),
      successIconColor: Color.lerp(successIconColor, other.successIconColor, t),
      linkTextColor: Color.lerp(linkTextColor, other.linkTextColor, t),
      linkUnderlineColor:
          Color.lerp(linkUnderlineColor, other.linkUnderlineColor, t),
      closeIconColor: Color.lerp(closeIconColor, other.closeIconColor, t),
      titleTextColor: Color.lerp(titleTextColor, other.titleTextColor, t),
      descriptionTextColor:
          Color.lerp(descriptionTextColor, other.descriptionTextColor, t),
      linkTextStyle: linkTextStyle ?? other.linkTextStyle,
      titleTextStyle: titleTextStyle ?? other.titleTextStyle,
      descriptionTextStyle: descriptionTextStyle ?? other.descriptionTextStyle,
      closeIconPadding: closeIconPadding ?? other.closeIconPadding,
      linkStyle: linkStyle ?? other.linkStyle,
    );
  }
}

enum FlagState { informational, warning, error, success }

class VFlag extends StatelessWidget {
  const VFlag({
    Key? key,
    this.flagState = FlagState.informational,
    this.onClosePressed,
    this.hasTitle = false,
    this.title = "",
    this.hasAction = false,
    this.action = "Action",
    this.onActionPressed,
    this.hasLink = false,
    this.link = "",
    this.onLinkPressed,
    this.hasClose = false,
    required this.description,
    this.style,
    this.vExt,
    this.contentPadding,
    this.flagIconPadding,
  }) : super(key: key);

  final String title, description, action, link;
  final FlagState flagState;
  final VoidCallback? onClosePressed, onActionPressed, onLinkPressed;
  final bool hasTitle, hasAction, hasLink, hasClose;
  final VFlagStyle? style;
  final VExt? vExt;
  final EdgeInsetsGeometry? contentPadding, flagIconPadding;

  FontWeight getFirstLineStyle(bool hasTitle) {
    return hasTitle ? VFontWeight.semiBold : VFontWeight.regular;
  }

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (vExt == null || vExt is VDef) {
      defaultStyle = getDefaultColorScheme()!;
    } else {
      defaultStyle = getAltColorScheme()!;
    }

    final messageStyle = getMessageColorScheme()!;
    final infoIconColor = style?.infoIconColor ?? messageStyle.infoText;
    final warningIconColor =
        style?.warningIconColor ?? messageStyle.warningText;
    final errorIconColor = style?.errorIconColor ?? messageStyle.negativeText;
    final successIconColor =
        style?.successIconColor ?? messageStyle.positiveText;
    final linkTextColor = style?.linkTextColor ?? defaultStyle.active;
    final linkUnderlineColor = style?.linkUnderlineColor ?? defaultStyle.active;
    final closeIconColor =
        style?.closeIconColor ?? defaultStyle.activeSubtle.withOpacity(0.5);
    final titleTextColor = style?.titleTextColor ?? defaultStyle?.text;
    final descriptionTextColor =
        style?.descriptionTextColor ?? defaultStyle?.text;
    final linkTextStyle =
        style?.linkTextStyle ?? defaultStyle.vFlagProperties.linkTextStyle;
    final titleTextStyle =
        style?.titleTextStyle ?? defaultStyle.vFlagProperties.titleTextStyle;
    final descriptionTextStyle = style?.descriptionTextStyle ??
        defaultStyle.vFlagProperties.descriptionTextStyle;
    final closeIconPadding = style?.closeIconPadding ??
        defaultStyle.vFlagProperties.closeIconPadding;
    final linkStyle =
        style?.linkStyle ?? defaultStyle.vFlagProperties.linkStyle;

    String getFlagState(flagState) {
      if (flagState == FlagState.informational) {
        return "informational flag";
      }
      if (flagState == FlagState.warning) {
        return "warning flag";
      }
      if (flagState == FlagState.error) {
        return "error flag";
      }
      if (flagState == FlagState.success) {
        return "success flag";
      }
      return "";
    }

    Widget? getFlagIcon(flagState) {
      if (flagState == FlagState.informational) {
        return VIcon(
          svgIcon: VIcons.informationLow,
          iconHeight: 24,
          iconWidth: 24,
          iconColor: infoIconColor,
        );
      } else if (flagState == FlagState.warning) {
        return VIcon(
          svgIcon: VIcons.warningLow,
          iconHeight: 24,
          iconWidth: 24,
          iconColor: warningIconColor,
        );
      } else if (flagState == FlagState.error) {
        return VIcon(
          svgIcon: VIcons.errorLow,
          iconHeight: 24,
          iconWidth: 24,
          iconColor: errorIconColor,
        );
      } else if (flagState == FlagState.success) {
        return VIcon(
          svgIcon: VIcons.successLow,
          iconHeight: 24,
          iconWidth: 24,
          iconColor: successIconColor,
        );
      }
      return null;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: flagIconPadding ?? EdgeInsets.zero,
                  child: getFlagIcon(flagState)!,
                ),
              ),
              Expanded(
                flex: hasClose ? 6 : 10,
                child: Padding(
                  padding:
                      contentPadding ?? const EdgeInsets.fromLTRB(10, 4, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hasTitle ? title : description,
                        style: titleTextStyle.copyWith(
                          color: titleTextColor,
                          fontWeight: getFirstLineStyle(hasTitle),
                          height: 1.0,
                        ),
                      ),
                      if (hasTitle)
                        Text(
                          description,
                          style: descriptionTextStyle.copyWith(
                            color: descriptionTextColor,
                            height: 1.5,
                          ),
                        ),
                      if (hasLink)
                        VButton(
                            style: linkStyle.copyWith(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              backgroundColorActive: VColors.transparent,
                            ),
                            onPressed: onLinkPressed,
                            child: Text(
                              link,
                              style: linkTextStyle.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: linkUnderlineColor,
                                color: linkTextColor,
                              ),
                            )),
                      if (hasAction) ...[
                        const SizedBox(
                          height: 10,
                        ),
                        VButton(
                          style: VButtonStyle(
                            backgroundColorActive: VColors.defaultSurface1,
                            backgroundColorDisabled: VColors.defaultSurface1,
                            foregroundColorActive: VColors.defaultActive,
                            foregroundColorDisabled: VColors.disabled,
                            overlayColorFocused: VColors.defaultSurfaceLowlight,
                            overlayColorPressed: VColors.defaultSurfaceLowlight,
                            borderSideActive: const BorderSide(
                              color: VColors.defaultActive,
                              style: BorderStyle.solid,
                            ),
                            borderSideDisabled: BorderSide(
                              color: VColors.defaultDisabled,
                              style: BorderStyle.solid,
                            ),
                          ),
                          onPressed: onActionPressed,
                          child: Text(
                            action,
                            style:
                                defaultVTheme.textStyles.buttonMedium.copyWith(
                              color: VColors.defaultActive,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              if (hasClose)
                Expanded(
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    highlightColor: VColors.transparent,
                    splashColor: VColors.defaultSurfaceLowlight,
                    onTap: onClosePressed,
                    child: Semantics(
                      button: true,
                      hint: "Close ${getFlagState(flagState)}",
                      focusable: true,
                      child: Container(
                        width: 44,
                        height: 44,
                        padding: closeIconPadding,
                        child: VIcon(
                          svgIcon: VIcons.closeTiny,
                          iconColor: closeIconColor,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
