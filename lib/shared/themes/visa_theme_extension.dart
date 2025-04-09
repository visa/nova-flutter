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
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

class VAccordionProperties {
  VAccordionProperties({
    this.headerBoldTextStyle,
    this.headerSubtleTextStyle,
    this.bodyTextStyle,
    this.headerTextStyle,
    this.headerBorderRadius = 8,
    this.subtleBorderRadius = 8,
    this.borderRadius = 8,
  });
  final TextStyle? headerBoldTextStyle,
      headerTextStyle, // @TODO unused; remove on major release
      bodyTextStyle; // @TODO unused; remove on major release;
  final TextStyle? headerSubtleTextStyle;
  final double? headerBorderRadius, subtleBorderRadius, borderRadius;
}

class VAppBarProperties {
  VAppBarProperties({
    this.elevation = 1.0,
    this.buttonOpacity = 1.0,
    this.borderRadius = 0.0,
    this.titleTextStyle,
  });
  final double elevation;
  final double buttonOpacity;
  final double borderRadius;
  TextStyle? titleTextStyle;
}

class VAvatarProperties {
  VAvatarProperties({
    this.radius = 20.0,
    this.borderRadius = 100.0,
  });
  final double radius;
  final double borderRadius;
}

class VBannerProperties {
  VBannerProperties({
    this.borderRadius = 0.0,
    this.boxShadowSpreadRadius = 0.0,
    this.boxShadowBlurRadius = 0.0,
    this.boxShadowOffset = const Offset(0, 0),
    this.margin = const EdgeInsets.all(0),
    this.contentPadding = const EdgeInsets.fromLTRB(10, 15, 0, 0),
    this.iconPadding = const EdgeInsets.fromLTRB(0, 15, 0, 0),
    this.bannerPadding = const EdgeInsets.fromLTRB(24, 0, 24, 15),
    this.titleTextStyle,
    this.descriptionTextStyle,
    Color? boxShadowColor,
  }) : boxShadowColor =
            boxShadowColor ?? VColors.defaultSubtle.withOpacity(0.3);

  final double borderRadius;
  final double boxShadowSpreadRadius;
  final double boxShadowBlurRadius;
  final Offset boxShadowOffset;
  final EdgeInsets margin;
  final Color boxShadowColor;
  final EdgeInsets contentPadding;
  final EdgeInsets iconPadding;
  final EdgeInsets bannerPadding;
  final TextStyle? titleTextStyle;
  final TextStyle? descriptionTextStyle;
}

class VBottomNavBarProperties {
  VBottomNavBarProperties({
    this.selectedFontSize,
    this.unselectedFontSize,
    this.selectedIconHeight,
    this.selectedIconWidth,
    this.unselectedIconHeight,
    this.unselectedIconWidth,
  });
  final double? selectedFontSize,
      unselectedFontSize,
      selectedIconHeight,
      selectedIconWidth,
      unselectedIconHeight,
      unselectedIconWidth;
}

class VButtonProperties {
  VButtonProperties({
    this.elevation = 0.0,
    this.minimumSize = const Size(0, 46),
    this.buttonTextStyle,
    this.borderRadiusActive = 8.0,
    this.borderRadiusDisabled = 8.0,
    this.borderSideActive = BorderSide.none,
    this.borderSideDisabled = BorderSide.none,
    this.padding = const EdgeInsets.all(8.0),
  });
  final double? elevation;
  final Size? minimumSize;
  final TextStyle? buttonTextStyle;
  final double? borderRadiusActive;
  final double? borderRadiusDisabled;
  final BorderSide? borderSideActive;
  final BorderSide? borderSideDisabled;
  final EdgeInsetsGeometry? padding;
}

class VChipsRemovableProperties {
  VChipsRemovableProperties({
    this.chipLabelTextStyle,
    this.standardBorderRadius = 40.0,
    this.compactBorderRadius = 6.0,
    this.elevation = 0,
    this.pressedElevation = 0,
  });
  final TextStyle? chipLabelTextStyle;
  final double? standardBorderRadius,
      compactBorderRadius,
      elevation,
      pressedElevation;
}

class VChipsSelectionProperties {
  VChipsSelectionProperties({
    this.chipLabelTextStyle,
    this.borderRadius = 22.0,
    this.elevation = 0,
    this.pressedElevation = 0,
  });
  final TextStyle? chipLabelTextStyle;
  final double? borderRadius, elevation, pressedElevation;
}

