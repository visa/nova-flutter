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
// Visa Section Message
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// VSectionMessageStyle using ThemeExtension
class VSectionMessageStyle extends ThemeExtension<VSectionMessageStyle> {
  const VSectionMessageStyle({
    this.normalColor,
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
    this.subtleBGColor,
    this.subtleHLColor,
    this.subtleIconColor,
    this.borderColor,
  });

  final Color? borderColor,
      normalColor,
      infoBGColor,
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
      subtleBGColor,
      subtleHLColor,
      subtleIconColor;

  @override
  VSectionMessageStyle copyWith({
    Color? normalColor,
    infoBGColor,
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
    subtleBGColor,
    subtleHLColor,
    subtleIconColor,
    borderColor,
  }) =>
      VSectionMessageStyle(
        normalColor: normalColor ?? this.normalColor,
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
        subtleBGColor: subtleBGColor ?? this.subtleBGColor,
        subtleHLColor: subtleHLColor ?? this.subtleHLColor,
        subtleIconColor: subtleIconColor ?? this.subtleIconColor,
        borderColor: borderColor ?? this.borderColor,
      );

  @override
  VSectionMessageStyle lerp(
      ThemeExtension<VSectionMessageStyle>? other, double t) {
    if (other is! VSectionMessageStyle) {
      return this;
    }

    return VSectionMessageStyle(
      normalColor: Color.lerp(normalColor, other.normalColor, t),
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
      subtleBGColor: Color.lerp(subtleBGColor, other.subtleBGColor, t),
      subtleHLColor: Color.lerp(subtleHLColor, other.subtleHLColor, t),
      subtleIconColor: Color.lerp(subtleIconColor, other.subtleIconColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
    );
  }
}

enum SectionMessageState {
  informational,
  warning,
  error,
  success,
  subtle,
}

class VSectionMessage extends StatelessWidget {
  const VSectionMessage({
    Key? key,
    this.sectionMessageState = SectionMessageState.informational,
    this.hasClose = false,
    this.onClosePressed,
    this.visible = false,
    this.semanticsCloseLabel = close,
    this.closeIconButton = closeIcon,
    this.hasTitle = false,
    this.title = "Title",
    required this.description,
    this.hasAction = false,
    this.action = "Action",
    this.onActionPressed,
    this.hasLink = false,
    this.link = "",
    this.onLinkPressed,
    this.buttonMainAxisAlignment,
    this.subtleSectionMessageIcon,
    this.infoSectionMessageIcon,
    this.warningSectionMessageIcon,
    this.errorSectionMessageIcon,
    this.successSectionMessageIcon,
    this.style,
  }) : super(key: key);

  final String title,
      description,
      action,
      semanticsCloseLabel,
      closeIconButton,
      link;
  final SectionMessageState sectionMessageState;
  final VoidCallback? onClosePressed, onActionPressed, onLinkPressed;
  final bool visible, hasClose, hasTitle, hasAction, hasLink;
  final MainAxisAlignment? buttonMainAxisAlignment;
  final Widget? subtleSectionMessageIcon,
      infoSectionMessageIcon,
      warningSectionMessageIcon,
      errorSectionMessageIcon,
      successSectionMessageIcon;
  final VSectionMessageStyle? style;

  TextStyle getFirstLineStyle(bool hasTitle) {
    return defaultVTheme.textStyles.bodyText2.copyWith(
        fontWeight: hasTitle ? VFontWeight.semiBold : null, height: 1.5);
  }

