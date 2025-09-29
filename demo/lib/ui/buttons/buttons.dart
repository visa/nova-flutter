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
// Visa Nova Flutter Demo Button Page
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:visa_nova_flutter/shared/themes/themes.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

const buttonHGap = SizedBox(
  width: 6.5,
);
const buttonVGap = SizedBox(
  height: 2.5,
);

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  final String shareIcon = 'share-icon.svg';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    setPageTitle('Buttons', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(
            globalKey: _key, title: "Buttons"), //CustomAppBar(_key, "Buttons"),
        drawer: const MyDrawer(pageTitle: "Buttons"),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// Primary Buttons
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SemanticHeader(
                          title: "Primary text buttons",
                          style: defaultVTheme.textStyles.headline2.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? VColors.defaultTextDark
                                  : VColors.defaultText)),
                      smallHeight(),
                      const SemanticHeader(
                        title: "Default primary text button",
                      ),
                      smallHeight(),
                      const VButtonPrimary(),
                      smallHeight(),
                      const ShowCodeAccordion(
                        codeSegment: CodeSegments.VButtonPrimary,
                        componentName: 'Button',
                        exampleName: 'Primary_Text_Button',
                        copyLabel: "Primary text button",
                      ),
                      const Divider(),
                      const SemanticHeader(
                        title: "Alternate primary text button",
                      ),
                      smallHeight(),
                      CustomPaint(
                        painter: CheckeredPatternDark(),
                        child: const SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: VButtonPrimaryAlt(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      largeHeight(),
                      smallHeight(),
                      const ShowCodeAccordion(
                        codeSegment: CodeSegments.VButtonPrimaryAlt,
                        componentName: 'Button',
                        exampleName: 'Alternate_Primary_Text_Button',
                        copyLabel: "Alternate primary text button",
                      ),
                      const Divider(),
                      const SemanticHeader(
                        title: "Primary text button with leading icon",
                      ),
                      smallHeight(),
                      VButtonPrimaryIconLeading(shareIcon: shareIcon),
                      smallHeight(),
                      const ShowCodeAccordion(
                        codeSegment: CodeSegments.VButtonPrimaryIconLeading,
                        componentName: 'Button',
                        exampleName: 'Primary_Text_Button_With_Leading_Icon',
                        copyLabel: "Primary text button with icon",
                      ),
                      smallHeight(),
                      const Divider(),
                      const SemanticHeader(
                        title: "Primary text button with trailing icon",
                      ),
                      smallHeight(),
                      VButtonPrimaryIconTrailing(shareIcon: shareIcon),
                      smallHeight(),
                      const ShowCodeAccordion(
                        codeSegment: CodeSegments.VButtonPrimaryIconTrailing,
                        componentName: 'Button',
                        exampleName: 'Primary_Text_Button_With_Trailing_Icon',
                        copyLabel: "Primary text button with icon",
                      ),
                      const Divider(),
                      const SemanticHeader(
                        title: "Disabled primary text button",
                      ),
                      smallHeight(),
                      VButtonPrimaryIconLeadingDisabled(shareIcon: shareIcon),
                      smallHeight(),
                      const ShowCodeAccordion(
                        codeSegment:
                            CodeSegments.VButtonPrimaryIconLeadingDisabled,
                        componentName: 'Button',
                        exampleName:
                            'Primary_Disabled_Text_Button_With_Leading_Icon',
                        copyLabel: "Primary text button with icon",
                      ),
                      const Divider(),
                    ]),

                /// Secondary Buttons
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SemanticHeader(
                        title: "Secondary text buttons",
                        style: defaultVTheme.textStyles.headline2.copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? VColors.defaultTextDark
                                    : VColors.defaultText),
                      ),
                      smallHeight(),
                      const SemanticHeader(
                        title: "Default secondary text button",
                      ),
                      smallHeight(),
                      const VButtonSecondary(),
                      smallHeight(),
                      const ShowCodeAccordion(
                        codeSegment: CodeSegments.VButtonSecondary,
                        componentName: 'Button',
                        exampleName: 'Secondary_Text_Button',
                        copyLabel: "Secondary text button",
                      ),
                      const Divider(),
                      const SemanticHeader(
                        title: "Alternate secondary text button",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomPaint(
                        painter: CheckeredPatternDark(),
                        child: const SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: VButtonSecondaryAlt(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      largeHeight(),
                      const ShowCodeAccordion(
                        codeSegment: CodeSegments.VButtonSecondaryAlt,
                        componentName: 'Button',
                        exampleName: 'Secondary_Alt_Text_Button',
                        copyLabel: "Secondary alt text button",
                      ),
                      const Divider(),
                      const SemanticHeader(
                        title: "Secondary text button with leading icon",
                      ),
                      smallHeight(),
                      VButtonSecondaryIconLeading(shareIcon: shareIcon),
                      smallHeight(),
                      const ShowCodeAccordion(
                        codeSegment: CodeSegments.VButtonSecondaryIconLeading,
                        componentName: 'Button',
                        exampleName: 'Secondary_Text_Button_With_Leading_Icon',
                        copyLabel: "Secondary text button with icon",
                      ),
                      const Divider(),
                      const SemanticHeader(
                        title: "Secondary text button with trailing icon",
                      ),
                      VButtonSecondaryIconTrailing(shareIcon: shareIcon),
                      smallHeight(),
                      const ShowCodeAccordion(
                        codeSegment: CodeSegments.VButtonSecondaryIconTrailing,
                        componentName: 'Button',
                        exampleName: 'Secondary_Text_Button_With_Trailing_Icon',
                        copyLabel: "Secondary text button with icon",
                      ),
                      const Divider(),
                      const SemanticHeader(
                        title: "Disabled secondary text button",
                      ),
                      smallHeight(),
                      VButtonSecondaryIconLeadingDisabled(shareIcon: shareIcon),
                      smallHeight(),
                      const ShowCodeAccordion(
                        codeSegment:
                            CodeSegments.VButtonSecondaryIconLeadingDisabled,
                        componentName: 'Button',
                        exampleName:
                            'Secondary_Disabled_Text_Button_With_Leading_Icon',
                        copyLabel: "Secondary text button with icon",
                      ),
                      const Divider(),
                    ]),

                /// Tertiary Buttons
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SemanticHeader(
                      title: "Tertiary text buttons",
                      style: defaultVTheme.textStyles.headline2.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? VColors.defaultTextDark
                              : VColors.defaultText),
                    ),
                    smallHeight(),
                    const SemanticHeader(
                      title: "Default tertiary text button",
                    ),
                    const VButtonTertiary(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VButtonTertiary,
                      componentName: 'Button',
                      exampleName: 'Tertiary_Text_Button',
                      copyLabel: "Tertiary text button",
                    ),
                    const Divider(),
                    const SemanticHeader(
                      title: "Alternate tertiary text button",
                    ),
                    CustomPaint(
                      painter: CheckeredPatternDark(),
                      child: const SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0),
                              child: VButtonTertiaryAlt(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    largeHeight(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VButtonTertiaryAlt,
                      componentName: 'Button',
                      exampleName: 'Tertiary_Alt_Text_Button',
                      copyLabel: "Tertiary alt text button",
                    ),
                    const Divider(),
                    const SemanticHeader(
                      title: "Tertiary text button with leading icon",
                    ),
                    smallHeight(),
                    VButtonTertiaryIconLeading(shareIcon: shareIcon),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VButtonTertiaryIconLeading,
                      componentName: 'Button',
                      exampleName: 'Tertiary_Text_Button_With_Leading_Icon',
                      copyLabel: "Tertiary text button with icon",
                    ),
                    const Divider(),
                    const SemanticHeader(
                      title: "Tertiary text button with trailing icon",
                    ),
                    VButtonTertiaryIconTrailing(shareIcon: shareIcon),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VButtonTertiaryIconTrailing,
                      componentName: 'Button',
                      exampleName: 'Tertiary_Text_Button_With_Trailing_Icon',
                      copyLabel: "Tertiary text button with icon",
                    ),
                    const Divider(),
                    const SemanticHeader(
                      title: "Disabled tertiary text button",
                    ),
                    VButtonTertiaryIconLeadingDisabled(shareIcon: shareIcon),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment:
                          CodeSegments.VButtonTertiaryIconLeadingDisabled,
                      componentName: 'Button',
                      exampleName:
                          'Tertiary_Disabled_Text_Button_With_Leading_Icon',
                      copyLabel: "Tertiary text button with icon",
                    ),
                    const Divider(),

                    /// Destructive Buttons
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SemanticHeader(
                          title: "Destructive text buttons",
                          style: defaultVTheme.textStyles.headline2.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? VColors.defaultTextDark
                                  : VColors.defaultText),
                        ),
                        smallHeight(),
                        const SemanticHeader(
                          title: "Primary destructive text button",
                        ),
                        smallHeight(),
                        const VisaPrimaryButtonIconDestructive(),
                        smallHeight(),
                        const ShowCodeAccordion(
                          codeSegment:
                              CodeSegments.VisaPrimaryButtonIconDestructive,
                          componentName: 'Button',
                          exampleName: 'Primary_Destructive_Button_With_Icon',
                          copyLabel: "Primary destructive",
                        ),
                        const Divider(),
                        const SemanticHeader(
                          title: "Secondary destructive text button",
                        ),
                        smallHeight(),
                        const VSecondaryButtonIconDestructive(),
                        smallHeight(),
                        const ShowCodeAccordion(
                          codeSegment:
                              CodeSegments.VSecondaryButtonIconDestructive,
                          componentName: 'Button',
                          exampleName: 'Secondary_Destructive_Button_With_Icon',
                          copyLabel: "Secondary destructive",
                        ),
                        const Divider(),
                        const SemanticHeader(
                          title: "Tertiary destructive text button",
                        ),
                        smallHeight(),
                        const VTertiaryButtonIconDestructive(),
                        smallHeight(),
                        const ShowCodeAccordion(
                          codeSegment:
                              CodeSegments.VTertiaryButtonIconDestructive,
                          componentName: 'Button',
                          exampleName:
                              'Tertiary_Destructive_Text_Button_With_Icon',
                          copyLabel: "Tertiary destructive",
                        ),
                        const Divider(),
                      ],
                    ),

                    /// Primary icon buttons
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SemanticHeader(
                          title: "Primary icon buttons",
                          style: defaultVTheme.textStyles.headline2.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? VColors.defaultTextDark
                                  : VColors.defaultText),
                        ),
                        smallHeight(),
                        const SemanticHeader(
                          title: "Primary icon button with label",
                        ),
                        smallHeight(),
                        VisaPrimaryIconButton(shareIcon: shareIcon),
                        smallHeight(),
                        const ShowCodeAccordion(
                          codeSegment: CodeSegments.VisaPrimaryIconButton,
                          componentName: 'Button',
                          exampleName: 'Primary_Button_With_Icon',
                          copyLabel: "Primary icon button",
                        ),
                        smallHeight(),
                        const SemanticHeader(
                          title: "Disabled primary icon button with label",
                        ),
                        smallHeight(),
                        VisaPrimaryIconButtonDisabled(shareIcon: shareIcon),
                        smallHeight(),
                        const ShowCodeAccordion(
                          codeSegment:
                              CodeSegments.VisaPrimaryIconButtonDisabled,
                          componentName: 'Button',
                          exampleName: 'Primary_Disabled_Button_With_Icon',
                          copyLabel: "Primary icon button",
                        ),
                        const Divider(),
                      ],
                    ),

                    /// Secondary icon buttons
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SemanticHeader(
                          title: "Secondary icon buttons",
                          style: defaultVTheme.textStyles.headline2.copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? VColors.defaultTextDark
                                  : VColors.defaultText),
                        ),
                        smallHeight(),
                        const SemanticHeader(
                          title: "Secondary icon button with label",
                        ),
                        smallHeight(),
                        VSecondaryIconButton(shareIcon: shareIcon),
                        smallHeight(),
                        const ShowCodeAccordion(
                          codeSegment: CodeSegments.VSecondaryIconButton,
                          componentName: 'Button',
                          exampleName: 'Secondary_Button_With_Icon',
                          copyLabel: "Secondary icon button",
                        ),
                        smallHeight(),
                        const SemanticHeader(
                          title: "Disabled secondary icon button with label",
                        ),
                        VSecondaryIconButtonDisabled(shareIcon: shareIcon),
                        smallHeight(),
                        const ShowCodeAccordion(
                          codeSegment:
                              CodeSegments.VSecondaryIconButtonDisabled,
                          componentName: 'Button',
                          exampleName: 'Secondary_Disabled_Button_With_Icon',
                          copyLabel: "Secondary icon button",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN VButtonTertiaryAlt
class VButtonTertiaryAlt extends StatelessWidget {
  const VButtonTertiaryAlt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VButton(
      style: VButtonStyle(
        backgroundColorActive: VColors.transparent,
        backgroundColorDisabled: VColors.transparent,
        foregroundColorActive: VColors.alternateActive,
        foregroundColorDisabled: VColors.alternateDisabled,
        overlayColorPressed: VColors.alternateSurfaceLowlight,
      ),
      vExt: VAlt(),
      child: const Text(
        "Tertiary action",
      ),
      onPressed: () {},
    );
  }
}
// END

