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
// Visa banner
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import "package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart";

// VBannerStyle using ThemeExtension
class VBannerStyle extends ThemeExtension<VBannerStyle> {
  const VBannerStyle({
    this.infoBGColor,
    this.infoIconColor,
    this.infoHLColor,
    this.warningBGColor,
    this.warningIconColor,
    this.warningHLColor,
    this.errorBGColor,
    this.errorIconColor,
    this.errorHLColor,
    this.successBGColor,
    this.successIconColor,
    this.successHLColor,
    this.borderRadius,
    this.boxShadowColor,
    this.boxShadowSpreadRadius,
    this.boxShadowBlurRadius,
    this.boxShadowOffset,
    this.margin,
    this.contentPadding,
    this.iconPadding,
    this.bannerPadding,
    this.titleTextStyle,
    this.descriptionTextStyle,
  });

  final Color? infoBGColor,
      infoIconColor,
      infoHLColor,
      warningBGColor,
      warningIconColor,
      warningHLColor,
      errorBGColor,
      errorIconColor,
      errorHLColor,
      successBGColor,
      successIconColor,
      successHLColor,
      boxShadowColor;
  final double? borderRadius, boxShadowSpreadRadius, boxShadowBlurRadius;
  final Offset? boxShadowOffset;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final EdgeInsets? iconPadding;
  final EdgeInsets? bannerPadding;
  final TextStyle? titleTextStyle, descriptionTextStyle;

  @override
  VBannerStyle copyWith({
    Color? infoBGColor,
    infoIconColor,
    infoHLColor,
    warningBGColor,
    warningIconColor,
    warningHLColor,
    errorBGColor,
    errorIconColor,
    errorHLColor,
    successBGColor,
    successIconColor,
    successHLColor,
    boxShadowColor,
    double? borderRadius,
    boxShadowSpreadRadius,
    boxShadowBlurRadius,
    Offset? boxShadowOffset,
    EdgeInsets? margin,
    contentPadding,
    iconPadding,
    bannerPadding,
    TextStyle? titleTextStyle,
    descriptionTextStyle,
  }) =>
      VBannerStyle(
        infoBGColor: infoBGColor ?? this.infoBGColor,
        infoIconColor: infoIconColor ?? this.infoIconColor,
        infoHLColor: infoHLColor ?? this.infoHLColor,
        warningBGColor: warningBGColor ?? this.warningBGColor,
        warningIconColor: warningIconColor ?? this.warningIconColor,
        warningHLColor: warningHLColor ?? this.warningHLColor,
        errorBGColor: errorBGColor ?? this.errorBGColor,
        errorIconColor: errorIconColor ?? this.errorIconColor,
        errorHLColor: errorHLColor ?? this.errorHLColor,
        successBGColor: successBGColor ?? this.successBGColor,
        successIconColor: successIconColor ?? this.successIconColor,
        successHLColor: successHLColor ?? this.successHLColor,
        boxShadowColor: boxShadowColor ?? this.boxShadowColor,
        borderRadius: borderRadius ?? this.borderRadius,
        boxShadowSpreadRadius:
            boxShadowSpreadRadius ?? this.boxShadowSpreadRadius,
        boxShadowBlurRadius: boxShadowBlurRadius ?? this.boxShadowBlurRadius,
        boxShadowOffset: boxShadowOffset ?? this.boxShadowOffset,
        margin: margin ?? this.margin,
        contentPadding: contentPadding ?? this.contentPadding,
        iconPadding: iconPadding ?? this.iconPadding,
        bannerPadding: bannerPadding ?? this.bannerPadding,
        titleTextStyle: titleTextStyle ?? this.titleTextStyle,
        descriptionTextStyle: descriptionTextStyle ?? this.descriptionTextStyle,
      );

  @override
  VBannerStyle lerp(ThemeExtension<VBannerStyle>? other, double t) {
    if (other is! VBannerStyle) {
      return this;
    }

    return VBannerStyle(
      infoBGColor: Color.lerp(infoBGColor, other.infoBGColor, t),
      infoIconColor: Color.lerp(infoIconColor, other.infoIconColor, t),
      infoHLColor: Color.lerp(infoHLColor, other.infoHLColor, t),
      warningBGColor: Color.lerp(warningBGColor, other.warningBGColor, t),
      warningIconColor: Color.lerp(warningIconColor, other.warningIconColor, t),
      warningHLColor: Color.lerp(warningHLColor, other.warningHLColor, t),
      errorBGColor: Color.lerp(errorBGColor, other.errorBGColor, t),
      errorIconColor: Color.lerp(errorIconColor, other.errorIconColor, t),
      errorHLColor: Color.lerp(errorHLColor, other.errorHLColor, t),
      successBGColor: Color.lerp(successBGColor, other.successBGColor, t),
      successIconColor: Color.lerp(successIconColor, other.successIconColor, t),
      successHLColor: Color.lerp(successHLColor, other.successHLColor, t),
      boxShadowColor: Color.lerp(boxShadowColor, other.boxShadowColor, t),
      borderRadius: borderRadius,
      boxShadowSpreadRadius: boxShadowSpreadRadius,
      boxShadowBlurRadius: boxShadowBlurRadius,
      boxShadowOffset: boxShadowOffset,
      margin: margin,
      contentPadding: contentPadding,
      iconPadding: iconPadding,
      bannerPadding: bannerPadding,
      titleTextStyle: titleTextStyle,
      descriptionTextStyle: descriptionTextStyle,
    );
  }
}

