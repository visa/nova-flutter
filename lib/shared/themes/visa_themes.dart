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

VTheme defaultVTheme =
    VTheme(fontFamily: "packages/visa_nova_flutter/VisaDialectUI");

getDefaultColorScheme() {
  final theme = getColorScheme(VDef.defaultColorScheme);
  return theme.extension<VDefaultThemeProps>();
}

getDefaultColorSchemeDark() {
  final theme = getColorScheme(VDef.defaultColorSchemeDark);
  return theme.extension<VDefaultThemeProps>();
}

getAltColorScheme() {
  final theme = getColorScheme(VAlt.altColorScheme);
  return theme.extension<VAltThemeProps>();
}

getAltColorSchemeDark() {
  final theme = getColorScheme(VAlt.altColorSchemeDark);
  return theme.extension<VAltThemeProps>();
}

VMessageColorSet? getMessageColorScheme() =>
    getColorScheme(messageColorScheme).extension<VMessageColorSet>();

abstract class VExt {}

class VDef extends VExt {
  void switchLightTheme(VDefaultThemeProps? themeData) {
    if (null == themeData) {
      defaultColorScheme = VDefaultThemeProps(
        active: VColors.defaultActive,
        activeHover: VColors.defaultActiveHover,
        activePressed: VColors.defaultActivePressed,
        subtle: VColors.defaultSubtle,
        activeSubtle: VColors.defaultActiveSubtle,
        surface1: VColors.defaultSurface1,
        surface2: VColors.defaultSurface2,
        surface3: VColors.defaultSurface3,
        surfaceHighlight: VColors.defaultSurfaceHighlight,
        surfaceLowlight: VColors.defaultSurfaceLowlight,
        text: VColors.defaultText,
        textSubtle: VColors.defaultTextSubtle,
        onActive: VColors.defaultOnActive,
        border: VColors.defaultBorder,
        disabled: VColors.defaultDisabled,
        accent: VColors.defaultAccent,
        overlay: VColors.defaultOverlay,
        transparent: VColors.transparent,
        vAccordionProperties: VAccordionProperties(
          headerTextStyle: defaultVTheme.textStyles
              .bodyText2Medium, // @TODO unused; remove on major release
          bodyTextStyle: defaultVTheme
              .textStyles.subtitle2, // @TODO unused; remove on major release
          headerBoldTextStyle: defaultVTheme.textStyles.bodyText2Medium,
          headerSubtleTextStyle: defaultVTheme.textStyles.subtitle2,
        ),
        vAppBarProperties: VAppBarProperties(
          titleTextStyle:
              defaultVTheme.textStyles.headline4.copyWith(height: 1.3181),
        ),
        vBannerProperties: VBannerProperties(
          titleTextStyle: defaultVTheme.textStyles.bodyText2
              .copyWith(height: 1.5, fontWeight: VFontWeight.semiBold),
          descriptionTextStyle:
              defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
        ),
        vButtonProperties: VButtonProperties(),
        vChipsRemovableProperties: VChipsRemovableProperties(
          chipLabelTextStyle: defaultVTheme.textStyles.uiLabelLarge,
        ),
        vChipsSelectionProperties: VChipsSelectionProperties(
          chipLabelTextStyle: defaultVTheme.textStyles.uiLabelLarge,
        ),
        vComboboxProperties: VComboboxProperties(
          errorTextStyle: defaultVTheme.textStyles.uiLabelLarge,
          resultTextStyle: defaultVTheme.textStyles.uiLabelLarge,
        ),
        vContentCardProperties: VContentCardProperties(),
        vDividerProperties: VDividerProperties(),
        vDropdownIconProperties: VDropdownIconProperties(
          dropdownTextStyle: defaultVTheme.textStyles.baseTextStyle,
        ),
        vDropdownTextProperties: VDropdownTextProperties(
          dropdownTextStyle: defaultVTheme.textStyles.baseTextStyle,
          bigIconTextStyle: defaultVTheme.textStyles.buttonLarge,
          smallIconTextStyle: defaultVTheme.textStyles.buttonMedium,
        ),
        vFlagProperties: VFlagProperties(
          linkTextStyle: defaultVTheme.textStyles.bodyText2Medium,
          titleTextStyle: defaultVTheme.textStyles.bodyText2,
          descriptionTextStyle: defaultVTheme.textStyles.bodyText2,
          closeIconPadding: const EdgeInsets.all(14),
        ),
        vInputProperties: VInputProperties(
          topLabelTextStyle: defaultVTheme.textStyles.uiLabelSmall,
          inputTextStyle: defaultVTheme.textStyles.bodyText2,
          errorTextStyle: defaultVTheme.textStyles.baseTextStyle,
          counterTextStyle: defaultVTheme.textStyles.baseTextStyle,
          validateErrorTextStyle: defaultVTheme.textStyles.uiLabelSmall,
          hintTextStyle: defaultVTheme.textStyles.bodyText2,
        ),
        vLinkProperties: VLinkProperties(
          titleTextStyle: defaultVTheme.textStyles.bodyText2Medium,
        ),
        vListItemProperties: VListItemProperties(),
        vNavDrawerProperties: VNavDrawerProperties(
          selectedLabelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
          unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge
              .copyWith(color: VColors.defaultTextSubtle),
        ),
        vPanelProperties: VPanelProperties(
          titleTextStyle: defaultVTheme.textStyles.headline3,
        ),
        vProgressProperties: VProgressProperties(
          circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
        ),
        vSelectProperties: VSelectProperties(
          headerTextStyle: defaultVTheme.textStyles.uiLabel,
          labelTextStyle: defaultVTheme.textStyles.baseTextStyle,
          validateTextStyle: defaultVTheme.textStyles.bodyText3,
        ),
        vTabBarProperties: VTabBarProperties(
          labelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
          unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge,
        ),
        vToggleProperties: VToggleProperties(),
        vWizardProperties: VWizardProperties(
          numberTextStyle: defaultVTheme.textStyles.uiLabelActive.copyWith(
            color: VColors.defaultSurface1,
            fontWeight: VFontWeight.medium,
          ),
        ),
      );
    } else {
      defaultColorScheme = defaultColorScheme.copyWith(
        active: themeData.active,
        activeHover: themeData.activeHover,
        activePressed: themeData.activePressed,
        subtle: themeData.subtle,
        activeSubtle: themeData.activeSubtle,
        surface1: themeData.surface1,
        surface2: themeData.surface2,
        surface3: themeData.surface3,
        surfaceHighlight: themeData.surfaceHighlight,
        surfaceLowlight: themeData.surfaceLowlight,
        text: themeData.text,
        textSubtle: themeData.textSubtle,
        onActive: themeData.onActive,
        border: themeData.border,
        disabled: themeData.disabled,
        accent: themeData.accent,
        overlay: themeData.overlay,
        transparent: themeData.transparent,
        vAccordionProperties: themeData.vAccordionProperties,
        vAppBarProperties: themeData.vAppBarProperties,
        vAvatarProperties: themeData.vAvatarProperties,
        vBannerProperties: themeData.vBannerProperties,
        vBottomNavBarProperties: themeData.vBottomNavBarProperties,
        vButtonProperties: themeData.vButtonProperties,
        vChipsRemovableProperties: themeData.vChipsRemovableProperties,
        vChipsSelectionProperties: themeData.vChipsSelectionProperties,
        vComboboxProperties: themeData.vComboboxProperties,
        vContentCardProperties: themeData.vContentCardProperties,
        vDividerProperties: themeData.vDividerProperties,
        vDropdownIconProperties: themeData.vDropdownIconProperties,
        vDropdownTextProperties: themeData.vDropdownTextProperties,
        vFlagProperties: themeData.vFlagProperties,
        vInputProperties: themeData.vInputProperties,
        vLinkProperties: themeData.vLinkProperties,
        vListItemProperties: themeData.vListItemProperties,
        vNavDrawerProperties: themeData.vNavDrawerProperties,
        vPanelProperties: themeData.vPanelProperties,
        vProgressProperties: themeData.vProgressProperties,
        vSelectProperties: themeData.vSelectProperties,
        vTabBarProperties: themeData.vTabBarProperties,
        vToggleProperties: themeData.vToggleProperties,
        vWizardProperties: themeData.vWizardProperties,
      ) as VDefaultThemeProps;
    }
  }

