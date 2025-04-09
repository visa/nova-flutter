import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'dart:ui';

void main() {
  test('VSwitchStyle copyWith test', () {
    final original = VSwitchStyle(
      switchColor: Colors.red,
      tagColor: Colors.green,
      tagBorderColor: Colors.blue,
      borderColor: Colors.yellow,
    );

    final copy = original.copyWith();

    // Check that the properties have been updated
    expect(copy.switchColor, Colors.red);
    expect(copy.tagColor, Colors.green);
    expect(copy.tagBorderColor, Colors.blue);
    expect(copy.borderColor, Colors.yellow);
  });

  test('VSwitchStyle lerp test', () {
    const style1 = VSwitchStyle(
      switchColor: Colors.red,
      tagColor: Colors.green,
      tagBorderColor: Colors.blue,
      borderColor: Colors.yellow,
    );

    const style2 = VSwitchStyle(
      switchColor: Colors.grey,
      tagColor: Colors.teal,
      tagBorderColor: Colors.cyan,
      borderColor: Colors.lime,
    );

    final lerpStyle = style1.lerp(style2, 0.5);

    expect(lerpStyle.switchColor, Color.lerp(Colors.red, Colors.grey, 0.5));
    expect(lerpStyle.tagColor, Color.lerp(Colors.green, Colors.teal, 0.5));
    expect(lerpStyle.tagBorderColor, Color.lerp(Colors.blue, Colors.cyan, 0.5));
    expect(lerpStyle.borderColor, Color.lerp(Colors.yellow, Colors.lime, 0.5));
  });

  testWidgets('VSwitch test', (tester) async {
    bool switchValue = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VSwitch(
          switchValue: switchValue,
          isDisabled: false,
          onPressed: () {
            switchValue = !switchValue;
          },
        ),
      ),
    ));

    final switchFinder = find.byType(VSwitch);

    // Check initial state
    expect(switchValue, isFalse);
    expect(tester.widget<VSwitch>(switchFinder).switchValue, isFalse);

    // Tap on the switch
    await tester.tap(switchFinder);
    await tester.pump();

    // Check that the switch value has changed
    expect(switchValue, isTrue);
  });

  testWidgets('VSwitch disabled test', (tester) async {
    bool switchValue = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VSwitch(
          switchValue: switchValue,
          isDisabled: true,
          onPressed: () {
            switchValue = !switchValue;
          },
        ),
      ),
    ));

    final switchFinder = find.byType(VSwitch);

    // Check initial state
    expect(switchValue, isFalse);
    expect(tester.widget<VSwitch>(switchFinder).switchValue, isFalse);

    // Try to tap on the disabled switch
    await tester.tap(switchFinder);
    await tester.pump();

    // Check that the switch value has not changed
    expect(switchValue, isFalse);
  });

  testWidgets('VSwitch applies getAltColorSchemeDark when theme brightness is dark and vExt is not VDef', (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is not VDef
    bool switchValue = false;

    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: VSwitch(
          switchValue: switchValue,
          isDisabled: true,
          onPressed: () {
            switchValue = !switchValue;
          },
          vExt: VAlt(),
        ),
      ),
    ));

    expect(find.byType(VSwitch), findsOneWidget);
  });

  testWidgets('VSwitch applies getAltColorSchemeDark when theme brightness is dark and VDef is not VExt', (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is not VDef
    bool switchValue = false;

    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: VSwitch(
          switchValue: switchValue,
          isDisabled: true,
          onPressed: () {
            switchValue = !switchValue;
          },
          vExt: VDef(),
        ),
      ),
    ));

    expect(find.byType(VSwitch), findsOneWidget);
  });

  testWidgets('VSwitch applies getAltColorSchemeDark when theme brightness is dark and vExt is not VDef', (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is not VDef
    bool switchValue = false;

    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      home: Scaffold(
        body: VSwitch(
          switchValue: switchValue,
          isDisabled: true,
          onPressed: () {
            switchValue = !switchValue;
          },
          vExt: VAlt(),
        ),
      ),
    ));

    expect(find.byType(VSwitch), findsOneWidget);
  });

  testWidgets('VSwitch onTapCancel test', (tester) async {
    bool switchValue = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VSwitch(
          switchValue: false,
          isDisabled: false,
          onPressed: () {
            switchValue = !switchValue;
          },
        ),
      ),
    ));

    final switchFinder = find.byType(VSwitch);

    // Start press
    final gesture = await tester.press(switchFinder);
    await tester.pump();

    // Drag the pointer away from the switch
    await gesture.moveBy(const Offset(200.0, 0.0));
    await tester.pump();

    // Check that the switch value has not changed
    expect(switchValue, isFalse);
  });

  testWidgets('VSwitch border Color when disabled and value is true ', (tester) async {
    // bool switchValue = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VSwitch(
          switchValue: true,
          isDisabled: true,
          onPressed: () {
            // switchValue = !switchValue;
          },
          style: VSwitchStyle(borderColor: VColors.disabled.withOpacity(0.2)),
        ),
      ),
    ));

    final Color? borderColor = tester.widget<VSwitch>(find.byType(VSwitch)).style?.borderColor;

    // Check initial state
    expect(borderColor, VColors.disabled.withOpacity(0.2));
  });

  testWidgets('VSwitch tag Color when value is true ', (tester) async {
    // bool switchValue = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VSwitch(
          switchValue: true,
          onPressed: () {
            // switchValue = !switchValue;
          },
          style: VSwitchStyle(tagBorderColor: VColors.disabled),
        ),
      ),
    ));

    final Color? borderColor = tester.widget<VSwitch>(find.byType(VSwitch)).style?.tagBorderColor;

    // Check initial state
    expect(borderColor, VColors.disabled);
  });

  testWidgets('VSwitch tag Color when disabled and value is false ', (tester) async {
    // bool switchValue = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSwitch(switchValue: true, onPressed: () {}, style: VSwitchStyle(switchColor: VColors.defaultActivePressed)),
        ),
      ),
    );

    final switchFinder = find.byType(VSwitch);

    // Start press
    final gesture = await tester.press(switchFinder);
    await tester.pump();

    final Color? switchColor = tester.widget<VSwitch>(find.byType(VSwitch)).style?.switchColor;

    // Check initial state
    expect(switchColor, VColors.defaultActivePressed);
  });
}
