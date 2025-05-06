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
// Visa Nova Flutter Demo Link Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

class Links extends StatefulWidget {
  const Links({Key? key}) : super(key: key);

  @override
  State<Links> createState() => _LinksState();
}

class _LinksState extends State<Links> {
  bool isDisplayed = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Link', context);
    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Link"),
        drawer: const MyDrawer(pageTitle: "Link"),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SemanticHeader(
                  title: "Standalone links",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                largeHeight(),
                Semantics(
                  header: true,
                  child: Text(
                    "Default link",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                const Divider(),
                const VLinkDefault(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VLinkDefault,
                  componentName: 'Link',
                  exampleName: 'Default_Link',
                  copyLabel: "Default link enabled",
                ),
                const SizedBox(
                  height: 10,
                ),
                /*const VLinkDisabledDefault(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VLinkDisabledDefault,
                  componentName: 'Link',
                  exampleName: 'Disabled_Link',
                  copyLabel: "Default link disabled",
                ),
                const SizedBox(
                  height: 10,
                ),*/
                const Divider(),
                Semantics(
                  header: true,
                  child: Text(
                    "Link with leading icon",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                const Divider(),
                const VLinkWithLeading(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VLinkWithLeading,
                  componentName: 'Link',
                  exampleName: 'Link_With_Leading_Icon',
                  copyLabel: "Link with leading icon enabled",
                ),
                const SizedBox(
                  height: 10,
                ),
                /*const VLinkWithLeadingDisabled(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VLinkWithLeadingDisabled,
                  componentName: 'Link',
                  exampleName: 'Disabled_Link_With_Leading_Icon',
                  copyLabel: "Link with leading icon disabled",
                ),
                const SizedBox(
                  height: 10,
                ),*/
                const Divider(),
                Semantics(
                  header: true,
                  child: Text(
                    "Link with trailing icon",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                const VLinkWithTrailing(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VLinkWithTrailing,
                  componentName: 'Link',
                  exampleName: 'Link_With_Trailing_Icon',
                  copyLabel: "Link with trailing icon enabled",
                ),
                const Divider(),
                const SemanticHeader(
                    title: "Alternate link with trailing icon"),
                const Divider(),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.black87,
                  width: double.infinity,
                  child: const AlternateLink(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.AlternateLink,
                  componentName: 'Link',
                  exampleName: 'Alternate_Link',
                  copyLabel: "link with alternate color set",
                ),
                const SizedBox(
                  height: 10,
                ),
                /*const VLinkWithTrailingDisabled(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VLinkWithTrailingDisabled,
                  componentName: 'Link',
                  exampleName: 'Disabled_Link_With_Trailing_Icon',
                  copyLabel: "Link with trailing icon disabled",
                ),
                const SizedBox(
                  height: 10,
                ),*/
                const Divider(),
                const SemanticHeader(title: "Disabled link"),
                const Divider(),
                const VLinkDisabledDefault(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VLinkDisabledDefault,
                  componentName: 'Link',
                  exampleName: 'Disabled_Link',
                  copyLabel: "Disabled link",
                ),
                const Divider(),
                SemanticHeader(
                  title: "Inline links",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                largeHeight(),
                const SemanticHeader(title: "Inline link"),
                const Divider(),
                const VLinkInline(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VLinkInline,
                  componentName: 'Link',
                  exampleName: 'Inline_Link',
                  copyLabel: "inline link",
                ),
                const Divider(),
                const SemanticHeader(title: "Inline link with trailing icon"),
                const VLinkInlineWithTrailing(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VLinkInlineWithTrailing,
                  componentName: 'Link',
                  exampleName: 'Inline_Link_With_Trailing_Icon',
                  copyLabel: "inline link with trailing icon",
                ),
                const Divider(),
                SemanticHeader(
                  title: "Link coded as buttons",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                largeHeight(),
                const SemanticHeader(title: "Link coded as a button"),
                const Divider(),
                const LinkAsButton(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.LinkAsButton,
                  componentName: 'Link',
                  exampleName: 'Button_Link',
                  copyLabel: "Link as button",
                ),
                const Divider(),
                largeHeight(),
                const SemanticHeader(title: "Disabled link coded as a button"),
                const Divider(),
                const LinkAsButtonDisabled(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.LinkAsButtonDisabled,
                  componentName: 'Link',
                  exampleName: 'Disabled_Button_Link',
                  copyLabel: "Disabled link as button",
                ),
                const Divider(),
                largeHeight(),
                SemanticHeader(
                  title: "Custom link",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                largeHeight(),
                const SemanticHeader(title: "Link with custom typography"),
                const Divider(),
                const LinkWithCustomTypography(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.LinkWithCustomTypography,
                  componentName: 'Link',
                  exampleName: 'Link_with_custom_typography',
                  copyLabel: "Link with custom typography",
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN VLinkWithTrailingDisabled
class VLinkWithTrailingDisabled extends StatelessWidget {
  const VLinkWithTrailingDisabled({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VLink(
      title: "Destination label",
      isTrailingIcon: true,
      onPressed: null,
    );
  }
}
// END

// BEGIN VLinkWithLeadingDisabled
class VLinkWithLeadingDisabled extends StatelessWidget {
  const VLinkWithLeadingDisabled({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VLink(
      title: "Destination label",
      isLeadingIcon: true,
      onPressed: null,
    );
  }
}
// END

// BEGIN VLinkDisabledDefault
class VLinkDisabledDefault extends StatelessWidget {
  const VLinkDisabledDefault({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VLink(
      title: "Destination label",
      isUnderlined: true,
      onPressed: null,
    );
  }
}
// END

// BEGIN VLinkWithTrailing
class VLinkWithTrailing extends StatelessWidget {
  const VLinkWithTrailing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VLink(
      title: "Destination label",
      isTrailingIcon: true,
      onPressed: () {},
    );
  }
}
// END

// BEGIN VLinkWithLeading
class VLinkWithLeading extends StatelessWidget {
  const VLinkWithLeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VLink(
      title: "Destination label",
      isLeadingIcon: true,
      onPressed: () {},
    );
  }
}
// END

// BEGIN VLinkDefault
class VLinkDefault extends StatelessWidget {
  const VLinkDefault({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VLink(
      title: "Destination label",
      isUnderlined: true,
      onPressed: () {},
    );
  }
}
// END

// BEGIN VLinkExternal
class VLinkExternal extends StatelessWidget {
  const VLinkExternal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VLink(
      title: "Destination label",
      isLeadingIcon: true,
      isTrailingIcon: true,
      onPressed: () {
        // launchUrl(
        //   Uri.parse(
        //     'https://apple.com',
        //   ),
        //   mode: LaunchMode.externalApplication,
        // );
      },
    );
  }
}
// END

// BEGIN VLink
class VLinkInternal extends StatelessWidget {
  const VLinkInternal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VLink(
      title: "Destination label",
      isLeadingIcon: true,
      isTrailingIcon: true,
      onPressed: () {
        // launchUrl(
        //   Uri.parse(
        //     'https://apple.com',
        //   ),
        //   mode: LaunchMode.inAppWebView,
        // );
      },
    );
  }
}
// END

// BEGIN VLinkLeadingAndTrailingDisabled
class VLinkLeadingAndTrailingDisabled extends StatelessWidget {
  const VLinkLeadingAndTrailingDisabled({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VLink(
      title: "Destination label",
      isLeadingIcon: true,
      isTrailingIcon: true,
      onPressed: null,
    );
  }
}
// END

// BEGIN VLinkInline
class VLinkInline extends StatelessWidget {
  const VLinkInline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: defaultVTheme.textStyles.baseTextStyle,
        children: [
          const TextSpan(
            text: "This is a sentence with an inline ",
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: VLink(
              title: "destination label",
              isUnderlined: true,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
// END

// BEGIN VLinkInlineWithTrailing
class VLinkInlineWithTrailing extends StatelessWidget {
  const VLinkInlineWithTrailing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: defaultVTheme.textStyles.baseTextStyle,
        children: [
          const TextSpan(
            text: "This is a sentence with an inline ",
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: VLink(
              title: "destination label",
              isUnderlined: true,
              onPressed: () {},
              trailingIcon: const VIcon(
                svgIcon: VIcons.maximizeTiny,
                iconFit: BoxFit.contain,
                iconColor: VColors.defaultActive,
              ),
              isTrailingIcon: true,
            ),
          ),
        ],
      ),
    );
  }
}
// END

// BEGIN LinkAsButton
class LinkAsButton extends StatelessWidget {
  const LinkAsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VLink(
      title: "Print",
      trailingIcon: const VIcon(
        svgIcon: VIcons.devicePrinterTiny,
        iconFit: BoxFit.contain,
        iconColor: VColors.defaultActive,
      ),
      isTrailingIcon: true,
      onPressed: () {},
    );
  }
}
// END

// BEGIN LinkAsButtonDisabled
class LinkAsButtonDisabled extends StatelessWidget {
  const LinkAsButtonDisabled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const VLink(
      title: "Print",
      trailingIcon: VIcon(
        svgIcon: VIcons.devicePrinterTiny,
        iconFit: BoxFit.contain,
        iconColor: VColors.disabled,
      ),
      isTrailingIcon: true,
      onPressed: null,
    );
  }
}
// END

// BEGIN AlternateLink
class AlternateLink extends StatelessWidget {
  const AlternateLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VLink(
      title: "Destination label",
      isTrailingIcon: true,
      onPressed: () {},
      vExt: VAlt(),
    );
  }
}
// END

// BEGIN LinkWithCustomTypography
class LinkWithCustomTypography extends StatelessWidget {
  const LinkWithCustomTypography({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VLink(
      title: "Destination label (headline 3)",
      onPressed: () {},
      style: VLinkStyle(
        titleTextStyle: defaultVTheme.textStyles.headline3,
      ),
    );
  }
}
// END