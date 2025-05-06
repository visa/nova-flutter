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
// Visa Nova Flutter Accordion Demo Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class Accordion extends StatefulWidget {
  const Accordion({
    Key? key,
  }) : super(key: key);

  final bool? enabled = true;
  final bool isPressed = false;
  final bool makeBold = false;

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    setPageTitle('Accordion', context);

    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Accordion"),
        drawer: const MyDrawer(pageTitle: "Accordion"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SemanticHeader(
                  title: "Individual accordions",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                largeHeight(),
                SemanticHeader(
                  title: "Default accordion",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                smallHeight(),
                const VAccordionDefault(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VAccordion,
                  componentName: 'Accordion',
                  exampleName: 'Default_Accordion',
                  copyLabel: "Example of default accordion",
                ),
                const Divider(),
                smallHeight(),
                SemanticHeader(
                  title: "Disabled accordion",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                smallHeight(),
                const VAccordionDefaultDisabled(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VAccordionDisabled,
                  componentName: 'Accordion',
                  exampleName: 'Disable_Accordion',
                  copyLabel: "Example of disabled accordion",
                ),
                const Divider(),
                smallHeight(),
                SemanticHeader(
                  title: "Accordion with icon",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                smallHeight(),
                const VAccordionDefaultWithIcon(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VAccordionDefaultWithIcon,
                  componentName: 'Accordion',
                  exampleName: 'Accordion_With_Icon',
                  copyLabel: "Accordion with icon",
                ),
                const Divider(),

                smallHeight(),
                // ------------------------------
                SemanticHeader(
                  title: "Accordion with badge",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                smallHeight(),
                const VAccordionDefaultWithBadge(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VAccordionDefaultWithBadge,
                  componentName: 'Accordion',
                  exampleName: 'Accordion_With_Badge',
                  copyLabel: "Accordion with badge",
                ),
                const Divider(),
                //!
                SemanticHeader(
                  title: "Subtle accordion",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                const VAccordionSubtle(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VAccordionSubtle,
                  componentName: 'Accordion',
                  exampleName: 'Accordion_With_Subtitle',
                  copyLabel: "Example of accordion subtle",
                ),
                const Divider(),
                SemanticHeader(
                  title: "Disabled subtle accordion",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                smallHeight(),
                const VAccordionSubtleDisabled(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VAccordionSubtleDisabled,
                  componentName: 'Accordion',
                  exampleName: 'Disabled_Subtle_Accordion',
                  copyLabel: "Disabled subtle accordion",
                ),
                const Divider(),
                SemanticHeader(
                  title: "Subtle accordion with icon",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                smallHeight(),
                const VAccordionWithIcon(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VAccordionWithIcon,
                  componentName: 'Accordion',
                  exampleName: 'Subtle_Accordion_With_Icon',
                  copyLabel: "Subtle accordion with icon",
                ),
                largeHeight(),
                /*const Divider(),
                SemanticHeader(
                  title: "Subtle accordion with badge",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                const VAccordionWithBadge(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VAccordionWithBadge,
                  componentName: 'Accordion',
                  exampleName: 'Subtle_Accordion_With_Badge',
                  copyLabel: "Subtle accordion with badge",
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN VAccordionWithBadge
class VAccordionWithBadge extends StatelessWidget {
  const VAccordionWithBadge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAccordion(
      badgeStatus: "Label",
      title: "Accordion title",
      trailing: VBadge(
        badgeState: BadgeState.stable,
        label: "Label",
      ),
      body: Text(
        "This is required text that describes the accordion section in more detail.",
        style: defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
      ),
    );
  }
}
// END

// BEGIN VAccordionWithIcon
class VAccordionWithIcon extends StatelessWidget {
  const VAccordionWithIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAccordion(
      title: "Accordion title",
      leadingSvgIcon: VIcons.cloudLow,
      body: Text(
        "This is required text that describes the accordion section in more detail.",
        style: defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
      ),
    );
  }
}
// END

// BEGIN VAccordionSubtleDisabled
class VAccordionSubtleDisabled extends StatelessWidget {
  const VAccordionSubtleDisabled({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAccordion(
      title: "Accordion title",
      body: Text(
        "This is required text that describes the accordion section in more detail.",
        style: defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
      ),
      isEnabled: false,
    );
  }
}
// END

// BEGIN VAccordionSubtle
class VAccordionSubtle extends StatelessWidget {
  const VAccordionSubtle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAccordion(
      title: "Accordion title",
      body: Text(
        "This is required text that describes the accordion section in more detail.",
        style: defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
      ),
    );
  }
}
// END

// BEGIN VAccordionDisabled
class VAccordionDefaultDisabled extends StatelessWidget {
  const VAccordionDefaultDisabled({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VAccordion(
      title: "Accordion title",
      body: Text(
        "This is required text that describes the accordion section in more detail.",
        style: defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
      ),
      isEnabled: false,
      isSubtle: false,
    );
  }
}
// END

// BEGIN VAccordion
class VAccordionDefault extends StatelessWidget {
  const VAccordionDefault({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAccordion(
      title: "Accordion title",
      body: Text(
        "This is required text that describes the accordion section in more detail.",
        style: defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
      ),
      isSubtle: false,
    );
  }
}
// END

// BEGIN VAccordionDefaultWithIcon

class VAccordionDefaultWithIcon extends StatelessWidget {
  const VAccordionDefaultWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return VAccordion(
      title: "Accordion title",
      leadingSvgIcon: VIcons.cloudLow,
      body: Text(
        "This is required text that describes the accordion section in more detail.",
        style: defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
      ),
      isSubtle: false,
    );
  }
}

// END

// BEGIN VAccordionDefaultWithBadge

class VAccordionDefaultWithBadge extends StatelessWidget {
  const VAccordionDefaultWithBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return VAccordion(
      badgeStatus: "Label",
      title: "Accordion title",
      trailing: VBadge(
        badgeState: BadgeState.stable,
        label: "Label",
      ),
      body: Text(
        "This is required text that describes the accordion section in more detail.",
        style: defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
      ),
      isSubtle: false,
    );
  }
}
// END
