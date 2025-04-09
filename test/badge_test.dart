import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  // ! This is Badge unit test
  testWidgets("Badge theme testing", (WidgetTester tester) async {
    // Badge theme
    const theme = VBadgeStyle(
      stableBGColor: VColors.positiveSurface,
      stableIconColor: VColors.positiveText,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VBadge(
              label: "Badge",
              style: VBadgeStyle(
                stableBGColor: theme.stableBGColor,
                stableIconColor: theme.stableIconColor,
              ),
            ),
          ),
        ),
      ),
    );

    // Find my widget
    final widgetFinder = find.byType(VBadge);

    // Expect my widget uses the theme's color
    VBadge badge = tester.widget(widgetFinder);
    expect(badge.style?.stableBGColor, theme.stableBGColor);
    expect(badge.style?.stableIconColor, theme.stableIconColor);
  });

  //! This is Badge golden test

  testWidgets('Badge golden(snapshot) testing', (WidgetTester tester) async {
    // Build widget and trigger a frame.
    await tester.pumpWidget(
      RepaintBoundary(
        child: MaterialApp(
          home: Center(
            child: SizedBox(
              width: 100,
              height: 48,
              child: VBadge(
                badgeState: BadgeState.stable,
                label: "Badge",
              ),
            ),
          ),
        ),
      ),
    );

    // Take a snapshot of the widget.
    await expectLater(
      find.byType(VBadge),
      matchesGoldenFile('goldens/badge.png'),
    );
  });

  test("VBadgeStyle copyWith & lerp testing", () {
    var initialStyle = const VBadgeStyle(
      criticalBGColor: Colors.red,
      neutralBGColor: Colors.green,
      stableBGColor: Colors.blue,
      subtleBGColor: Colors.yellow,
      warningBGColor: Colors.orange,
      criticalIconColor: Colors.purple,
      neutralIconColor: Colors.brown,
      stableIconColor: Colors.grey,
      subtleIconColor: Colors.pink,
      warningIconColor: Colors.lime,
      numberColor: Colors.cyan,
    );

    var copiedStyle = initialStyle.copyWith(
      criticalBGColor: Colors.blue,
      neutralBGColor: Colors.red,
      stableBGColor: Colors.green,
      subtleBGColor: Colors.orange,
      warningBGColor: Colors.purple,
      criticalIconColor: Colors.brown,
      neutralIconColor: Colors.grey,
      stableIconColor: Colors.pink,
      subtleIconColor: Colors.lime,
      warningIconColor: Colors.cyan,
      numberColor: Colors.red,
    );

    expect(copiedStyle.criticalBGColor, Colors.blue);
    expect(copiedStyle.neutralBGColor, Colors.red);
    expect(copiedStyle.stableBGColor, Colors.green);
    expect(copiedStyle.subtleBGColor, Colors.orange);
    expect(copiedStyle.warningBGColor, Colors.purple);
    expect(copiedStyle.criticalIconColor, Colors.brown);
    expect(copiedStyle.neutralIconColor, Colors.grey);
    expect(copiedStyle.stableIconColor, Colors.pink);
    expect(copiedStyle.subtleIconColor, Colors.lime);
    expect(copiedStyle.warningIconColor, Colors.cyan);
    expect(copiedStyle.numberColor, Colors.red);

    var lerpedStyle = initialStyle.lerp(copiedStyle, 0.5);

    expect(
        lerpedStyle.criticalBGColor, Color.lerp(Colors.red, Colors.blue, 0.5));
    expect(
        lerpedStyle.neutralBGColor, Color.lerp(Colors.green, Colors.red, 0.5));
    expect(
        lerpedStyle.stableBGColor, Color.lerp(Colors.blue, Colors.green, 0.5));
    expect(lerpedStyle.subtleBGColor,
        Color.lerp(Colors.yellow, Colors.orange, 0.5));
    expect(lerpedStyle.warningBGColor,
        Color.lerp(Colors.orange, Colors.purple, 0.5));
    expect(lerpedStyle.criticalIconColor,
        Color.lerp(Colors.purple, Colors.brown, 0.5));
    expect(lerpedStyle.neutralIconColor,
        Color.lerp(Colors.brown, Colors.grey, 0.5));
    expect(
        lerpedStyle.stableIconColor, Color.lerp(Colors.grey, Colors.pink, 0.5));
    expect(
        lerpedStyle.subtleIconColor, Color.lerp(Colors.pink, Colors.lime, 0.5));
    expect(lerpedStyle.warningIconColor,
        Color.lerp(Colors.lime, Colors.cyan, 0.5));
    expect(lerpedStyle.numberColor, Color.lerp(Colors.cyan, Colors.red, 0.5));
  });

  test("VBadgeStyle copyWith testing", () {
    var initialStyle = const VBadgeStyle(
      criticalBGColor: Colors.red,
      neutralBGColor: Colors.green,
      stableBGColor: Colors.blue,
      subtleBGColor: Colors.yellow,
      warningBGColor: Colors.orange,
      criticalIconColor: Colors.purple,
      neutralIconColor: Colors.brown,
      stableIconColor: Colors.grey,
      subtleIconColor: Colors.pink,
      warningIconColor: Colors.lime,
      numberColor: Colors.cyan,
    );

    // Test when parameters are null
    var copiedStyleWithNull = initialStyle.copyWith();

    expect(copiedStyleWithNull.criticalBGColor, initialStyle.criticalBGColor);
    expect(copiedStyleWithNull.neutralBGColor, initialStyle.neutralBGColor);
    expect(copiedStyleWithNull.stableBGColor, initialStyle.stableBGColor);
    expect(copiedStyleWithNull.subtleBGColor, initialStyle.subtleBGColor);
    expect(copiedStyleWithNull.warningBGColor, initialStyle.warningBGColor);
    expect(
        copiedStyleWithNull.criticalIconColor, initialStyle.criticalIconColor);
    expect(copiedStyleWithNull.neutralIconColor, initialStyle.neutralIconColor);
    expect(copiedStyleWithNull.stableIconColor, initialStyle.stableIconColor);
    expect(copiedStyleWithNull.subtleIconColor, initialStyle.subtleIconColor);
    expect(copiedStyleWithNull.warningIconColor, initialStyle.warningIconColor);
    expect(copiedStyleWithNull.numberColor, initialStyle.numberColor);

    // Test when parameters are not null
    var copiedStyle = initialStyle.copyWith(
      criticalBGColor: Colors.blue,
      neutralBGColor: Colors.red,
      stableBGColor: Colors.green,
      subtleBGColor: Colors.orange,
      warningBGColor: Colors.purple,
      criticalIconColor: Colors.brown,
      neutralIconColor: Colors.grey,
      stableIconColor: Colors.pink,
      subtleIconColor: Colors.lime,
      warningIconColor: Colors.cyan,
      numberColor: Colors.red,
    );

    expect(copiedStyle.criticalBGColor, Colors.blue);
    expect(copiedStyle.neutralBGColor, Colors.red);
    expect(copiedStyle.stableBGColor, Colors.green);
    expect(copiedStyle.subtleBGColor, Colors.orange);
    expect(copiedStyle.warningBGColor, Colors.purple);
    expect(copiedStyle.criticalIconColor, Colors.brown);
    expect(copiedStyle.neutralIconColor, Colors.grey);
    expect(copiedStyle.stableIconColor, Colors.pink);
    expect(copiedStyle.subtleIconColor, Colors.lime);
    expect(copiedStyle.warningIconColor, Colors.cyan);
    expect(copiedStyle.numberColor, Colors.red);
  });

  testWidgets('VBadge critical state test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VBadge(
          badgeState: BadgeState.critical,
        ),
      ),
    ));

    final vBadgeFinder = find.byType(VBadge);
    expect(vBadgeFinder, findsOneWidget);
    final vBadge = tester.widget<VBadge>(vBadgeFinder);
    expect(vBadge.badgeState, BadgeState.critical);
    expect(vBadge.backgroundColor, isNotNull);
    expect(vBadge.badgeIcon, isNotNull);
    expect(vBadge.badgeEllipse, isNotNull);
  });

  testWidgets('VBadge neutral state test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VBadge(
          badgeState: BadgeState.neutral,
        ),
      ),
    ));

    final vBadgeFinder = find.byType(VBadge);
    expect(vBadgeFinder, findsOneWidget);
    final vBadge = tester.widget<VBadge>(vBadgeFinder);
    expect(vBadge.badgeState, BadgeState.neutral);
    expect(vBadge.backgroundColor, isNotNull);
    expect(vBadge.badgeIcon, isNotNull);
    expect(vBadge.badgeEllipse, isNotNull);
  });

  testWidgets('VBadge number state test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VBadge(
          badgeState: BadgeState.number,
        ),
      ),
    ));

    final vBadgeFinder = find.byType(VBadge);
    expect(vBadgeFinder, findsOneWidget);
    final vBadge = tester.widget<VBadge>(vBadgeFinder);
    expect(vBadge.badgeState, BadgeState.number);
    expect(vBadge.backgroundColor, isNotNull);
    expect(vBadge.badgeIcon, isNull);
    expect(vBadge.badgeEllipse, isNull);
  });

  testWidgets('VBadge stable state test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VBadge(
          badgeState: BadgeState.stable,
        ),
      ),
    ));

    final vBadgeFinder = find.byType(VBadge);
    expect(vBadgeFinder, findsOneWidget);
    final vBadge = tester.widget<VBadge>(vBadgeFinder);
    expect(vBadge.badgeState, BadgeState.stable);
    expect(vBadge.backgroundColor, isNotNull);
    expect(vBadge.badgeIcon, isNotNull);
    expect(vBadge.badgeEllipse, isNotNull);
  });

  testWidgets('VBadge subtle state test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VBadge(
          badgeState: BadgeState.subtle,
        ),
      ),
    ));

    final vBadgeFinder = find.byType(VBadge);
    expect(vBadgeFinder, findsOneWidget);
    final vBadge = tester.widget<VBadge>(vBadgeFinder);
    expect(vBadge.badgeState, BadgeState.subtle);
    expect(vBadge.backgroundColor, isNotNull);
    expect(vBadge.badgeIcon, isNotNull);
    expect(vBadge.badgeEllipse, isNotNull);
  });

  testWidgets('VBadge warning state test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VBadge(
          badgeState: BadgeState.warning,
        ),
      ),
    ));

    final vBadgeFinder = find.byType(VBadge);
    expect(vBadgeFinder, findsOneWidget);
    final vBadge = tester.widget<VBadge>(vBadgeFinder);
    expect(vBadge.badgeState, BadgeState.warning);
    expect(vBadge.backgroundColor, isNotNull);
    expect(vBadge.badgeIcon, isNotNull);
    expect(vBadge.badgeEllipse, isNotNull);
  });

  testWidgets('VBadgeLabel hasEllipse test', (WidgetTester tester) async {
    // Build the widget under test
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VBadgeLabel(
            hasBG: false,
            backgroundColor: Colors.red,
            hasIcon: false,
            hasEllipse: true,
            badgeIcon: null,
            badgeEllipse: Container(color: Colors.green),
            label: "Test",
          ),
        ),
      ),
    );

    // Verify that the specific Container (which is built as badgeEllipse) is present
    expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is Container && widget.color == Colors.green,
        ),
        findsOneWidget);
  });
}