enum BannerState { informational, warning, error, success }

class VBanner extends StatelessWidget {
  VBanner({
    Key? key,
    this.bannerState = BannerState.informational,
    this.backgroundColor,
    this.bannerIcon,
    this.bannerHighlight,
    this.hasClose = false,
    this.onClosePressed,
    this.onActionPressed,
    this.onLinkPressed,
    this.visible = false,
    this.hasTitle = false,
    this.title = "",
    this.hasLink = false,
    this.link = "",
    this.hasAction = false,
    this.action = "Action",
    this.style,
    required this.description,
    this.vExt,
  }) : super(key: key);

  final String title, description, action, link;
  final BannerState bannerState;
  Color? backgroundColor, bannerHighlight;
  final bool visible, hasAction, hasTitle, hasLink, hasClose;
  Widget? bannerIcon;
  final VoidCallback? onClosePressed, onActionPressed, onLinkPressed;
  final VBannerStyle? style;
  final VExt? vExt;

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (vExt == null || vExt is VDef) {
      defaultStyle = getDefaultColorScheme()!;
    } else {
      defaultStyle = getAltColorScheme()!;
    }

    final messageStyle = getMessageColorScheme()!;
    final infoBGColor = style?.infoBGColor ?? messageStyle.infoSurface;
    final infoIconColor = style?.infoIconColor ?? messageStyle.infoText;
    final infoHLColor = style?.infoHLColor ?? messageStyle.infoGraphics;
    final warningBGColor = style?.warningBGColor ?? messageStyle.warningSurface;
    final warningIconColor =
        style?.warningIconColor ?? messageStyle.warningText;
    final warningHLColor =
        style?.warningHLColor ?? messageStyle.warningGraphics;
    final errorBGColor = style?.errorBGColor ?? messageStyle.negativeSurface;
    final errorIconColor = style?.errorIconColor ?? messageStyle.negativeText;
    final errorHLColor = style?.errorHLColor ?? messageStyle.negativeGraphics;
    final successBGColor =
        style?.successBGColor ?? messageStyle.positiveSurface;
    final successIconColor =
        style?.successIconColor ?? messageStyle.positiveText;
    final successHLColor =
        style?.successHLColor ?? messageStyle.positiveGraphics;
    final boxShadowColor =
        style?.boxShadowColor ?? defaultStyle.vBannerProperties?.boxShadowColor;
    final borderRadius =
        style?.borderRadius ?? defaultStyle.vBannerProperties?.borderRadius;
    final boxShadowSpreadRadius = style?.boxShadowSpreadRadius ??
        defaultStyle.vBannerProperties?.boxShadowSpreadRadius;
    final boxShadowBlurRadius = style?.boxShadowBlurRadius ??
        defaultStyle.vBannerProperties?.boxShadowBlurRadius;
    final boxShadowOffset = style?.boxShadowOffset ??
        defaultStyle.vBannerProperties?.boxShadowOffset;
    final margin = style?.margin ?? defaultStyle.vBannerProperties?.margin;
    final contentPadding =
        style?.contentPadding ?? defaultStyle.vBannerProperties?.contentPadding;
    final iconPadding =
        style?.iconPadding ?? defaultStyle.vBannerProperties?.iconPadding;
    final bannerPadding =
        style?.bannerPadding ?? defaultStyle.vBannerProperties?.bannerPadding;
    final titleTextStyle =
        style?.titleTextStyle ?? defaultStyle.vBannerProperties?.titleTextStyle;
    final descriptionTextStyle = style?.descriptionTextStyle ??
        defaultStyle.vBannerProperties?.descriptionTextStyle;

    TextScaler textScaler = MediaQuery.textScalerOf(context);
    final scaledIconSize = textScaler.scale(24);

