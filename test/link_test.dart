import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  test('VLinkStyle copyWith copies values correctly', () {
    final original = VLinkStyle(
      splashColor: Colors.red,
      iconColor: Colors.green,
      defaultColor: Colors.blue,
      pressedColor: Colors.yellow,
      tapUpColor: Colors.orange,
      disabledColor: Colors.purple,
      underlineColor: Colors.brown,
      titleTextStyle: TextStyle(fontSize: 16),
    );

    final copy = original.copyWith();

    expect(copy.splashColor, Colors.red);
    expect(copy.iconColor, Colors.green);
    expect(copy.defaultColor, Colors.blue);
    expect(copy.pressedColor, Colors.yellow);
    expect(copy.tapUpColor, Colors.orange);
    expect(copy.disabledColor, Colors.purple);
    expect(copy.underlineColor, Colors.brown);
    expect(copy.titleTextStyle!.fontSize, 16);
  });

  test('VLinkStyle lerp interpolates values correctly', () {
    final style1 = VLinkStyle(
      splashColor: Colors.red,
      iconColor: Colors.green,
      defaultColor: Colors.blue,
      pressedColor: Colors.yellow,
      tapUpColor: Colors.orange,
      disabledColor: Colors.purple,
      underlineColor: Colors.brown,
      titleTextStyle: TextStyle(fontSize: 16),
    );

    final style2 = VLinkStyle(
      splashColor: Colors.pink,
      iconColor: Colors.indigo,
      defaultColor: Colors.grey,
      pressedColor: Colors.teal,
      tapUpColor: Colors.cyan,
      disabledColor: Colors.lime,
      underlineColor: Colors.amber,
      titleTextStyle: TextStyle(fontSize: 18),
    );

    final result = style1.lerp(style2, 0.5);

    expect(result.splashColor, Color.lerp(Colors.red, Colors.pink, 0.5));
    expect(result.iconColor, Color.lerp(Colors.green, Colors.indigo, 0.5));
    expect(result.defaultColor, Color.lerp(Colors.blue, Colors.grey, 0.5));
    expect(result.pressedColor, Color.lerp(Colors.yellow, Colors.teal, 0.5));
    expect(result.tapUpColor, Color.lerp(Colors.orange, Colors.cyan, 0.5));
    expect(result.disabledColor, Color.lerp(Colors.purple, Colors.lime, 0.5));
    expect(result.underlineColor, Color.lerp(Colors.brown, Colors.amber, 0.5));
    expect(result.titleTextStyle!.fontSize, 16);
  });

  test('VLinkStyle copyWith', () {
    final original = VLinkStyle(
      splashColor: Colors.red,
      iconColor: Colors.green,
      defaultColor: Colors.blue,
      pressedColor: Colors.yellow,
      tapUpColor: Colors.orange,
      disabledColor: Colors.purple,
      underlineColor: Colors.brown,
      titleTextStyle: TextStyle(fontSize: 16),
    );

    final copy = original.copyWith(
      splashColor: Colors.pink,
      iconColor: Colors.indigo,
      defaultColor: Colors.grey,
      pressedColor: Colors.teal,
      tapUpColor: Colors.cyan,
      disabledColor: Colors.lime,
      underlineColor: Colors.amber,
      titleTextStyle: TextStyle(fontSize: 18),
    );

    expect(copy.splashColor, Colors.pink);
    expect(copy.iconColor, Colors.indigo);
    expect(copy.defaultColor, Colors.grey);
    expect(copy.pressedColor, Colors.teal);
    expect(copy.tapUpColor, Colors.cyan);
    expect(copy.disabledColor, Colors.lime);
    expect(copy.underlineColor, Colors.amber);
    expect(copy.titleTextStyle!.fontSize, 18);
  });

  testWidgets('VLink applies getAltColorSchemeDark when theme brightness is dark and vExt is not VDef', (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is not VDef
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: VLink(
          title: 'Test',
          onPressed: () {},
          vExt: VAlt(),
        ),
      ),
    ));

    expect(find.byType(VLink), findsOneWidget);
  });

  testWidgets('VLink test', (WidgetTester tester) async {
    bool wasOnPressedCalled = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VLink(
          title: 'Test',
          onPressed: () {
            wasOnPressedCalled = true;
          },
          isUnderlined: true,
          isLeadingIcon: true,
          isTrailingIcon: true,
        ),
      ),
    ));

    // Check that the title is present
    expect(find.text('Test'), findsOneWidget);

    // Check that the leading and trailing icons are present
    expect(find.byType(VIcon), findsNWidgets(2));

    // Check that the title is underlined
    final textWidget = tester.firstWidget(find.byType(Text)) as Text;
    expect(textWidget.style!.decoration, TextDecoration.underline);

    // Tap the link and check that onPressed was called
    await tester.tap(find.byType(VLink));
    expect(wasOnPressedCalled, true);
  });
}