class VComboboxProperties {
  VComboboxProperties({
    this.errorTextStyle,
    this.resultTextStyle,
  });
  final TextStyle? errorTextStyle, resultTextStyle;
}

class VContentCardProperties {
  VContentCardProperties({
    this.borderRadius = 13.0,
    this.elevation = 0.0,
  });
  double? borderRadius, elevation;
}

class VDividerProperties {
  VDividerProperties({
    this.height,
    this.endIndent,
    this.indent,
    this.thickness = 1.0,
  });
  final double? height, thickness, indent, endIndent;
}

class VDropdownIconProperties {
  VDropdownIconProperties({
    this.dropdownBorderRadius = 8.0,
    this.dropdownTextStyle,
    this.bigIconSize = 72.0,
    this.defaultIconSize = 46.0,
  });
  double? dropdownBorderRadius, bigIconSize, defaultIconSize;
  final TextStyle? dropdownTextStyle;
}

class VDropdownTextProperties {
  VDropdownTextProperties({
    this.dropdownBorderRadius = 8.0,
    this.borderRadius = 8.0,
    this.bigButtonSize = 58.0,
    this.defaultButtonSize = 46.0,
    this.dropdownTextStyle,
    this.bigIconTextStyle,
    this.smallIconTextStyle,
  });
  double? borderRadius, dropdownBorderRadius, bigButtonSize, defaultButtonSize;
  final TextStyle? dropdownTextStyle, bigIconTextStyle, smallIconTextStyle;
}

class VFlagProperties {
  VFlagProperties({
    this.titleTextStyle,
    this.descriptionTextStyle,
    this.linkTextStyle,
    this.closeIconPadding = const EdgeInsets.all(14),
    this.linkStyle = const VButtonStyle(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      backgroundColorActive: VColors.transparent,
      overlayColorPressed: Color(0x99B3D7FF),
    ),
  });
  final TextStyle? linkTextStyle, titleTextStyle, descriptionTextStyle;
  final EdgeInsetsGeometry? closeIconPadding;
  final VButtonStyle? linkStyle;
}

class VInputProperties {
  VInputProperties({
    this.trackRadius = 7.0,
    this.borderRadius = 8.0,
    this.inputContainerHeight = 46.0,
    this.topLabelTextStyle,
    this.inputTextStyle,
    this.errorTextStyle,
    this.counterTextStyle,
    this.validateErrorTextStyle,
    this.hintTextStyle,
  });
  double? borderRadius, trackRadius, inputContainerHeight;
  final TextStyle? topLabelTextStyle,
      inputTextStyle,
      errorTextStyle,
      counterTextStyle,
      validateErrorTextStyle,
      hintTextStyle;
}

class VLinkProperties {
  VLinkProperties({this.titleTextStyle});
  TextStyle? titleTextStyle;
}

class VListItemProperties {
  VListItemProperties({
    this.borderRadius = 0.0,
  });
  double? borderRadius;
}

class VNavDrawerProperties {
  VNavDrawerProperties({
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.borderRadius = 0.0,
  });
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final double? borderRadius;
}

class VPanelProperties {
  VPanelProperties({
    this.titleTextStyle,
    this.borderRadius = 0.0,
  });
  final TextStyle? titleTextStyle;
  final double? borderRadius;
}

class VProgressProperties {
  VProgressProperties({
    this.circularLabelTextStyle,
    this.linearRadius = 4.0,
    this.circularSize = 70.0,
  });
  final TextStyle? circularLabelTextStyle;
  final double? linearRadius;
  final double? circularSize;
}

class VSelectProperties {
  VSelectProperties({
    this.buttonHeight = 46.0,
    this.borderRadius = 8.0,
    this.dropDownElevation = 8.0,
    this.dropDownBorderRadius = 8.0,
    this.headerTextStyle,
    this.labelTextStyle,
    this.validateTextStyle,
    this.buttonWidth,
    this.dropdownWidth,
  });
  final double? buttonHeight,
      borderRadius,
      dropDownElevation,
      dropDownBorderRadius,
      buttonWidth,
      dropdownWidth;
  final TextStyle? headerTextStyle, labelTextStyle, validateTextStyle;
}

class VTabBarProperties {
  VTabBarProperties({
    this.indicatorWeight = 2.0,
    this.labelStyle,
    this.unselectedLabelStyle,
  });
  final double? indicatorWeight;
  final TextStyle? labelStyle, unselectedLabelStyle;
}

class VToggleProperties {
  VToggleProperties({
    this.borderRadius = 8,
    this.height = 46,
    this.minimumWidth = 50,
  });