  void switchDarkTheme(VDefaultThemeProps? themeData) {
    if (null == themeData) {
      defaultColorSchemeDark = VDefaultThemeProps(
        active: VColors.defaultActiveDark,
        activeHover: VColors.defaultActiveHoverDark,
        activePressed: VColors.defaultActivePressedDark,
        subtle: VColors.defaultSubtleDark,
        activeSubtle: VColors.defaultActiveSubtleDark,
        surface1: VColors.defaultSurface1Dark,
        surface2: VColors.defaultSurface2Dark,
        surface3: VColors.defaultSurface3Dark,
        surfaceHighlight: VColors.defaultSurfaceHighlightDark,
        surfaceLowlight: VColors.defaultSurfaceLowlightDark,
        text: VColors.defaultTextDark,
        textSubtle: VColors.defaultTextSubtleDark,
        onActive: VColors.defaultOnActiveDark,
        border: VColors.defaultBorderDark,
        disabled: VColors.defaultDisabledDark,
        accent: VColors.defaultAccentDark,
        overlay: VColors.defaultOverlayDark,
        transparent: VColors.transparent,
        vAccordionProperties: VAccordionProperties(
          headerTextStyle: defaultVTheme.textStyles
              .bodyText2Medium, // @TODO unused; remove on major release
          bodyTextStyle: defaultVTheme
              .textStyles.subtitle2, // @TODO unused; remove on major release
          headerBoldTextStyle: defaultVTheme.textStyles.bodyText2Medium,
          headerSubtleTextStyle: defaultVTheme.textStyles.subtitle2,
        ),
        vAppBarProperties: VAppBarProperties(
          titleTextStyle:
              defaultVTheme.textStyles.headline4.copyWith(height: 1.3181),
        ),
        vBannerProperties: VBannerProperties(
          titleTextStyle: defaultVTheme.textStyles.bodyText2
              .copyWith(height: 1.5, fontWeight: VFontWeight.semiBold),
          descriptionTextStyle:
              defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
        ),
        vButtonProperties: VButtonProperties(),
        vChipsRemovableProperties: VChipsRemovableProperties(
          chipLabelTextStyle: defaultVTheme.textStyles.uiLabelLarge,
        ),
        vChipsSelectionProperties: VChipsSelectionProperties(
          chipLabelTextStyle: defaultVTheme.textStyles.uiLabelLarge,
        ),
        vComboboxProperties: VComboboxProperties(
          errorTextStyle: defaultVTheme.textStyles.uiLabelLarge,
          resultTextStyle: defaultVTheme.textStyles.uiLabelLarge,
        ),
        vContentCardProperties: VContentCardProperties(),
        vDividerProperties: VDividerProperties(),
        vDropdownIconProperties: VDropdownIconProperties(
          dropdownTextStyle: defaultVTheme.textStyles.baseTextStyle,
        ),
        vDropdownTextProperties: VDropdownTextProperties(
          dropdownTextStyle: defaultVTheme.textStyles.baseTextStyle,
          bigIconTextStyle: defaultVTheme.textStyles.buttonLarge,
          smallIconTextStyle: defaultVTheme.textStyles.buttonMedium,
        ),
        vFlagProperties: VFlagProperties(
          linkTextStyle: defaultVTheme.textStyles.bodyText2Medium,
          titleTextStyle: defaultVTheme.textStyles.bodyText2,
          descriptionTextStyle: defaultVTheme.textStyles.bodyText2,
          closeIconPadding: const EdgeInsets.all(14),
        ),
        vInputProperties: VInputProperties(
          topLabelTextStyle: defaultVTheme.textStyles.uiLabelSmall,
          inputTextStyle: defaultVTheme.textStyles.bodyText2,
          errorTextStyle: defaultVTheme.textStyles.baseTextStyle,
          counterTextStyle: defaultVTheme.textStyles.baseTextStyle,
          validateErrorTextStyle: defaultVTheme.textStyles.uiLabelSmall,
          hintTextStyle: defaultVTheme.textStyles.bodyText2,
        ),
        vLinkProperties: VLinkProperties(
          titleTextStyle: defaultVTheme.textStyles.bodyText2Medium,
        ),
        vListItemProperties: VListItemProperties(),
        vNavDrawerProperties: VNavDrawerProperties(
          selectedLabelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
          unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge
              .copyWith(color: VColors.defaultTextSubtle),
        ),
        vPanelProperties: VPanelProperties(
          titleTextStyle: defaultVTheme.textStyles.headline3,
        ),
        vProgressProperties: VProgressProperties(
          circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
        ),
        vSelectProperties: VSelectProperties(
          headerTextStyle: defaultVTheme.textStyles.uiLabel,
          labelTextStyle: defaultVTheme.textStyles.baseTextStyle,
          validateTextStyle: defaultVTheme.textStyles.bodyText3,
        ),
        vTabBarProperties: VTabBarProperties(
          labelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
          unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge,
        ),
        vToggleProperties: VToggleProperties(),
        vWizardProperties: VWizardProperties(
          numberTextStyle: defaultVTheme.textStyles.uiLabelActive.copyWith(
            color: VColors.defaultSurface1,
            fontWeight: VFontWeight.medium,
          ),
        ),
      );
    } else {
      defaultColorSchemeDark = defaultColorSchemeDark.copyWith(
        active: themeData.active,
        activeHover: themeData.activeHover,
        activePressed: themeData.activePressed,
        subtle: themeData.subtle,
        activeSubtle: themeData.activeSubtle,
        surface1: themeData.surface1,
        surface2: themeData.surface2,
        surface3: themeData.surface3,
        surfaceHighlight: themeData.surfaceHighlight,
        surfaceLowlight: themeData.surfaceLowlight,
        text: themeData.text,
        textSubtle: themeData.textSubtle,
        onActive: themeData.onActive,
        border: themeData.border,
        disabled: themeData.disabled,
        accent: themeData.accent,
        overlay: themeData.overlay,
        transparent: themeData.transparent,
        vAccordionProperties: themeData.vAccordionProperties,
        vAppBarProperties: themeData.vAppBarProperties,
        vAvatarProperties: themeData.vAvatarProperties,
        vBannerProperties: themeData.vBannerProperties,
        vBottomNavBarProperties: themeData.vBottomNavBarProperties,
        vButtonProperties: themeData.vButtonProperties,
        vChipsRemovableProperties: themeData.vChipsRemovableProperties,
        vChipsSelectionProperties: themeData.vChipsSelectionProperties,
        vComboboxProperties: themeData.vComboboxProperties,
        vContentCardProperties: themeData.vContentCardProperties,
        vDividerProperties: themeData.vDividerProperties,
        vDropdownIconProperties: themeData.vDropdownIconProperties,
        vDropdownTextProperties: themeData.vDropdownTextProperties,
        vFlagProperties: themeData.vFlagProperties,
        vInputProperties: themeData.vInputProperties,
        vLinkProperties: themeData.vLinkProperties,
        vListItemProperties: themeData.vListItemProperties,
        vNavDrawerProperties: themeData.vNavDrawerProperties,
        vPanelProperties: themeData.vPanelProperties,
        vProgressProperties: themeData.vProgressProperties,
        vSelectProperties: themeData.vSelectProperties,
        vTabBarProperties: themeData.vTabBarProperties,
        vToggleProperties: themeData.vToggleProperties,
        vWizardProperties: themeData.vWizardProperties,
      ) as VDefaultThemeProps;
    }
  }

