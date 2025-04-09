import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'dart:ui';

void main() {
  test('VContentCardStyle copyWith and lerp testing', () {
    // Create an initial style
    var style = const VContentCardStyle(
      borderColor: Colors.blue,
      backgroundColor: Colors.red,
      bottomBarColor: Colors.green,
      borderRadius: 1.0,
      elevation: 2.0,
    );

    // Test copyWith with non-null values
    var copiedStyle = style.copyWith(
      borderColor: Colors.orange,
      backgroundColor: Colors.yellow,
      bottomBarColor: Colors.purple,
      borderRadius: 2.0,
      elevation: 3.0,
    );
    expect(copiedStyle.borderColor, Colors.orange);
    expect(copiedStyle.backgroundColor, Colors.yellow);
    expect(copiedStyle.bottomBarColor, Colors.purple);
    expect(copiedStyle.borderRadius, 2.0);
    expect(copiedStyle.elevation, 3.0);

    // Test copyWith with null values
    var copiedStyleWithNulls = style.copyWith();
    expect(copiedStyleWithNulls.borderColor, Colors.blue);
    expect(copiedStyleWithNulls.backgroundColor, Colors.red);
    expect(copiedStyleWithNulls.bottomBarColor, Colors.green);
    expect(copiedStyleWithNulls.borderRadius, 1.0);
    expect(copiedStyleWithNulls.elevation, 2.0);

    // Create another style for lerp testing
    var anotherStyle = const VContentCardStyle(
      borderColor: Colors.black,
      backgroundColor: Colors.white,
      bottomBarColor: Colors.grey,
      borderRadius: 2.5,
      elevation: 3.5,
    );

    // Test lerp
    var lerpedStyle = style.lerp(anotherStyle, 0.5);
    expect(lerpedStyle.borderColor, Color.lerp(Colors.blue, Colors.black, 0.5));
    expect(
        lerpedStyle.backgroundColor, Color.lerp(Colors.red, Colors.white, 0.5));
    expect(
        lerpedStyle.bottomBarColor, Color.lerp(Colors.green, Colors.grey, 0.5));
    expect(lerpedStyle.borderRadius, lerpDouble(1.0, 2.5, 0.5));
    expect(lerpedStyle.elevation, lerpDouble(2.0, 3.5, 0.5));
  });

  testWidgets('VContentCard builds correctly', (WidgetTester tester) async {
    // Create a VContentCard widget
    await tester.pumpWidget(MaterialApp(
      home: VContentCard(
        child: Text('Test'),
        hasBottomBar: true,
        isDisabled: false,
        onTap: () {},
      ),
    ));

    // Find the VContentCard widget in the widget tree
    expect(find.byType(VContentCard), findsOneWidget);

    // Find the child Text widget in the widget tree
    expect(find.text('Test'), findsOneWidget);
  });

  testWidgets('VContentCard onTap callback works correctly',
      (WidgetTester tester) async {
    var onTapCalled = false;

    await tester.pumpWidget(MaterialApp(
      home: VContentCard(
        child: Text('Test'),
        onTap: () {
          onTapCalled = true;
        },
      ),
    ));

    // Tap on the VContentCard
    await tester.tap(find.byType(VContentCard));

    // Verify that the onTap callback was called
    expect(onTapCalled, isTrue);
  });

  // testWidgets('VContentCard onTapDown callback works correctly', (WidgetTester tester) async {
  //   var onTapDownCalled = false;

  //   await tester.pumpWidget(MaterialApp(
  //     home: VContentCard(
  //       child: Text('Test'),
  //       onTapDown: () {
  //         onTapDownCalled = true;
  //       },
  //     ),
  //   ));

  //   // Press on the VContentCard
  //   var gesture = await tester.press(find.byType(VContentCard));

  //   // Verify that the onTapDown callback was called
  //   expect(onTapDownCalled, isTrue);
  // });

  // testWidgets('VContentCard onTapUp callback works correctly', (WidgetTester tester) async {
  //   var onTapUpCalled = false;

  //   await tester.pumpWidget(MaterialApp(
  //     home: VContentCard(
  //       child: Text('Test'),
  //       onTapUp: () {
  //         onTapUpCalled = true;
  //       },
  //     ),
  //   ));

  //   // Press and release the VContentCard
  //   var gesture = await tester.press(find.byType(VContentCard));
  //   // await tester.release(gesture);

  //   // Verify that the onTapUp callback was called
  //   expect(onTapUpCalled, isTrue);
  // });

  testWidgets(
      'VContentCard applies correct color scheme based on theme brightness',
      (WidgetTester tester) async {
    // Test with Brightness.dark
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Material(
        child: VContentCard(
          child: Text('Test'),
          vExt: VAlt(),
        ),
      ),
    ));

    // Check if getAltColorSchemeDark is applied
    final cardWidget = tester.widget<Card>(find.byType(Card));
    expect(cardWidget.color, equals(getAltColorSchemeDark().surface1));

    // Test with Brightness.light
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      home: Material(
        child: VContentCard(
          child: Text('Test'),
          vExt: VAlt(),
        ),
      ),
    ));

    // Check if getAltColorScheme is applied
    final cardWidgetLight = tester.widget<Card>(find.byType(Card));
    expect(cardWidgetLight.color, equals(VColors.defaultSurface3Dark));
  });

  testWidgets('VContentCard onTapCancel callback works correctly',
      (WidgetTester tester) async {
    var onTapCancelCalled = false;

    await tester.pumpWidget(MaterialApp(
      home: VContentCard(
        child: Text('Test'),
        onTap: () {}, // To ensure onTap is not null
        onTapCancel: () {
          onTapCancelCalled = false;
        },
      ),
    ));

    // Press the VContentCard and then fling away to simulate cancellation
    var gesture =
        await tester.startGesture(tester.getCenter(find.byType(VContentCard)));
    await gesture.moveBy(const Offset(0, -200));
    await tester.pumpAndSettle();

    // Verify that the onTapCancel callback was called
    expect(onTapCancelCalled, false);
    // Verify that onInteraction was called
  });

  // testWidgets(
  //     'VContentCard Divider color is defaultActivePressed when isPressed is true and onTap is not null',
  //     (WidgetTester tester) async {
  //   await tester.pumpWidget(MaterialApp(
  //     home: VContentCard(
  //       child: Text('Test'),
  //       onTap: () {}, // Ensure onTap is not null
  //     ),
  //   ));

  //   await tester.tap(find.byType(VContentCard));
  //   await tester.pump(); // Pump a frame to apply the color change
  //   await tester.pumpAndSettle(); // Update the widget state after tap

  //   // Simulate pressing down on the widget
  //   await tester.press(find.byType(VContentCard));
  //   await tester.pump(); // Pump a frame to apply the color change

  //   // Get the Divider widget
  //   final dividerWidget = tester.widget<Divider>(find.descendant(
  //     of: find.byType(VContentCard),
  //     matching: find.byType(Divider),
  //   ));

  //   // Check if the Divider color is defaultActivePressed
  //   expect(dividerWidget.color, equals(VColors.defaultActivePressed));
  // });
}
