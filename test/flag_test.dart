import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  // ! This is Flag unit test
  testWidgets("Flag theme testing", (WidgetTester tester) async {
    // Flag theme
    const theme = VFlagStyle(
      infoIconColor: VColors.infoText,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              VFlag(
                hasClose: true,
                hasAction: true,
                hasTitle: true,
                vExt: VAlt(),
                title: "Flag testing",
                description: "Flag testing",
                style: VFlagStyle(
                  infoIconColor: theme.infoIconColor,
                ),
                flagState: FlagState.informational,
              ),
            ],
          ),
        ),
      ),
    );

    // Find my widget
    final widgetFinder = find.byType(VFlag);

    // Expect my widget uses the theme's color
    VFlag flag = tester.widget(widgetFinder);
    expect(flag.style?.infoIconColor, theme.infoIconColor);
  });

  //! This is Flag golden test

  testWidgets('Flag golden(snapshot) testing', (WidgetTester tester) async {
    // Build the MaterialApp with a Scaffold.
    await tester.pumpWidget(
      const MaterialApp(
        home: ScaffoldMessenger(
          child: Scaffold(
            body: Center(
              child: Text('Flag testing'),
            ),
          ),
        ),
      ),
    );
    // Get the ScaffoldMessengerState.
    ScaffoldMessengerState messengerState =
        ScaffoldMessenger.of(tester.element(find.byType(Scaffold)));

    // Show the SnackBar.
    messengerState.showSnackBar(const VSnackBar(
      snackBarState: SnackBarState.informational,
      behavior: SnackBarBehavior.floating,
      content: VFlag(
        hasLink: true,
        link: "Close",
        description: "Your response is pending.",
        flagState: FlagState.informational,
      ),
    ));

    // Pump the widget tree to let the SnackBar appear.
    await tester.pumpAndSettle();

    // Take a snapshot of the widget.
    await expectLater(
      find.byType(VSnackBar),
      matchesGoldenFile('goldens/flag.png'),
    );
  });

  test('VFlagStyle copyWith and lerp', () {
    const style1 = VFlagStyle(
      infoIconColor: Colors.red,
      warningIconColor: Colors.orange,
      errorIconColor: Colors.green,
      successIconColor: Colors.yellow,
      linkTextColor: Colors.brown,
      linkUnderlineColor: Colors.grey,
      closeIconColor: Colors.pink,
      titleTextColor: Colors.teal,
      descriptionTextColor: Colors.lime,
      // ... add other properties as needed
    );

    const style2 = VFlagStyle(
      infoIconColor: Colors.cyan,
      warningIconColor: Colors.teal,
      errorIconColor: Colors.amber,
      successIconColor: Colors.lime,
      linkTextColor: Colors.indigo,
      linkUnderlineColor: Colors.deepPurple,
      closeIconColor: Colors.deepOrange,
      titleTextColor: Colors.lightGreen,
      descriptionTextColor: Colors.deepPurpleAccent,
      // ... add other properties as needed
    );

    // Test copyWith
    final copiedStyle = style1.copyWith();

    expect(copiedStyle.infoIconColor, Colors.red);
    expect(copiedStyle.warningIconColor, Colors.orange);
    expect(copiedStyle.errorIconColor, Colors.green);
    expect(copiedStyle.successIconColor, Colors.yellow);
    expect(copiedStyle.linkTextColor, Colors.brown);
    expect(copiedStyle.linkUnderlineColor, Colors.grey);
    expect(copiedStyle.closeIconColor, Colors.pink);
    expect(copiedStyle.titleTextColor, Colors.teal);
    expect(copiedStyle.descriptionTextColor, Colors.lime);
    // ... add other property expectations as needed

    // Test lerp
    final lerpedStyle = style1.lerp(style2, 0.5);

    expect(lerpedStyle.infoIconColor, Color.lerp(Colors.red, Colors.cyan, 0.5));
    expect(lerpedStyle.warningIconColor,
        Color.lerp(Colors.orange, Colors.teal, 0.5));
    expect(lerpedStyle.errorIconColor,
        Color.lerp(Colors.green, Colors.amber, 0.5));
    expect(lerpedStyle.successIconColor,
        Color.lerp(Colors.yellow, Colors.lime, 0.5));
    expect(lerpedStyle.linkTextColor,
        Color.lerp(Colors.brown, Colors.indigo, 0.5));
    expect(lerpedStyle.linkUnderlineColor,
        Color.lerp(Colors.grey, Colors.deepPurple, 0.5));
    expect(lerpedStyle.closeIconColor,
        Color.lerp(Colors.pink, Colors.deepOrange, 0.5));
    expect(lerpedStyle.titleTextColor,
        Color.lerp(Colors.teal, Colors.lightGreen, 0.5));
    expect(lerpedStyle.descriptionTextColor,
        Color.lerp(Colors.lime, Colors.deepPurpleAccent, 0.5));
    // ... add other property expectations as needed
  });

  testWidgets('VFlag widgets display correct content',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            VFlag(
              hasClose: true,
              hasAction: true,
              hasTitle: true,
              title: "Flag testing",
              description: "Flag testing",
              flagState: FlagState.success,
            ),
            VFlag(
              hasClose: true,
              hasAction: true,
              hasTitle: true,
              title: "Flag testing",
              description: "Flag testing",
              flagState: FlagState.warning,
            ),
            VFlag(
              hasClose: true,
              hasAction: true,
              hasTitle: true,
              title: "Flag testing",
              description: "Flag testing",
              flagState: FlagState.error,
            ),
            VFlag(
              hasClose: true,
              hasAction: true,
              hasTitle: true,
              title: "Flag testing",
              description: "Flag testing",
            ),
          ],
        ),
      ),
    ));

    // Verify that the correct content is displayed
    expect(find.text('Flag testing'),
        findsNWidgets(8)); // 3 titles and 3 descriptions
    expect(find.byType(VFlag), findsNWidgets(4));
    // Other checks depending on the actual implementation of the VFlag widget
  });
}
