import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
import 'dart:ui';

void main() {
  final GlobalKey<ScaffoldState> tabScaffoldKey = GlobalKey<ScaffoldState>();
  // ! This is Tab unit test
  testWidgets("Tab theme testing", (WidgetTester tester) async {
    // Tab theme
    var theme = VTabBarStyle(
      indicatorColor: VColors.defaultActiveHover,
      indicatorWeight: 2.0,
      labelColor: VColors.defaultText,
      labelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
      unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge,
      overlayColor: VColors.defaultSurfaceLowlight,
      overlayColorPressed: VColors.defaultSurfaceLowlight,
      unselectedLabelColor: VColors.defaultTextSubtle,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Center(
              child: Material(
                child: VTabBar(
                  style: VTabBarStyle(
                    indicatorColor: theme.indicatorColor,
                    indicatorWeight: theme.indicatorWeight,
                    labelColor: theme.labelColor,
                    labelStyle: theme.labelStyle,
                    overlayColor: theme.overlayColor,
                    overlayColorPressed: theme.overlayColorPressed,
                    unselectedLabelColor: theme.unselectedLabelColor,
                    unselectedLabelStyle: theme.unselectedLabelStyle,
                  ),
                  vTabs: [
                    VTab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          VIcon(
                            svgIcon: VIcons.statisticsTiny,
                            svgImagePlaceholderBuilder: (_) => const SizedBox(
                              height: 16.0,
                              width: 16.0,
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            ),
                            iconWidth: 18,
                            iconHeight: 18,
                            iconColor: VColors.defaultActive,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text("Home")
                        ],
                      ),
                    ),
                    const VTab(
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
                          Text("Billing")
                        ],
                      ),
                    ),
                    const VTab(
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
                          Text("Statistics")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Find my widget
    final widgetFinder = find.byType(VTabBar);

    // Expect my widget uses the theme's color
    VTabBar tab = tester.widget(widgetFinder);
    expect(tab.style?.indicatorColor, theme.indicatorColor);
    expect(tab.style?.indicatorWeight, theme.indicatorWeight);
    expect(tab.style?.labelColor, theme.labelColor);
    expect(tab.style?.labelStyle, theme.labelStyle);
    expect(tab.style?.overlayColor, theme.overlayColor);
    expect(tab.style?.overlayColorPressed, theme.overlayColorPressed);
    expect(tab.style?.unselectedLabelColor, theme.unselectedLabelColor);
    expect(tab.style?.unselectedLabelStyle, theme.unselectedLabelStyle);
  });

  //! This is Tab golden test

  testWidgets('Tab golden(snapshot) testing', (WidgetTester tester) async {
    // Build widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Material(
              child: Builder(builder: (BuildContext context) {
                return Scaffold(
                  key: tabScaffoldKey,
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(105),
                    child: VAppBar(
                      backButtonAction: () {},
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
                                Text("Home")
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
                                Text("Billing")
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
                                Text("Statistics")
                              ],
                            ),
                          ),
                        ],
                      ), // TabBar
                      title: const Text(
                        'Horizontal Tab',
                      ),
                    ),
                  ), // AppBar
                  body: const TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Center(child: Text('Content of Tab One')),
                      Center(child: Text('Content of Tab Two')),
                      Center(child: Text('Content of Tab Three')),
                    ],
                  ), // TabBarView
                );
              }),
            )),
      ),
    );

    // Take a snapshot of the widget.
    await expectLater(
      find.byKey(tabScaffoldKey),
      matchesGoldenFile('goldens/tab.png'),
    );
  });

  test('VTabBarStyle copyWith, lerp', () {
    const style = VTabBarStyle(
      labelColor: Colors.red,
      unselectedLabelColor: Colors.green,
      overlayColor: Colors.blue,
      overlayColorPressed: Colors.yellow,
      indicatorColor: Colors.orange,
      indicatorWeight: 2.0,
      labelStyle: TextStyle(fontSize: 16),
      unselectedLabelStyle: TextStyle(fontSize: 14),
    );

    // Testing copyWith
    final copiedStyle = style.copyWith();

    expect(copiedStyle.labelColor, Colors.red);
    expect(copiedStyle.unselectedLabelColor, Colors.green);
    expect(copiedStyle.overlayColor, Colors.blue);
    expect(copiedStyle.overlayColorPressed, Colors.yellow);
    expect(copiedStyle.indicatorColor, Colors.orange);
    expect(copiedStyle.indicatorWeight, 2.0);
    expect(copiedStyle.labelStyle, const TextStyle(fontSize: 16));
    expect(copiedStyle.unselectedLabelStyle, const TextStyle(fontSize: 14));
  });

  test('VTabBarStyle lerp', () {
    const style = VTabBarStyle(
      labelColor: Colors.red,
      unselectedLabelColor: Colors.green,
      overlayColor: Colors.blue,
      overlayColorPressed: Colors.yellow,
      indicatorColor: Colors.orange,
      indicatorWeight: 2.0,
      labelStyle: TextStyle(fontSize: 16),
      unselectedLabelStyle: TextStyle(fontSize: 14),
    );

    const style2 = VTabBarStyle(
      labelColor: Colors.orange,
      unselectedLabelColor: Colors.blue,
      overlayColor: Colors.green,
      overlayColorPressed: Colors.red,
      indicatorColor: Colors.purple,
      indicatorWeight: 5.0,
      labelStyle: TextStyle(fontSize: 18),
      unselectedLabelStyle: TextStyle(fontSize: 16),
    );

    final lerpedStyle = style.lerp(style2, 0.5);

    expect(lerpedStyle.labelColor, Color.lerp(Colors.red, Colors.orange, 0.5));
    expect(lerpedStyle.unselectedLabelColor,
        Color.lerp(Colors.green, Colors.blue, 0.5));
    expect(
        lerpedStyle.overlayColor, Color.lerp(Colors.blue, Colors.green, 0.5));
    expect(lerpedStyle.overlayColorPressed,
        Color.lerp(Colors.yellow, Colors.red, 0.5));
    expect(lerpedStyle.indicatorColor,
        Color.lerp(Colors.orange, Colors.purple, 0.5));
    expect(lerpedStyle.indicatorWeight, lerpDouble(2.0, 5.0, 0.5));
  });

  testWidgets('vTabHasTextAndIcon should return correct boolean',
      (WidgetTester tester) async {
    // Create a VTab with height 72.0
    const vTab1 = VTab(height: 72.0);

    // Create a VTab with height not equal to 72.0
    const vTab2 = VTab(height: 50.0);

    // Create a VTabBar with vTab1
    const vTabBar1 = VTabBar(vTabs: [vTab1]);

    // Create a VTabBar with vTab2
    const vTabBar2 = VTabBar(vTabs: [vTab2]);

    expect(vTabBar1.vTabHasTextAndIcon,
        true); // Should return true as height is 72.0
    expect(vTabBar2.vTabHasTextAndIcon,
        false); // Should return false as height is not 72.0
  });

  testWidgets("Tab alt testing", (WidgetTester tester) async {
    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            key: tabScaffoldKey,
            body: Center(
              child: Material(
                child: VTabBar(
                  style: const VTabBarStyle(indicatorWeight: 2),
                  vExt: VAlt(),
                  vTabs: const [
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
                          Text("Home")
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
                          Text("Billing")
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
                          Text("Statistics")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(VTabBar), findsNWidgets(1));
  });

  testWidgets("Tab dark testing", (WidgetTester tester) async {
    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            key: tabScaffoldKey,
            body: const Center(
              child: Material(
                child: VTabBar(
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
                          Text("Home")
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
                          Text("Billing")
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
                          Text("Statistics")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(VTabBar), findsNWidgets(1));
  });

  testWidgets("Tab dark alt testing", (WidgetTester tester) async {
    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            key: tabScaffoldKey,
            body: Center(
              child: Material(
                child: VTabBar(
                  style: const VTabBarStyle(indicatorWeight: 2),
                  vExt: VAlt(),
                  vTabs: const [
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
                          Text("Home")
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
                          Text("Billing")
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
                          Text("Statistics")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(VTabBar), findsNWidgets(1));
  });
}
