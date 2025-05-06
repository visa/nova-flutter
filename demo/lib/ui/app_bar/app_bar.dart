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
// Visa Nova Flutter Demo AppBar Page
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
// Demo app imports
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import '../../codeviewer/code_segments.dart';
import 'package:demo/ui/getting_started/getting_started.dart';
import 'package:demo/utilities.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Top app bar', context);

    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
          key: _key,
          appBar: CustomAppBar(globalKey: _key, title: "Top app bar"),
          drawer: const MyDrawer(pageTitle: "Top app bar"),
          body: const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SemanticHeader(
                    title: "Default top app bar",
                  ),
                ),
                VAppBarDefault(),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ShowCodeAccordion(
                    codeSegment: CodeSegments.VAppBarDefault,
                    componentName: 'AppBar',
                    exampleName: 'Default_AppBar',
                    copyLabel: 'Top app bar',
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SemanticHeader(
                    title: "Alternate default top app bar",
                  ),
                ),
                VAppBarDefaultAlt(),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ShowCodeAccordion(
                    codeSegment: CodeSegments.VAppBarDefaultAlt,
                    componentName: 'AppBar',
                    exampleName: 'Default_Alt_AppBar',
                    copyLabel: 'Top app bar',
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SemanticHeader(
                    title: "Top app bar with page title",
                  ),
                ),
                VAppBarPageTitle(),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ShowCodeAccordion(
                    codeSegment: CodeSegments.VAppBarPageTitle,
                    componentName: 'AppBar',
                    exampleName: 'Default_AppBar_With_Page_Title',
                    copyLabel: 'Top app bar',
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SemanticHeader(
                    title: "Alternate top app bar with page title",
                  ),
                ),
                VAppBarPageTitleAlt(),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ShowCodeAccordion(
                    codeSegment: CodeSegments.VAppBarPageTitleAlt,
                    componentName: 'AppBar',
                    exampleName: 'Alt_AppBar_With_Page_Title',
                    copyLabel: 'Top app bar',
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

// BEGIN VAppBarPageTitleAlt
class VAppBarPageTitleAlt extends StatelessWidget {
  const VAppBarPageTitleAlt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAppBar(
      vExt: VAlt(),
      style: const VAppBarStyle(iconColor: VColors.alternateActive),
      backButtonAction: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => GettingStarted() //const FlutterComponents()
              ),
          (Route<dynamic> route) => false,
        );
      },
      title: const Text(
        "Page title",
        style: TextStyle(color: VColors.defaultSurface1),
      ),
    );
  }
}
// END

// BEGIN VAppBarPageTitle
class VAppBarPageTitle extends StatelessWidget {
  const VAppBarPageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAppBar(
      backButtonAction: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => GettingStarted() //const FlutterComponents()
              ),
          (Route<dynamic> route) => false,
        );
      },
      title: const Text("Page title"),
    );
  }
}
// END

// BEGIN VAppBarDefaultAlt
class VAppBarDefaultAlt extends StatelessWidget {
  const VAppBarDefaultAlt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VAppBar(
      vExt: VAlt(),
      leading: Semantics(
        label: "Menu",
        button: true,
        child: InkWell(
          customBorder: const CircleBorder(),
          splashColor: VColors.alternateSurfaceLowlight,
          child: Container(
            width: 44,
            height: 44,
            padding: const EdgeInsets.all(16),
            child: const ExcludeSemantics(
              child: VIcon(
                svgIcon: VIcons.menuLow,
                iconColor: VColors.alternateActive,
                iconHeight: 24,
                iconWidth: 24,
              ),
            ),
          ),
          onTap: () {},
        ),
      ),
      title: Semantics(
        label: "Visa Top App Bar Default Alternate",
        child: const VIconAsset(
          svgIcon: "assets/icons/visa.svg",
          iconColor: VColors.alternateAccent,
          iconHeight: 23,
          iconWidth: 71,
        ),
      ),
      actionList: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 16, 4),
          child: Semantics(
            button: true,
            label: "Profile",
            child: InkWell(
              customBorder: const CircleBorder(),
              splashColor: VColors.alternateSurfaceLowlight,
              child: Container(
                width: 44,
                height: 44,
                padding: const EdgeInsets.all(10),
                child: const ExcludeSemantics(
                  child: VIcon(
                    svgIcon: VIcons.accountLow,
                    iconColor: VColors.alternateActive,
                    iconHeight: 24,
                    iconWidth: 24,
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
// END

// BEGIN VAppBarDefault
class VAppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  const VAppBarDefault({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return VAppBar(
      backButtonAction: () {
        Navigator.pop(context);
      },
      leading: Semantics(
        label: "Menu",
        button: true,
        child: InkWell(
          customBorder: const CircleBorder(),
          splashColor: VColors.defaultSurfaceLowlight,
          child: Container(
            width: 44,
            height: 44,
            padding: const EdgeInsets.all(16),
            child: const ExcludeSemantics(
              child: VIcon(
                iconColor: VColors.defaultActive,
                svgIcon: VIcons.menuLow,
                iconHeight: 24,
                iconWidth: 24,
              ),
            ),
          ),
          onTap: () {},
        ),
      ),
      title: Semantics(
        label: "Visa Top App Bar",
        child: const VIconAsset(
          svgIcon: "assets/icons/visa.svg",
          iconHeight: 23,
          iconWidth: 71,
        ),
      ),
      actionList: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
          child: Semantics(
            label: "Search",
            button: true,
            child: InkWell(
              customBorder: const CircleBorder(),
              splashColor: VColors.defaultSurfaceLowlight,
              child: Container(
                width: 44,
                height: 44,
                padding: const EdgeInsets.all(10),
                child: const ExcludeSemantics(
                  child: VIcon(
                    svgIcon: VIcons.searchLow,
                    iconHeight: 24,
                    iconWidth: 24,
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 16, 4),
          child: Semantics(
            label: "Profile",
            button: true,
            child: InkWell(
              customBorder: const CircleBorder(),
              splashColor: VColors.defaultSurfaceLowlight,
              child: Container(
                width: 44,
                height: 44,
                padding: const EdgeInsets.all(10),
                child: const ExcludeSemantics(
                  child: VIcon(
                    svgIcon: VIcons.accountLow,
                    iconColor: VColors.defaultActive,
                    iconHeight: 24,
                    iconWidth: 24,
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
// END