  final double? borderRadius, height, minimumWidth;
}

class VWizardProperties {
  VWizardProperties({
    this.borderRadius = 20,
    this.numberTextStyle,
  });

  final double? borderRadius;
  final TextStyle? numberTextStyle;
}

@immutable
class VDefaultThemeProps extends ThemeExtension<VDefaultThemeProps> {
  const VDefaultThemeProps({
    // VTheme
    this.vAccordionProperties,
    this.vAppBarProperties,
    this.vAvatarProperties,
    this.vBannerProperties,
    this.vBottomNavBarProperties,
    this.vButtonProperties,
    this.vChipsRemovableProperties,
    this.vChipsSelectionProperties,
    this.vComboboxProperties,
    this.vContentCardProperties,
    this.vDividerProperties,
    this.vDropdownIconProperties,
    this.vDropdownTextProperties,
    this.vFlagProperties,
    this.vInputProperties,
    this.vLinkProperties,
    this.vListItemProperties,
    this.vNavDrawerProperties,
    this.vPanelProperties,
    this.vProgressProperties,
    this.vSelectProperties,
    this.vTabBarProperties,
    this.vToggleProperties,
    this.vWizardProperties,
    this.active,
    this.activeHover,
    this.activePressed,
    this.subtle,
    this.activeSubtle,
    this.surface1,
    this.surface2,
    this.surface3,
    this.surfaceHighlight,
    this.surfaceLowlight,
    this.text,
    this.textSubtle,
    this.onActive,
    this.border,
    this.disabled,
    this.accent,
    this.overlay,
    this.transparent,
  });

  // VTheme
  final VAccordionProperties? vAccordionProperties;
  final VAppBarProperties? vAppBarProperties;
  final VAvatarProperties? vAvatarProperties;
  final VBannerProperties? vBannerProperties;
  final VBottomNavBarProperties? vBottomNavBarProperties;
  final VButtonProperties? vButtonProperties;
  final VChipsRemovableProperties? vChipsRemovableProperties;
  final VChipsSelectionProperties? vChipsSelectionProperties;
  final VComboboxProperties? vComboboxProperties;
  final VContentCardProperties? vContentCardProperties;
  final VDividerProperties? vDividerProperties;
  final VDropdownIconProperties? vDropdownIconProperties;
  final VDropdownTextProperties? vDropdownTextProperties;
  final VFlagProperties? vFlagProperties;
  final VInputProperties? vInputProperties;
  final VLinkProperties? vLinkProperties;
  final VListItemProperties? vListItemProperties;
  final VNavDrawerProperties? vNavDrawerProperties;
  final VPanelProperties? vPanelProperties;
  final VProgressProperties? vProgressProperties;
  final VSelectProperties? vSelectProperties;
  final VTabBarProperties? vTabBarProperties;
  final VToggleProperties? vToggleProperties;
  final VWizardProperties? vWizardProperties;
  final Color? active;
  final Color? activeHover;
  final Color? activePressed;
  final Color? subtle;
  final Color? activeSubtle;
  final Color? surface1;
  final Color? surface2;
  final Color? surface3;
  final Color? surfaceHighlight;
  final Color? surfaceLowlight;
  final Color? text;
  final Color? textSubtle;
  final Color? onActive;
  final Color? border;
  final Color? disabled;
  final Color? accent;
  final Color? overlay;
  final Color? transparent;

