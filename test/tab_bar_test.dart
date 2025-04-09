import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
import 'dart:ui';

enum Options { option1, option2 }

void main() {
  // ! This is TabBar unit test
  testWidgets("TabBar theme testing", (WidgetTester tester) async {
    // TabBar theme
    var theme = VBottomNavBarStyle(
      backgroundColor: VColors.defaultSurface1,
      borderColor: VColors.defaultBorder,
      selectedFontSize: 12,
      selectedIconSize: 24,
      selectedItemColor: VColors.defaultActive,
      selectedTextColor: VColors.defaultText,
      splashColor: VColors.transparent,
      unselectedFontSize: 12,
      unselectedIconSize: 24,
      unselectedItemColor: VColors.defaultSubtle,
      unselectedTextColor: VColors.defaultTextSubtle,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Material(
              child: VBottomNavBar(
                style: VBottomNavBarStyle(
                  backgroundColor: theme.backgroundColor,
                  borderColor: theme.borderColor,
                  selectedFontSize: theme.selectedFontSize,
                  selectedIconSize: theme.selectedIconSize,
                  selectedItemColor: theme.selectedItemColor,
                  selectedTextColor: theme.selectedTextColor,
                  splashColor: theme.splashColor,
                  unselectedFontSize: theme.unselectedFontSize,
                  unselectedIconSize: theme.unselectedIconSize,
                  unselectedItemColor: theme.unselectedItemColor,
                  unselectedTextColor: theme.unselectedTextColor,
                ),
                onTap: (int i) {},
                visaBottomNavBarItems: [
                  VBottomBarItems(
                    icon: VIcons.homeLow,
                    label: 'Home',
                  ),
                  VBottomBarItems(
                    icon: VIcons.historyLow,
                    label: 'History',
                  ),
                  VBottomBarItems(
                    icon: VIcons.settingsLow,
                    label: 'Settings',
                  ),
                  VBottomBarItems(
                    icon: VIcons.reportLow,
                    label: 'Reports',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Find my widget
    final widgetFinder = find.byType(VBottomNavBar);

    // Expect my widget uses the theme's color
    VBottomNavBar tabBar = tester.widget(widgetFinder);
    expect(tabBar.style?.backgroundColor, theme.backgroundColor);
    expect(tabBar.style?.borderColor, theme.borderColor);
    expect(tabBar.style?.selectedFontSize, theme.selectedFontSize);
    expect(tabBar.style?.selectedIconSize, theme.selectedIconSize);
    expect(tabBar.style?.selectedItemColor, theme.selectedItemColor);
    expect(tabBar.style?.selectedTextColor, theme.selectedTextColor);
    expect(tabBar.style?.splashColor, theme.splashColor);
    expect(tabBar.style?.unselectedFontSize, theme.unselectedFontSize);
    expect(tabBar.style?.unselectedIconSize, theme.unselectedIconSize);
    expect(tabBar.style?.unselectedItemColor, theme.unselectedItemColor);
    expect(tabBar.style?.unselectedTextColor, theme.unselectedTextColor);
  });

  //! This is TabBar golden test

  testWidgets('TabBar golden(snapshot) testing', (WidgetTester tester) async {
    int selectedIndex = 0;
    final List<Widget> widgetOptions = <Widget>[
      Text(
        'Index 0: Home page of testing',
        style: defaultVTheme.textStyles.headline2,
      ),
      Text(
        'Index 1: History',
        style: defaultVTheme.textStyles.headline2,
      ),
      Text(
        'Index 2: Goals',
        style: defaultVTheme.textStyles.headline2,
      ),
      Text(
        'Index 3: Reports',
        style: defaultVTheme.textStyles.headline2,
      ),
    ];

    void onItemTapped(int index) {
      selectedIndex = index;
    }

    // Build widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: RepaintBoundary(
          child: Center(
            child: SizedBox(
              width: 420,
              height: 600,
              child: Material(
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Scaffold(
                      appBar: const VAppBar(
                        title: Text(
                          'Tab Bar',
                        ),
                      ),
                      body: SingleChildScrollView(
                        child: widgetOptions.elementAt(selectedIndex),
                      ),
                      bottomNavigationBar: VBottomNavBar(
                        visaBottomNavBarItems: [
                          VBottomBarItems(
                            icon: VIcons.homeLow,
                            label: 'Home',
                          ),
                          VBottomBarItems(
                            icon: VIcons.historyLow,
                            label: 'History',
                          ),
                          VBottomBarItems(
                            icon: VIcons.settingsLow,
                            label: 'Settings',
                          ),
                          VBottomBarItems(
                            icon: VIcons.reportLow,
                            label: 'Reports',
                          ),
                        ],
                        currentIndex: selectedIndex,
                        onTap: (index) {
                          setState(() {
                            onItemTapped(index);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Take a snapshot of the widget.
    await expectLater(
      find.byType(Scaffold),
      matchesGoldenFile('goldens/tab_bar.png'),
    );
  });

  test('VBottomNavBarStyle copyWith test for retaining original values', () {
    const original = VBottomNavBarStyle(
      backgroundColor: Colors.red,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.yellow,
      selectedTextColor: Colors.orange,
      unselectedTextColor: Colors.purple,
      splashColor: Colors.green,
      borderColor: Colors.brown,
      selectedFontSize: 10.0,
      unselectedFontSize: 12.0,
      selectedIconSize: 14.0,
      unselectedIconSize: 16.0,
    );

    final copy = original.copyWith();

    // Verify that the copy retains the original values
    expect(copy.backgroundColor, Colors.red);
    expect(copy.selectedItemColor, Colors.blue);
    expect(copy.unselectedItemColor, Colors.yellow);
    expect(copy.selectedTextColor, Colors.orange);
    expect(copy.unselectedTextColor, Colors.purple);
    expect(copy.splashColor, Colors.green);
    expect(copy.borderColor, Colors.brown);
    expect(copy.selectedFontSize, 10.0);
    expect(copy.unselectedFontSize, 12.0);
    expect(copy.selectedIconSize, 14.0);
    expect(copy.unselectedIconSize, 16.0);
  });

  test('VBottomNavBarStyle lerp testing', () {
    // Create an initial style
    var style = const VBottomNavBarStyle(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.green,
      selectedTextColor: Colors.yellow,
      unselectedTextColor: Colors.purple,
      splashColor: Colors.red,
      borderColor: Colors.brown,
      selectedFontSize: 10.0,
      unselectedFontSize: 12.0,
      selectedIconSize: 14.0,
      unselectedIconSize: 16.0,
    );

    // Create another style for lerp testing
    var anotherStyle = const VBottomNavBarStyle(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedTextColor: Colors.orange,
      unselectedTextColor: Colors.pink,
      splashColor: Colors.red,
      borderColor: Colors.deepOrange,
      selectedFontSize: 20.0,
      unselectedFontSize: 22.0,
      selectedIconSize: 24.0,
      unselectedIconSize: 26.0,
    );

    // Test lerp
    var lerpedStyle = style.lerp(anotherStyle, 0.5);
    expect(lerpedStyle.backgroundColor,
        Color.lerp(Colors.blue, Colors.black, 0.5));
    expect(lerpedStyle.selectedItemColor,
        Color.lerp(Colors.red, Colors.white, 0.5));
    expect(lerpedStyle.unselectedItemColor,
        Color.lerp(Colors.green, Colors.grey, 0.5));
    expect(lerpedStyle.selectedTextColor,
        Color.lerp(Colors.yellow, Colors.orange, 0.5));
    expect(lerpedStyle.unselectedTextColor,
        Color.lerp(Colors.purple, Colors.pink, 0.5));
    expect(lerpedStyle.splashColor, Color.lerp(Colors.red, Colors.red, 0.5));
    expect(lerpedStyle.borderColor,
        Color.lerp(Colors.brown, Colors.deepOrange, 0.5));
    expect(lerpedStyle.selectedFontSize, lerpDouble(10.0, 20.0, 0.5));
    expect(lerpedStyle.unselectedFontSize, lerpDouble(12.0, 22.0, 0.5));
    expect(lerpedStyle.selectedIconSize, lerpDouble(14.0, 24.0, 0.5));
    expect(lerpedStyle.unselectedIconSize, lerpDouble(16.0, 26.0, 0.5));
  });

  testWidgets('VBottomNavBar build method with non-VDef',
      (WidgetTester tester) async {
    // Build the VBottomNavBar widget with a non-VDef value for vExt
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        bottomNavigationBar: VBottomNavBar(
          style:
              const VBottomNavBarStyle(backgroundColor: VColors.defaultActive),
          visaBottomNavBarItems: const [],
          onTap: (index) {},
          vExt:
              VAlt(), // Assuming VAlt is a class that extends VExt and is not VDef
        ),
      ),
    ));

    // Verify that the alternate color scheme was applied
    final bottomNavBar =
        tester.widget<VBottomNavBar>(find.byType(VBottomNavBar));
    expect(bottomNavBar.style?.backgroundColor, getAltColorScheme().surface1);
  });

  testWidgets(
      'VBottomNavBar applies defaultColorSchemeDark when theme brightness is dark and vExt is VDef',
      (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is VDef
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        bottomNavigationBar: VBottomNavBar(
          style: const VBottomNavBarStyle(
              backgroundColor: VColors.defaultSurface1Dark),
          visaBottomNavBarItems: const [],
          onTap: (index) {},
          vExt: VDef(),
        ),
      ),
    ));

    // Check if defaultColorSchemeDark is applied
    final bottomNavBarDark =
        tester.widget<VBottomNavBar>(find.byType(VBottomNavBar));
    expect(bottomNavBarDark.style?.backgroundColor,
        equals(getDefaultColorSchemeDark().surface1));
  });

  testWidgets(
      'VBottomNavBar applies altColorSchemeDark when theme brightness is dark and vExt is not VDef',
      (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is not VDef
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        bottomNavigationBar: VBottomNavBar(
          style: const VBottomNavBarStyle(
              backgroundColor: VColors.alternateSurface1Dark),
          visaBottomNavBarItems: const [],
          onTap: (index) {},
          vExt: VAlt(),
        ),
      ),
    ));

    // Check if altColorSchemeDark is applied
    final bottomNavBarAltDark =
        tester.widget<VBottomNavBar>(find.byType(VBottomNavBar));
    expect(bottomNavBarAltDark.style?.backgroundColor,
        equals(getAltColorSchemeDark().surface1));
  });
}
