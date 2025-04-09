import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
import 'dart:ui';

class ScaffoldTester {
  static Future<void> openDrawer(GlobalKey<ScaffoldState> scaffoldKey) async {
    scaffoldKey.currentState?.openDrawer();
  }
}

void main() {
  final GlobalKey<ScaffoldState> drawerScaffoldKey = GlobalKey<ScaffoldState>();
  // ! This tests VNavDrawer opens on icon tap
  testWidgets("VNavDrawer opens on icon tap", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Builder(builder: (BuildContext context) {
          return Scaffold(
            key: drawerScaffoldKey,
            appBar: VAppBar(
              title: const Text("NavDrawer test"),
              leading: InkWell(
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
                onTap: () => ScaffoldTester.openDrawer(drawerScaffoldKey),
              ),
            ),
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
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(20, 0, 11, 12),
                          child: const VIcon(svgIcon: VIcons.successHigh),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(20, 0, 18, 0),
                          child: Text(
                            "Application Name",
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
                  title: 'SECTION TITLE',
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
                  title: 'SECTION TITLE',
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
              // Example of bottom items
              bottomItems: Column(
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
              onTap: (int i) {},
            ), // Your VNavDrawer goes here
          );
        }),
      ),
    );

    // Check that the drawer is initially closed
    expect(find.byType(VNavDrawer), findsNothing);

    // Find the icon and tap on it
    final inkWellFinder = find.byType(InkWell);
    await tester.tap(inkWellFinder);
    await tester.pumpAndSettle();

    // Check that the drawer is now open
    expect(find.byType(VNavDrawer), findsOneWidget);
  });

  // ! This is VNavDrawer unit test
  testWidgets("VNavDrawer theme testing", (WidgetTester tester) async {
    // VNavDrawer theme
    var theme = VNavDrawerStyle(
      backgroundColor: VColors.defaultSurface1,
      borderRadius: 0.0,
      selectedLabelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
      unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge
          .copyWith(color: VColors.defaultTextSubtle),
      selectedTileColor: VColors.defaultSurface3,
      selectedTileIndicatorColor: VColors.defaultActiveHover,
      splashColor: VColors.defaultSurfaceLowlight,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(builder: (BuildContext context) {
          return Scaffold(
            key: drawerScaffoldKey,
            drawer: VNavDrawer(
              style: theme,
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
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(20, 0, 11, 12),
                          child: const VIcon(svgIcon: VIcons.successHigh),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(20, 0, 18, 0),
                          child: Text(
                            "Application Name",
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
                  title: 'SECTION TITLE',
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
                  title: 'SECTION TITLE',
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
              // Example of bottom items
              bottomItems: Column(
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
              onTap: (int i) {},
            ),
          );
        }),
      ),
    );

    // Open the drawer
    await ScaffoldTester.openDrawer(drawerScaffoldKey);
    await tester.pumpAndSettle();

    // Find my widget
    final widgetFinder = find.byType(VNavDrawer);

    // Expect my widget uses the theme's color
    VNavDrawer vNavDrawer = tester.widget(widgetFinder);
    expect(vNavDrawer.style?.backgroundColor, theme.backgroundColor);
    expect(vNavDrawer.style?.borderRadius, theme.borderRadius);
    expect(vNavDrawer.style?.selectedLabelStyle, theme.selectedLabelStyle);
    expect(vNavDrawer.style?.unselectedLabelStyle, theme.unselectedLabelStyle);
    expect(vNavDrawer.style?.selectedTileColor, theme.selectedTileColor);
    expect(vNavDrawer.style?.selectedTileIndicatorColor,
        theme.selectedTileIndicatorColor);
    expect(vNavDrawer.style?.splashColor, theme.splashColor);
  });

  //! This is VNavDrawer golden test
  testWidgets('VNavDrawer golden(snapshot) testing',
      (WidgetTester tester) async {
    // Build widget and trigger a frame.
    await tester.pumpWidget(
      RepaintBoundary(
        child: MaterialApp(
          home: Builder(builder: (BuildContext context) {
            return Scaffold(
              key: drawerScaffoldKey,
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
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.fromLTRB(20, 0, 11, 12),
                            child: const VIcon(svgIcon: VIcons.successHigh),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.fromLTRB(20, 0, 18, 0),
                            child: Text(
                              "Application Name",
                              style: defaultVTheme.textStyles.subtitle1
                                  .copyWith(
                                      color: VColors.defaultActive,
                                      height: 1.2778),
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
                    title: 'SECTION TITLE',
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
                    title: 'SECTION TITLE',
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
                // Example of bottom items
                bottomItems: Column(
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
                onTap: (int i) {},
              ),
            );
          }),
        ),
      ),
    );

    // Open the drawer
    await ScaffoldTester.openDrawer(drawerScaffoldKey);
    await tester.pumpAndSettle();

    // Take a snapshot of the widget.
    await expectLater(
      find.byType(VNavDrawer),
      matchesGoldenFile('goldens/nav_drawer.png'),
    );
  });

  test("VNavDrawerStyle copyWith and lerp testing", () {
    // Create an initial theme
    var theme = VNavDrawerStyle(
      backgroundColor: VColors.defaultSurface1,
      borderRadius: 0.0,
      selectedLabelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
      unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge
          .copyWith(color: VColors.defaultTextSubtle),
      selectedTileColor: VColors.defaultSurface3,
      selectedTileIndicatorColor: VColors.defaultActiveHover,
      splashColor: VColors.defaultSurfaceLowlight,
    );

    // Test copyWith with non-null backgroundColor
    var copiedTheme = theme.copyWith(backgroundColor: Colors.red);
    expect(copiedTheme.backgroundColor, Colors.red);

    // Test copyWith with null backgroundColor
    var copiedThemeWithNullColor = theme.copyWith();
    expect(copiedThemeWithNullColor.backgroundColor, VColors.defaultSurface1);

    // Create another theme for lerp testing
    var anotherTheme = VNavDrawerStyle(
      backgroundColor: VColors.defaultSurface2,
      borderRadius: 1.0,
      selectedLabelStyle: defaultVTheme.textStyles.uiLabelLargeActive,
      unselectedLabelStyle: defaultVTheme.textStyles.uiLabelLarge
          .copyWith(color: VColors.defaultTextSubtle),
      selectedTileColor: VColors.defaultSurface3,
      selectedTileIndicatorColor: VColors.defaultActiveHover,
      splashColor: VColors.defaultSurfaceLowlight,
    );

    // Test lerp
    var lerpedTheme = theme.lerp(anotherTheme, 0.5);
    expect(lerpedTheme.backgroundColor,
        Color.lerp(theme.backgroundColor, anotherTheme.backgroundColor, 0.5));
    expect(lerpedTheme.borderRadius,
        lerpDouble(theme.borderRadius, anotherTheme.borderRadius, 0.5));
  });

  testWidgets('VNavDrawer onTap coverage test', (WidgetTester tester) async {
    int tappedIndex = -1;

    // Build your VNavDrawer widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          drawer: VNavDrawer(
            vExt: VAlt(),
            onTap: (index) {
              tappedIndex = index; // Update the tappedIndex when item is tapped
            },
            vNavDrawerSections: [
              VNavDrawerSection(
                title: 'SECTION TITLE',
                items: [
                  VNavDrawerItem(
                    label: "L1 label 1",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    // Open the drawer
    await tester.dragFrom(const Offset(0, 0), const Offset(300, 0));
    await tester.pumpAndSettle();

    // Tap the ListTile
    await tester.tap(find.text('L1 label 1'));
    await tester.pumpAndSettle();

    // Verify that the onTap function has been called with the correct index
    expect(tappedIndex, 0);
  });

  testWidgets('VNavDrawer dark theme alt test', (WidgetTester tester) async {
    int tappedIndex = -1;

    // Build your VNavDrawer widget
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          drawer: VNavDrawer(
            vExt: VAlt(),
            onTap: (index) {
              tappedIndex = index; // Update the tappedIndex when item is tapped
            },
            vNavDrawerSections: [
              VNavDrawerSection(
                title: 'SECTION TITLE',
                items: [
                  VNavDrawerItem(
                    label: "L1 label 1",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    // Open the drawer
    await tester.dragFrom(const Offset(0, 0), const Offset(300, 0));
    await tester.pumpAndSettle();

    // Tap the ListTile
    await tester.tap(find.text('L1 label 1'));
    await tester.pumpAndSettle();

    // Verify that the onTap function has been called with the correct index
    expect(tappedIndex, 0);
  });
}