  @override
  Widget build(BuildContext context) {
    final messageStyle = getMessageColorScheme()!;
    final normalColor = style?.normalColor ?? messageStyle.normalColor;
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
    final subtleBGColor = style?.subtleBGColor ?? messageStyle.surface2;
    final subtleHLColor = style?.subtleBGColor ?? messageStyle.surface2;
    final subtleIconColor = style?.subtleIconColor ?? messageStyle.subtleText;
    final borderColor = style?.borderColor ?? messageStyle.transparent;

    Color? getSectionMessageBackgroundColor(sectionMessageState) {
      if (sectionMessageState == SectionMessageState.informational) {
        return infoBGColor;
      } else if (sectionMessageState == SectionMessageState.warning) {
        return warningBGColor;
      } else if (sectionMessageState == SectionMessageState.error) {
        return errorBGColor;
      } else if (sectionMessageState == SectionMessageState.success) {
        return successBGColor;
      } else if (sectionMessageState == SectionMessageState.subtle) {
        return subtleBGColor;
      } else {
        return normalColor;
      }
    }

    Color? getSectionMessageHighlightColor(sectionMessageState) {
      if (sectionMessageState == SectionMessageState.informational) {
        return infoHLColor;
      } else if (sectionMessageState == SectionMessageState.warning) {
        return warningHLColor;
      } else if (sectionMessageState == SectionMessageState.error) {
        return errorHLColor;
      } else if (sectionMessageState == SectionMessageState.success) {
        return successHLColor;
      } else if (sectionMessageState == SectionMessageState.subtle) {
        return subtleHLColor;
      } else {
        return normalColor;
      }
    }

    Widget? getSectionMessageIcon(sectionMessageState) {
      if (sectionMessageState == SectionMessageState.informational) {
        return infoSectionMessageIcon ??
            VIcon(
              svgIcon: VIcons.informationLow,
              iconHeight: 24,
              iconWidth: 24,
              iconColor: infoIconColor,
            );
      } else if (sectionMessageState == SectionMessageState.warning) {
        return warningSectionMessageIcon ??
            VIcon(
              svgIcon: VIcons.warningLow,
              iconHeight: 24,
              iconWidth: 24,
              iconColor: warningIconColor,
            );
      } else if (sectionMessageState == SectionMessageState.error) {
        return errorSectionMessageIcon ??
            VIcon(
              svgIcon: VIcons.errorLow,
              iconHeight: 24,
              iconWidth: 24,
              iconColor: errorIconColor,
            );
      } else if (sectionMessageState == SectionMessageState.success) {
        return successSectionMessageIcon ??
            VIcon(
              svgIcon: VIcons.successLow,
              iconHeight: 24,
              iconWidth: 24,
              iconColor: successIconColor,
            );
      } else if (sectionMessageState == SectionMessageState.subtle) {
        return subtleSectionMessageIcon ??
            VIcon(
              svgIcon: VIcons.ideaLow,
              iconHeight: 24,
              iconWidth: 24,
              iconColor: subtleIconColor,
            );
      }
      return null;
    }

    return Visibility(
      visible: visible,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor ?? VColors.transparent,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: getSectionMessageBackgroundColor(sectionMessageState),
            border: Border(
              bottom: BorderSide(
                color: getSectionMessageHighlightColor(sectionMessageState)!,
                width: 3,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: getSectionMessageIcon(sectionMessageState)!,
              ),
              Expanded(
                flex: hasClose ? 8 : 10,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Semantics(
                        // Force the semantics focus come to this part when triggered (banner becomes visible)
                        focused: true,
                        // Force the semantics order of this part to become higher priority than close button
                        sortKey: const OrdinalSortKey(1.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hasTitle ? title : description,
                              style: getFirstLineStyle(hasTitle),
                            ),
                            if (hasTitle)
                              Text(
                                description,
                                style: defaultVTheme.textStyles.bodyText2
                                    .copyWith(height: 1.5),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: hasAction || hasLink ? 10 : 0,
                      ),
                      Row(
                        mainAxisAlignment:
                            buttonMainAxisAlignment ?? MainAxisAlignment.start,
                        children: [
                          if (hasAction) ...[
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
                                    .copyWith(
                                  color: VColors.defaultActive,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: hasAction && hasLink ? 20 : 0,
                            ),
                          ],
                          if (hasLink)
                            VLink(
                                linkFontSize: 16,
                                linkFontWeight: VFontWeight.medium,
                                // Making touchArea 12.5 to meet a11y requirement
                                touchArea: 12.5,
                                title: link,
                                isUnderlined: true,
                                onPressed: onLinkPressed),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (hasClose)
                Expanded(
                  child: Material(
                    child: Ink(
                      color:
                          getSectionMessageBackgroundColor(sectionMessageState),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                        child: Semantics(
                          label: close,
                          child: InkWell(
                            highlightColor: VColors.transparent,
                            customBorder: const CircleBorder(),
                            splashColor: VColors.defaultSurfaceLowlight,
                            onTap: onClosePressed,
                            child: VIcon(
                              svgIcon: VIcons.closeTiny,
                              iconColor:
                                  VColors.defaultActiveSubtle.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