// BEGIN VButtonSecondaryAlt
class VButtonSecondaryAlt extends StatelessWidget {
  const VButtonSecondaryAlt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VButton(
      style: VButtonStyle(
        backgroundColorActive: VColors.transparent,
        backgroundColorDisabled: VColors.transparent,
        foregroundColorActive: VColors.alternateActive,
        foregroundColorDisabled: VColors.alternateDisabled,
        overlayColorPressed: VColors.alternateSurfaceLowlight,
        borderSideActive: const BorderSide(
          color: VColors.alternateActive,
        ),
        borderSideDisabled: BorderSide(
          color: VColors.alternateDisabled,
        ),
      ),
      vExt: VAlt(),
      child: const Text(
        "Secondary action",
      ),
      onPressed: () {},
    );
  }
}
// END

// BEGIN VButtonPrimaryAlt
class VButtonPrimaryAlt extends StatelessWidget {
  const VButtonPrimaryAlt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VButton(
      child: Text(
        "Primary action",
        style: defaultVTheme.textStyles.buttonMedium.copyWith(
          color: VColors.alternateOnActive,
        ),
      ),
      onPressed: () {},
      vExt: VAlt(),
    );
  }
}
// END

// BEGIN VTertiaryButtonIconDestructive
class VTertiaryButtonIconDestructive extends StatelessWidget {
  const VTertiaryButtonIconDestructive({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
      style: const VButtonStyle(
        backgroundColorActive: Colors.transparent,
        backgroundColorDisabled: Colors.transparent,
        foregroundColorActive: VColors.negativeText,
        foregroundColorDisabled: VColors.disabled,
        overlayColorPressed: VColors.negativeSurfaceLowLight,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VIcon(
            svgIcon: VIcons.deleteTiny,
            iconColor: VColors.negativeText,
          ),
          buttonHGap,
          Text(
            "Destructive action",
            style: defaultVTheme.textStyles.buttonMedium.copyWith(
              color: VColors.negativeText,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
// END

// BEGIN VButtonTertiaryIconTrailing
class VButtonTertiaryIconTrailing extends StatelessWidget {
  const VButtonTertiaryIconTrailing({
    Key? key,
    required this.shareIcon,
  }) : super(key: key);

  final String shareIcon;

  @override
  Widget build(BuildContext context) {
    return VButton(
      style: VButtonStyle(
        backgroundColorActive: Colors.transparent,
        backgroundColorDisabled: Colors.transparent,
        foregroundColorActive: VColors.defaultActive,
        foregroundColorDisabled: VColors.defaultDisabled,
        overlayColorPressed: VColors.defaultSurfaceLowlight,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Tertiary action",
            style: defaultVTheme.textStyles.buttonMedium.copyWith(
              color: VColors.defaultActive,
            ),
          ),
          buttonHGap,
          const VIcon(
            svgIcon: VIcons.shareTiny,
            iconColor: VColors.defaultActive,
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
// END

// BEGIN VButtonTertiaryIconLeadingDisabled
class VButtonTertiaryIconLeadingDisabled extends StatelessWidget {
  const VButtonTertiaryIconLeadingDisabled({
    Key? key,
    required this.shareIcon,
  }) : super(key: key);

  final String shareIcon;

  @override
  Widget build(BuildContext context) {
    return VButton(
      style: VButtonStyle(
        backgroundColorActive: Colors.transparent,
        backgroundColorDisabled: Colors.transparent,
        foregroundColorActive: VColors.defaultActive,
        foregroundColorDisabled: VColors.defaultDisabled,
        overlayColorPressed: VColors.defaultSurfaceLowlight,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VIcon(
            svgIcon: VIcons.shareTiny,
            iconColor: VColors.disabled,
          ),
          buttonHGap,
          Text(
            "Tertiary action",
            style: defaultVTheme.textStyles.buttonMedium.copyWith(
              color: VColors.defaultDisabled,
            ),
          ),
        ],
      ),
      onPressed: null,
    );
  }
}
// END

// BEGIN VButtonTertiaryIconLeading
class VButtonTertiaryIconLeading extends StatelessWidget {
  const VButtonTertiaryIconLeading({
    Key? key,
    required this.shareIcon,
  }) : super(key: key);

  final String shareIcon;

  @override
  Widget build(BuildContext context) {
    return VButton(
      style: VButtonStyle(
        backgroundColorActive: Colors.transparent,
        backgroundColorDisabled: Colors.transparent,
        foregroundColorActive: VColors.defaultActive,
        foregroundColorDisabled: VColors.defaultDisabled,
        overlayColorPressed: VColors.defaultSurfaceLowlight,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VIcon(
            svgIcon: VIcons.shareTiny,
            iconColor: VColors.defaultActive,
          ),
          buttonHGap,
          Text(
            "Tertiary action",
            style: defaultVTheme.textStyles.buttonMedium.copyWith(
              color: VColors.defaultActive,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
// END

// BEGIN VButtonTertiary
class VButtonTertiary extends StatelessWidget {
  const VButtonTertiary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
      style: VButtonStyle(
        backgroundColorActive: Colors.transparent,
        backgroundColorDisabled: Colors.transparent,
        foregroundColorActive: VColors.defaultActive,
        foregroundColorDisabled: VColors.defaultDisabled,
        overlayColorPressed: VColors.defaultSurfaceLowlight,
      ),
      child: Text(
        "Tertiary action",
        style: defaultVTheme.textStyles.buttonMedium.copyWith(
          color: VColors.defaultActive,
        ),
      ),
      onPressed: () {},
    );
  }
}
// END

// BEGIN VSecondaryButtonIconDestructive
class VSecondaryButtonIconDestructive extends StatelessWidget {
  const VSecondaryButtonIconDestructive({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
      style: VButtonStyle(
        foregroundColorActive: VColors.negativeText,
        foregroundColorDisabled: VColors.disabled,
        backgroundColorActive: VColors.transparent,
        backgroundColorDisabled: VColors.transparent,
        overlayColorPressed: VColors.negativeSurfaceLowLight,
        borderSideActive: const BorderSide(
          color: VColors.negativeText,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        borderSideDisabled: BorderSide(
          color: VColors.defaultDisabled,
          style: BorderStyle.solid,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VIcon(
            svgIcon: VIcons.deleteTiny,
            iconColor: VColors.negativeText,
          ),
          buttonHGap,
          Text(
            "Destructive action",
            style: defaultVTheme.textStyles.buttonMedium.copyWith(
              color: VColors.negativeText,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
// END

// BEGIN VSecondaryIconButtonDisabled
class VSecondaryIconButtonDisabled extends StatelessWidget {
  const VSecondaryIconButtonDisabled({
    Key? key,
    required this.shareIcon,
  }) : super(key: key);

  final String shareIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VIconButton(
          // Secondary theme
          style: VButtonStyle(
            minimumSize: const Size(46, 46),
            backgroundColorActive: VColors.transparent,
            backgroundColorDisabled: VColors.transparent,
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
          onPressed: null,
          icon: const VIcon(
            svgIcon: VIcons.shareTiny,
            iconColor: VColors.disabled,
          ),
        ),
        buttonVGap,
        Text(
          "Action",
          style: defaultVTheme.textStyles.uiLabelSmall.copyWith(
            color: VColors.defaultDisabled,
          ),
        ),
      ],
    );
  }
}
// END

// BEGIN VSecondaryIconButton
class VSecondaryIconButton extends StatelessWidget {
  const VSecondaryIconButton({
    Key? key,
    required this.shareIcon,
  }) : super(key: key);

  final String shareIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VIconButton(
          // Secondary theme
          style: VButtonStyle(
            minimumSize: const Size(46, 46),
            backgroundColorActive: VColors.transparent,
            backgroundColorDisabled: VColors.transparent,
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
          onPressed: () {},
          icon: const VIcon(
            svgIcon: VIcons.shareTiny,
            iconColor: VColors.defaultActive,
          ),
        ),
        buttonVGap,
        Text(
          "Action",
          style: defaultVTheme.textStyles.uiLabelSmall,
        ),
      ],
    );
  }
}
// END

// BEGIN VButtonSecondaryIconTrailing
class VButtonSecondaryIconTrailing extends StatelessWidget {
  const VButtonSecondaryIconTrailing({
    Key? key,
    required this.shareIcon,
  }) : super(key: key);

  final String shareIcon;

  @override
  Widget build(BuildContext context) {
    return VButton(
      // Secondary theme
      style: VButtonStyle(
        backgroundColorActive: VColors.transparent,
        backgroundColorDisabled: VColors.transparent,
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Secondary action",
            style: defaultVTheme.textStyles.buttonMedium.copyWith(
              color: VColors.defaultActive,
            ),
          ),
          buttonHGap,
          const VIcon(
            svgIcon: VIcons.shareTiny,
            iconColor: VColors.defaultActive,
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
// END

// BEGIN VButtonSecondaryIconLeadingDisabled
class VButtonSecondaryIconLeadingDisabled extends StatelessWidget {
  const VButtonSecondaryIconLeadingDisabled({
    Key? key,
    required this.shareIcon,
  }) : super(key: key);

  final String shareIcon;

  @override
  Widget build(BuildContext context) {
    return VButton(
      // Secondary theme
      style: VButtonStyle(
        backgroundColorActive: VColors.transparent,
        backgroundColorDisabled: VColors.transparent,
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VIcon(
            svgIcon: VIcons.shareTiny,
            iconColor: VColors.disabled,
          ),
          buttonHGap,
          Text(
            "Secondary action",
            style: defaultVTheme.textStyles.buttonMedium.copyWith(
              color: VColors.defaultDisabled,
            ),
          ),
        ],
      ),
      onPressed: null,
    );
  }
}
// END

// BEGIN VButtonSecondaryIconLeading
class VButtonSecondaryIconLeading extends StatelessWidget {
  const VButtonSecondaryIconLeading({
    Key? key,
    required this.shareIcon,
  }) : super(key: key);

  final String shareIcon;

  @override
  Widget build(BuildContext context) {
    return VButton(
      // Secondary theme
      style: VButtonStyle(
        backgroundColorActive: VColors.transparent,
        backgroundColorDisabled: VColors.transparent,
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VIcon(
            svgIcon: VIcons.shareTiny,
            iconColor: VColors.defaultActive,
          ),
          buttonHGap,
          Text(
            "Secondary action",
            style: defaultVTheme.textStyles.buttonMedium.copyWith(
              color: VColors.defaultActive,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
// END

// BEGIN VButtonSecondary
class VButtonSecondary extends StatelessWidget {
  const VButtonSecondary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
      child: Text(
        "Secondary action",
        style: defaultVTheme.textStyles.buttonMedium.copyWith(
          color: VColors.defaultActive,
        ),
      ),
      // Secondary theme
      style: VButtonStyle(
        backgroundColorActive: VColors.transparent,
        backgroundColorDisabled: VColors.transparent,
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
      onPressed: () {},
    );
  }
}
// END

// BEGIN VisaPrimaryButtonIconDestructive
class VisaPrimaryButtonIconDestructive extends StatelessWidget {
  const VisaPrimaryButtonIconDestructive({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
        style: const VButtonStyle(
          backgroundColorActive: VColors.negativeText,
          overlayColorPressed: VColors.negativeTextPressed,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VIcon(
              svgIcon: VIcons.deleteTiny,
              iconColor: VColors.defaultSurface1,
            ),
            buttonHGap,
            Text(
              "Destructive action",
              style: defaultVTheme.textStyles.buttonMedium.copyWith(
                color: VColors.defaultSurface1,
              ),
            ),
          ],
        ),
        onPressed: () {});
  }
}
// END

// BEGIN VisaPrimaryIconButtonDisabled
class VisaPrimaryIconButtonDisabled extends StatelessWidget {
  const VisaPrimaryIconButtonDisabled({
    Key? key,
    required this.shareIcon,
  }) : super(key: key);

  final String shareIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VIconButton(
          style: VButtonStyle(
            minimumSize: Size(46, 46),
          ),
          onPressed: null,
          icon: VIcon(
            svgIcon: VIcons.shareTiny,
            iconColor: VColors.defaultSurface1,
          ),
        ),
        buttonVGap,
        Text(
          "Action",
          style: defaultVTheme.textStyles.uiLabelSmall,
        )
      ],
    );
  }
}
// END

// BEGIN VisaPrimaryIconButton
class VisaPrimaryIconButton extends StatelessWidget {
  const VisaPrimaryIconButton({
    Key? key,
    required this.shareIcon,
  }) : super(key: key);

  final String shareIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VIconButton(
          style: const VButtonStyle(
            minimumSize: Size(46, 46),
          ),
          onPressed: () {},
          icon: const VIcon(
            svgIcon: VIcons.shareTinyAlternate,
          ),
        ),
        buttonVGap,
        Text(
          "Action",
          style: defaultVTheme.textStyles.uiLabelSmall,
        ),
      ],
    );
  }
}
// END

// BEGIN VButtonPrimaryIconTrailing
class VButtonPrimaryIconTrailing extends StatelessWidget {
  const VButtonPrimaryIconTrailing({
    Key? key,
    required this.shareIcon,
  }) : super(key: key);

  final String shareIcon;

  @override
  Widget build(BuildContext context) {
    return VButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Primary action",
            style: defaultVTheme.textStyles.buttonMedium.copyWith(
              color: VColors.defaultSurface1,
            ),
          ),
          buttonHGap,
          const VIcon(
            svgIcon: VIcons.shareTinyAlternate,
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
// END

// BEGIN VButtonPrimaryIconLeadingDisabled
class VButtonPrimaryIconLeadingDisabled extends StatelessWidget {
  const VButtonPrimaryIconLeadingDisabled({
    Key? key,
    required this.shareIcon,
  }) : super(key: key);

  final String shareIcon;

  @override
  Widget build(BuildContext context) {
    return VButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VIcon(
            svgIcon: VIcons.shareTiny,
            iconColor: VColors.defaultSurface1,
          ),
          buttonHGap,
          Text(
            "Primary action",
            style: defaultVTheme.textStyles.buttonMedium.copyWith(
              color: VColors.defaultSurface1,
            ),
          ),
        ],
      ),
      onPressed: null,
    );
  }
}
// END

// BEGIN VButtonPrimaryIconLeading
class VButtonPrimaryIconLeading extends StatelessWidget {
  const VButtonPrimaryIconLeading({
    Key? key,
    required this.shareIcon,
  }) : super(key: key);

  final String shareIcon;

  @override
  Widget build(BuildContext context) {
    return VButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VIcon(
            svgIcon: VIcons.shareTinyAlternate,
          ),
          buttonHGap,
          Text(
            "Primary action",
            style: defaultVTheme.textStyles.buttonMedium.copyWith(
              color: VColors.defaultSurface1,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
// END

// BEGIN VButtonPrimary
class VButtonPrimary extends StatelessWidget {
  const VButtonPrimary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
      child: Text(
        "Primary action",
        style: defaultVTheme.textStyles.buttonMedium.copyWith(
          color: VColors.defaultSurface1,
        ),
      ),
      onPressed: () {},
    );
  }
}
// END
