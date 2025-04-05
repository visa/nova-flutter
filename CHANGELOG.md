<!--
 * © 2025 Visa.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the specific language governing permissions and
 * limitations under the License.
 *
 -->

# Changelog

## 8.1.0 (2025-02-12)

![Nova Flutter 8.1.0 pixel art banner](./assets/nova-8.1.png)

## Bug fixes 8.1.0

- Resolved padding issues in the `VAppBar` component.
- Fixed an accessibility issue with `VInput` TalkBack behavior.
- Fixed the border curve issue in the `VSectionMessage` component.
- Fixed the border curve issue in the `VSelect` component.
- Implemented design updates for the `VToggle` component.

## Features 8.1.0

- Introduced two new properties in the `VFlag` component: `contentPadding` (EdgeInsetsGeometry?) and `flagIconPadding` (EdgeInsetsGeometry?). These properties allow for enhanced customization.
- Enhanced the theme switching experience in the demo app for better light/dark mode transitions.
- Added three new properties to the `VToggle` component for improved flexibility and functionality:
  - `topLabelAlignment` (CrossAxisAlignment?): Allows for alignment customization of the top label.
  - `topLabel` (Widget?): Enables the addition of a custom top label widget.
  - `disabledItems` (List\<bool>?): Provides the ability to disable specific items within the toggle.

## 8.0.0 (2025-01-23)

![Nova Flutter 8.0.0 pixel art banner](./assets/nova-8.0.png)

## Breaking changes 8.0.0

- **Flutter SDK upgrade**: The library now requires a minimum Flutter SDK version of 3.27. Ensure you update your Flutter SDK to this version or higher to continue using the library. In Flutter 3.27 updates, `CardTheme`, `DialogTheme` and `TabBarTheme` were refactored to conform to Flutter's conventions for component themes. `CardThemeData`, `DialogThemeData`, and `TabBarThemeData` were added to define overrides for the defaults of the component visual properties. Releases of Flutter continue to normalize component themes like these for a more consistent theming experience in the material library. For migration guide, please check [Component theme normalization | Migration guide](https://docs.flutter.dev/release/breaking-changes/component-theme-normalization#migration-guide). For upgrading your Flutter SDK version at Visa, please check [Instructions for updating Flutter](https://visawiki.trusted.visa.com/display/VINNOV/Instructions+for+updating+Flutter).

## Bug fixes 8.0.0

- Fixed an issue with voiceover accessibility for `VIcon`. The `VIcon` widget now includes a new property `semanticLabel` (String) to improve accessibility descriptions.

## 7.4.2 (2025-01-14)

## Bug fixes 7.4.2

- VLink a11y focus issue fix

## 7.4.1 (2024-12-18)

## Bug fixes 7.4.1

- VInput text alignment issue
- VFlag alignment issue with icon and text on large fonts
- VWizard a11y issues

## 7.4.0 (2024-11-20)

![Nova Flutter 7.4.0 pixel art banner](./assets/nova-7.4.png)

## Breaking changes 7.4.0

- VPanel: `contentPadding` (`EdgeInsets?`) and `closeIconPadding` (`EdgeInsets?`) have been introduced for enhanced flexibility.

## Content review 7.4.0

- VListItem
- VWizard

## 7.3.5 (2024-11-14)

## Content review 7.3.5

- VButton
- VInput
- VSelect

## Design review 7.3.5

- VWizard

## 7.3.4 (2024-11-07)

## Content review 7.3.4

- VAppBar
- VBanner
- VButton
- VCombobox
- VDialog
- VInput
- VListItem
- VSelect

## 7.3.3 (2024-10-24)

## Content review 7.3.3

- VAccordion
- VAppBar
- VAvatar
- VBadge
- VBanner
- VButton
- VCheckbox
- VChip
- VCombobox
- VContentCard
- VDialog
- VDivider
- VDropdown
- VFlag
- VInput
- VLink
- VListItem
- VProgress
- VSectionMessage
- VSelect
- VTabBar
- VTabs
- VToggle

## Design review 7.3.3

- VWizard

## Bug fix 7.3.3

- VSelect now supports disabling the default validation icon and exposes a string for custom semantic readout.

## 7.3.2 (2024-10-09)

## Content review 7.3.2

- VAccordion
- VAppBar
- VAvatar
- VBadge
- VBanner
- VButton
- VCheckbox
- VChip
- VCombobox
- VContentCard
- VDialog
- VDivider
- VDropdown
- VFlag
- VInput
- VLink
- VListItem
- VNavigationDrawer
- VPanel
- VProgress
- VRadio
- VSectionMessage
- VSelect
- VSwitch
- VTabBar
- VTab
- VToggle

## Bug Fix 7.3.2

- VInput: Fixed the issue that VInput textbox defined as views are not supported for automation via Appium.

## 7.3.1 (2024-09-17)

## Content review 7.3.1

- VCheckbox
- VDialog
- VFlag
- VSectionMessage
- VRadio
- VTab
- VSelect
- VToggle
- VBottomNavBar

## Design review 7.3.1

- VSectionMessage

## Bug fixes 7.3.1

- VFlag: Corrected the default `onPressed` color.
- VBottomNavBar: Resolved the issue with the `onTap` function.

## 7.3.0 (2024-09-04)

![Nova Flutter 7.3.0 pixel art banner](./assets/nova-7.3.png)

## Feature 7.3.0

- VDropdownIcon and VDropdownTextButton: The `dropdownOptions` (`List`) has been updated to `itemBuilder` (`List<PopupMenuEntry<dynamic>> Function(BuildContext)`) for custom array support. New properties `position` (`PopupMenuPosition?`) and `offset` (`Offset`) have been introduced for enhanced flexibility.
- VListItem: A new property `trailingPadding` (`EdgeInsets`) has been introduced to offer better flexibility.
- VInput: The design has been updated to align better with the component design. New properties `initialValue` (`String?`) and `semanticsError` (`String?`) have been added.

## Content review 7.3.0

- VAccordion
- VBadge
- VBanner
- VButton
- VChips
- VContentCard
- VDivider
- VLink
- VNavDrawer
- VPanel
- VProgress
- VSwitch

## Bug fixes 7.3.0

- VNavDrawer: A bug affecting back button navigation has been fixed.
- VInput: A Talkback issue has been rectified.

## 7.2.0 (2024-08-22)

![Nova Flutter 7.2.0 pixel art banner](./assets/nova-7.2.png)

### Features 7.2.0

- VDialog: Introduced an `assert()` function in the constructor that prevents both `title` and `description` from being null. Also, the `title` property is now optional for more flexibility.
- VDropdown: Introduced `defaultFontColor`, `disabledFontColor`, `isSecDefaultFontColor`, and `isSecDisabledFontColor` for more customization options. Also, the `iconFit` in VDropdown icon has been updated for improved user experience.
- Demo App: The home page of the demo app/docs has been redesigned for a fresh new look. The documentation has also been improved for better user experience.
- VBanner: The `contentPadding`, `iconPadding`, `bannerPadding`, `titleTextStyle`, and `descriptionTextStyle` properties have been exposed for more flexibility and customization.

### Bug fixes 7.2.0

- VDialog: Fixed an issue with the icon & multi-line text alignment for improved consistency and readability.
- VBanner: Fixed an issue with the icon alignment in larger font mode for better accessibility. Also, fixed an issue where VBanner would not wrap vertically to content when on stack, improving layout flexibility and responsiveness.

## 7.1.0 (2024-07-25)

![Nova Flutter 7.1.0 pixel art banner](./assets/nova-7.1.png)

### Features 7.1.0

