import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  // ! This is Banner unit test
  testWidgets("Banner theme testing", (WidgetTester tester) async {
    // Banner theme
    const theme = VBannerStyle(
      infoBGColor: VColors.infoSurface,
      infoHLColor: VColors.infoGraphics,
      infoIconColor: VColors.infoText,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VBanner(
              visible: true,
              description: "VBanner testing",
              style: VBannerStyle(
                infoBGColor: theme.infoBGColor,
                infoHLColor: theme.infoHLColor,
                infoIconColor: theme.infoIconColor,
              ),
            ),
          ),
        ),
      ),
    );

    // Find my widget
    final widgetFinder = find.byType(VBanner);

    // Expect my widget uses the theme's color
    VBanner banner = tester.widget(widgetFinder);
    expect(banner.style?.infoBGColor, theme.infoBGColor);
    expect(banner.style?.infoHLColor, theme.infoHLColor);
    expect(banner.style?.infoIconColor, theme.infoIconColor);
  });

  //! This is Banner golden test

  testWidgets('Banner golden(snapshot) testing', (WidgetTester tester) async {
    // Build widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: RepaintBoundary(
          child: Center(
            child: SizedBox(
              width: 420,
              height: 100,
              child: VBanner(
                description: "VBanner testing",
                bannerState: BannerState.informational,
                visible: true,
              ),
            ),
          ),
        ),
      ),
    );

    // Take a snapshot of the widget.
    await expectLater(
      find.byType(VBanner),
      matchesGoldenFile('goldens/banner.png'),
    );
  });

  test('VBannerStyle copyWith test', () {
    const original = VBannerStyle(
      infoBGColor: Colors.red,
      infoIconColor: Colors.blue,
      infoHLColor: Colors.yellow,
      warningBGColor: Colors.orange,
      warningIconColor: Colors.purple,
      warningHLColor: Colors.green,
      errorBGColor: Colors.brown,
      errorIconColor: Colors.grey,
      errorHLColor: Colors.pink,
      successBGColor: Colors.teal,
      successIconColor: Colors.cyan,
      successHLColor: Colors.lime,
      boxShadowColor: Colors.indigo,
      borderRadius: 10.0,
      boxShadowSpreadRadius: 5.0,
      boxShadowBlurRadius: 7.0,
      boxShadowOffset: Offset(1, 1),
      margin: EdgeInsets.all(10),
    );

    final modified = original.copyWith(
      infoBGColor: Colors.green,
      infoIconColor: Colors.black,
      infoHLColor: Colors.white,
      warningBGColor: Colors.amber,
      warningIconColor: Colors.deepPurple,
      warningHLColor: Colors.lightGreen,
      errorBGColor: Colors.deepOrange,
      errorIconColor: Colors.blueGrey,
      errorHLColor: Colors.deepPurpleAccent,
      successBGColor: Colors.lightBlue,
      successIconColor: Colors.amberAccent,
      successHLColor: Colors.limeAccent,
      boxShadowColor: Colors.deepPurple,
      borderRadius: 20.0,
      boxShadowSpreadRadius: 10.0,
      boxShadowBlurRadius: 14.0,
      boxShadowOffset: const Offset(2, 2),
      margin: const EdgeInsets.all(20),
    );

    // Verify that the modified VBannerStyle has the new values
    expect(modified.infoBGColor, Colors.green);
    expect(modified.infoIconColor, Colors.black);
    expect(modified.infoHLColor, Colors.white);
    expect(modified.warningBGColor, Colors.amber);
    expect(modified.warningIconColor, Colors.deepPurple);
    expect(modified.warningHLColor, Colors.lightGreen);
    expect(modified.errorBGColor, Colors.deepOrange);
    expect(modified.errorIconColor, Colors.blueGrey);
    expect(modified.errorHLColor, Colors.deepPurpleAccent);
    expect(modified.successBGColor, Colors.lightBlue);
    expect(modified.successIconColor, Colors.amberAccent);
    expect(modified.successHLColor, Colors.limeAccent);
    expect(modified.boxShadowColor, Colors.deepPurple);
    expect(modified.borderRadius, 20.0);
    expect(modified.boxShadowSpreadRadius, 10.0);
    expect(modified.boxShadowBlurRadius, 14.0);
    expect(modified.boxShadowOffset, const Offset(2, 2));
    expect(modified.margin, const EdgeInsets.all(20));
  });

  test('VBannerStyle lerp test', () {
    const bannerStyle1 = VBannerStyle(
      infoBGColor: Colors.red,
      infoIconColor: Colors.green,
      infoHLColor: Colors.blue,
      warningBGColor: Colors.yellow,
      warningIconColor: Colors.orange,
      warningHLColor: Colors.purple,
      errorBGColor: Colors.brown,
      errorIconColor: Colors.grey,
      errorHLColor: Colors.cyan,
      successBGColor: Colors.lime,
      successIconColor: Colors.indigo,
      successHLColor: Colors.teal,
    );

    const bannerStyle2 = VBannerStyle(
      infoBGColor: Colors.black,
      infoIconColor: Colors.white,
      infoHLColor: Colors.pink,
      warningBGColor: Colors.amber,
      warningIconColor: Colors.lime,
      warningHLColor: Colors.teal,
      errorBGColor: Colors.indigo,
      errorIconColor: Colors.cyan,
      errorHLColor: Colors.grey,
      successBGColor: Colors.brown,
      successIconColor: Colors.purple,
      successHLColor: Colors.yellow,
    );

    final lerpBannerStyle = bannerStyle1.lerp(bannerStyle2, 0.5);

    expect(
        lerpBannerStyle.infoBGColor, Color.lerp(Colors.red, Colors.black, 0.5));
    expect(lerpBannerStyle.infoIconColor,
        Color.lerp(Colors.green, Colors.white, 0.5));
    expect(
        lerpBannerStyle.infoHLColor, Color.lerp(Colors.blue, Colors.pink, 0.5));
    expect(lerpBannerStyle.warningBGColor,
        Color.lerp(Colors.yellow, Colors.amber, 0.5));
    expect(lerpBannerStyle.warningIconColor,
        Color.lerp(Colors.orange, Colors.lime, 0.5));
    expect(lerpBannerStyle.warningHLColor,
        Color.lerp(Colors.purple, Colors.teal, 0.5));
    expect(lerpBannerStyle.errorBGColor,
        Color.lerp(Colors.brown, Colors.indigo, 0.5));
    expect(lerpBannerStyle.errorIconColor,
        Color.lerp(Colors.grey, Colors.cyan, 0.5));
    expect(lerpBannerStyle.errorHLColor,
        Color.lerp(Colors.cyan, Colors.grey, 0.5));
    expect(lerpBannerStyle.successBGColor,
        Color.lerp(Colors.lime, Colors.brown, 0.5));
    expect(lerpBannerStyle.successIconColor,
        Color.lerp(Colors.indigo, Colors.purple, 0.5));
    expect(lerpBannerStyle.successHLColor,
        Color.lerp(Colors.teal, Colors.yellow, 0.5));
  });

  testWidgets("Banner theme testing for warning state",
      (WidgetTester tester) async {
    const theme = VBannerStyle(
      warningBGColor: VColors.warningSurface,
      warningHLColor: VColors.warningGraphics,
      warningIconColor: VColors.warningText,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VBanner(
              visible: true,
              description: "VBanner testing",
              style: theme,
              bannerState: BannerState.warning,
            ),
          ),
        ),
      ),
    );

    final widgetFinder = find.byType(VBanner);
    VBanner banner = tester.widget(widgetFinder);
    expect(banner.style?.warningBGColor, theme.warningBGColor);
    expect(banner.style?.warningHLColor, theme.warningHLColor);
    expect(banner.style?.warningIconColor, theme.warningIconColor);
  });

  testWidgets("Banner theme testing for error state",
      (WidgetTester tester) async {
    const theme = VBannerStyle(
      errorBGColor: VColors.negativeSurface,
      errorHLColor: VColors.negativeGraphics,
      errorIconColor: VColors.negativeText,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VBanner(
              visible: true,
              description: "VBanner testing",
              style: theme,
              bannerState: BannerState.error,
            ),
          ),
        ),
      ),
    );

    final widgetFinder = find.byType(VBanner);
    VBanner banner = tester.widget(widgetFinder);
    expect(banner.style?.errorBGColor, theme.errorBGColor);
    expect(banner.style?.errorHLColor, theme.errorHLColor);
    expect(banner.style?.errorIconColor, theme.errorIconColor);
  });

  testWidgets("Banner theme testing for success state",
      (WidgetTester tester) async {
    const theme = VBannerStyle(
      successBGColor: VColors.positiveSurface,
      successHLColor: VColors.positiveGraphics,
      successIconColor: VColors.positiveText,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VBanner(
              visible: true,
              description: "VBanner testing",
              style: theme,
              bannerState: BannerState.success,
            ),
          ),
        ),
      ),
    );

    final widgetFinder = find.byType(VBanner);
    VBanner banner = tester.widget(widgetFinder);
    expect(banner.style?.successBGColor, theme.successBGColor);
    expect(banner.style?.successHLColor, theme.successHLColor);
    expect(banner.style?.successIconColor, theme.successIconColor);
  });

  testWidgets(
      "VBanner should display description, link, and action when conditions are met",
      (WidgetTester tester) async {
    const description = "VBanner testing";
    const link = "Link testing";
    const action = "Action testing";

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VBanner(
              vExt: VAlt(),
              visible: true,
              description: description,
              hasTitle: true,
              link: link,
              hasLink: true,
              action: action,
              hasAction: true,
              hasClose: true,
              onActionPressed: () {},
            ),
          ),
        ),
      ),
    );

    expect(find.text(description), findsOneWidget);
    expect(find.text(link), findsOneWidget);
    expect(find.text(action), findsOneWidget);
  });

  test('getBannerState should return correct string for each BannerState', () {
    expect(getBannerState(BannerState.informational),
        equals("informational banner"));
    expect(getBannerState(BannerState.warning), equals("warning banner"));
    expect(getBannerState(BannerState.error), equals("error banner"));
    expect(getBannerState(BannerState.success), equals("success banner"));
    expect(getBannerState(null), equals(""));
  });

  test('VBannerStyle copyWith test for retaining original values', () {
    const original = VBannerStyle(
      infoBGColor: Colors.red,
      infoIconColor: Colors.blue,
      infoHLColor: Colors.yellow,
      warningBGColor: Colors.orange,
      warningIconColor: Colors.purple,
      warningHLColor: Colors.green,
      errorBGColor: Colors.brown,
      errorIconColor: Colors.grey,
      errorHLColor: Colors.pink,
      successBGColor: Colors.teal,
      successIconColor: Colors.cyan,
      successHLColor: Colors.lime,
      boxShadowColor: Colors.indigo,
      borderRadius: 10.0,
      boxShadowSpreadRadius: 5.0,
      boxShadowBlurRadius: 7.0,
      boxShadowOffset: Offset(1, 1),
      margin: EdgeInsets.all(10),
    );

    final modified = original.copyWith();

    // Verify that the modified VBannerStyle retains the original values
    expect(modified.infoBGColor, Colors.red);
    expect(modified.infoIconColor, Colors.blue);
    expect(modified.infoHLColor, Colors.yellow);
    expect(modified.warningBGColor, Colors.orange);
    expect(modified.warningIconColor, Colors.purple);
    expect(modified.warningHLColor, Colors.green);
    expect(modified.errorBGColor, Colors.brown);
    expect(modified.errorIconColor, Colors.grey);
    expect(modified.errorHLColor, Colors.pink);
    expect(modified.successBGColor, Colors.teal);
    expect(modified.successIconColor, Colors.cyan);
    expect(modified.successHLColor, Colors.lime);
    expect(modified.boxShadowColor, Colors.indigo);
    expect(modified.borderRadius, 10.0);
    expect(modified.boxShadowSpreadRadius, 5.0);
    expect(modified.boxShadowBlurRadius, 7.0);
    expect(modified.boxShadowOffset, const Offset(1, 1));
    expect(modified.margin, const EdgeInsets.all(10));
  });
}
