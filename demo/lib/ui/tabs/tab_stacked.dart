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
// Visa Nova Flutter Demo TabStacked Page
import 'package:demo/utilities.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/ui/getting_started/getting_started.dart';

// BEGIN VMatTabStacked
class TabStacked extends StatelessWidget {
  const TabStacked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setPageTitle('Tab stacked', context);
    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(130),
            child: VAppBar(
              backButtonAction: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          GettingStarted() //const FlutterComponents()
                      ),
                  (Route<dynamic> route) => false,
                );
              },
              bottom: VMatTabBar(
                labelStyle: defaultVTheme.textStyles.uiLabelActive,
                labelColor: VColors.defaultText,
                unselectedLabelStyle: defaultVTheme.textStyles.uiLabel,
                overlayColor:
                    MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return VColors.defaultSurfaceLowlight;
                  }
                  return VColors.defaultSurfaceLowlight;
                }),
                indicatorWeight: 2,
                indicatorColor: VColors.defaultActiveHover,
                indicatorSize: VMatTabBarIndicatorSize.vTab,
                vTabs: const [
                  VTab(
                    icon: VIcon(
                      svgIcon: VIcons.statisticsTiny,
                      iconWidth: 24,
                      iconHeight: 24,
                      iconColor: VColors.defaultActive,
                    ),
                    text: "Label 1",
                  ),
                  VTab(
                    icon: VIcon(
                      svgIcon: VIcons.statisticsTiny,
                      iconWidth: 24,
                      iconHeight: 24,
                      iconColor: VColors.defaultActive,
                    ),
                    text: "Label 2",
                  ),
                  VTab(
                    icon: VIcon(
                      svgIcon: VIcons.statisticsTiny,
                      iconWidth: 24,
                      iconHeight: 24,
                      iconColor: VColors.defaultActive,
                    ),
                    text: "Label 3",
                  ),
                ],
              ), // TabBar
              title: const SemanticHeader(title: "Stacked tabs"),
            ),
          ), // AppBar
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            dragStartBehavior: DragStartBehavior.down,
            children: [
              SingleChildScrollView(
                  child: ShowCodeAccordion(
                codeSegment: CodeSegments.VMatTabStacked,
                componentName: 'Stacked_Tab',
                exampleName: 'Default_Stacked_Tab',
                copyLabel: 'Tab stacked',
              )),
              Center(child: Text('Tab panel label')),
              Center(child: Text('Tab panel label')),
            ],
          ), // TabBarView
        ), // Scaffold
      ),
    ); // DefaultTabController
    // MaterialApp
  }
}
// END