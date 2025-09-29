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
// Visa Nova Flutter Demo Avatar Page
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class Avatar extends StatelessWidget {
  Avatar({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Avatar', context);

    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Avatar"),
        drawer: const MyDrawer(pageTitle: "Avatar"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SemanticHeader(
                  title: "Small avatars",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                largeHeight(),
                const SemanticHeader(
                  title: "Small image avatar",
                ),
                smallHeight(),
                const VAvatarProfileSmall(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VAvatarProfileSmall,
                  componentName: 'Avatar',
                  exampleName: 'Small_Image_Avatar',
                  copyLabel: "Small image avatar",
                ),
                smallHeight(),
                const SemanticHeader(
                  title: "Small initials avatar",
                ),
                smallHeight(),
                const VAvatarInitialSmall(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VAvatarInitialSmall,
                  componentName: 'Avatar',
                  exampleName: 'Small_initials_Avatar',
                  copyLabel: "Small initials avatar",
                ),
                /*smallHeight(),
                const SemanticHeader(
                  title: "Small horizontal icon avatar",
                ),
                smallHeight(),
                const SemanticHeader(
                  title: "Small vertical icon avatar",
                ),*/
                smallHeight(),
                const SemanticHeader(
                  title: "Small vertical icon avatar",
                ),
                smallHeight(),
                const VerticalAvatarWithImageSmall(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VerticalAvatarWithImageSmall,
                  componentName: 'Avatar',
                  exampleName: 'Small_Vertical_Avatar_With_Image',
                  copyLabel: "Small vertical icon avatar",
                ),
                smallHeight(),
                const Divider(),
                smallHeight(),
                SemanticHeader(
                  title: "Large avatars",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                largeHeight(),
                smallHeight(),
                const SemanticHeader(
                  title: "Large image avatar",
                ),
                smallHeight(),
                const ProfileAvatarWithImage(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.ProfileAvatarWithImage,
                  componentName: 'Avatar',
                  exampleName: 'Large_Image_Avatar',
                  copyLabel: "Large image avatar",
                ),
                smallHeight(),
                const SemanticHeader(
                  title: "Large initials avatar",
                ),
                smallHeight(),
                const ProfileAvatarWithInitials(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.ProfileAvatarWithInitials,
                  componentName: 'Avatar',
                  exampleName: 'Large_Initials_Avatar',
                  copyLabel: "Large initials avatar",
                ),
                smallHeight(),
                const SemanticHeader(
                  title: "Large icon avatar",
                ),
                smallHeight(),
                const VerticalAvatarWithImage(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VerticalAvatarWithImage,
                  componentName: 'Avatar',
                  exampleName: 'Large_Avatar_With_Image',
                  copyLabel: "Large icon avatar",
                ),
                /*const Divider(),
                smallHeight(),
                const SemanticHeader(
                  title: "Example of vertical avatar with icon",
                ),
                smallHeight(),
                const VerticalAvatarWithIcon(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VerticalAvatarWithIcon,
                  componentName: 'Avatar',
                  exampleName: 'Vertical_Avatar_With_Icon',
                  copyLabel: "Example of vertical avatar with icon",
                ),
                smallHeight(),
                const SemanticHeader(
                  title: "Example of vertical avatar with initials",
                ),
                smallHeight(),
                const VerticalAvatarWithInitials(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VerticalAvatarWithInitials,
                  componentName: 'Avatar',
                  exampleName: 'Vertical_Avatar_With_Initial',
                  copyLabel: "Example of vertical avatar with initials",
                ),*/
                smallHeight(),
                const SemanticHeader(
                  title: "Text avatar",
                ),
                smallHeight(),
                const VerticalAvatarWithText(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VerticalAvatarWithText,
                  componentName: 'Avatar',
                  exampleName: 'Text_Avatar',
                  copyLabel: "Text Avatar",
                ),
                smallHeight(),
                const SemanticHeader(
                  title: "Large fictitious brand avatar",
                ),
                smallHeight(),
                const LargeFictitiousAvatar(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.LargeFictitiousAvatar,
                  componentName: 'Avatar',
                  exampleName: 'Text_Avatar',
                  copyLabel: "Text Avatar",
                ),
                largeHeight(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN ProfileAvatarWithImage
class ProfileAvatarWithImage extends StatelessWidget {
  const ProfileAvatarWithImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VAvatarProfile(
      style: VAvatarStyle(radius: 24),
      backgroundImage: AssetImage("assets/images/avatarImage.png"),
      semanticLabel: "Alex Miller",
    );
  }
}

// END
// BEGIN ProfileAvatarWithInitials
class ProfileAvatarWithInitials extends StatelessWidget {
  const ProfileAvatarWithInitials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAvatarProfile(
      semanticLabel: "Alex Miller",
      style: const VAvatarStyle(radius: 24),
      child: Text(
        "AM",
        style: defaultVTheme.textStyles.bodyText2.copyWith(
          color: VColors.defaultSurface1,
          fontSize: 14,
          height: 1.35,
        ),
      ),
    );
  }
}
// END

// BEGIN VerticalAvatarWithIcon
class VerticalAvatarWithIcon extends StatelessWidget {
  const VerticalAvatarWithIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAvatarVertical(
      leading: const VAvatarProfile(
        style: VAvatarStyle(backgroundColor: VColors.transparent, radius: 9),
        child: VIcon(
          iconFit: BoxFit.contain,
          svgIcon: VIcons.accountTiny,
          iconColor: VColors.defaultActive,
          iconHeight: 20,
          iconWidth: 20,
        ),
      ),
      child: Text(
        "Alex Miller",
        style: defaultVTheme.textStyles.uiLabelLarge.copyWith(
          color: VColors.defaultTextSubtle,
        ),
      ),
      onTap: () {},
    );
  }
}
// END

// BEGIN VerticalAvatarWithInitials
class VerticalAvatarWithInitials extends StatelessWidget {
  const VerticalAvatarWithInitials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAvatarVertical(
      leading: VAvatarProfile(
        style: const VAvatarStyle(radius: 24),
        child: Text(
          "AM",
          style: defaultVTheme.textStyles.bodyText2.copyWith(
            color: VColors.defaultSurface1,
            fontSize: 14,
            height: 1.29,
          ),
        ),
      ),
      child: Text(
        "Alex Miller",
        style: defaultVTheme.textStyles.uiLabelLarge.copyWith(
          color: VColors.defaultTextSubtle,
        ),
      ),
      onTap: null,
    );
  }
}
// END

// BEGIN VerticalAvatarWithText
class VerticalAvatarWithText extends StatelessWidget {
  const VerticalAvatarWithText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAvatarVertical(
      child: Text(
        "Alex Miller",
        style: defaultVTheme.textStyles.uiLabelLarge.copyWith(
          color: VColors.defaultTextSubtle,
        ),
      ),
      onTap: null,
    );
  }
}
// END

// BEGIN VerticalAvatarWithImage
class VerticalAvatarWithImage extends StatelessWidget {
  const VerticalAvatarWithImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VAvatarProfile(
      style: VAvatarStyle(backgroundColor: VColors.defaultActive, radius: 24),
      child: VIcon(
        iconFit: BoxFit.contain,
        svgIcon: VIcons.accountTiny,
        iconColor: VColors.defaultSurface1,
        iconHeight: 20,
        iconWidth: 20,
      ),
    );
  }
}
// END

// BEGIN VAvatarProfileSmall
class VAvatarProfileSmall extends StatelessWidget {
  const VAvatarProfileSmall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const VAvatarProfile(
      backgroundImage: AssetImage("assets/images/avatarImage.png"),
    );
  }
}
// END

