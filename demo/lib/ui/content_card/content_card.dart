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
// Visa Nova Flutter Demo ContentCard Page
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class ContentCard extends StatefulWidget {
  const ContentCard({Key? key}) : super(key: key);

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  bool pressed = false;
  bool isDisabled = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Content Card', context);
    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Content card"),
        drawer: const MyDrawer(pageTitle: "Content card"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SemanticHeader(
                  title: "Default content cards",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? VColors.defaultTextDark
                        : VColors.defaultText,
                  ),
                ),
                largeHeight(),
                SemanticHeader(
                  title: "Default content card",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? VColors.defaultTextDark
                        : VColors.defaultText,
                  ),
                ),
                smallHeight(),
                const VContentCardDefault(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.ContentCardDefault,
                  componentName: 'Content_Card',
                  exampleName: 'Default_Content_Card',
                  copyLabel: "Default content card",
                ),
                smallHeight(),
                SemanticHeader(
                  title: "Content card with UI buttons",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? VColors.defaultTextDark
                        : VColors.defaultText,
                  ),
                ),
                smallHeight(),
                const VContentCardWithUIButton(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.ContentCardWithUIButton,
                  componentName: 'Content_Card',
                  exampleName: 'Content_Card_With_UI_Buttons',
                  copyLabel: "Content card with UI buttons",
                ),
                smallHeight(),
                smallHeight(),
                SemanticHeader(
                  title: "Clickable content card",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? VColors.defaultTextDark
                        : VColors.defaultText,
                  ),
                ),
                smallHeight(),
                const VContentCardClickable(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.ContentCardClickableCard,
                  componentName: 'Content_Card',
                  exampleName: 'Clickable_Content_Card',
                  copyLabel: "Clickable content card",
                ),
                smallHeight(),
                smallHeight(),
                SemanticHeader(
                  title: "Compact content card",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? VColors.defaultTextDark
                        : VColors.defaultText,
                  ),
                ),
                smallHeight(),
                const VContentCardCompact(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.ContentCardCompact,
                  componentName: 'Content_Card',
                  exampleName: 'Compact_Content_Card',
                  copyLabel: "Compact content card",
                ),
                smallHeight(),
                smallHeight(),
                SemanticHeader(
                  title: "Content card with category",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? VColors.defaultTextDark
                        : VColors.defaultText,
                  ),
                ),
                smallHeight(),
                const VContentCardCategory(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.ContentCardCategory,
                  componentName: 'Content_Card',
                  exampleName: 'Category_Content_Card',
                  copyLabel: "Category content card ",
                ),
                smallHeight(),
                smallHeight(),
                SemanticHeader(
                  title: "Content card with icon",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? VColors.defaultTextDark
                        : VColors.defaultText,
                  ),
                ),
                smallHeight(),
                const VContentCardWithIcon(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.ContentCardWithIcon,
                  componentName: 'Content_Card',
                  exampleName: 'Content_Card_With_Icon',
                  copyLabel: "Content card with icon",
                ),
                smallHeight(),
                smallHeight(),
                SemanticHeader(
                  title: "Content card with image",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? VColors.defaultTextDark
                        : VColors.defaultText,
                  ),
                ),
                smallHeight(),
                smallHeight(),
                const VContentCardWithImage(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.ContentCardWithImage,
                  componentName: 'Content_Card',
                  exampleName: 'Content_Card_With_Image',
                  copyLabel: "Content card with image",
                ),
                smallHeight(),
                /*
                smallHeight(),
                SemanticHeader(
                  title: "Content card with chart",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                smallHeight(),
                smallHeight(),
                const VContentCardWithChart(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.ContentCardWithChart,
                  componentName: 'Content_Card',
                  exampleName: 'Content_Card_With_Chart',
                  copyLabel: "Content card with chart",
                ),
                smallHeight(),
                */
                SemanticHeader(
                  title: "Dashboard content card",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? VColors.defaultTextDark
                        : VColors.defaultText,
                  ),
                ),
                largeHeight(),
                SemanticHeader(
                  title: "Compact dashboard content card",
                  style: defaultVTheme.textStyles.headline3.copyWith(
                    fontWeight: VFontWeight.semiBold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? VColors.defaultTextDark
                        : VColors.defaultText,
                  ),
                ),
                smallHeight(),
                smallHeight(),
                const VContentCardWithSingleData(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.ContentCardWithData,
                  componentName: 'Content_Card',
                  exampleName: 'Content_Card_With_Data',
                  copyLabel: "Content card with dashboard",
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN ContentCardWithData
class VContentCardWithSingleData extends StatelessWidget {
  const VContentCardWithSingleData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VContentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Headline",
                  style: defaultVTheme.textStyles.headline4.copyWith(
                    color: VColors.defaultActive,
                  ),
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: VIcon(
                  svgIcon: VIcons.shareTiny,
                  iconColor: VColors.defaultActive,
                  iconHeight: 16,
                  iconWidth: 16,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: VIcon(
                  svgIcon: VIcons.favoriteStarOutlineTiny,
                  iconFit: BoxFit.none,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "This is optional text that describes the headline in more detail.",
            style: defaultVTheme.textStyles.bodyText2.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? VColors.defaultTextDark
                  : VColors.defaultText,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "0,000",
                style: defaultVTheme.textStyles.headline4.copyWith(
                  fontSize: 48,
                  color: VColors.positiveGraphics,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  const VIcon(
                    svgIcon: VIcons.arrowUpTiny,
                    iconHeight: 16,
                    iconWidth: 16,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Label",
                    style: defaultVTheme.textStyles.bodyText2.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? VColors.defaultTextDark
                          : VColors.defaultText,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

// END

// BEGIN ContentCardWithChart
class VContentCardWithChart extends StatelessWidget {
  const VContentCardWithChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VContentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VIcon(
                svgIcon: VIcons.billLow,
                iconHeight: 24,
                iconWidth: 24,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "CATEGORY",
                style: defaultVTheme.textStyles.overline
                    .copyWith(color: VColors.defaultActive),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: VIcon(
                  svgIcon: VIcons.fileDownloadTiny,
                  iconColor: VColors.defaultActive,
                  iconHeight: 16,
                  iconWidth: 16,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: VIcon(
                  svgIcon: VIcons.optionHorizontalTiny,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Headline",
            style: defaultVTheme.textStyles.headline4.copyWith(
              color: VColors.defaultActive,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "subtitle",
            style: defaultVTheme.textStyles.subtitle3.copyWith(
              color: VColors.defaultTextSubtle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "This is optional text that describes the headline and subtitle in more detail.",
            style: defaultVTheme.textStyles.bodyText2.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? VColors.defaultTextDark
                  : VColors.defaultText,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/images/chart.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}

// END

// BEGIN ContentCardWithImage
class VContentCardWithImage extends StatelessWidget {
  const VContentCardWithImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VContentCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Image.asset(
            "assets/images/content_card_image.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Headline",
                  style: defaultVTheme.textStyles.headline4.copyWith(
                    color: VColors.defaultActive,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Subtitle",
                  style: defaultVTheme.textStyles.subtitle3.copyWith(
                    color: VColors.defaultTextSubtle,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "This is optional text that describes the headline and subtitle in more detail.",
                  style: defaultVTheme.textStyles.bodyText2.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? VColors.defaultTextDark
                        : VColors.defaultText,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      onPressed: () {},
                      child: const Text("Primary action"),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    VLink(
                      semanticLabel: "Destination label",
                      title: "Destination label",
                      onPressed: () {},
                      isTrailingIcon: true,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// END

// BEGIN ContentCardWithIcon
class VContentCardWithIcon extends StatelessWidget {
  const VContentCardWithIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VContentCard(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VIcon(
            svgIcon: VIcons.securityLockHigh,
            iconHeight: 48,
            iconWidth: 48,
            iconColor: VColors.defaultActive,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Headline",
            style: defaultVTheme.textStyles.headline4.copyWith(
              color: VColors.defaultActive,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const ExcludeSemantics(
            excluding: true,
            child: VDivider(
              height: 0,
              dividerType: VDividerType.section,
              style: VDividerStyle(
                thickness: 1,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "This is optional text that describes the headline in more detail.",
            style: defaultVTheme.textStyles.bodyText2.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? VColors.defaultTextDark
                  : VColors.defaultText,
            ),
          ),
          VLink(
            semanticLabel: "Destination label",
            isTrailingIcon: true,
            title: "Destination label",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
// END

// BEGIN ContentCardCategory
class VContentCardCategory extends StatelessWidget {
  const VContentCardCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VContentCard(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const VIcon(
                svgIcon: VIcons.billLow,
                iconHeight: 24,
                iconWidth: 24,
                iconColor: VColors.defaultActive,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "CATEGORY",
                style: defaultVTheme.textStyles.overline
                    .copyWith(color: VColors.defaultActive),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Headline",
            style: defaultVTheme.textStyles.headline4.copyWith(
              color: VColors.defaultActive,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Subtitle",
            style: defaultVTheme.textStyles.subtitle3.copyWith(
              color: VColors.defaultTextSubtle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "This is optional text that describes the headline and subtitle in more detail.",
            style: defaultVTheme.textStyles.bodyText2.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? VColors.defaultTextDark
                  : VColors.defaultText,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
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
                onPressed: () {},
                child: const Text("Primary action"),
              ),
              const SizedBox(
                width: 15,
              ),
              VLink(
                semanticLabel: "Destination label",
                title: "Destination label",
                isTrailingIcon: true,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
// END

// BEGIN ContentCardCompact
class VContentCardCompact extends StatelessWidget {
  const VContentCardCompact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VContentCard(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      crossAxisAlignment: CrossAxisAlignment.start,
      hasBottomBar: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Headline",
            style: defaultVTheme.textStyles.headline4.copyWith(
              color: VColors.defaultActive,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "This is optional text that describes the headline in more detail.",
            style: defaultVTheme.textStyles.bodyText2.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? VColors.defaultTextDark
                  : VColors.defaultText,
            ),
          ),
          VLink(
            semanticLabel: "Destination label",
            title: "Destination label",
            isTrailingIcon: true,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
// END

// BEGIN ContentCardClickableCard
class VContentCardClickable extends StatefulWidget {
  const VContentCardClickable({
    Key? key,
  }) : super(key: key);

  @override
  State<VContentCardClickable> createState() => _VContentCardClickableState();
}

class _VContentCardClickableState extends State<VContentCardClickable> {
  bool isTapped = false;
  bool bottomBarVisible = false;
  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: VContentCard(
        onTapCancel: () {
          setState(() {
            isTapped = false;
            bottomBarVisible = false;
          });
        },
        onTapUp: () {
          setState(() {
            isTapped = false;
            bottomBarVisible = false;
          });
        },
        onTapDown: () {
          setState(() {
            isTapped = true;
            bottomBarVisible = true;
          });
        },
        hasBottomBar: bottomBarVisible,
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Headline",
                  style: defaultVTheme.textStyles.headline4.copyWith(
                    color: isTapped
                        ? VColors.defaultActivePressed
                        : VColors.defaultActive,
                  ),
                ),
                SizedBox(
                  width: isTapped ? 15 : 5,
                ),
                VIcon(
                  svgIcon: VIcons.chevronRightTiny,
                  iconColor: isTapped
                      ? VColors.defaultActivePressed
                      : VColors.defaultActive,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Subtitle",
              style: defaultVTheme.textStyles.subtitle3.copyWith(
                color: VColors.defaultTextSubtle,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "This is optional text that describes the headline in more detail.",
              style: defaultVTheme.textStyles.bodyText2.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? VColors.defaultTextDark
                    : VColors.defaultText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// END

// BEGIN ContentCardDefault
class VContentCardDefault extends StatelessWidget {
  const VContentCardDefault({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VContentCard(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Headline",
                  style: defaultVTheme.textStyles.headline4.copyWith(
                    color: VColors.defaultActive,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Subtitle",
            style: defaultVTheme.textStyles.subtitle3.copyWith(
              color: VColors.defaultTextSubtle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "This is optional text that describes the headline and subtitle in more detail.",
            style: defaultVTheme.textStyles.bodyText2.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? VColors.defaultTextDark
                  : VColors.defaultText,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
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
                onPressed: () {},
                child: const Text("Primary action"),
              ),
              const SizedBox(
                width: 15,
              ),
              VLink(
                semanticLabel: "Destination label",
                title: "Destination label",
                isTrailingIcon: true,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
// END

// BEGIN ContentCardWithUIButton
class VContentCardWithUIButton extends StatelessWidget {
  const VContentCardWithUIButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VContentCard(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Content card with UI buttons",
                  style: defaultVTheme.textStyles.headline4.copyWith(
                    color: VColors.defaultActive,
                  ),
                ),
              ),
              Semantics(
                value: "Mark as favorite.",
                onDidGainAccessibilityFocus: () {
                  SemanticsService.announce(
                    "Content card with UI buttons",
                    TextDirection.ltr,
                  );
                },
                child: InkWell(
                  child: const VIcon(
                    svgIcon: VIcons.fileUploadTiny,
                    iconFit: BoxFit.none,
                    iconHeight: 44,
                    iconWidth: 44,
                    iconColor: VColors.defaultActive,
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Semantics(
                value: "Mark as favorite.",
                onDidGainAccessibilityFocus: () {
                  SemanticsService.announce(
                    "Headline",
                    TextDirection.ltr,
                  );
                },
                child: InkWell(
                  child: const VIcon(
                    svgIcon: VIcons.favoriteStarOutlineTiny,
                    iconFit: BoxFit.none,
                    iconHeight: 44,
                    iconWidth: 44,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Subtitle",
            style: defaultVTheme.textStyles.subtitle3.copyWith(
              color: VColors.defaultTextSubtle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "This is optional text that describes the headline and subtitle in more detail.",
            style: defaultVTheme.textStyles.bodyText2.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? VColors.defaultTextDark
                  : VColors.defaultText,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
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
                onPressed: () {},
                child: const Text("Primary action"),
              ),
              const SizedBox(
                width: 15,
              ),
              VLink(
                semanticLabel: "Destination label",
                title: "Destination label",
                isTrailingIcon: true,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
// END