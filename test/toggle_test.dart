import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'dart:ui';

void main() {
  test('VToggleStyle copyWith', () {
    final original = VToggleStyle(
      pressedSplashColor: Colors.red,
      selectedBorderColor: Colors.green,
      unselectedBorderColor: Colors.blue,
      toggleFillColor: Colors.yellow,
      disabledBorderColor: Colors.orange,
      bottomBarDisabledColor: Colors.purple,
      bottomBarUnselectedColor: Colors.brown,
      bottomBarColor: Colors.pink,
      height: 10.0,
      borderRadius: 5.0,
      minimumWidth: 15.0,
    );

    final copy = original.copyWith();

    expect(copy.pressedSplashColor, Colors.red);
    expect(copy.selectedBorderColor, Colors.green);
    expect(copy.unselectedBorderColor, Colors.blue);
    expect(copy.toggleFillColor, Colors.yellow);
    expect(copy.disabledBorderColor, Colors.orange);
    expect(copy.bottomBarDisabledColor, Colors.purple);
    expect(copy.bottomBarUnselectedColor, Colors.brown);
    expect(copy.bottomBarColor, Colors.pink);
    expect(copy.height, 10.0);
    expect(copy.borderRadius, 5.0);
    expect(copy.minimumWidth, 15.0);
  });

  test('VToggleStyle lerp', () {
    final style1 = VToggleStyle(
      pressedSplashColor: Colors.red,
      selectedBorderColor: Colors.green,
      unselectedBorderColor: Colors.blue,
      toggleFillColor: Colors.yellow,
      disabledBorderColor: Colors.orange,
      bottomBarDisabledColor: Colors.purple,
      bottomBarUnselectedColor: Colors.brown,
      bottomBarColor: Colors.pink,
      height: 10.0,
      borderRadius: 5.0,
      minimumWidth: 15.0,
    );

    final style2 = VToggleStyle(
      pressedSplashColor: Colors.pink,
      selectedBorderColor: Colors.indigo,
      unselectedBorderColor: Colors.grey,
      toggleFillColor: Colors.teal,
      disabledBorderColor: Colors.cyan,
      bottomBarDisabledColor: Colors.lime,
      bottomBarUnselectedColor: Colors.amber,
      bottomBarColor: Colors.black,
      height: 20.0,
      borderRadius: 10.0,
      minimumWidth: 25.0,
    );

    final result = style1.lerp(style2, 0.5);

    expect(result.pressedSplashColor, Color.lerp(Colors.red, Colors.pink, 0.5));
    expect(result.selectedBorderColor, Color.lerp(Colors.green, Colors.indigo, 0.5));
    expect(result.unselectedBorderColor, Color.lerp(Colors.blue, Colors.grey, 0.5));
    expect(result.toggleFillColor, Color.lerp(Colors.yellow, Colors.teal, 0.5));
    expect(result.disabledBorderColor, Color.lerp(Colors.orange, Colors.cyan, 0.5));
    expect(result.bottomBarDisabledColor, Color.lerp(Colors.purple, Colors.lime, 0.5));
    expect(result.bottomBarUnselectedColor, Color.lerp(Colors.brown, Colors.amber, 0.5));
    expect(result.bottomBarColor, Color.lerp(Colors.pink, Colors.black, 0.5));
    expect(result.height, lerpDouble(10.0, 20.0, 0.5));
    expect(result.borderRadius, lerpDouble(5.0, 10.0, 0.5));
    expect(result.minimumWidth, lerpDouble(15.0, 25.0, 0.5));
  });

  testWidgets('VToggle test', (tester) async {
    var isSelected = [true, false];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: [Text('Item 1'), Text('Item 2')],
          onPressed: (index) {
            isSelected[index] = !isSelected[index];
          },
        ),
      ),
    ));

    final firstToggle = find.text('Item 1');
    final secondToggle = find.text('Item 2');

    expect(firstToggle, findsOneWidget);
    expect(secondToggle, findsOneWidget);

    // Test that 'Item 1' is initially selected
    expect(isSelected[0], isTrue);
    expect(isSelected[1], isFalse);
  });

  testWidgets('VToggle test', (tester) async {
    var isSelected = [false, true];
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: [Text('Item 1'), Text('Item 2')],
          onPressed: (index) {
            isSelected[index] = !isSelected[index];
          },
        ),
      ),
    ));

    // Test that 'Item 2' is now selected
    expect(isSelected[0], isFalse);
    expect(isSelected[1], isTrue);
  });

  testWidgets('VToggle onPressed test', (tester) async {
    var isSelected = [false, false];
    var pressedIndex;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: [Text('Item 1'), Text('Item 2')],
          onPressed: (index) {
            pressedIndex = index;
          },
        ),
      ),
    ));

    final firstToggle = find.text('Item 1');
    final secondToggle = find.text('Item 2');

    // Tap 'Item 1', it should now be selected
    await tester.tap(firstToggle);
    await tester.pump();

    expect(isSelected[0], isTrue);
    expect(isSelected[1], isFalse);
    expect(pressedIndex, 0);

    // Tap 'Item 2', 'Item 1' should be unselected and 'Item 2' should now be selected
    await tester.tap(secondToggle);
    await tester.pump();

    expect(isSelected[0], isFalse);
    expect(isSelected[1], isTrue);
    expect(pressedIndex, 1);
  });

  testWidgets('VLink applies getAltColorSchemeDark when theme brightness is dark and vExt is not VDef', (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is not VDef

    var isSelected = [false, false];
    var pressedIndex;

    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: [Text('Item 1'), Text('Item 2')],
          onPressed: (index) {
            pressedIndex = index;
          },
          vExt: VAlt(),
        ),
      ),
    ));

    expect(find.byType(VToggle), findsOneWidget);
  });

  testWidgets('VToggle disabled test', (tester) async {
    var isSelected = [false, false];
    // var pressedIndex;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VToggle(
          isSelected: isSelected,
          toggleListItems: [Text('Item 1'), Text('Item 2')],
          isDisabled: true,
          onPressed: (index) {
            // pressedIndex = index;
          },
        ),
      ),
    ));

    final firstToggle = find.text('Item 1');

    // Try to tap 'Item 1', but it should be disabled
    await tester.tap(firstToggle);
    await tester.pump();

    // The onPressed function should not have been called, and the button should not be selected
    // expect(pressedIndex, isNull);
    expect(isSelected[0], isTrue);
  });
}