  @override
  ThemeExtension<VDefaultThemeProps> copyWith({
    // VTheme
    VAccordionProperties? vAccordionProperties,
    VAppBarProperties? vAppBarProperties,
    VAvatarProperties? vAvatarProperties,
    VBannerProperties? vBannerProperties,
    VBottomNavBarProperties? vBottomNavBarProperties,
    VButtonProperties? vButtonProperties,
    VChipsRemovableProperties? vChipsRemovableProperties,
    VChipsSelectionProperties? vChipsSelectionProperties,
    VComboboxProperties? vComboboxProperties,
    VContentCardProperties? vContentCardProperties,
    VDividerProperties? vDividerProperties,
    VDropdownIconProperties? vDropdownIconProperties,
    VDropdownTextProperties? vDropdownTextProperties,
    VFlagProperties? vFlagProperties,
    VInputProperties? vInputProperties,
    VLinkProperties? vLinkProperties,
    VListItemProperties? vListItemProperties,
    VNavDrawerProperties? vNavDrawerProperties,
    VPanelProperties? vPanelProperties,
    VProgressProperties? vProgressProperties,
    VSelectProperties? vSelectProperties,
    VTabBarProperties? vTabBarProperties,
    VToggleProperties? vToggleProperties,
    VWizardProperties? vWizardProperties,
    Color? active,
    Color? activeHover,
    Color? activePressed,
    Color? subtle,
    Color? activeSubtle,
    Color? surface1,
    Color? surface2,
    Color? surface3,
    Color? surfaceHighlight,
    Color? surfaceLowlight,
    Color? text,
    Color? textSubtle,
    Color? onActive,
    Color? border,
    Color? disabled,
    Color? accent,
    Color? overlay,
    Color? transparent,
  }) {
    return VDefaultThemeProps(
      // VTheme
      vAccordionProperties: vAccordionProperties ?? this.vAccordionProperties,
      vAppBarProperties: vAppBarProperties ?? this.vAppBarProperties,
      vAvatarProperties: vAvatarProperties ?? this.vAvatarProperties,
      vBannerProperties: vBannerProperties ?? this.vBannerProperties,
      vBottomNavBarProperties:
          vBottomNavBarProperties ?? this.vBottomNavBarProperties,
      vButtonProperties: vButtonProperties ?? this.vButtonProperties,
      vChipsRemovableProperties:
          vChipsRemovableProperties ?? this.vChipsRemovableProperties,
      vChipsSelectionProperties:
          vChipsSelectionProperties ?? this.vChipsSelectionProperties,
      vComboboxProperties: vComboboxProperties ?? this.vComboboxProperties,
      vContentCardProperties:
          vContentCardProperties ?? this.vContentCardProperties,
      vDividerProperties: vDividerProperties ?? this.vDividerProperties,
      vDropdownIconProperties:
          vDropdownIconProperties ?? this.vDropdownIconProperties,
      vDropdownTextProperties:
          vDropdownTextProperties ?? this.vDropdownTextProperties,
      vFlagProperties: vFlagProperties ?? this.vFlagProperties,
      vInputProperties: vInputProperties ?? this.vInputProperties,
      vLinkProperties: vLinkProperties ?? this.vLinkProperties,
      vListItemProperties: vListItemProperties ?? this.vListItemProperties,
      vNavDrawerProperties: vNavDrawerProperties ?? this.vNavDrawerProperties,
      vPanelProperties: vPanelProperties ?? this.vPanelProperties,
      vProgressProperties: vProgressProperties ?? this.vProgressProperties,
      vSelectProperties: vSelectProperties ?? this.vSelectProperties,
      vTabBarProperties: vTabBarProperties ?? this.vTabBarProperties,
      vToggleProperties: vToggleProperties ?? this.vToggleProperties,
      vWizardProperties: vWizardProperties ?? this.vWizardProperties,
      active: active ?? this.active,
      activeHover: activeHover ?? this.activeHover,
      activePressed: activePressed ?? this.activePressed,
      subtle: subtle ?? this.subtle,
      activeSubtle: activeSubtle ?? this.activeSubtle,
      surface1: surface1 ?? this.surface1,
      surface2: surface2 ?? this.surface2,
      surface3: surface3 ?? this.surface3,
      surfaceHighlight: surfaceHighlight ?? this.surfaceHighlight,
      surfaceLowlight: surfaceLowlight ?? this.surfaceLowlight,
      text: text ?? this.text,
      textSubtle: textSubtle ?? this.textSubtle,
      onActive: onActive ?? this.onActive,
      border: border ?? this.border,
      disabled: disabled ?? this.disabled,
      accent: accent ?? this.accent,
      overlay: overlay ?? this.overlay,
      transparent: transparent ?? this.transparent,
    );
  }

