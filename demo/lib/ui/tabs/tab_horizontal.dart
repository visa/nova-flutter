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
// Visa Nova Flutter TabHorizontal Page
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

// BEGIN VMatTabHorizontal
class TabHorizontal extends StatefulWidget {
  const TabHorizontal({Key? key}) : super(key: key);

  @override
  State<TabHorizontal> createState() => TabHorizontalState();
}

class TabHorizontalState extends State<TabHorizontal>
    with TickerProviderStateMixin {
  late TabController _controller;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      if (_controller.indexIsChanging) {
        // Tab is switching
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setPageTitle('Tab horizontal', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          key: _key,
          appBar: CustomAppBar(
            globalKey: _key, title: "Horizontal tabs",
            preferredSize: const Size.fromHeight(105),

            bottom: const VTabBar(
              vTabs: [
                VTab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VIcon(
                        svgIcon: VIcons.statisticsTiny,
                        iconWidth: 18,
                        iconHeight: 18,
                        iconColor: VColors.defaultActive,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                          fit: FlexFit.loose,
                          child: Text("Label 1",
                              softWrap: false, overflow: TextOverflow.fade))
                    ],
                  ),
                ),
                VTab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VIcon(
                        svgIcon: VIcons.statisticsTiny,
                        iconWidth: 18,
                        iconHeight: 18,
                        iconColor: VColors.defaultActive,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                          fit: FlexFit.loose,
                          child: Text("Label 2",
                              softWrap: false, overflow: TextOverflow.fade))
                    ],
                  ),
                ),
                VTab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VIcon(
                        svgIcon: VIcons.statisticsTiny,
                        iconWidth: 18,
                        iconHeight: 18,
                        iconColor: VColors.defaultActive,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                          fit: FlexFit.loose,
                          child: Text("Label 3",
                              softWrap: false, overflow: TextOverflow.fade))
                    ],
                  ),
                ),
              ],
            ), // TabBar
          ),
          drawer: const MyDrawer(
            pageTitle: "Horizontal tab",
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            dragStartBehavior: DragStartBehavior.down,
            children: [
              SingleChildScrollView(
                  child: ShowCodeAccordion(
                codeSegment: CodeSegments.VMatTabHorizontal,
                componentName: 'Divider',
                exampleName: 'Default_Divider',
                copyLabel: 'Tab horizontal',
              )),
              Center(child: Text('Tab panel label')),
              Center(child: Text('Tab panel label')),
            ],
          ), // TabBarView
        ), // Scaffold
      ),
    ); // MaterialApp
  }
}
// END
