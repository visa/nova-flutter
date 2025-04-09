import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  // ! This is SectionMessage unit test
  testWidgets("SectionMessage theme testing", (WidgetTester tester) async {
    // SectionMessage theme
    const theme = VSectionMessageStyle(
      successBGColor: VColors.positiveSurface,
      successHLColor: VColors.positiveGraphics,
      successIconColor: VColors.positiveText,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Material(
              child: VSectionMessage(
                style: VSectionMessageStyle(
                  successBGColor: theme.successBGColor,
                  successHLColor: theme.successHLColor,
                  successIconColor: theme.successIconColor,
                ),
                visible: true,
                hasLink: true,
                link: "Close",
                sectionMessageState: SectionMessageState.success,
                title: "Success",
                description: "Your response has been recorded.",
                action: "Action",
                onActionPressed: () {},
                onLinkPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );

    // Find my widget
    final widgetFinder = find.byType(VSectionMessage);

    // Expect my widget uses the theme's color
    VSectionMessage sectionMessage = tester.widget(widgetFinder);
    expect(sectionMessage.style?.successBGColor, theme.successBGColor);
    expect(sectionMessage.style?.successHLColor, theme.successHLColor);
    expect(sectionMessage.style?.successIconColor, theme.successIconColor);
  });

  //! This is SectionMessage golden test

  testWidgets('SectionMessage golden(snapshot) testing',
      (WidgetTester tester) async {
    // Build widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: RepaintBoundary(
          child: Center(
            child: SizedBox(
              width: 420,
              height: 200,
              child: Material(
                child: VSectionMessage(
                  visible: true,
                  hasLink: true,
                  link: "Close",
                  sectionMessageState: SectionMessageState.success,
                  title: "Success",
                  description: "Your response has been recorded.",
                  action: "Action",
                  onActionPressed: () {},
                  onLinkPressed: () {},
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Take a snapshot of the widget.
    await expectLater(
      find.byType(VSectionMessage),
      matchesGoldenFile('goldens/section_message.png'),
    );
  });

  group('VSectionMessageStyle', () {
    test('copyWith', () {
      const style = VSectionMessageStyle(
        normalColor: Colors.red,
        infoBGColor: Colors.green,
        infoIconColor: Colors.blue,
        infoHLColor: Colors.cyan,
        warningBGColor: Colors.yellow,
        warningIconColor: Colors.orange,
        warningHLColor: Colors.pink,
        errorBGColor: Colors.purple,
        errorIconColor: Colors.brown,
        errorHLColor: Colors.grey,
        successBGColor: Colors.lightGreen,
        successIconColor: Colors.lime,
        successHLColor: Colors.teal,
      );

      final copiedStyle = style.copyWith();

      expect(copiedStyle.normalColor, Colors.red);
      expect(copiedStyle.infoBGColor, Colors.green);
      expect(copiedStyle.infoIconColor, Colors.blue);
      expect(copiedStyle.infoHLColor, Colors.cyan);
      expect(copiedStyle.warningBGColor, Colors.yellow);
      expect(copiedStyle.warningIconColor, Colors.orange);
      expect(copiedStyle.warningHLColor, Colors.pink);
      expect(copiedStyle.errorBGColor, Colors.purple);
      expect(copiedStyle.errorIconColor, Colors.brown);
      expect(copiedStyle.errorHLColor, Colors.grey);
      expect(copiedStyle.successBGColor, Colors.lightGreen);
      expect(copiedStyle.successIconColor, Colors.lime);
      expect(copiedStyle.successHLColor, Colors.teal);
    });
  });

  group('VSectionMessageStyle', () {
    test('lerp', () {
      const style1 = VSectionMessageStyle(
        normalColor: Colors.red,
        infoBGColor: Colors.green,
        infoIconColor: Colors.blue,
        infoHLColor: Colors.cyan,
        warningBGColor: Colors.yellow,
        warningIconColor: Colors.orange,
        warningHLColor: Colors.pink,
        errorBGColor: Colors.purple,
        errorIconColor: Colors.brown,
        errorHLColor: Colors.grey,
        successBGColor: Colors.lightGreen,
        successIconColor: Colors.lime,
        successHLColor: Colors.teal,
      );

      const style2 = VSectionMessageStyle(
        normalColor: Colors.black,
        infoBGColor: Colors.white,
        infoIconColor: Colors.amber,
        infoHLColor: Colors.indigo,
        warningBGColor: Colors.deepPurple,
        warningIconColor: Colors.lightBlue,
        warningHLColor: Colors.deepOrange,
        errorBGColor: Colors.blueGrey,
        errorIconColor: Colors.amberAccent,
        errorHLColor: Colors.greenAccent,
        successBGColor: Colors.pinkAccent,
        successIconColor: Colors.redAccent,
        successHLColor: Colors.yellowAccent,
      );

      final lerpedStyle = style1.lerp(style2, 0.5);

      expect(
          lerpedStyle.normalColor, Color.lerp(Colors.red, Colors.black, 0.5));
      expect(
          lerpedStyle.infoBGColor, Color.lerp(Colors.green, Colors.white, 0.5));
      expect(lerpedStyle.infoIconColor,
          Color.lerp(Colors.blue, Colors.amber, 0.5));
      expect(
          lerpedStyle.infoHLColor, Color.lerp(Colors.cyan, Colors.indigo, 0.5));
      expect(lerpedStyle.warningBGColor,
          Color.lerp(Colors.yellow, Colors.deepPurple, 0.5));
      expect(lerpedStyle.warningIconColor,
          Color.lerp(Colors.orange, Colors.lightBlue, 0.5));
      expect(lerpedStyle.warningHLColor,
          Color.lerp(Colors.pink, Colors.deepOrange, 0.5));
      expect(lerpedStyle.errorBGColor,
          Color.lerp(Colors.purple, Colors.blueGrey, 0.5));
      expect(lerpedStyle.errorIconColor,
          Color.lerp(Colors.brown, Colors.amberAccent, 0.5));
      expect(lerpedStyle.errorHLColor,
          Color.lerp(Colors.grey, Colors.greenAccent, 0.5));
      expect(lerpedStyle.successBGColor,
          Color.lerp(Colors.lightGreen, Colors.pinkAccent, 0.5));
      expect(lerpedStyle.successIconColor,
          Color.lerp(Colors.lime, Colors.redAccent, 0.5));
      expect(lerpedStyle.successHLColor,
          Color.lerp(Colors.teal, Colors.yellowAccent, 0.5));
    });
  });

  testWidgets("SectionMessage subtle testing", (WidgetTester tester) async {
    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Material(
              child: VSectionMessage(
                hasAction: true,
                hasClose: true,
                hasTitle: true,
                visible: true,
                hasLink: true,
                link: "Close",
                sectionMessageState: SectionMessageState.subtle,
                title: "Success",
                description: "Your response has been recorded.",
                action: "Action",
                onActionPressed: () {},
                onLinkPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(VSectionMessage), findsNWidgets(1));
  });

  testWidgets("SectionMessage info testing", (WidgetTester tester) async {
    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Material(
              child: VSectionMessage(
                visible: true,
                hasLink: true,
                link: "Close",
                sectionMessageState: SectionMessageState.informational,
                title: "Success",
                description: "Your response has been recorded.",
                action: "Action",
                onActionPressed: () {},
                onLinkPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(VSectionMessage), findsNWidgets(1));
  });

  testWidgets("SectionMessage warning testing", (WidgetTester tester) async {
    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Material(
              child: VSectionMessage(
                visible: true,
                hasLink: true,
                link: "Close",
                sectionMessageState: SectionMessageState.warning,
                title: "Success",
                description: "Your response has been recorded.",
                action: "Action",
                onActionPressed: () {},
                onLinkPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(VSectionMessage), findsNWidgets(1));
  });

  testWidgets("SectionMessage error testing", (WidgetTester tester) async {
    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Material(
              child: VSectionMessage(
                visible: true,
                hasLink: true,
                link: "Close",
                sectionMessageState: SectionMessageState.error,
                title: "Success",
                description: "Your response has been recorded.",
                action: "Action",
                onActionPressed: () {},
                onLinkPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(VSectionMessage), findsNWidgets(1));
  });
}