  static var defaultColorScheme = VDefaultThemeProps(
    active: VColors.defaultActive,
    activeHover: VColors.defaultActiveHover,
    activePressed: VColors.defaultActivePressed,
    subtle: VColors.defaultSubtle,
    activeSubtle: VColors.defaultActiveSubtle,
    surface1: VColors.defaultSurface1,
    surface2: VColors.defaultSurface2,
    surface3: VColors.defaultSurface3,
    surfaceHighlight: VColors.defaultSurfaceHighlight,
    surfaceLowlight: VColors.defaultSurfaceLowlight,
    text: VColors.defaultText,
    textSubtle: VColors.defaultTextSubtle,
    onActive: VColors.defaultOnActive,
    border: VColors.defaultBorder,
    disabled: VColors.defaultDisabled,
    accent: VColors.defaultAccent,
    overlay: VColors.defaultOverlay,
    transparent: VColors.transparent,
    vAccordionProperties: VAccordionProperties(
      headerTextStyle: defaultVTheme
          .textStyles.bodyText2Medium, // @TODO unused; remove on major release
      bodyTextStyle: defaultVTheme
          .textStyles.subtitle2, // @TODO unused; remove on major release
      headerBoldTextStyle: defaultVTheme.textStyles.bodyText2Medium,
      headerSubtleTextStyle: defaultVTheme.textStyles.subtitle2,
    ),
    vAppBarProperties: VAppBarProperties(
      titleTextStyle:
          defaultVTheme.textStyles.headline4.copyWith(height: 1.3181),
    ),
    vBannerProperties: VBannerProperties(
      titleTextStyle: defaultVTheme.textStyles.bodyText2
          .copyWith(height: 1.5, fontWeight: VFontWeight.semiBold),
      descriptionTextStyle:
          defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
    ),
    vButtonProperties: VButtonProperties(),
    vChipsRemovableProperties: VChipsRemovableProperties(
      chipLabelTextStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vChipsSelectionProperties: VChipsSelectionProperties(
      chipLabelTextStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vComboboxProperties: VComboboxProperties(
      errorTextStyle: defaultVTheme.textStyles.uiLabelLarge,
      resultTextStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vContentCardProperties: VContentCardProperties(),
    vDividerProperties: VDividerProperties(),
    vDropdownIconProperties: VDropdownIconProperties(
      dropdownTextStyle: defaultVTheme.textStyles.baseTextStyle,
    ),
    vDropdownTextProperties: VDropdownTextProperties(
      dropdownTextStyle: defaultVTheme.textStyles.baseTextStyle,
      bigIconTextStyle: defaultVTheme.textStyles.buttonLarge,
      smallIconTextStyle: defaultVTheme.textStyles.buttonMedium,
    ),
    vFlagProperties: VFlagProperties(
      linkTextStyle: defaultVTheme.textStyles.bodyText2Medium,
      titleTextStyle: defaultVTheme.textStyles.bodyText2,
      descriptionTextStyle: defaultVTheme.textStyles.bodyText2,
      closeIconPadding: const EdgeInsets.all(14),
    ),
    vInputProperties: VInputProperties(
      topLabelTextStyle: defaultVTheme.textStyles.uiLabelSmall,
      inputTextStyle: defaultVTheme.textStyles.bodyText2,
      errorTextStyle: defaultVTheme.textStyles.baseTextStyle,
      counterTextStyle: defaultVTheme.textStyles.baseTextStyle,
      validateErrorTextStyle: defaultVTheme.textStyles.uiLabelSmall,
      hintTextStyle: defaultVTheme.textStyles.bodyText2,
    ),
    vLinkProperties: VLinkProperties(
      titleTextStyle: defaultVTheme.textStyles.bodyText2Medium,
    ),
    vListItemProperties: VListItemProperties(),
    vNavDrawerProperties: VNavDrawerProperties(
      selectedLabelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
      unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge
          .copyWith(color: VColors.defaultTextSubtle),
    ),
    vPanelProperties: VPanelProperties(
      titleTextStyle: defaultVTheme.textStyles.headline3,
    ),
    vProgressProperties: VProgressProperties(
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
    ),
    vSelectProperties: VSelectProperties(
      headerTextStyle: defaultVTheme.textStyles.uiLabel,
      labelTextStyle: defaultVTheme.textStyles.baseTextStyle,
      validateTextStyle: defaultVTheme.textStyles.bodyText3,
    ),
    vTabBarProperties: VTabBarProperties(
      labelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
      unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vToggleProperties: VToggleProperties(),
    vWizardProperties: VWizardProperties(
      numberTextStyle: defaultVTheme.textStyles.uiLabelActive.copyWith(
        color: VColors.defaultSurface1,
        fontWeight: VFontWeight.medium,
      ),
    ),
  );

  static var defaultColorSchemeDark = VDefaultThemeProps(
    active: VColors.defaultActiveDark,
    activeHover: VColors.defaultActiveHoverDark,
    activePressed: VColors.defaultActivePressedDark,
    subtle: VColors.defaultSubtleDark,
    activeSubtle: VColors.defaultActiveSubtleDark,
    surface1: VColors.defaultSurface1Dark,
    surface2: VColors.defaultSurface2Dark,
    surface3: VColors.defaultSurface3Dark,
    surfaceHighlight: VColors.defaultSurfaceHighlightDark,
    surfaceLowlight: VColors.defaultSurfaceLowlightDark,
    text: VColors.defaultTextDark,
    textSubtle: VColors.defaultTextSubtleDark,
    onActive: VColors.defaultOnActiveDark,
    border: VColors.defaultBorderDark,
    disabled: VColors.defaultDisabledDark,
    accent: VColors.defaultAccentDark,
    overlay: VColors.defaultOverlayDark,
    transparent: VColors.transparent,
    vAccordionProperties: VAccordionProperties(
      headerTextStyle: defaultVTheme
          .textStyles.bodyText2Medium, // @TODO unused; remove on major release
      bodyTextStyle: defaultVTheme
          .textStyles.subtitle2, // @TODO unused; remove on major release
      headerBoldTextStyle: defaultVTheme.textStyles.bodyText2Medium,
      headerSubtleTextStyle: defaultVTheme.textStyles.subtitle2,
    ),
    vAppBarProperties: VAppBarProperties(
      titleTextStyle:
          defaultVTheme.textStyles.headline4.copyWith(height: 1.3181),
    ),
    vBannerProperties: VBannerProperties(
      titleTextStyle: defaultVTheme.textStyles.bodyText2
          .copyWith(height: 1.5, fontWeight: VFontWeight.semiBold),
      descriptionTextStyle:
          defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
    ),
    vButtonProperties: VButtonProperties(),
    vChipsRemovableProperties: VChipsRemovableProperties(
      chipLabelTextStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vChipsSelectionProperties: VChipsSelectionProperties(
      chipLabelTextStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vComboboxProperties: VComboboxProperties(
      errorTextStyle: defaultVTheme.textStyles.uiLabelLarge,
      resultTextStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vContentCardProperties: VContentCardProperties(),
    vDividerProperties: VDividerProperties(),
    vDropdownIconProperties: VDropdownIconProperties(
      dropdownTextStyle: defaultVTheme.textStyles.baseTextStyle,
    ),
    vDropdownTextProperties: VDropdownTextProperties(
      dropdownTextStyle: defaultVTheme.textStyles.baseTextStyle,
      bigIconTextStyle: defaultVTheme.textStyles.buttonLarge,
      smallIconTextStyle: defaultVTheme.textStyles.buttonMedium,
    ),
    vFlagProperties: VFlagProperties(
      linkTextStyle: defaultVTheme.textStyles.bodyText2Medium,
      titleTextStyle: defaultVTheme.textStyles.bodyText2,
      descriptionTextStyle: defaultVTheme.textStyles.bodyText2,
      closeIconPadding: const EdgeInsets.all(14),
    ),
    vInputProperties: VInputProperties(
      topLabelTextStyle: defaultVTheme.textStyles.uiLabelSmall,
      inputTextStyle: defaultVTheme.textStyles.bodyText2,
      errorTextStyle: defaultVTheme.textStyles.baseTextStyle,
      counterTextStyle: defaultVTheme.textStyles.baseTextStyle,
      validateErrorTextStyle: defaultVTheme.textStyles.uiLabelSmall,
      hintTextStyle: defaultVTheme.textStyles.bodyText2,
    ),
    vLinkProperties: VLinkProperties(
      titleTextStyle: defaultVTheme.textStyles.bodyText2Medium,
    ),
    vListItemProperties: VListItemProperties(),
    vNavDrawerProperties: VNavDrawerProperties(
      selectedLabelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
      unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge
          .copyWith(color: VColors.defaultTextSubtle),
    ),
    vPanelProperties: VPanelProperties(
      titleTextStyle: defaultVTheme.textStyles.headline3,
    ),
    vProgressProperties: VProgressProperties(
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
    ),
    vSelectProperties: VSelectProperties(
      headerTextStyle: defaultVTheme.textStyles.uiLabel,
      labelTextStyle: defaultVTheme.textStyles.baseTextStyle,
      validateTextStyle: defaultVTheme.textStyles.bodyText3,
    ),
    vTabBarProperties: VTabBarProperties(
      labelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
      unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vToggleProperties: VToggleProperties(),
    vWizardProperties: VWizardProperties(
      numberTextStyle: defaultVTheme.textStyles.uiLabelActive.copyWith(
        color: VColors.defaultSurface1,
        fontWeight: VFontWeight.medium,
      ),
    ),
  );
}

class VAlt extends VExt {
  static var altColorScheme = VAltThemeProps(
    active: VColors.alternateActive,
    activeHover: VColors.alternateActiveHover,
    activePressed: VColors.alternateActivePressed,
    subtle: VColors.alternateSubtle,
    activeSubtle: VColors.alternateActiveSubtle,
    surface1: VColors.alternateSurface1,
    surface2: VColors.alternateSurface2,
    surface3: VColors.alternateSurface3,
    surfaceHighlight: VColors.alternateSurfaceHighlight,
    surfaceLowlight: VColors.alternateSurfaceLowlight,
    text: VColors.alternateText,
    textSubtle: VColors.alternateTextSubtle,
    onActive: VColors.alternateOnActive,
    border: VColors.alternateBorder,
    disabled: VColors.alternateDisabled,
    accent: VColors.alternateAccent,
    overlay: VColors.alternateOverlay,
    transparent: VColors.transparent,
    vAccordionProperties: VAccordionProperties(
      headerTextStyle: defaultVTheme
          .textStyles.bodyText2Medium, // @TODO unused; remove on major release
      bodyTextStyle: defaultVTheme
          .textStyles.subtitle2, // @TODO unused; remove on major release
      headerBoldTextStyle: defaultVTheme.textStyles.bodyText2Medium,
      headerSubtleTextStyle: defaultVTheme.textStyles.subtitle2,
    ),
    vAppBarProperties: VAppBarProperties(
      titleTextStyle:
          defaultVTheme.textStyles.headline4.copyWith(height: 1.3181),
    ),
    vBannerProperties: VBannerProperties(
      titleTextStyle: defaultVTheme.textStyles.bodyText2
          .copyWith(height: 1.5, fontWeight: VFontWeight.semiBold),
      descriptionTextStyle:
          defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
    ),
    vButtonProperties: VButtonProperties(),
    vChipsRemovableProperties: VChipsRemovableProperties(
      chipLabelTextStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vChipsSelectionProperties: VChipsSelectionProperties(
      chipLabelTextStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vComboboxProperties: VComboboxProperties(
      errorTextStyle: defaultVTheme.textStyles.uiLabelLarge,
      resultTextStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vContentCardProperties: VContentCardProperties(),
    vDividerProperties: VDividerProperties(),
    vDropdownIconProperties: VDropdownIconProperties(
      dropdownTextStyle: defaultVTheme.textStyles.baseTextStyle,
    ),
    vDropdownTextProperties: VDropdownTextProperties(
      dropdownTextStyle: defaultVTheme.textStyles.baseTextStyle,
      bigIconTextStyle: defaultVTheme.textStyles.buttonLarge,
      smallIconTextStyle: defaultVTheme.textStyles.buttonMedium,
    ),
    vFlagProperties: VFlagProperties(
      linkTextStyle: defaultVTheme.textStyles.bodyText2Medium,
      titleTextStyle: defaultVTheme.textStyles.bodyText2,
      descriptionTextStyle: defaultVTheme.textStyles.bodyText2,
      closeIconPadding: const EdgeInsets.all(14),
    ),
    vInputProperties: VInputProperties(
      topLabelTextStyle: defaultVTheme.textStyles.uiLabelSmall,
      inputTextStyle: defaultVTheme.textStyles.bodyText2,
      errorTextStyle: defaultVTheme.textStyles.baseTextStyle,
      counterTextStyle: defaultVTheme.textStyles.baseTextStyle,
      validateErrorTextStyle: defaultVTheme.textStyles.uiLabelSmall,
      hintTextStyle: defaultVTheme.textStyles.bodyText2,
    ),
    vLinkProperties: VLinkProperties(
      titleTextStyle: defaultVTheme.textStyles.bodyText2Medium,
    ),
    vListItemProperties: VListItemProperties(),
    vNavDrawerProperties: VNavDrawerProperties(
      selectedLabelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
      unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge
          .copyWith(color: VColors.defaultTextSubtle),
    ),
    vPanelProperties: VPanelProperties(
      titleTextStyle: defaultVTheme.textStyles.headline3,
    ),
    vProgressProperties: VProgressProperties(
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
    ),
    vSelectProperties: VSelectProperties(
      headerTextStyle: defaultVTheme.textStyles.uiLabel,
      labelTextStyle: defaultVTheme.textStyles.baseTextStyle,
      validateTextStyle: defaultVTheme.textStyles.bodyText3,
    ),
    vTabBarProperties: VTabBarProperties(
      labelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
      unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vToggleProperties: VToggleProperties(),
    vWizardProperties: VWizardProperties(
      numberTextStyle: defaultVTheme.textStyles.uiLabelActive.copyWith(
        color: VColors.defaultSurface1,
        fontWeight: VFontWeight.medium,
      ),
    ),
  );

  static var altColorSchemeDark = VAltThemeProps(
    active: VColors.alternateActiveDark,
    activeHover: VColors.alternateActiveHoverDark,
    activePressed: VColors.alternateActivePressedDark,
    subtle: VColors.alternateSubtleDark,
    activeSubtle: VColors.alternateActiveSubtleDark,
    surface1: VColors.alternateSurface1Dark,
    surface2: VColors.alternateSurface2Dark,
    surface3: VColors.alternateSurface3Dark,
    surfaceHighlight: VColors.alternateSurfaceHighlightDark,
    surfaceLowlight: VColors.alternateSurfaceLowlightDark,
    text: VColors.alternateTextDark,
    textSubtle: VColors.alternateTextSubtleDark,
    onActive: VColors.alternateOnActiveDark,
    border: VColors.alternateBorderDark,
    disabled: VColors.alternateDisabledDark,
    accent: VColors.alternateAccentDark,
    overlay: VColors.alternateOverlayDark,
    transparent: VColors.transparent,
    vAccordionProperties: VAccordionProperties(
      headerTextStyle: defaultVTheme
          .textStyles.bodyText2Medium, // @TODO unused; remove on major release
      bodyTextStyle: defaultVTheme
          .textStyles.subtitle2, // @TODO unused; remove on major release
      headerBoldTextStyle: defaultVTheme.textStyles.bodyText2Medium,
      headerSubtleTextStyle: defaultVTheme.textStyles.subtitle2,
    ),
    vAppBarProperties: VAppBarProperties(
      titleTextStyle:
          defaultVTheme.textStyles.headline4.copyWith(height: 1.3181),
    ),
    vBannerProperties: VBannerProperties(
      titleTextStyle: defaultVTheme.textStyles.bodyText2
          .copyWith(height: 1.5, fontWeight: VFontWeight.semiBold),
      descriptionTextStyle:
          defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
    ),
    vButtonProperties: VButtonProperties(),
    vChipsRemovableProperties: VChipsRemovableProperties(
      chipLabelTextStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vChipsSelectionProperties: VChipsSelectionProperties(
      chipLabelTextStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vComboboxProperties: VComboboxProperties(
      errorTextStyle: defaultVTheme.textStyles.uiLabelLarge,
      resultTextStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vContentCardProperties: VContentCardProperties(),
    vDividerProperties: VDividerProperties(),
    vDropdownIconProperties: VDropdownIconProperties(
      dropdownTextStyle: defaultVTheme.textStyles.baseTextStyle,
    ),
    vDropdownTextProperties: VDropdownTextProperties(
      dropdownTextStyle: defaultVTheme.textStyles.baseTextStyle,
      bigIconTextStyle: defaultVTheme.textStyles.buttonLarge,
      smallIconTextStyle: defaultVTheme.textStyles.buttonMedium,
    ),
    vFlagProperties: VFlagProperties(
      linkTextStyle: defaultVTheme.textStyles.bodyText2Medium,
      titleTextStyle: defaultVTheme.textStyles.bodyText2,
      descriptionTextStyle: defaultVTheme.textStyles.bodyText2,
      closeIconPadding: const EdgeInsets.all(14),
    ),
    vInputProperties: VInputProperties(
      topLabelTextStyle: defaultVTheme.textStyles.uiLabelSmall,
      inputTextStyle: defaultVTheme.textStyles.bodyText2,
      errorTextStyle: defaultVTheme.textStyles.baseTextStyle,
      counterTextStyle: defaultVTheme.textStyles.baseTextStyle,
      validateErrorTextStyle: defaultVTheme.textStyles.uiLabelSmall,
      hintTextStyle: defaultVTheme.textStyles.bodyText2,
    ),
    vLinkProperties: VLinkProperties(
      titleTextStyle: defaultVTheme.textStyles.bodyText2Medium,
    ),
    vListItemProperties: VListItemProperties(),
    vNavDrawerProperties: VNavDrawerProperties(
      selectedLabelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
      unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge
          .copyWith(color: VColors.defaultTextSubtle),
    ),
    vPanelProperties: VPanelProperties(
      titleTextStyle: defaultVTheme.textStyles.headline3,
    ),
    vProgressProperties: VProgressProperties(
      circularLabelTextStyle: defaultVTheme.textStyles.uiLabelActive,
    ),
    vSelectProperties: VSelectProperties(
      headerTextStyle: defaultVTheme.textStyles.uiLabel,
      labelTextStyle: defaultVTheme.textStyles.baseTextStyle,
      validateTextStyle: defaultVTheme.textStyles.bodyText3,
    ),
    vTabBarProperties: VTabBarProperties(
      labelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
      unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge,
    ),
    vToggleProperties: VToggleProperties(),
    vWizardProperties: VWizardProperties(
      numberTextStyle: defaultVTheme.textStyles.uiLabelActive.copyWith(
        color: VColors.defaultSurface1,
        fontWeight: VFontWeight.medium,
      ),
    ),
  );
}

const messageColorScheme = VMessageColorSet(
  normalColor: VColors.defaultSurface1,
  positiveSurface: VColors.positiveSurface,
  positiveGraphics: VColors.positiveGraphics,
  positiveText: VColors.positiveText,
  warningSurface: VColors.warningSurface,
  warningGraphics: VColors.warningGraphics,
  warningText: VColors.warningText,
  negativeSurfaceHighLight: VColors.negativeSurfaceHighLight,
  negativeSurfaceLowLight: VColors.negativeSurfaceLowLight,
  negativeSurface: VColors.negativeSurface,
  negativeGraphics: VColors.negativeGraphics,
  negativeTextHover: VColors.negativeTextHover,
  negativeText: VColors.negativeText,
  negativeTextPressed: VColors.negativeTextPressed,
  infoSurface: VColors.infoSurface,
  infoGraphics: VColors.infoGraphics,
  surface2: VColors.defaultSurface2,
  infoText: VColors.infoText,
  transparent: VColors.transparent,
  subtleText: VColors.defaultTextSubtle,
  defaultText: VColors.defaultText,
);

ThemeData getColorScheme(ThemeExtension<dynamic> scheme) {
  return ThemeData(
    extensions: [scheme, messageColorScheme],
  );
}

class VTheme {
  final String fontFamily;
  final VTextStyle textStyles;

  VTheme({this.fontFamily = "packages/visa_nova_flutter/VisaDialectUI"})
      : textStyles = VTextStyle(fontFamily: fontFamily);

  // Primary theme
  ThemeData get primaryTheme {
    return ThemeData(
      useMaterial3: false,
      extensions: <ThemeExtension<dynamic>>{
        VDef.defaultColorScheme,
        VAlt.altColorScheme,
        messageColorScheme,
      },
      fontFamily: fontFamily,
    );
  }

  // Primary dark theme
  ThemeData get primaryThemeDark {
    return ThemeData.dark(
      useMaterial3: false,
    ).copyWith(
      extensions: <ThemeExtension<dynamic>>{
        VDef.defaultColorSchemeDark,
        VAlt.altColorSchemeDark,
        messageColorScheme,
      },
    );
  }
}

/// Visa Flutter Text Style Definitions
class VTextStyle {
  final String fontFamily;
  final TextStyle baseTextStyle;

  VTextStyle({this.fontFamily = "packages/visa_nova_flutter/VisaDialectUI"})
      : baseTextStyle = TextStyle(
          fontFamily: fontFamily,
          color: VColors.defaultText,
          fontWeight: VFontWeight.regular,
          fontSize: 16.0,
        );

  /// Display 1 Text Style
  TextStyle get display1 {
    return baseTextStyle.copyWith(
      fontSize: 70.0,
      fontWeight: VFontWeight.semiBold,
    );
  }

  /// Display 2 Text Style
  TextStyle get display2 {
    return baseTextStyle.copyWith(
      fontSize: 58.0,
      fontWeight: VFontWeight.semiBold,
    );
  }

  /// Headline 1 Text Style
  TextStyle get headline1 {
    return baseTextStyle.copyWith(
      fontSize: 36.0,
      fontWeight: VFontWeight.medium,
    );
  }

  /// Headline 2 Text Style
  TextStyle get headline2 {
    return baseTextStyle.copyWith(
      fontSize: 28.0,
      fontWeight: VFontWeight.regular,
    );
  }

  /// Headline 3 Text Style
  TextStyle get headline3 {
    return baseTextStyle.copyWith(
      fontSize: 24.0,
      fontWeight: VFontWeight.semiBold,
    );
  }

  /// Headline 4 Text Style
  TextStyle get headline4 {
    return baseTextStyle.copyWith(
      fontSize: 22.0,
      fontWeight: VFontWeight.semiBold,
    );
  }

  /// Subtitle 1 Text Style
  TextStyle get subtitle1 {
    return baseTextStyle.copyWith(
      fontSize: 18.0,
      fontWeight: VFontWeight.semiBold,
    );
  }

  /// Subtitle 2 Text Style
  TextStyle get subtitle2 {
    return baseTextStyle.copyWith(
      fontSize: 18.0,
      fontWeight: VFontWeight.medium,
    );
  }

  /// Subtitle 3 Text Style
  TextStyle get subtitle3 {
    return baseTextStyle.copyWith(
      fontSize: 16.0,
      fontWeight: VFontWeight.semiBold,
    );
  }

  /// Overline Text Style
  TextStyle get overline {
    return baseTextStyle.copyWith(
      fontSize: 11.0,
      fontWeight: VFontWeight.semiBold,
    );
  }

  /// Body Text 1 Text Style
  TextStyle get bodyText1 {
    return baseTextStyle.copyWith(
      fontSize: 18.0,
      fontWeight: VFontWeight.regular,
    );
  }

  /// Body Text 2 Text Style (the default)
  TextStyle get bodyText2 {
    return baseTextStyle.copyWith(
      height: 1.5,
      fontSize: 16.0,
      fontWeight: VFontWeight.regular,
    );
  }

  /// Body Text 2 Text Style Medium
  TextStyle get bodyText2Medium {
    return baseTextStyle.copyWith(
      fontSize: 16.0,
      height: 1.5,
      fontWeight: VFontWeight.medium,
    );
  }

  /// Body Text 3 Text Style (the default)
  TextStyle get bodyText3 {
    return baseTextStyle.copyWith(
      fontSize: 14.0,
      fontWeight: VFontWeight.regular,
    );
  }

  /// Button Large Text Style
  TextStyle get buttonLarge {
    return baseTextStyle.copyWith(
      fontSize: 16.0,
      fontWeight: VFontWeight.semiBold,
    );
  }

  /// Button Medium Text Style
  TextStyle get buttonMedium {
    return baseTextStyle.copyWith(
        fontSize: 14.0, fontWeight: VFontWeight.semiBold);
  }

  /// Button Small Text Style
  TextStyle get buttonSmall {
    return baseTextStyle.copyWith(
      fontSize: 14.0,
      fontWeight: VFontWeight.medium,
    );
  }

  /// UI Label Large Text Style
  TextStyle get uiLabelLarge {
    return baseTextStyle.copyWith(
      fontSize: 16.0,
      fontWeight: VFontWeight.regular,
    );
  }

  /// UI Label Large Active Text Style
  TextStyle get uiLabelLargeActive {
    return baseTextStyle.copyWith(
      fontSize: 16.0,
      fontWeight: VFontWeight.medium,
    );
  }

  /// UI Label Text Style
  TextStyle get uiLabel {
    return baseTextStyle.copyWith(
      fontSize: 14.0,
      fontWeight: VFontWeight.regular,
    );
  }

  /// UI Label Active Text Style
  TextStyle get uiLabelActive {
    return baseTextStyle.copyWith(
      fontSize: 14.0,
      fontWeight: VFontWeight.medium,
    );
  }

  /// UI Label Small Text Style
  TextStyle get uiLabelSmall {
    return baseTextStyle.copyWith(
      fontSize: 12.0,
      fontWeight: VFontWeight.regular,
      height: 1.3333,
    );
  }

  /// UI Label XSmall Text Style
  TextStyle get uiLabelXSmall {
    return baseTextStyle.copyWith(
      fontSize: 10.0,
      fontWeight: VFontWeight.regular,
    );
  }

  /// Input Text Style
  TextStyle get input {
    return baseTextStyle.copyWith(
      fontSize: 16.0,
      fontWeight: VFontWeight.regular,
    );
  }

  /// Tab Text Style
  TextStyle get tab {
    return baseTextStyle.copyWith(
      fontSize: 16.0,
      fontWeight: VFontWeight.regular,
    );
  }

  /// Tab Selected Text Style
  TextStyle get tabSelected {
    return baseTextStyle.copyWith(
      fontSize: 16.0,
      fontWeight: VFontWeight.medium,
    );
  }
}