- Enhanced Flexibility: `linkStyle` (VButtonStyle) is now a feature of VFlag.
- More Flexibility in VDropdown: `icons` now take (Widget?) instead of (Icon?) for increased flexibility.
- VDialog Enhancements: VDialog's `description` is now optional, not required. Additional `actionButtonFlex` and `dismissButtonFlex` properties have been added for increased flexibility.

### Bug fixes 7.1.0

- VInput Improvements: Fixed `inLineLabel` bug and corrected semantic error readout.

### Testing 7.1.0

- Expanded Test Coverage: Improved test coverage for Checkbox and Icon. The overall test coverage now stands at 93%.

| **Widget**        | **Tested** | **Coverage** |
| ----------------- | ---------- | ------------ |
| Accordion         | Yes        | 95.2% ✅     |
| App bar           | Yes        | 100% ✅      |
| Avatar            | Yes        | 100% ✅      |
| Badge             | Yes        | 100% ✅      |
| Banner            | Yes        | 100% ✅      |
| Button            | Yes        | 100% ✅      |
| Checkbox          | Yes        | 94.5% ✅     |
| Chips             | Yes        | 85.2% ✅     |
| Combobox          | Yes        | 84.9% ✅     |
| Content card      | Yes        | 98.7% ✅     |
| Dialog            | Yes        | 100% ✅      |
| Divider           | Yes        | 100% ✅      |
| Dropdown          | Yes        | 95.1% ✅     |
| Flag              | Yes        | 100% ✅      |
| Icon              | Yes        | 72.2% ✅     |
| Input             | Yes        | 93.9% ✅     |
| Link              | Yes        | 95.3% ✅     |
| List Item         | Yes        | 92.6% ✅     |
| Navigation drawer | Yes        | 100% ✅      |
| Panel             | Yes        | 100% ✅      |
| Progress          | Yes        | 100% ✅      |
| Radio             | Yes        | 100% ✅      |
| Section message   | Yes        | 100% ✅      |
| Select            | Yes        | 84.8% ✅     |
| Switch            | Yes        | 93.8% ✅     |
| Tab bar           | Yes        | 100% ✅      |
| Tabs              | Yes        | 100% ✅      |
| Toggle            | Yes        | 100% ✅      |
| Wizard            | Yes        | 100% ✅      |

## 7.0.0 (2024-07-02)

![Nova Flutter 7.0 pixel art banner](./assets/nova-7.0.png)

### Breaking Changes 7.0.0