  @override
  ThemeExtension<VDefaultThemeProps> lerp(
      ThemeExtension<VDefaultThemeProps>? other, double t) {
    if (other is! VDefaultThemeProps) {
      return this;
    }
    return VDefaultThemeProps(
      // VTheme
      active: Color.lerp(active, other.active, t),
      activeHover: Color.lerp(activeHover, other.activeHover, t),
      activePressed: Color.lerp(activePressed, other.activePressed, t),
      subtle: Color.lerp(subtle, other.subtle, t),
      activeSubtle: Color.lerp(activeSubtle, other.activeSubtle, t),
      surface1: Color.lerp(surface1, other.surface1, t),
      surface2: Color.lerp(surface2, other.surface2, t),
      surface3: Color.lerp(surface3, other.surface3, t),
      surfaceHighlight: Color.lerp(surfaceHighlight, other.surfaceHighlight, t),
      surfaceLowlight: Color.lerp(surfaceLowlight, other.surfaceLowlight, t),
      text: Color.lerp(text, other.text, t),
      textSubtle: Color.lerp(textSubtle, other.textSubtle, t),
      onActive: Color.lerp(onActive, other.onActive, t),
      border: Color.lerp(border, other.border, t),
      disabled: Color.lerp(disabled, other.disabled, t),
      accent: Color.lerp(accent, other.accent, t),
      overlay: Color.lerp(overlay, other.overlay, t),
      transparent: Color.lerp(transparent, other.transparent, t),
      vAccordionProperties: vAccordionProperties,
      vAppBarProperties: vAppBarProperties,
      vAvatarProperties: vAvatarProperties,
      vBannerProperties: vBannerProperties,
      vBottomNavBarProperties: vBottomNavBarProperties,
      vButtonProperties: vButtonProperties,
      vChipsRemovableProperties: vChipsRemovableProperties,
      vChipsSelectionProperties: vChipsSelectionProperties,
      vComboboxProperties: vComboboxProperties,
      vContentCardProperties: vContentCardProperties,
      vDividerProperties: vDividerProperties,
      vDropdownIconProperties: vDropdownIconProperties,
      vDropdownTextProperties: vDropdownTextProperties,
      vFlagProperties: vFlagProperties,
      vInputProperties: vInputProperties,
      vLinkProperties: vLinkProperties,
      vListItemProperties: vListItemProperties,
      vNavDrawerProperties: vNavDrawerProperties,
      vPanelProperties: vPanelProperties,
      vProgressProperties: vProgressProperties,
      vSelectProperties: vSelectProperties,
      vTabBarProperties: vTabBarProperties,
      vToggleProperties: vToggleProperties,
      vWizardProperties: vWizardProperties,
    );
  }
}

@immutable
class VAltThemeProps extends ThemeExtension<VAltThemeProps> {
  const VAltThemeProps({
    // VTheme
    this.vAccordionProperties,
    this.vAppBarProperties,
    this.vAvatarProperties,
    this.vBannerProperties,
    this.vBottomNavBarProperties,
    this.vButtonProperties,
    this.vChipsRemovableProperties,
    this.vChipsSelectionProperties,
    this.vComboboxProperties,
    this.vContentCardProperties,
    this.vDividerProperties,
    this.vDropdownIconProperties,
    this.vDropdownTextProperties,
    this.vFlagProperties,
    this.vInputProperties,
    this.vLinkProperties,
    this.vListItemProperties,
    this.vNavDrawerProperties,
    this.vPanelProperties,
    this.vProgressProperties,
    this.vSelectProperties,
    this.vTabBarProperties,
    this.vToggleProperties,
    this.vWizardProperties,
    this.active,
    this.activeHover,
    this.activePressed,
    this.subtle,
    this.activeSubtle,
    this.surface1,
    this.surface2,
    this.surface3,
    this.surfaceHighlight,
    this.surfaceLowlight,
    this.text,
    this.textSubtle,
    this.onActive,
    this.border,
    this.disabled,
    this.accent,
    this.overlay,
    this.transparent,
  });
  // VTheme
  final VAccordionProperties? vAccordionProperties;
  final VAppBarProperties? vAppBarProperties;
  final VAvatarProperties? vAvatarProperties;
  final VBannerProperties? vBannerProperties;
  final VBottomNavBarProperties? vBottomNavBarProperties;
  final VButtonProperties? vButtonProperties;
  final VChipsRemovableProperties? vChipsRemovableProperties;
  final VChipsSelectionProperties? vChipsSelectionProperties;
  final VComboboxProperties? vComboboxProperties;
  final VContentCardProperties? vContentCardProperties;
  final VDividerProperties? vDividerProperties;
  final VDropdownIconProperties? vDropdownIconProperties;
  final VDropdownTextProperties? vDropdownTextProperties;
  final VFlagProperties? vFlagProperties;
  final VInputProperties? vInputProperties;
  final VLinkProperties? vLinkProperties;
  final VListItemProperties? vListItemProperties;
  final VNavDrawerProperties? vNavDrawerProperties;
  final VPanelProperties? vPanelProperties;
  final VProgressProperties? vProgressProperties;
  final VSelectProperties? vSelectProperties;
  final VTabBarProperties? vTabBarProperties;
  final VToggleProperties? vToggleProperties;
  final VWizardProperties? vWizardProperties;
  final Color? active;
  final Color? activeHover;
  final Color? activePressed;
  final Color? subtle;
  final Color? activeSubtle;
  final Color? surface1;
  final Color? surface2;
  final Color? surface3;
  final Color? surfaceHighlight;
  final Color? surfaceLowlight;
  final Color? text;
  final Color? textSubtle;
  final Color? onActive;
  final Color? border;
  final Color? disabled;
  final Color? accent;
  final Color? overlay;
  final Color? transparent;