// BEGIN VAvatarInitialSmall
class VAvatarInitialSmall extends StatelessWidget {
  const VAvatarInitialSmall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VAvatarProfile(
      semanticLabel: "Alex Miller",
      child: Text(
        "AM",
        style: defaultVTheme.textStyles.bodyText2.copyWith(
          color: VColors.defaultSurface1,
          fontSize: 14,
          height: 1.35,
        ),
      ),
    );
  }
}
// END

// BEGIN VerticalAvatarWithImageSmall
class VerticalAvatarWithImageSmall extends StatelessWidget {
  const VerticalAvatarWithImageSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAvatarVertical(
      leading: const VAvatarProfile(
        style: VAvatarStyle(backgroundColor: VColors.transparent, radius: 9),
        child: VIcon(
          iconFit: BoxFit.contain,
          svgIcon: VIcons.accountTiny,
          iconColor: VColors.defaultActive,
          iconHeight: 20,
          iconWidth: 20,
        ),
      ),
      child: Row(
        children: [
          Text(
            "Alex Miller",
            style: defaultVTheme.textStyles.uiLabelLarge.copyWith(
              color: VColors.defaultTextSubtle,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          const VIcon(
            iconFit: BoxFit.contain,
            svgIcon: VIcons.chevronDownTiny,
            iconColor: VColors.defaultSubtle,
            iconHeight: 20,
            iconWidth: 20,
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
// END

// BEGIN VerticalAvatarWithInitialsSmall
class VerticalAvatarWithInitialsSmall extends StatelessWidget {
  const VerticalAvatarWithInitialsSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAvatarVertical(
      leading: VAvatarProfile(
        // style: const VAvatarStyle(radius: 19),
        child: Text(
          "AM",
          style: defaultVTheme.textStyles.bodyText2.copyWith(
            color: VColors.defaultSurface1,
            fontSize: 14,
            height: 1.29,
          ),
        ),
      ),
      child: Text(
        "Alex Miller",
        style: defaultVTheme.textStyles.uiLabelLarge.copyWith(
          color: VColors.defaultTextSubtle,
        ),
      ),
      onTap: null,
    );
  }
}
// END

// BEGIN LargeFictitiousAvatar
class LargeFictitiousAvatar extends StatelessWidget {
  const LargeFictitiousAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAvatarProfile(
        style:
            const VAvatarStyle(backgroundColor: Color(0xFF6DF2FA), radius: 24),
        child: Text(
          "D",
          style: defaultVTheme.textStyles.uiLabelLarge.copyWith(
              color: VColors.defaultTextSubtle, fontWeight: FontWeight.bold),
        ));
  }
}
// END
