import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
import 'dart:ui';

void main() {
  // ! This is App Bar unit test
  testWidgets("AppBar theme testing", (WidgetTester tester) async {
    // AppBar theme
    final theme = VAppBarStyle(
      backgroundColor: VColors.defaultSurface1,
      splashColor: VColors.defaultSurfaceLowlight,
      elevation: 1.0,
      bottomOpacity: 1.0,
      titleTextStyle:
          defaultVTheme.textStyles.headline4.copyWith(height: 1.3181),
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: VAppBar(
            style: VAppBarStyle(
              backgroundColor: theme.backgroundColor,
              splashColor: theme.splashColor,
              elevation: theme.elevation,
              bottomOpacity: theme.bottomOpacity,
              titleTextStyle: theme.titleTextStyle,
            ),
            title: const Text("AppBar"),
          ),
        ),
      ),
    );

    // Find my widget
    final widgetFinder = find.byType(VAppBar);

    // Expect my widget uses the theme's color
    VAppBar appBar = tester.widget(widgetFinder);
    expect(appBar.style?.backgroundColor, theme.backgroundColor);
    expect(appBar.style?.splashColor, theme.splashColor);
    expect(appBar.style?.elevation, theme.elevation);
    expect(appBar.style?.bottomOpacity, theme.bottomOpacity);
    expect(appBar.style?.titleTextStyle, theme.titleTextStyle);
  });

  //! This is AppBar golden test

  testWidgets('AppBar golden(snapshot) testing', (WidgetTester tester) async {
    // Build widget and trigger a frame.
    await tester.pumpWidget(
      RepaintBoundary(
        child: MaterialApp(
          home: Center(
            child: SizedBox(
              width: 420,
              height: 100,
              child: VAppBar(
                backButtonAction: () {},
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
                title: const Text("Visa"),
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
              ),
            ),
          ),
        ),
      ),
    );

    // Take a snapshot of the widget.
    await expectLater(
      find.byType(VAppBar),
      matchesGoldenFile('goldens/app_bar.png'),
    );
  });
  test('VAppBarStyle copyWith and lerp testing', () {
    // Create an initial style
    var style = const VAppBarStyle(
      backgroundColor: Colors.blue,
      splashColor: Colors.red,
      iconColor: Colors.green,
      elevation: 1.0,
      bottomOpacity: 0.5,
      titleTextStyle: TextStyle(color: Colors.yellow),
    );

    // Test copyWith with non-null values
    var copiedStyle = style.copyWith(
      backgroundColor: Colors.orange,
      splashColor: Colors.purple,
      iconColor: Colors.brown,
      elevation: 2.0,
      bottomOpacity: 0.6,
      titleTextStyle: const TextStyle(color: Colors.pink),
    );
    expect(copiedStyle.backgroundColor, Colors.orange);
    expect(copiedStyle.splashColor, Colors.purple);
    expect(copiedStyle.iconColor, Colors.brown);
    expect(copiedStyle.elevation, 2.0);
    expect(copiedStyle.bottomOpacity, 0.6);
    expect(copiedStyle.titleTextStyle?.color, Colors.pink);

    // Test copyWith with null values
    var copiedStyleWithNulls = style.copyWith();
    expect(copiedStyleWithNulls.backgroundColor, Colors.blue);
    expect(copiedStyleWithNulls.splashColor, Colors.red);
    expect(copiedStyleWithNulls.iconColor, Colors.green);
    expect(copiedStyleWithNulls.elevation, 1.0);
    expect(copiedStyleWithNulls.bottomOpacity, 0.5);
    expect(copiedStyleWithNulls.titleTextStyle?.color, Colors.yellow);

    // Create another style for lerp testing
    var anotherStyle = const VAppBarStyle(
      backgroundColor: Colors.black,
      splashColor: Colors.white,
      iconColor: Colors.grey,
      elevation: 3.0,
      bottomOpacity: 0.7,
      titleTextStyle: TextStyle(color: Colors.teal),
    );

    // Test lerp
    var lerpedStyle = style.lerp(anotherStyle, 0.5);
    expect(lerpedStyle.backgroundColor,
        Color.lerp(Colors.blue, Colors.black, 0.5));
    expect(lerpedStyle.splashColor, Color.lerp(Colors.red, Colors.white, 0.5));
    expect(lerpedStyle.iconColor, Color.lerp(Colors.green, Colors.grey, 0.5));
    expect(lerpedStyle.elevation, lerpDouble(1.0, 3.0, 0.5));
    expect(lerpedStyle.bottomOpacity, lerpDouble(0.5, 0.7, 0.5));
    expect(lerpedStyle.titleTextStyle, isNotNull);
  });

  testWidgets('VAppBar build method with non-VDef',
      (WidgetTester tester) async {
    // Build the VAppBar widget with a non-VDef value for vExt
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: VAppBar(
          title: const Text('Test'),
          vExt:
              VAlt(), // Assuming VAlt is a class that extends VExt and is not VDef
        ),
      ),
    ));

    // Verify that the alternate color scheme was applied
    final appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.backgroundColor, getAltColorScheme().surface1);
  });

  testWidgets(
      'VAppBar applies defaultColorSchemeDark when theme brightness is dark and vExt is VDef',
      (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is VDef
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(appBar: VAppBar(title: const Text('Test'), vExt: VDef())),
    ));

    // Check if defaultColorSchemeDark is applied
    final appBarDark = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBarDark.backgroundColor,
        equals(getDefaultColorSchemeDark().surface1));
  });

  testWidgets(
      'VAppBar applies altColorSchemeDark when theme brightness is dark and vExt is not VDef',
      (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is not VDef
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
          appBar: VAppBar(
        title: VIconAsset(
          svgImagePlaceholderBuilder: (_) => const SizedBox(
            height: 16.0,
            width: 16.0,
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
          svgIcon: "test/assets/visa.svg",
          iconColor: VColors.alternateAccent,
          iconHeight: 20,
          iconWidth: 20,
        ),
        vExt: VAlt(),
      )),
    ));

    // Check if altColorSchemeDark is applied
    final appBarAltDark = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBarAltDark.backgroundColor,
        equals(getAltColorSchemeDark().surface1));
  });

  testWidgets('VAppBar default backButtonAction test',
      (WidgetTester tester) async {
    // Build the widget under test
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VAppBar(
            title: Text('Test'),
          ),
        ),
      ),
    );

    // Find the back button and tap it
    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();

    // Verify that the Navigator.pop was called by checking if the VAppBar widget is no longer in the widget tree
    expect(find.byType(VAppBar), findsNothing);
  });
}