  @override
  ThemeExtension<VAltThemeProps> copyWith({
    // VTheme
    VAccordionProperties? vAccordionProperties,
    VAppBarProperties? vAppBarProperties,
    VAvatarProperties? vAvatarProperties,
    VBannerProperties? vBannerProperties,
    VBottomNavBarProperties? vBottomNavBarProperties,
    VButtonProperties? vButtonProperties,
    VChipsRemovableProperties? vChipsRemovableProperties,
    VChipsSelectionProperties? vChipsSelectionProperties,
    VComboboxProperties? vComboboxProperties,
    VContentCardProperties? vContentCardProperties,
    VDividerProperties? vDividerProperties,
    VDropdownIconProperties? vDropdownIconProperties,
    VDropdownTextProperties? vDropdownTextProperties,
    VFlagProperties? vFlagProperties,
    VInputProperties? vInputProperties,
    VLinkProperties? vLinkProperties,
    VListItemProperties? vListItemProperties,
    VNavDrawerProperties? vNavDrawerProperties,
    VPanelProperties? vPanelProperties,
    VProgressProperties? vProgressProperties,
    VSelectProperties? vSelectProperties,
    VTabBarProperties? vTabBarProperties,
    VToggleProperties? vToggleProperties,
    VWizardProperties? vWizardProperties,
    Color? active,
    Color? activeHover,
    Color? activePressed,
    Color? subtle,
    Color? activeSubtle,
    Color? surface1,
    Color? surface2,
    Color? surface3,
    Color? surfaceHighlight,
    Color? surfaceLowlight,
    Color? text,
    Color? textSubtle,
    Color? onActive,
    Color? border,
    Color? disabled,
    Color? accent,
    Color? overlay,
    Color? transparent,
  }) {
    return VAltThemeProps(
      // VTheme
      vAccordionProperties: vAccordionProperties ?? this.vAccordionProperties,
      vAppBarProperties: vAppBarProperties ?? this.vAppBarProperties,
      vAvatarProperties: vAvatarProperties ?? this.vAvatarProperties,
      vBannerProperties: vBannerProperties ?? this.vBannerProperties,
      vBottomNavBarProperties:
          vBottomNavBarProperties ?? this.vBottomNavBarProperties,
      vButtonProperties: vButtonProperties ?? this.vButtonProperties,
      vChipsRemovableProperties:
          vChipsRemovableProperties ?? this.vChipsRemovableProperties,
      vChipsSelectionProperties:
          vChipsSelectionProperties ?? this.vChipsSelectionProperties,
      vComboboxProperties: vComboboxProperties ?? this.vComboboxProperties,
      vContentCardProperties:
          vContentCardProperties ?? this.vContentCardProperties,
      vDividerProperties: vDividerProperties ?? this.vDividerProperties,
      vDropdownIconProperties:
          vDropdownIconProperties ?? this.vDropdownIconProperties,
      vDropdownTextProperties:
          vDropdownTextProperties ?? this.vDropdownTextProperties,
      vFlagProperties: vFlagProperties ?? this.vFlagProperties,
      vInputProperties: vInputProperties ?? this.vInputProperties,
      vLinkProperties: vLinkProperties ?? this.vLinkProperties,
      vListItemProperties: vListItemProperties ?? this.vListItemProperties,
      vNavDrawerProperties: vNavDrawerProperties ?? this.vNavDrawerProperties,
      vPanelProperties: vPanelProperties ?? this.vPanelProperties,
      vProgressProperties: vProgressProperties ?? this.vProgressProperties,
      vSelectProperties: vSelectProperties ?? this.vSelectProperties,
      vTabBarProperties: vTabBarProperties ?? this.vTabBarProperties,
      vToggleProperties: vToggleProperties ?? this.vToggleProperties,
      vWizardProperties: vWizardProperties ?? this.vWizardProperties,
      active: active ?? this.active,
      activeHover: activeHover ?? this.activeHover,
      activePressed: activePressed ?? this.activePressed,
      subtle: subtle ?? this.subtle,
      activeSubtle: activeSubtle ?? this.activeSubtle,
      surface1: surface1 ?? this.surface1,
      surface2: surface2 ?? this.surface2,
      surface3: surface3 ?? this.surface3,
      surfaceHighlight: surfaceHighlight ?? this.surfaceHighlight,
      surfaceLowlight: surfaceLowlight ?? this.surfaceLowlight,
      text: text ?? this.text,
      textSubtle: textSubtle ?? this.textSubtle,
      onActive: onActive ?? this.onActive,
      border: border ?? this.border,
      disabled: disabled ?? this.disabled,
      accent: accent ?? this.accent,
      overlay: overlay ?? this.overlay,
      transparent: transparent ?? this.transparent,
    );
  }