    switch (bannerState) {
      case BannerState.informational:
        backgroundColor = infoBGColor;
        bannerIcon = VIcon(
          svgIcon: VIcons.informationLow,
          iconHeight: scaledIconSize,
          iconWidth: scaledIconSize,
          iconColor: infoIconColor,
        );
        bannerHighlight = infoHLColor;
        break;
      case BannerState.warning:
        backgroundColor = warningBGColor;
        bannerIcon = VIcon(
          svgIcon: VIcons.warningLow,
          iconHeight: scaledIconSize,
          iconWidth: scaledIconSize,
          iconColor: warningIconColor,
        );
        bannerHighlight = warningHLColor;
        break;
      case BannerState.error:
        backgroundColor = errorBGColor;
        bannerIcon = VIcon(
          svgIcon: VIcons.errorLow,
          iconHeight: scaledIconSize,
          iconWidth: scaledIconSize,
          iconColor: errorIconColor,
        );
        bannerHighlight = errorHLColor;
        break;
      case BannerState.success:
        backgroundColor = successBGColor;
        bannerIcon = VIcon(
          svgIcon: VIcons.successLow,
          iconHeight: scaledIconSize,
          iconWidth: scaledIconSize,
          iconColor: successIconColor,
        );
        bannerHighlight = successHLColor;
        break;
    }

    FontWeight getFirstLineStyle(bool hasTitle) {
      return hasTitle ? VFontWeight.semiBold : VFontWeight.regular;
    }

    return Visibility(
      visible: visible,
      child: Semantics(
        onDidGainAccessibilityFocus: () {
          SemanticsService.announce(
            hasTitle ? "$title$description" : description,
            TextDirection.ltr,
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: margin,
              padding: bannerPadding,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: boxShadowColor,
                      spreadRadius: boxShadowSpreadRadius,
                      blurRadius: boxShadowBlurRadius,
                      offset: boxShadowOffset, // changes position of shadow
                    ),
                  ],
                  color: backgroundColor,
                  border: Border(
                      bottom: BorderSide(color: bannerHighlight!, width: 3))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: iconPadding,
                      child: bannerIcon!,
                    ),
                  ),
                  Expanded(
                    flex: hasClose ? 6 : 10,
                    child: Padding(
                      padding: contentPadding,
                      child: Semantics(
                        // Force the semantics order of this part to become higher priority than close button
                        sortKey: const OrdinalSortKey(1.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hasTitle ? title : description,
                              style: titleTextStyle.copyWith(
                                fontWeight: getFirstLineStyle(hasTitle),
                              ),
                            ),
                            if (hasTitle)
                              Text(
                                description,
                                style: descriptionTextStyle,
                              ),
                            if (hasLink)
                              VLink(
                                  linkFontSize: 16,
                                  linkFontWeight: VFontWeight.medium,
                                  // Making touchArea 12.5 to meet a11y requirement
                                  touchArea: 12.5,
                                  title: link,
                                  isUnderlined: true,
                                  onPressed: onLinkPressed),
                            if (hasAction) ...[
                              const SizedBox(
                                height: 10,
                              ),
                              VButton(
                                style: VButtonStyle(
                                  backgroundColorActive: VColors.transparent,
                                  backgroundColorDisabled: VColors.transparent,
                                  foregroundColorActive: VColors.defaultActive,
                                  foregroundColorDisabled: VColors.disabled,
                                  overlayColorFocused:
                                      VColors.defaultSurfaceLowlight,
                                  overlayColorPressed:
                                      VColors.defaultSurfaceLowlight,
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
                                  style: defaultVTheme.textStyles.buttonMedium
                                      .copyWith(color: VColors.defaultActive),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (hasClose)
                    Expanded(
                      child: Semantics(
                        hint: "Close ${getBannerState(bannerState)}",
                        button: true,
                        child: Material(
                          color: backgroundColor,
                          child: InkWell(
                            highlightColor: VColors.transparent,
                            customBorder: const CircleBorder(),
                            splashColor: VColors.defaultSurfaceLowlight,
                            onTap: onClosePressed,
                            child: Container(
                              width: 48,
                              height: 48,
                              padding:
                                  const EdgeInsets.fromLTRB(16, 16, 16, 16),
                              child: VIcon(
                                svgIcon: VIcons.closeTiny,
                                iconColor: VColors.defaultActiveSubtle
                                    .withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String getBannerState(bannerState) {
  if (bannerState == BannerState.informational) {
    return "informational banner";
  }
  if (bannerState == BannerState.warning) {
    return "warning banner";
  }
  if (bannerState == BannerState.error) {
    return "error banner";
  }
  if (bannerState == BannerState.success) {
    return "success banner";
  }
  return "";
}