- A Typography section has been added to [VPDS Flutter Home Site](https://productdesignsystem.visa.com/flutter)
- The VCheckboxStyle has been refactored with a new variable, `crossAxisAlignment`
- The `label`(String) attribute of VCheckboxTile has been refactored to `child`(Widget)
- VCheckboxTile now includes additional properties: `title`(String), `subtitle`(String), `controlAffinity`(ListTileControlAffinity), `titleStyle`(TextStyle), `subtitleStyle`(TextStyle), `secondary`(Widget), `child`(Widget), `onChanged`(void)
- VMatCheckboxTile is now having some more properties: `titleStyle`(TextStyle), `subtitleStyle`(TextStyle), `crossAxisAlignment`(CrossAxisAlignment), `child`(Widget)
- For users of VCheckboxTile or VMatCheckboxTile, including a child widget allows for more customization since it can take any Widget. If you wish to change the alignment of the title/subtitle to center, top, or bottom (see [VDS-5950](https://issues.trusted.visa.com/browse/VDS-5950)), please use `title`, `subtitle`, `titleStyle`, and `subtitleStyle` instead. For more detailed examples, please check [VPDS Flutter Home Site | Checkbox](https://productdesignsystem.visa.com/flutter/checkboxes)
- The Artifactory link for this project has been updated. The previous link was `https://artifactory.trusted.visa.com/api/pub/flutter-commons`. The new link is `https://artifactory.trusted.visa.com/api/pub/visa-commons-flutter`. Please update your references accordingly.

### Bug Fixes 7.0.0

- The VSelect now features an error border color
- The VInput height issue has been resolved
- The alignment of the VInput inline error icon has been fixed
- Enabled suggestions and autocorrect booleans for VDropdown textFields and labels.

### Testing 7.0.0

- All widgets have been tested, with a few that require further improvements. Overall testing coverage: 92%

| **Widget**        | **Tested** | **Coverage** |
| ----------------- | ---------- | ------------ |
| Accordion         | Yes        | 95.2% ✅     |
| App bar           | Yes        | 100% ✅      |
| Avatar            | Yes        | 100% ✅      |
| Badge             | Yes        | 100% ✅      |
| Banner            | Yes        | 100% ✅      |
| Button            | Yes        | 100% ✅      |
| Checkbox          | Yes        | 56.4%        |
| Chips             | Yes        | 85.2% ✅     |
| Combobox          | Yes        | 84.9% ✅     |
| Content card      | Yes        | 98.7% ✅     |
| Dialog            | Yes        | 100% ✅      |
| Divider           | Yes        | 100% ✅      |
| Dropdown          | Yes        | 95.1% ✅     |
| Flag              | Yes        | 100% ✅      |
| Icon              | Yes        | 36.1%        |
| Input             | Yes        | 93.9% ✅     |
| Link              | Yes        | 95.3% ✅     |
| List Item         | Yes        | 92.6% ✅     |
| Navigation drawer | Yes        | 100% ✅      |
| Panel             | Yes        | 100% ✅      |
| Progress          | Yes        | 100% ✅      |
| Radio             | Yes        | 100% ✅      |
| Section message   | Yes        | 100% ✅      |
| Select            | Yes        | 84.8% ✅     |
| Switch            | Yes        | 93.8% ✅     |
| Tab bar           | Yes        | 100% ✅      |
| Tabs              | Yes        | 100% ✅      |
| Toggle            | Yes        | 100% ✅      |
| Wizard            | Yes        | 100% ✅      |

## 6.3.3 (2024-05-07)

### Bug Fixes 6.3.3

- VTabs oversize issue fixed

### Features 6.3.3

- VCombobox provided more flexibility and customization
- VTabs is now having controller
- Updated iOS app bundle id

### Testing 6.3.3

- Hit 100% coverage on dialog, flag, nav-drawer, progress, radio, section message, panel, tabs, and wizard

| **Widget**        | **Tested** | **Coverage** |
| ----------------- | ---------- | ------------ |
| Accordion         |            | 0%           |
| App bar           | Yes        | 100% ✅      |
| Avatar            |            | 0%           |
| Badge             | Yes        | 100% ✅      |
| Banner            | Yes        | 100% ✅      |
| Button            | Yes        | 100% ✅      |
| Checkbox          | Yes        | 100% ✅      |
| Chips             |            | 0%           |
| Combobox          |            | 0%           |
| Content card      |            | 0%           |
| Dialog            | Yes        | 100% ✅      |
| Divider           |            | 48.9%        |
| Dropdown          |            | 0%           |
| Flag              | Yes        | 100% ✅      |
| Icon              |            | 36.1%        |
| Input             |            | 0%           |
| Link              |            | 51.8%        |
| Navigation drawer | Yes        | 100% ✅      |
| Panel             |            | 0%           |
| Progress          | Yes        | 100% ✅      |
| Radio             | Yes        | 100% ✅      |
| Section message   | Yes        | 100% ✅      |
| Select            |            | 0%           |
| Switch            |            | 0%           |
| Tab bar           | Yes        | 100% ✅      |
| Tabs              | Yes        | 100% ✅      |
| Toggle            |            | 0%           |
| Wizard            | Yes        | 100% ✅      |

## 6.3.2 (2024-04-30)

### Bug Fixes 6.3.2

- Demo app copy code button a11y fix

## 6.3.1 (2024-04-25)

### Bug Fixes 6.3.1

- VNavDrawer a11y fix
- VProgress a11y fix

### Features 6.3.1

- VDropdown provided more flexibility and customization
- VChips updated border color for compact and standard
- VSelect customizable select function

## 6.3.0 (2024-04-22)

![Nova Flutter 6.3 pixel art banner](./assets/nova-6.3.png)

### Breaking Changes 6.3.0

- **New component VWizard**: VWizard is added to our library as a new component!

### Bug Fixes 6.3.0

- VCombobox a11y fix
- VSelect semantic error fix, color bug fix
- VFlag dismiss method a11y fix
- VToggle community support bug fix
- VChip design fix

### Features 6.3.0

- VSectionMessage subtle variant design update
- VSelect button and dropdown width variables exposed

### Testing 6.3.0

| **Widget**        | **Tested** | **Coverage** |
| ----------------- | ---------- | ------------ |
| Accordion         |            | 0%           |
| App bar           | Yes        | 100% ✅      |
| Avatar            |            | 0%           |
| Badge             | Yes        | 100% ✅      |
| Banner            | Yes        | 100% ✅      |
| Button            | Yes        | 100% ✅      |
| Checkbox          | Yes        | 100% ✅      |
| Chips             |            | 0%           |
| Combobox          |            | 0%           |
| Content card      |            | 0%           |
| Dialog            | Yes        | 32.1%        |
| Divider           |            | 48.9%        |
| Dropdown          |            | 0%           |
| Flag              | Yes        | 43.9%        |
| Icon              |            | 36.1%        |
| Input             |            | 0%           |
| Link              |            | 51.8%        |
| Navigation drawer | Yes        | 92.7% ✅     |
| Panel             |            | 0%           |
| Progress          | Yes        | 13.4%        |
| Radio             | Yes        | 57.1%        |
| Section message   | Yes        | 64.7%        |
| Select            |            | 0%           |
| Switch            |            | 0%           |
| Tab bar           | Yes        | 100% ✅      |
| Tabs              | Yes        | 81.4% ✅     |
| Toggle            |            | 0%           |
| Wizard            |            | 0%           |

## 6.2.0 (2024-04-01)

![Nova Flutter 6.2 pixel art banner](./assets/nova-6.2.png)

### Bug Fixes 6.2.0

- Demo app a11y issues (22 in total) fix
- VBottomNavBarItems theming fix
- VPanel backgroundColor theme-ability fix
- VPanel dynamic height fix
- VLink community a11y support fix
- VChip design review fix
- VDropdownMenu custom variable fix

### Features 6.2.0

- Design update on button alignment in VDialog
- New variables (borderRadius, boxShadowColor, boxShadowSpreadRadius, boxShadowBlurRadius, boxShadowOffset, margin) in VBanner
- New variables (linkTextColor, linkUnderlineColor, closeIconColor, titleTextColor, descriptionTextColor, linkTextStyle, titleTextStyle, descriptionTextStyle, closeIconPadding) in VFlag

## 6.1.0 (2024-03-25)

![Nova Flutter 6.1 pixel art banner](./assets/nova-6.1.png)

### Breaking Changes 6.1.0

- **Flutter SDK upgrade**: Now the library is compatible with the latest Flutter SDK version 3.19.4

### Bug Fixes 6.1.0

- VSelect bottom error message overflow fix
- VChip design review fix
- VSelect large font size display fix
- VToggle a11y review fix
- VDivider a11y review fix
- VCombobox a11y review fix
- VInput input formatter fix
- VFlag a11y review fix

### Features 6.1.0

- VRadio subtitle variable exposed

## 6.0.1 (2024-03-04)

### Bug Fixes 6.0.1

- Navigation Drawer a11y review fix
- Panel a11y review fix
- Panel community support fix

## 6.0.0 (2024-02-26)

### Breaking Changes 6.0.0

- **Theme refactor**: Refactored primary theme and primary dark theme instance properties and used getters to create themes. Text style is now under theme. Users can now set custom font to their preference.
  - `VTheme.primaryTheme` -> `defaultVTheme.primaryTheme`
  - `VTextStyle.uiLabel` -> `defaultVTheme.textStyles.uiLabel`
- **Dark theme support**: Dark Theme support is now added to library per [Design team's variables](https://visawiki.trusted.visa.com/pages/viewpage.action?spaceKey=VIS670A&title=Variables)! App level Dark Theme is ready, too!
- **Vertical tab removal**: Vertical tab is removed from library (since it is only used in Nav Drawer and we have list item and similar widgets).

### Features 6.0.0

- **Documentation updates**: Getting started is updated with latest Dark Theme and Font change methods.

### Bug Fixes 6.0.0

- VSelect validateTextColor fix
- VLink edge case wrapping design fix
- Toggle button a11y review fix

### Testing 6.0.0

| **Widget**        | **Tested** | **Coverage** |
| ----------------- | ---------- | ------------ |
| Accordion         |            | 0%           |
| App bar           | Yes        | 95.8% ✅     |
| Avatar            |            | 0%           |
| Badge             | Yes        | 97.5% ✅     |
| Banner            | Yes        | 90.5% ✅     |
| Button            | Yes        | 37.9%        |
| Checkbox          | Yes        | 27.9%        |
| Chips             |            | 0%           |
| Combobox          |            | 0%           |
| Content card      |            | 0%           |
| Dialog            | Yes        | 32.1%        |
| Divider           |            | 48.9%        |
| Dropdown          |            | 0%           |
| Flag              | Yes        | 43.9%        |
| Icon              |            | 36.1%        |
| Input             |            | 0%           |
| Link              |            | 51.8%        |
| Navigation drawer | Yes        | 92.2% ✅     |
| Panel             |            | 0%           |
| Progress          | Yes        | 13.4%        |
| Radio             | Yes        | 57.1%        |
| Section message   | Yes        | 64.7%        |
| Select            |            | 0%           |
| Switch            |            | 0%           |
| Tab bar           | Yes        | 69.8%        |
| Tabs              | Yes        | 81.4% ✅     |
| Toggle            |            | 0%           |

## 5.2.0 (2024-02-21)

![Nova Flutter 5.2 pixel art banner](./assets/nova-5.2.png)

### Features 5.2.0

- **Flutter testing coverage update** Now we have code coverage report added to Changelog
- Input content update

### Bug Fixes 5.2.0

- Badge a11y review fix
- Chip a11y review fix
- Dialog a11y review fix
- Flag a11y review fix
- Copy code button semantic fix

### Testing 5.2.0

| **Widget**        | **Tested** | **Coverage** |
| ----------------- | ---------- | ------------ |
| Accordion         |            | 0%           |
| App bar           | Yes        | 95.5% ✅     |
| Avatar            |            | 0%           |
| Badge             | Yes        | 48%          |
| Banner            | Yes        | 41.8%        |
| Button            | Yes        | 37.5%        |
| Checkbox          | Yes        | 28.6%        |
| Chips             |            | 0%           |
| Combobox          |            | 0%           |
| Content card      |            | 0%           |
| Dialog            | Yes        | 32%          |
| Divider           |            | 48.9%        |
| Dropdown          |            | 0%           |
| Flag              | Yes        | 47.3%        |
| Icon              |            | 36.1%        |
| Input             |            | 0%           |
| Link              |            | 51.8%        |
| Navigation drawer | Yes        | 100% ✅      |
| Panel             |            | 0%           |
| Progress          | Yes        | 13%          |
| Radio             | Yes        | 60.5%        |
| Section message   | Yes        | 54%          |
| Select            |            | 0%           |
| Switch            |            | 0%           |
| Tab bar           | Yes        | 68.5%        |
| Tabs              | Yes        | 39.4%        |
| Toggle            |            | 0%           |

## 5.1.0 (2024-01-22)

### Breaking Changes 5.1.0

- **App level theming**: Users can input their customized theme on app level using switchTheme()

### Features 5.1.0

- Input content update
- Demo app theme switch button

### Bug fixes 5.1.0

- Progress design review fix
- Navigation Drawer design review fix

### Testing 5.1.0

- AppBar unit and widget testing

## 5.0.1 (2023-12-26)

### Bug Fixes 5.0.1

- Progress design review fix
- Navigation Drawer design review fix
- Chip design review fix

### Features 5.0.1

- Chip content update

## 5.0.0 (2023-12-12)

### Breaking Changes 5.0.0

- **Icon library name update**: The name of the library is changed from visa_nova_flutter_icon to visa_nova_icons_flutter
- **Icon name update**: The name of each icon has been changed!! In the previous versions of icon library, we used '', '1', and '2' to represent Tiny, Low, and High for the size. However, to align with our web libraries, we decided to change the naming of icons. For example, `VIcons.success` -> `VIcons.successTiny`; `VIcons.success1` -> `VIcons.SuccessLow`; `VIcons.success2` -> `VIcons.SuccessHigh`
- **Generic icons**: Visa Nova Generic Icons has been added to the icon library

Here are two examples of using the new icons in your project

```dart
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:flutter/material.dart';

class MyVisaIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: VIcon(
        svgIcon: VIcons.successHigh,
        iconColor: VColors.positiveGraphics,
      ),
    );
  }
}

class MyGenericIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: VIcon(
        svgIcon: VIconsGeneric.launchTiny,
      ),
    );
  }
}
```

## 4.1.0 (2023-12-11)

### Breaking Changes 4.1.0

- **Flutter SDK upgrade**: Now the library is compatible with the latest Flutter SDK version 3.16.3
- **Font update on library**: Visa Dialect UI font has replaced Visa Dialect font in the library

### Features 4.1.0

- Link content update

### Bug Fixes 4.1.0

- Progress design review
- Navigation Drawer design review
- ListItem community support, now component has a new height argument
- Accordion and copy code button a11y update

## 4.0.0 (2023-11-14)

### Breaking Changes 4.0.0

- **Button Theme Update**: A major update/refactor on visa_button (`VButton`) theming that aligns with current `ThemeExtension` method

  - Property `buttonText` -> `child`
    - It is more flexible for users to decide what to put inside of a button
  - Property `buttonType` removed
    - By default the button comes with Nova primary button, it is more flexible for users to customize them
  - Property `buttonStyle` -> `style`; `VButtonStyle()` added into style

    - Now users can style buttons using `VButtonStyle` properties without knowing how to deal with `MaterialState`:

      | **Name**                  | **Type**    | **Default**       | **Description**                                              |
      | ------------------------- | ----------- | ----------------- | ------------------------------------------------------------ |
      | `backgroundColorDisabled` | Color?      | disabled          | Background fill color while `onPressed` action is null       |
      | `backgroundColorActive`   | Color?      | active            | Background fill color while there is any `onPressed` action  |
      | `foregroundColorDisabled` | Color?      | surface1          | Button's child color while `onPressed` action is null        |
      | `foregroundColorActive`   | Color?      | surface1          | Button's child color while there is any `onPressed` action   |
      | `overlayColorPressed`     | Color?      | activePressed     | Color when button is pressed                                 |
      | `overlayColorFocused`     | Color?      |                   | Color when button is focused                                 |
      | `shadowColor`             | Color?      | transparent       | The shadow color of the button                               |
      | `elevation`               | double?     | 0.0               | The elevation of the button                                  |
      | `borderRadiusActive`      | double?     | 8.0               | Button's border radius while there is any `onPressed` action |
      | `borderRadiusDisabled`    | double?     | 8.0               | Button's border radius while `onPressed` action is null      |
      | `minimumSize`             | Size?       | const Size(0, 46) | The minimum size of the button itself (width, height)        |
      | `borderSideActive`        | BorderSide? | BorderSide.none   | Button border while there is any `onPressed` action          |
      | `borderSideDisabled`      | BorderSide? | BorderSide.none   | Button border while `onPressed` action is null               |

  - Demo app button updates

    - Users can now view our latest code snippets of `VButton()` in demo app

      - `VButton()` example

        ```Dart
        VButton(
        child: Text(
            "Continue",
            style: defaultVTheme.textStyles.buttonMedium.copyWith(
            color: VColors.defaultActive,
            ),
        ),
        // Nova Secondary theme
        style: const VButtonStyle(
            backgroundColorActive: VColors.transparent,
            backgroundColorDisabled: VColors.transparent,
            foregroundColorActive: VColors.defaultActive,
            foregroundColorDisabled: VColors.disabled,
            overlayColorFocused: VColors.defaultSurfaceLowlight,
            overlayColorPressed: VColors.defaultSurfaceLowlight,
            borderSideActive: BorderSide(
            color: VColors.defaultActive,
            style: BorderStyle.solid,
            ),
            borderSideDisabled: BorderSide(
            color: VColors.defaultDisabled,
            style: BorderStyle.solid,
            ),
        ),
        onPressed: () {},
        );
        ```

      - `VIconButton()` example

        ```Dart
        VIconButton(
          // Secondary theme
          style: const VButtonStyle(
            minimumSize: Size(46, 46),
            backgroundColorActive: VColors.transparent,
            backgroundColorDisabled: VColors.transparent,
            foregroundColorActive: VColors.defaultActive,
            foregroundColorDisabled: VColors.disabled,
            overlayColorFocused: VColors.defaultSurfaceLowlight,
            overlayColorPressed: VColors.defaultSurfaceLowlight,
            borderSideActive: BorderSide(
              color: VColors.defaultActive,
              style: BorderStyle.solid,
            ),
            borderSideDisabled: BorderSide(
              color: VColors.defaultDisabled,
              style: BorderStyle.solid,
            ),
          ),
          onPressed: () {},
          icon: const VIcon(
            svgIcon: VIcons.shareTiny,
            iconColor: VColors.defaultActive,
          ),
        ),
        ```

- **VButtonIcon removed**: `VButtonIcon()` is now merged into `VButton`. To view the usage, see demo app examples' code snippet
- **Demo**: Updated Code display component to contain copy button text
- **Git Tag**: Git tag is now added to each release

### Bug Fixes 4.0.0

- Chip design review

## 3.4.1 (2023-10-31)

### Breaking Changes 3.4.1

- **Icon library minor update**: There was a minor update on icon library (2.0.1) that fixed some color issues of demo app
- **Design review**: Chip is now ready to be reviewed again
- **Web build fix**: Fixed combobox issue on web build

## 3.4.0 (2023-10-24)

### Breaking Changes 3.4.0

- **Flutter SDK upgrade**: Now the library is compatible with the latest Flutter SDK version 3.13.8
- **Docs API**: Added code parser cli to generate docs api

## 3.3.0 (2023-10-18)

### Breaking Changes 3.3.0

- **Design and A11y reviews**: 13 components are now ready to be reviewed again
- **Theme variable**: Fixed theme variables in library to be compatible with Flutter 3.13.7

### Bug Fixes 3.3.0

- Avatar design review
- Chip design review
- Input design review
- Progress design review
- Panel design review
- ToggleButton design review
- Badge design review
- Combobox design review
- TabBar a11y review
- Dialog a11y review
- Banner a11y review
- Flag a11y review
- Avatar a11y review

## 3.2.0 (2023-09-25)

### Breaking Changes 3.2.0

- **New components**: Panel, combobox, and progress are now available in visa_nova_flutter library!
- **Release update**: Now latest version of visa_nova_flutter will be merged into main branch before release!

### Features 3.2.0

- Panel dev complete
- Combobox dev complete
- Progress dev complete

## 3.1.0 (2023-09-05)

### Breaking Changes 3.1.0

- **visa_nova_flutter:** check out out new library name that aligns with Nova!
- **visa_nova_flutter_icon:** also check out our new icon library name, too!
- **New components:** Toggle, navigation drawer, and badge are now available in visa_nova_flutter library!

### Features 3.1.0

- Toggle dev complete
- Navigation drawer dev complete
- Badge dev complete

### Chores 3.1.0

- Refactored library that all imports are aligned with visa_nova_flutter and visa_nova_flutter_icon

## 3.0.1 (2023-08-22)

### Breaking Changes 3.0.1

- **routing:** added routing to demo app web build
- **chip:** added chip component to vpds-flutter library
- **a11y:** fixed content card and input a11y issues

### Features 3.0.1

- feat(demo): added Changelog section in getting started VDS-4416
- feat: Added flutter routing
- feat: Gave each page a custom title
- feat: updates favicon
- feat: removing the "#" from flutter web url
- feat: added VChips properties
- feat: added theming capability to chips component
- feat: Created VChips Component
- feat: Updated display code
- feat: Created Chips page and added chips variants
- feat: Added Chips component to components list
- feat(Toggle): Added toggle component
- feat(Toggle): Added toggle component to list and created route - Created Toggle component

### Bug Fixes 3.0.1

- fix(release): fixed web title VDS-4416
- fix: code display update
- fix:- fix: component review fix
- fix: touch target area for close button a11y
- fix: code clean up
- fix: input touch target area a11y
- fix(accordion): removed unwanted "//"
- fix(Switch): removed unwanted background rectangular splash
- fix(content card): a11y review fix
- fix(content card): applied a111y review fix. VPDS-4597
- fix(input): a11y review fix
- fix(input): code corrected
- fix(input): updated code to reflect label color and border color when character count goes above
- fix: Android build fix
- fix: remove pubspec lock

## 3.0.0 (2023-07-03)

### Breaking Changes 3.0.0

- **flutter:** upgraded flutter sdk version to channel stable, 3.7.12
- **theming:** added theming to all components and is controlled by one theme file; components are now customizable in color, typography, spatial, shape, and size

### Features 3.0.0

- feat(theme): customized AppBar theme VDS-4820
- feat(theme): added AppBar custom theme VDS-4820
- feat(theme): finished initial theme design for AppBar VDS-4820
- feat(theme): updated new approach to theming VDS-4820
- feat: Applied new theming methodology to link component
- feat: Updated Accordion theming
- feat(theme): Updated the theming for Avatar
- feat: Updated display code
- feat(Divider): Refactored code using new theming method
- feat(theme): modified AppBar theme, added banner theme as example of message theme VDS-4820
- feat(theme): finished theming for all message components VDS-4820
- feat(theme): refactored checkbox; merged 3 checkbox files together VDS-4820
- feat(theme): refactored radio to current theming approach VDS-4820
- feat:(Select)- added adaptive theming to component and updated Theme to contain "transparent" color
- feat:(Switch) added adaptive theming to VSwitch component
- feat(theme): refactored BottomNavBar with theme control VDS-4820
- feat: (content card)- added adaptive theming to VContentCard component
- feat:(ListItem)- added adaptive theming to VListItem component
- feat(theme): finished refactor of TabBar theme VDS-4820
- feat(theme): refactored button with new theming and all buttons in demo app VDS-4820
- feat(theme): removed old theme and refactored checkbox and radio with new theme VDS-4820
- feat(grinder): updated code segments VDS-4820
- feat(Dropdown): WIP Theming
- feat(input): added adaptive theming to VInput component- Updated code display
- feat(theme): fixed button theme VDS-4820
- fix(link,flag): fixed type and error VDS-4820
- feat(code-segments): updated code segments VDS-4820
- feat(VDropdown):added adaptive theming to VDropdown component \* Updated code display
- feat(GA4): added google tag on this page VDS-4820

### Bug Fixes 3.0.0

- fix(VIcon): SVG update fix
- fix(AppBar): fixed theme extension naming VDS-4820
- fix: left proper commenting on progressing work
- fix(ListItem): removed unwanted piece of code
- fix(demo): fixed code segment error VDS-4820
- fix(demo): added notation on vertical tab VDS-4820
- fix(VLink): fixed typo
- fix(accordion): removed residual VColors from component
- fix(theme): added .0 to all doubles in theme_extension file VDS-4820

## 2.1.0 (2023-05-08)

### Features 2.1.0

- feat(nova-icon): added homepage in pubspec.yaml; added usage instruction in README VDS-4740
- feat(nova-icon): added README VDS-4740
- feat(nova-icon): removed unnecessary dependency VDS-4740
- feat(nova-icon): created a class for Nova Icons, created Wiki for icon testing, removed assets using strings VDS-4740
- feat(icon): resumed code after testing VDS-4740
- feat(icon): testing icons VDS-4740
- feat(icon-library): prepared for icon library VDS-4740
- feat(icon-library): added an icon library in vpds-flutter repo VDS-4740
- feat(avatar): updated get height function
- feat(avatar): updated code based on review
- feat(avatar): fixed bool based on review
- feat(avatar): Added code to show code snippet
- feat(avatar): updated talk back behavior
- feat(avatar): Updated code display'
- feat(avatar): added image tag to semantic
- feat(avatar): added avatar variants
- feat(avatar): added avatar component to export and extracted component
- feat(avatar): added svg and image
- feat(avatar): Added vertical avatar component
- feat(avatar): Created a new avatar component
- feat(avatar): Added a new component to the home page
- feat(demo): moved visa.svg to demo app asset; changed icon in main and link VDS-4783
- feat(accordion): refactored icon part of accordion VDS-4783 - feat(accordion): refactored icon part of accordion VDS-4783
- feat(app-bar): refactored icons in app-bar; changed account-1 icon to match design VDS-4783
- feat(app-bar): finished app-bar icon refactor VDS-4783
- feat(avatar): refactored icons in avatar VDS-4783
- feat(banner): refactored banner icon VDS-4783
- feat(button): refactored icons in button; updated icon in library VDS-4783
- feat(checkbox): refactored icons in checkbox VDS-4783
- feat(content-card): refactored icons in content card VDS-4783
- feat(dialog): refactored dialog icons VDS-4783
- feat(dropdown): refactored dropdown menu icons VDS-4783
- feat(flag): refactored icons in flag VDS-4783
- feat(input): partially refactored input VDS-4783
- feat(link): refactored icons in link VDS-4783
- feat(list-item): refactored icons in list-item VDS-4783
- feat(radio): refactored icons in radio VDS-4783
- feat(section-message): refactored icons in section message VDS-4783
- feat(select): refactored icons in select VDS-4783
- feat(tabs): refactored icons in horizontal and stacked tabs VDS-4783
- feat(tab-bar): refactored icons in tab-bar VDS-4783
- feat(input): refactored icons in input VDS-4783
- feat(demo): updated code segments
  refactor(vpds-flutter): replaced VIcon with new VIcon VDS-4783
- feat(input): updated per Vipins comment VDS-4783
- feat(vpds-flutter): removed assets/icons folder VDS-4783

### Bug fixes 2.1.0

- fix(input): updated code display
- fix(input): updated scrollbar color
- fix: system file update
- fix(input): Scrollbar fix and a11y "required" UI change
- fix: file system
- fix(avatar): system name update
- fix(avatar): system name update
- fix: flutter file update
- fix: updated "link" dependency

### Release 2.1.0

- release(nova-flutter): released 1.0.2
- release(vpds-flutter): released vpds-flutter 2.1.0 VDS-4783

## 2.0.0 (2023-04-26)

### Features 2.0.0

- refactor(vpds-flutter): refactored all variable names from Visa... to V...

## 1.0.2 (2023-04-25)

### Bug fixes 1.0.2

- fix(input): updated code based on review
- fix(input): updated code based on review
- fix(input): updated component minimum height and fixed padding issue
- fix(input): Updated variants to stateless component and updated code display
- fix(input): Fixed input line alignment
- fix(input): updated code display
- fix(input): updated code fix OTP formatting and fit
- fix(input): updated variants to reflect design changes
- fix(input): updated trailing icon color code, updated code to account for trailing icon to appear on focus
- fix(input): updated svg images
- fix(tab-bar): fixed index announce problem without refactoring VDS-3576
- fix(select):updated component
- fix(select): updated code display, updated variants to match a11y review

## 1.0.1 (2023-04-17)

### Bug fixes 1.0.1

- fix(dialog): formatted some lines VDS-3582
- fix(dialog): removed x button on top right VDS-3582
- fix(dialog): added semantics label to close button on top VDS-3582
- fix(dialog): fixed a11y scanner issue VDS-3582

## 1.0.0 (2023-04-05)

### Bug fixes 1.0.0

- fix(dropdown menu): updated component width
- fix(dropdown menu): updated semantic TalkBack
- fix(list item): Semantic header fix
- fix(list item): code clean up and code display update
- fix(list item): Updated variant to express a11y concerns

## 0.21.10 (2023-04-04)

### Bug fixes 0.21.10

- fix(checkbox): fixed validation checkbox semantics issue VDS-3151

## 0.21.9 (2023-04-03)

### Bug fixes 0.21.9

- fix(select): updated color state
- fix(content card): updated component based on review
- fix(content card): updated variant examples
- fix(content card): updated variant examples as per design review
- fix(content card): Updated component
- fix(content card): updated code display
- fix(content card): renamed component to Vlink and updated svg
- fix(section-message): fixed announcement issue; focus area issue; sentence case VDS-3584

## 0.21.8 (2023-03-31)

### Bug fixes 0.21.8

- fix(list item): updated based on review
- fix(list item): updated code display
- fix(list item): updated variants to reflect a11y changes
- fix(list item): updated variant and updated component
- fix(list item): removed disable / enable button
- fix(flag): added button label to close icon VDS-3587
- fix(flag): fixed TalkBack on close icon VDS-3587
- fix(banner): fixed TalkBack focus and announcement VDS-3578
- fix(banner): fixed case issue VDS-3578
- fix(banner): added button label to close icon VDS-3578

## 0.21.7 (2023-03-30)

### Bug fixes 0.21.7

- fix(tabs): fixed label text color; changed name from VTab to VTab VDS-3346
- fix(dialog): removed nullable variable VDS-3581
- fix(dialog): fixed title padding VDS-3581
- fix(List item): updated based on PR
- fix(list item): updated name and code to reflect PR change
- fix(list item): updated code based on PR
- fix(list item): updated code display
- fix(list item): updated variant to so proper example
- fix(list item): Updated component to accommodate new state
- fix(list item): updated variant to accommodate new variable
- fix(list item): updated code display
- fix(list item): Updated code display
- fix(list item): updated variant based on design review
- fix(list item): Updated changes requested by design to checkbox variant
- fix(list item): Updated variant with better quality image and appropriate typography token
- fix(list item): Adjusted padding to trailing icon as suggested by design
- fix(list item): optimized the variant code
- fix(accordion): code fix
- fix(accordion): updated code display
- fix(accordion): Updated variant based design
  fix:Updated text style token based on design
- fix(accordion): updated component based on design review
- fix(select): code fix
- fix(select): code display update
- fix(select): updated code to accommodate error state
- fix(select): WIP
- fix(input): code clean up
- fix(input): updated component with new arguments, border color control and state
- fix(input): updated variants examples, updated assets used
- fix(input): updated code display
- fix(input): updated assets
- fix(dropdown menu): component refactor
- fix(dropdown menu): refactored variants
- fix(dropdown menu): updated code display
- fix(dropdown): WIP
- fix(dropdown): Code refactor
- fix(dropdown): Updated naming to reflect component
- fix(select): Updated class names
- fix(accordion): adjusted icon height to match row
- fix: Text style token update
- fix(accordion): line height fix
- fix(dropdown_menu): WIP
- fix(dropdown_menu): WIP
- fix(dropdown_menu): Fixed color state for text button
- fix(dropdown_menu): updated code to fix pressed state for Icon Button
- fix(link): Updated variant- removed unneeded example
- fix(dropdown_menu): WIP
- fix(dropdown menu): typo fix
- fix(dropdown menu): updated code to reflect enabled / disabled state of component
- fix(dropdown menu): fixed talk back label on component
- fix(dropdown menu): updated variant headers as per a11y review

## 0.21.6 (2023-03-20)

### Bug fixes 0.21.6

- fix(flag): optimized per Vipins comment VDS-3586
- fix(flag): added persistent examples VDS-3586
- fix(flag): slightly repositioned close button VDS-3586
- fix(flag): added examples with button VDS-3586
- fix(flag): added examples with title VDS-3586
- fix(flag): updated default examples VDS-3586
- fix(flag): refactored Visa Flag and changed naming to VFlag VDS-3586
- fix(dialog): added announcement of content in dialog; now close button is focusable VDS-3582
- fix(checkbox): updated code segments VDS-3344
- fix(checkbox): added fillColor as a property of checkbox listtile for theming it later VDS-3344
- fix(checkbox): fixed color issue VDS-3344
- fix(checkbox): refactored VCheckbox to VCheckbox VDS-3344
- fix(accordion): updated code based on peer review
- fix(select): Updated component to support inline select
- fix(select): Created new inline variant
- fix(select): updated code display
- fix(select): refactored code
- fix(select): removed unwanted code
- fix(Select): Updated code display
- fix(Select): code clean up
- fix(select): code display clean up
- fix(select): Code clean up
- fix(select): Updated code display
- fix(select): code clean upi
- fix(select): updated variants to reflect changes made to component
- fix(select): refactored and created new variants of VSelect
- fix(select): cleaned up amd refactored code to accommodate design review
- fix(select): WIP
- fix(select): Updated variants to reflect refactored component
- fix(select): WIP
- fix(select) border fix
- fix(select): updated argument
- fix(accordion): updated code based on
- fix(accordion): code display update
- fix(Accordion): Updated variants and adjusted colors based on component state
- fix: Updated text style based on design
- fix(accordion): Updated border color based on accordion state
- fix(Accordion): Updated name to VAccordion
- fix: Added version number on mobile home page for ease of referencing
- fix(UI Dialect): Updated UI dialect as suggested by design
- fix(accordion): Updated name change
- fix(accordion): Updated name change from "Visa" to "V"
- fix(banner): updated code segments VDS-3577
- fix(banner): refactored banner and fixed content per designs request VDS-3577
- fix(banner): added persistent examples VDS-3577
- fix(banner): added examples with button VDS-3577
- fix(banner): added examples with title VDS-3577
- fix(banner): added default examples VDS-3577
- fix(banner): updated demo page structure for all examples VDS-3577
- fix(banner): fixed the issue that previously triggered banner persists VDS-3578
- fix(banner/flag/section-message): fixed touch target area of link in those components VDS-3578
- fix(tab-bar): updated code segments VDS-3575
- fix(tab-bar): added highlight color to tab-bar VDS-3575
- fix(section-message): added string interpolation VDS-3584
- fix(section-message): fixed redundant code VDS-3584
- fix(section-message): fixed announcement issue VDS-3584
- fix(dialog): fixed code per Vipins comment VDS-3581
- fix(dialog): formatted code VDS-3581
- fix(dialog): button now hugs its contents VDS-3581
- fix(dialog): fixed title line height VDS-3581
- fix(app-bar): updated code segments VDS-3608
- fix(app-bar): reduced elevation; made hamburger as default leading VDS-3608
- fix(tab-bar): remove TalkBack reading tablist VDS-3576
- fix(tabs): modified code VDS-3346
- fix(theme): fixed theme per Vipins comments VDS-3346
- fix(tab): fixed tab label; updated code segments VDS-3150
- fix(s-tab): fixed color and font VDS-3346
- fix(s-tab): fixed pressed color and icon VDS-3346
- fix(h-tab): fixed pressed color and theming VDS-3346
- fix(h-tab): fixed label font VDS-3346
- fix(h-tab): fixed indicator color and text color VDS-3346
- fix(tabs): removed unnecessary code in h-tab v-tab VDS-3346
- fix(tabs): fixed icon issue VDS-3346
- fix(accordion): updated code display
- fix(accordion): removed unwanted example as requested by a11y
- fix(accordion): rearranged talk back read out to accommodate badge status
- fix(accordion): rearranged reading order as per a11y review
- fix(accordion): updated code to reflect design review

## 0.21.5 (2023-03-13)

### Bug fixes 0.21.5

- fix(banner): optimized code per Vipins instruction VDS-3577
- fix(banner): optimized code VDS-3577
- fix(banner): removed unnecessary code VDS-3577
- fix(banner): fixed close button - text padding VDS-3577
- fix(banner): fixed line height and close button state VDS-3577
- fix(banner): fixed link and action padding; icon colors VDS-3577
- fix(banner); fixed InfoGraphics and InfoText color code; fixed sentence case in Link VDS-3577
- fix(banner): fixed link font VDS-3577
- fix(banner): fixed link padding VDS-3577
- fix(switch): colors fix
- fix(switch): Updated switch disabled color based on design review
- fix(banner): completely refactored banner and fixed TalkBack order issue VDS-3577
- fix(banner): testing refactored banner VDS-3577
- fix(section-message): fixed per Vipins comment VDS-3583
- fix(section-message): fixed examples order by severity VDS-3583
- fix(section-message): added persistent examples to demo VDS-3583
- fix(section-message): added with button examples VDS-3583
- fix(section-message): added examples with title VDS-3583
- fix(section-message): fixed all default examples VDS-3583
- fix(section-message): refactored section message code; fixed semantics focus issue VDS-3583
- fix(section-message): fixed some coding structure; fixed close icon behavior VDS-3583

## 0.21.4 (2023-03-06)

### Bug fixes 0.21.4

- fix(accordion): Updated code display
- fix(accordion): Updated text style to match design review
- fix(accordion): Updated component based on design review
- fix(accordion): Updated variant to show new variant with badge and leading icon
- fix(accordion): Fixed leading icons color issue
- fix(accordion): Updated component to adapt leading icon color and fix border color
- fix(accordion): Added sg badge
- fix(accordion): Updated code display
- fix(accordion): Updated component to announce the state of the component when it gets accessibility focus
- fix(accordion): Updated accordion variant
- fix(accordion): Updated header labels according to a11y
- fix(accordion): Updated subtle variant text colors
- fix(accordion): Updated headers to semantic headers
- fix(top-app-bar): updated snippets VDS-3608
- fix(top-app-bar): fixed padding issues VDS-3608
- fix(top-app-bar): changed app bar height; changed elevation to small(2)
- fix(top-app-bar): fixed interaction states for all icons VDS-3608
- fix(top-app-bar): removed unnecessary code VDS-3608
- fix(top-app-bar): added alt boolean to control colors VDS-3608
- fix(top-app-bar): added all variations according to Figma VDS-3608
- fix(top-app-bar): added new example VDS-3608
- fix(top-app-bar): fix icon constants and added more examples VDS-3608
- fix(top-app-bar): updated code snippets VDS-3609
- fix(top-app-bar): fixed missing heading issues VDS-3609
- fix(top-app-bar): added app bar view title VDS-3609
- fix(top-app-bar): fixed icon labels VDS-3609
- fix(content card): Updated svg image
- fix(content card): updated code display
- fix(content card): updated code to align with design review and added new variants
- fix(content card): Updated code display
- fix(content card): added svg images
- fix(content card): Updated code display
- fix(content card): Added new images and svgs
- fix(divider): Added new parameter to divider
- fix(content card): Added new icons to variants
- fix(link): Code optimized based on code review
  updated git ignore
- fix(link): updated component based on code review
- fix(link): Updated system files
- fix(link): updated link based on a11y review
- fix(link): Updated code display
- fix: Updated system files
- fix(link): Removed unwanted link variant
- fix(link): Increased link touch area
- fix(link): Removed unwanted link variant
- fix: updated file changes
- fix(content card): updated code display
- fix(content card): updated content card variant
- fix(content card): Updated variant based on a11y review
- fix(link): Updated code to fix semantic label bug
  updated git ignore
- fix(link): updated link component based on design review
- fix(link): Updated style to body 2 medium
- fix(switch): updated component based in design review
- fix(switch): Updated switch variant examples and modified headers to align with a11t review
- fix(switch): updated code display

## 0.21.3 (2023-02-27)

### Bug fixes 0.21.3

- fix(radio): update snippets before merging VDS-3343
- fix(radio): fixed padding of group radio VDS-3343
- fix(radio): fixed error icon color and size VDS-3343
- fix(radio): fixed outer radius issue VDS-3343
- fix(checkbox): fixed one overlooked color issue VDS-3344
- fix(checkbox): fixed group padding and label padding VDS-3344
- fix(checkbox): fixed label text padding and messaging top padding VDS-3344
- fix(checkbox): fixed error message icon size and color VDS-3344
- fix(checkbox): fixed border color and fill color VDS-3344
- fix(flag): updated snippets before merging VDS-3586
- fix(flag): removed unnecessary code per Vipin's comments VDS-3586
- fix(flag): fixed content of flags; fixed colors of flags VDS-3586
- fix(flag): fixed icon padding issue and close button padding issue VDS-3586
- fix(flag): fixed border curve and color issue VDS-3586
- fix(flag): fixed text style; fixed close button pressed state VDS-3586
- fix(flag): added hasLink and its actions; added examples per designs request VDS-3586
- fix(flag): changed flag in demo to VSnackBar VFlag VDS-3586
- fix(flag): created visa_material widget for customizing flag VDS-3586
- fix(flag): fixed flag layout; added action and made title optional; fixed icon size VDS-3586
- fix(flag): removed all anchored, full-width version of flags; updated code snippets VDS-3586
- fix(flag): fixed icon in flag VDS-3586
- fix(input): Updated code to display nee variants
- fix(input): Generated new display code for Code display
- fix(input): cleaned up code for PR
- fix(input): Fixed naming
- fix(input): Updated component to match design on input text style
- fix(input): Updated component to match design review
- fix(input): Updated component to support design review
- fix(input): Updated code for code display
- fix(input): Added new variants of input field
  updated pubspec.lock
- fix(input): added new svg icon
- fix(banner): merged sized box per Vipins comment VDS-3577
- fix(banner): fixed colors per designs request VDS-3577
- fix(banner): fixed splash color issue VDS-3577
- fix(banner): added more banner examples VDS-3577
- fix(banner): fixed the alignment issue; fixed icon issue; fixed snippet issue VDS-3577
- fix(banner): made action and title not required; added hasAction/Link/Title for variation of banners VDS-3577
- fix(banner): removed examples of banners without close button, made close button default VDS-3577
- fix(banner): corrected name of banner VDS-3577
- fix(flag): fixed close icon semantics issue VDS-3587
- fix(flag): fixed the issue that close icon is not selectable in TalkBack VDS-3587
- fix(flag): added semantics header to flag examples VDS-3587
- fix(radio): updated code snippets before merging VDS-3152
- fix(radio): added required legend to field VDS-3152
- fix(banner): now forcing TalkBack to focus on Banner when triggered VDS-3578
- fix(banner): fixed multiple banners issue VDS-3578
- fix(banner): fixed TalkBack issue on close icon VDS-3578
- fix(banner): fixed issue of having button to turn on/off banners, now buttons will only show but not hide banners VDS-3578
- fix(checkbox): updated code snippets VDS-3151
- fix(checkbox): fixed required field label issue VDS-3151
- fix(tab-bar): fixed code per vipins comments VDS-3576
- fix(tab-bar): In semantics, the tab-bar is announced as a tab list and each item; when item is selected it will be announced too VDS-3576
- fix(list item): Updated code to support ally review
- fix(list item): Updated code to fix radio, add proper padding between elements, updated color and added new component variant
- fix(list item): Updated code display example
  added asset for list item example
- fix(radio): Aligned component
- fix(list item): Added splash color argument to component
- fix(list item): Updated component to support custom border radius and custom splash color
- fix(list item): Updated variant to show design changes
- fix(list item): Updated component to accommodate custom padding and icon
- fix(list item): Updated color of component in list item
- fix(switch): Added padding to switch component
- fix(input): updated code viewer
- fix(input): Updated Variant
- fix(input): updated code display
- fix(input): Updated input label names and needed ally review and updated icon
- fix(input): Updated variant names based on ally review
- fix(input): Added trailing semantic label to argument

## 0.21.2 (2023-02-17)

### Bug fixes 0.21.2

- fix(dialog): updated code snippets before merging VDS-3581
- fix(gradle): added gradle files to gitignore VDS-3581
- fix(dialog): fixed success, error, and warning dialog icon colors VDS-3581
- fix(dialog): fixed success dialog button variant VDS-3581
- fix(dialog): activated dialog X button VDS-3581
- fix(dialog): updated dialog code snippets before merging VDS-3584
- fix(gradle): ignored build.gradle VDS-3584
- fix(section-message): fixed string naming VDS-3584
- fix(section-message): added string variables to constant file VDS-3584
- fix(section-message): changed trigger element of section-message from link to button; button labels change by its state VDS-3582 VDS-3921
- fix(section-message): fixed the issue that section-message does not announce to TalkBack when visible VDS-3582 VDS-3922
- fix(section-message): added some spacing between widgets
- fix(section-message): added label to close button, section message does not gte auto-closed after toggle TalkBack; added section message content VDS-3920 VDS-3584
- fixed(manifest): added file
- fix(select): Updated code based on PR
- fix(select): Select options announce "in list" when talk back is on
- fix(ignore): added to git ignore
- fix(android): system files
  test push
- fix(select): reads selected list item as checked
- fix(android): Added files to git ignore
  added core files to gitignore
- fix(select): Removed unused code
- fix(Select): Added an accessibility focusnode to a Select component variants for validation
- fix(select): Added focus node parameter for when validation is required
- fix(Select): _Added spacing between widgets for aesthetics_ Updated Select label per a11y review
- fix(Select): Removed switch as suggested by a11y
- fix(select): \* Added semantic header to variants
- fix(demo): fixed version number of demo app VDS-3583
- fix(button): removed unnecessary property width VDS-3583
- fix(section-message): updated code segments; fixed version number error VDS-3583
- fix(button): fixed button border width VDS-3583
- fix(section-message): made description the only required in section message; added default value to title; added title in withButton examples VDS-3583
- fix(section-message): extracted all widgets in section message, updated code segments VDS-3583
- fix(section-message): added examples of section message with/without Button VDS-3583
- fix(section-message): added iconFit property to VIcon; changed layout of section message per design's request VDS-3583
- fix(section-message): made X button as optional VDS-3583
- fix(section-message): fixed icon size to 24 VDS-3583
- fix(section-message): updated error icon; fixed gradle error VDS-3583
- fix(switch): Refactor based on PR
- fix(switch): code clean up
- fix(switch): Updated code to support on pressed state and adjust tag width
- fix(tab-bar): removed duplicated gitignore; modified code per Vipin's comment VDS-3575
- fix(tab-bar): added local.properties to gitignore VDS-3575
- fix(tab-bar): changed local.properties to mine VDS-3575
- fix(tab-bar): removed unnecessary code of border width VDS-3575
- fix(tab-bar): fixed icon variation and opacity VDS-3575
- fix(tab-bar): fixed issue on tab bar top border VDS-3575
- fix(tab-bar): fixed height of tab bar to 85 VDS-3575
- fix(link): Code cleanup
- fix(link): Updated code to meet design review

### Release 0.22.0

- release(0.22.0): updated for release VDS-4341

## 0.21.1 (2023-02-01)

### Breaking Changes 0.21.1

- Upgraded to Flutter 3.3.10!
- Optimized demo app page routing
- Updated README.md and CONTRIBUTING.md

### Bug fixes 0.21.1

- Fixed design issues of: Dialog, Button, Switch
- Fixed A11y issues of: Link, Dialog, Switch

## 0.21.0 (2022-12-19)

### Breaking Changes 0.21.0

- Nova Flutter alpha release!
- Updated demo app UI
- Added code snippets for all demo widgets
- Added "Getting Started page"

## 0.20.0 (2022-11-14)

### Features 0.20.0

- Added components to Nova Flutter library: Content Card, List Item

## 0.18.0 (2022-11-10)

### Features 0.18.0

- Added components to Nova Flutter library: Tab Bar, App Bar, Dropdown Menu
- Updated: Divider, Web build, Version number to reflect the widget build

### Bug fixes 0.18.0

- Fixed design issues of: Button, Select
- Fixed A11y issues of: Button, Checkbox

## 0.0.5 (2022-10-25)

### Features 0.0.5

- Added 3 components to vpds Flutter library: Switch, Accordion, Divider

### Bug fixes 0.0.5

- Fixed design issues of: Checkbox
- Fixed A11y issues of: Radio

## 0.0.4 (2022-10-13)

### Bug fides 0.0.4

- Fixed design issues of: Radio, Input

## 0.0.3 (2022-10-05)

### Features 0.0.3

- Added 4 components to vpds Flutter library: Banner, Dialog, Flag, Section Message

### Bug fixes 0.0.3

- Fixed design and A11y issues of: Button, Link

## 0.0.2 (2022-08-03)

### Features 0.0.2

- Added 5 components to vpds library: Select, Tab, Checkbox, Radio, Input

## 0.0.1 (2022-06-15)

### Features 0.0.1

- Refactored vpds-flutter to Flutter package. Supporting button and link.