  @override
  ThemeExtension<VAltThemeProps> lerp(
      ThemeExtension<VAltThemeProps>? other, double t) {
    if (other is! VAltThemeProps) {
      return this;
    }
    return VAltThemeProps(
      // VTheme
      active: Color.lerp(active, other.active, t),
      activeHover: Color.lerp(activeHover, other.activeHover, t),
      activePressed: Color.lerp(activePressed, other.activePressed, t),
      subtle: Color.lerp(subtle, other.subtle, t),
      activeSubtle: Color.lerp(activeSubtle, other.activeSubtle, t),
      surface1: Color.lerp(surface1, other.surface1, t),
      surface2: Color.lerp(surface2, other.surface2, t),
      surface3: Color.lerp(surface3, other.surface3, t),
      surfaceHighlight: Color.lerp(surfaceHighlight, other.surfaceHighlight, t),
      surfaceLowlight: Color.lerp(surfaceLowlight, other.surfaceLowlight, t),
      text: Color.lerp(text, other.text, t),
      textSubtle: Color.lerp(textSubtle, other.textSubtle, t),
      onActive: Color.lerp(onActive, other.onActive, t),
      border: Color.lerp(border, other.border, t),
      disabled: Color.lerp(disabled, other.disabled, t),
      accent: Color.lerp(accent, other.accent, t),
      overlay: Color.lerp(overlay, other.overlay, t),
      transparent: Color.lerp(transparent, other.transparent, t),
      vAccordionProperties: vAccordionProperties,
      vAppBarProperties: vAppBarProperties,
      vAvatarProperties: vAvatarProperties,
      vBannerProperties: vBannerProperties,
      vBottomNavBarProperties: vBottomNavBarProperties,
      vButtonProperties: vButtonProperties,
      vChipsRemovableProperties: vChipsRemovableProperties,
      vChipsSelectionProperties: vChipsSelectionProperties,
      vComboboxProperties: vComboboxProperties,
      vContentCardProperties: vContentCardProperties,
      vDividerProperties: vDividerProperties,
      vDropdownIconProperties: vDropdownIconProperties,
      vDropdownTextProperties: vDropdownTextProperties,
      vFlagProperties: vFlagProperties,
      vInputProperties: vInputProperties,
      vLinkProperties: vLinkProperties,
      vListItemProperties: vListItemProperties,
      vNavDrawerProperties: vNavDrawerProperties,
      vPanelProperties: vPanelProperties,
      vProgressProperties: vProgressProperties,
      vSelectProperties: vSelectProperties,
      vTabBarProperties: vTabBarProperties,
      vToggleProperties: vToggleProperties,
      vWizardProperties: vWizardProperties,
    );
  }
}

@immutable
class VMessageColorSet extends ThemeExtension<VMessageColorSet> {
  const VMessageColorSet({
    this.normalColor,
    this.positiveSurface,
    this.positiveGraphics,
    this.positiveText,
    this.warningSurface,
    this.warningGraphics,
    this.warningText,
    this.negativeSurfaceHighLight,
    this.negativeSurfaceLowLight,
    this.negativeSurface,
    this.negativeGraphics,
    this.negativeTextHover,
    this.negativeText,
    this.negativeTextPressed,
    this.infoSurface,
    this.infoGraphics,
    this.infoText,
    this.surface2,
    this.transparent,
    this.subtleText,
    this.defaultText,
  });

