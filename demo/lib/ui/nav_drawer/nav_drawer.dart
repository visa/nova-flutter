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
// Visa Nova Flutter Demo Navigation Drawer Page
import 'package:demo/utilities.dart';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/ui/getting_started/getting_started.dart';

// BEGIN VNavDrawer
GlobalKey<ScaffoldState> _key = GlobalKey();

class NavDrawerPage extends StatefulWidget {
  const NavDrawerPage({Key? key}) : super(key: key);

  @override
  State<NavDrawerPage> createState() => _NavDrawerPageState();
}

class _NavDrawerPageState extends State<NavDrawerPage> {
  int _selectedIndex = 0;

  // Context of each page
  static final List<Widget> _widgetOptions = <Widget>[
    const ShowCodeAccordion(
      copyLabel: "Navigation Drawer",
      codeSegment: CodeSegments.VNavDrawer,
      componentName: 'Navigation_Drawer',
      exampleName: 'Default_Navigation_Drawer',
    ),
    Text(
      'L1 label 2',
      style: defaultVTheme.textStyles.bodyText2,
    ),
    Text(
      'L1 label 3',
      style: defaultVTheme.textStyles.bodyText2,
    ),
    Text(
      'L1 label 4',
      style: defaultVTheme.textStyles.bodyText2,
    ),
    Text(
      'L1 label 5',
      style: defaultVTheme.textStyles.bodyText2,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Navigation Drawer', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        // Demonstrate how to use VAppBar with VNavDrawer
        appBar: VAppBar(
          title: const SemanticHeader(title: "Navigation drawer"),
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
              onTap: () {
                _key.currentState?.openDrawer();
              },
            ),
          ),
          actionList: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 16, 4),
              child: Semantics(
                button: true,
                label: "Back",
                child: InkWell(
                  customBorder: const CircleBorder(),
                  splashColor: VColors.defaultSurfaceLowlight,
                  child: Container(
                    width: 44,
                    height: 44,
                    padding: const EdgeInsets.all(10),
                    child: const ExcludeSemantics(
                      child: VIcon(
                        svgIcon: VIcons.arrowBackLow,
                        iconHeight: 24,
                        iconWidth: 24,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GettingStarted() //const FlutterComponents()
                          ),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        // Drawer body of every tab
        body: SingleChildScrollView(
          child: _widgetOptions[_selectedIndex],
        ),
        // VNavDrawer is very clean if you do not wish to style it
        drawer: VNavDrawer(
          header: Theme(
            data: Theme.of(context).copyWith(
              dividerTheme: const DividerThemeData(
                color: Colors.transparent,
              ),
            ),
            // Example of Visa style drawer header
            child: SizedBox(
              height: MediaQuery.paddingOf(context).top + 130,
              child: DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4, 4, 0),
                      child: Row(
                        children: [
                          const Spacer(),
                          Material(
                            color: VColors.transparent,
                            child: MergeSemantics(
                              child: Semantics(
                                label: "Close",
                                button: true,
                                child: InkWell(
                                  highlightColor: VColors.transparent,
                                  customBorder: const CircleBorder(),
                                  splashColor: VColors.defaultSurfaceLowlight,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 44,
                                    height: 44,
                                    padding: const EdgeInsets.fromLTRB(
                                        14, 14, 14, 14),
                                    child: VIcon(
                                      svgIcon: VIcons.closeTiny,
                                      iconColor: VColors.defaultActiveSubtle
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(20, 0, 11, 12),
                      child: Semantics(
                        label: "visa",
                        child: const VIconAsset(
                          svgIcon: "assets/icons/visa.svg",
                          iconHeight: 23,
                          iconWidth: 71,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(20, 0, 18, 0),
                      child: Text(
                        "Application name",
                        style: defaultVTheme.textStyles.subtitle1.copyWith(
                            color: VColors.defaultActive, height: 1.2778),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Drawer items
          vNavDrawerSections: [
            VNavDrawerSection(
              title: 'SECTION TITLE 1',
              items: [
                VNavDrawerItem(
                  label: "L1 label 1",
                ),
                VNavDrawerItem(
                  label: "L1 label 2",
                ),
                VNavDrawerItem(
                  label: "L1 label 3",
                ),
              ],
            ),
            VNavDrawerSection(
              title: 'SECTION TITLE 2',
              items: [
                VNavDrawerItem(
                  label: "L1 label 4",
                ),
                VNavDrawerItem(
                  label: "L1 label 5",
                ),
              ],
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          // Example of bottom items
          bottomItems: MergeSemantics(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: VDivider(
                    dividerType: VDividerType.decorative,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ListTile(
                    horizontalTitleGap: 10,
                    minLeadingWidth: 10,
                    leading: const VIcon(
                      iconHeight: 20,
                      iconWidth: 20,
                      svgIcon: VIcons.accountTiny,
                      iconColor: VColors.defaultActive,
                    ),
                    title: Text(
                      "Alex Miller",
                      style: defaultVTheme.textStyles.uiLabelLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// END