  final Color? normalColor;
  final Color? positiveSurface;
  final Color? positiveGraphics;
  final Color? positiveText;
  final Color? warningSurface;
  final Color? warningGraphics;
  final Color? warningText;
  final Color? negativeSurfaceHighLight;
  final Color? negativeSurfaceLowLight;
  final Color? negativeSurface;
  final Color? negativeGraphics;
  final Color? negativeTextHover;
  final Color? negativeText;
  final Color? negativeTextPressed;
  final Color? infoSurface;
  final Color? infoGraphics;
  final Color? infoText;
  final Color? transparent;
  final Color? subtleText;
  final Color? defaultText;
  final Color? surface2;

  @override
  ThemeExtension<VMessageColorSet> copyWith({
    Color? normalColor,
    Color? positiveSurface,
    Color? positiveGraphics,
    Color? positiveText,
    Color? warningSurface,
    Color? warningGraphics,
    Color? warningText,
    Color? negativeSurfaceHighLight,
    Color? negativeSurfaceLowLight,
    Color? negativeSurface,
    Color? negativeGraphics,
    Color? negativeTextHover,
    Color? negativeText,
    Color? negativeTextPressed,
    Color? infoSurface,
    Color? infoGraphics,
    Color? infoText,
    Color? transparent,
    Color? subtleText,
    Color? defaultText,
    Color? surface2,
  }) {
    return VMessageColorSet(
      normalColor: normalColor ?? this.normalColor,
      positiveSurface: positiveSurface ?? this.positiveSurface,
      positiveGraphics: positiveGraphics ?? this.positiveGraphics,
      positiveText: positiveText ?? this.positiveText,
      warningSurface: warningSurface ?? this.warningSurface,
      warningGraphics: warningGraphics ?? this.warningGraphics,
      warningText: warningText ?? this.warningText,
      negativeSurfaceHighLight:
          negativeSurfaceHighLight ?? this.negativeSurfaceHighLight,
      negativeSurfaceLowLight:
          negativeSurfaceLowLight ?? this.negativeSurfaceLowLight,
      negativeSurface: negativeSurface ?? this.negativeSurface,
      negativeGraphics: negativeGraphics ?? this.negativeGraphics,
      negativeTextHover: negativeTextHover ?? this.negativeTextHover,
      negativeText: negativeText ?? this.negativeText,
      negativeTextPressed: negativeTextPressed ?? this.negativeTextPressed,
      infoSurface: infoSurface ?? this.infoSurface,
      infoGraphics: infoGraphics ?? this.infoGraphics,
      infoText: infoText ?? this.infoText,
      transparent: transparent ?? this.transparent,
      subtleText: subtleText ?? this.subtleText,
      defaultText: defaultText ?? this.defaultText,
      surface2: surface2 ?? this.surface2,
    );
  }

  @override
  ThemeExtension<VMessageColorSet> lerp(
      ThemeExtension<VMessageColorSet>? other, double t) {
    if (other is! VMessageColorSet) {
      return this;
    }
    return VMessageColorSet(
      normalColor: Color.lerp(normalColor, other.normalColor, t),
      positiveSurface: Color.lerp(positiveSurface, other.positiveSurface, t),
      positiveGraphics: Color.lerp(positiveGraphics, other.positiveGraphics, t),
      positiveText: Color.lerp(positiveText, other.positiveText, t),
      warningSurface: Color.lerp(warningSurface, other.warningSurface, t),
      warningGraphics: Color.lerp(warningGraphics, other.warningGraphics, t),
      warningText: Color.lerp(warningText, other.warningText, t),
      negativeSurfaceHighLight: Color.lerp(
          negativeSurfaceHighLight, other.negativeSurfaceHighLight, t),
      negativeSurfaceLowLight:
          Color.lerp(negativeSurfaceLowLight, other.negativeSurfaceLowLight, t),
      negativeSurface: Color.lerp(negativeSurface, other.negativeSurface, t),
      negativeGraphics: Color.lerp(negativeGraphics, other.negativeGraphics, t),
      negativeTextHover:
          Color.lerp(negativeTextHover, other.negativeTextHover, t),
      negativeText: Color.lerp(negativeText, other.negativeText, t),
      negativeTextPressed:
          Color.lerp(negativeTextPressed, other.negativeTextPressed, t),
      infoSurface: Color.lerp(infoSurface, other.infoSurface, t),
      infoGraphics: Color.lerp(infoGraphics, other.infoGraphics, t),
      infoText: Color.lerp(infoText, other.infoText, t),
      transparent: Color.lerp(transparent, other.transparent, t),
      subtleText: Color.lerp(subtleText, other.subtleText, t),
      defaultText: Color.lerp(defaultText, other.defaultText, t),
      surface2: Color.lerp(surface2, other.surface2, t),
    );
  }
}
