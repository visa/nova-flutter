import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  group('VChipSelectionStyle', () {
    test('copyWith should return a new instance with updated values', () {
      const style = VChipSelectionStyle(
        backgroundDisabledColor: Colors.red,
        backgroundReadOnlyColor: Colors.blue,
        backgroundIsSelectedColor: Colors.green,
        backgroundPressedColor: Colors.yellow,
        backgroundDefaultColor: Colors.orange,
        backgroundSelectedPressed: Colors.indigo,
        chipLabelReadOnlyColor: Colors.brown,
        chipLabelDisabledColor: Colors.pink,
        chipLabelSelectedColor: Colors.purple,
        chipLabelDefaultColor: Colors.teal,
        borderReadOnlyColor: Colors.cyan,
        borderDisabledColor: Colors.lime,
        borderSelectedColor: Colors.amber,
        borderDefaultColor: Colors.indigo,
        iconReadOnlyColor: Colors.purple,
        iconDisabledColor: Colors.teal,
        iconDefaultColor: Colors.brown,
        borderRadius: 20.0,
        elevation: 10.0,
        pressedElevation: 14.0,
        chipLabelTextStyle: TextStyle(color: Colors.blue),
      );

      final updatedStyle = style.copyWith();

      expect(updatedStyle.backgroundDisabledColor, Colors.red);
      expect(updatedStyle.backgroundReadOnlyColor, Colors.blue);
      expect(updatedStyle.backgroundIsSelectedColor, Colors.green);
      expect(updatedStyle.backgroundPressedColor, Colors.yellow);
      expect(updatedStyle.backgroundDefaultColor, Colors.orange);
      expect(updatedStyle.backgroundSelectedPressed, Colors.indigo);
      expect(updatedStyle.chipLabelReadOnlyColor, Colors.brown);
      expect(updatedStyle.chipLabelDisabledColor, Colors.pink);
      expect(updatedStyle.chipLabelSelectedColor, Colors.purple);
      expect(updatedStyle.chipLabelDefaultColor, Colors.teal);
      expect(updatedStyle.borderReadOnlyColor, Colors.cyan);
      expect(updatedStyle.borderDisabledColor, Colors.lime);
      expect(updatedStyle.borderSelectedColor, Colors.amber);
      expect(updatedStyle.borderDefaultColor, Colors.indigo);
      expect(updatedStyle.iconReadOnlyColor, Colors.purple);
      expect(updatedStyle.iconDisabledColor, Colors.teal);
      expect(updatedStyle.iconDefaultColor, Colors.brown);
      expect(updatedStyle.borderRadius, 20.0);
      expect(updatedStyle.elevation, 10.0);
      expect(updatedStyle.pressedElevation, 14.0);
      expect(updatedStyle.chipLabelTextStyle, TextStyle(color: Colors.blue));
    });

    // test('lerp should interpolate between two styles', () {
    //   const style1 = VChipSelectionStyle(
    //     backgroundDisabledColor: Colors.red,
    //     backgroundReadOnlyColor: Colors.blue,
    //     backgroundIsSelectedColor: Colors.green,
    //     backgroundPressedColor: Colors.yellow,
    //     backgroundDefaultColor: Colors.orange,
    //     backgroundSelectedPressed: Colors.indigo,
    //     chipLabelReadOnlyColor: Colors.brown,
    //     chipLabelDisabledColor: Colors.pink,
    //     chipLabelSelectedColor: Colors.purple,
    //     chipLabelDefaultColor: Colors.teal,
    //     borderReadOnlyColor: Colors.cyan,
    //     borderDisabledColor: Colors.lime,
    //     borderSelectedColor: Colors.amber,
    //     borderDefaultColor: Colors.indigo,
    //     iconReadOnlyColor: Colors.purple,
    //     iconDisabledColor: Colors.teal,
    //     iconDefaultColor: Colors.brown,
    //     borderRadius: 20.0,
    //     elevation: 10.0,
    //     pressedElevation: 14.0,
    //     chipLabelTextStyle: TextStyle(color: Colors.blue),
    //   );

    //   const style2 = VChipSelectionStyle(
    //     backgroundDisabledColor: Colors.green,
    //     backgroundReadOnlyColor: Colors.yellow,
    //     backgroundIsSelectedColor: Colors.blue,
    //     backgroundPressedColor: Colors.orange,
    //     backgroundDefaultColor: Colors.red,
    //     backgroundSelectedPressed: Colors.indigo,
    //     chipLabelReadOnlyColor: Colors.pink,
    //     chipLabelDisabledColor: Colors.purple,
    //     chipLabelSelectedColor: Colors.teal,
    //     chipLabelDefaultColor: Colors.brown,
    //     borderReadOnlyColor: Colors.lime,
    //     borderDisabledColor: Colors.amber,
    //     borderSelectedColor: Colors.indigo,
    //     borderDefaultColor: Colors.cyan,
    //     iconReadOnlyColor: Colors.teal,
    //     iconDisabledColor: Colors.brown,
    //     iconDefaultColor: Colors.purple,
    //     borderRadius: 10.0,
    //     elevation: 5.0,
    //     pressedElevation: 7.0,
    //     chipLabelTextStyle: TextStyle(color: Colors.green),
    //   );

    //   final lerpedStyle = style1.lerp(style2, 0.5);

    //   expect(lerpedStyle.backgroundDisabledColor, Color.lerp(Colors.red, Colors.green, 0.5));
    //   expect(lerpedStyle.backgroundReadOnlyColor, Color.lerp(Colors.blue, Colors.yellow, 0.5));
    //   expect(lerpedStyle.backgroundIsSelectedColor, Color.lerp(Colors.green, Colors.blue, 0.5));
    //   expect(lerpedStyle.backgroundPressedColor, Color.lerp(Colors.yellow, Colors.orange, 0.5));
    //   expect(lerpedStyle.backgroundDefaultColor, Color.lerp(Colors.orange, Colors.red, 0.5));
    //   expect(lerpedStyle.backgroundSelectedPressed, Color.lerp(Colors.red, Colors.indigo, 0.5));
    //   expect(lerpedStyle.chipLabelReadOnlyColor, Color.lerp(Colors.brown, Colors.pink, 0.5));
    //   expect(lerpedStyle.chipLabelDisabledColor, Color.lerp(Colors.pink, Colors.purple, 0.5));
    //   expect(lerpedStyle.chipLabelSelectedColor, Color.lerp(Colors.purple, Colors.teal, 0.5));
    //   expect(lerpedStyle.chipLabelDefaultColor, Color.lerp(Colors.teal, Colors.brown, 0.5));
    //   expect(lerpedStyle.borderReadOnlyColor, Color.lerp(Colors.cyan, Colors.lime, 0.5));
    //   expect(lerpedStyle.borderDisabledColor, Color.lerp(Colors.lime, Colors.amber, 0.5));
    //   expect(lerpedStyle.borderSelectedColor, Color.lerp(Colors.indigo, Colors.indigo, 0.5));
    //   expect(lerpedStyle.borderDefaultColor, Color.lerp(Colors.indigo, Colors.cyan, 0.5));
    //   expect(lerpedStyle.iconReadOnlyColor, Color.lerp(Colors.purple, Colors.teal, 0.5));
    //   expect(lerpedStyle.iconDisabledColor, Color.lerp(Colors.teal, Colors.brown, 0.5));
    //   expect(lerpedStyle.iconDefaultColor, Color.lerp(Colors.brown, Colors.purple, 0.5));
    //   expect(lerpedStyle.borderRadius, 15.0);
    //   expect(lerpedStyle.elevation, 7.5);
    //   expect(lerpedStyle.pressedElevation, 10.5);
    //   expect(lerpedStyle.chipLabelTextStyle, TextStyle(color: Colors.green));
    // });
  });

  group('VChipRemovableStyle', () {
    test('copyWith should return a new instance with the updated values', () {
      const style = VChipRemovableStyle(
        backgroundColor: Colors.red,
        chipLabelColor: Colors.blue,
        chipLabelDisabledColor: Colors.grey,
        borderReadOnlyColor: Colors.black,
        borderDisabledColor: Colors.white,
        borderDefaultColor: Colors.green,
        borderPressedColor: Colors.yellow,
        iconPressedColor: Colors.orange,
        iconDisabledColor: Colors.purple,
        iconDefaultColor: Colors.teal,
        deleteButtonBackgroundColor: Colors.cyan,
        deleteButtonSplashColor: Colors.lime,
        borderCompactChipColor: Colors.indigo,
        compactBorderRadius: 10.0,
        standardBorderRadius: 10.0,
        elevation: 5.0,
        pressedElevation: 7.0,
        chipLabelTextStyle: TextStyle(fontSize: 16),
      );

      final updatedStyle = style.copyWith();

      expect(updatedStyle.backgroundColor, Colors.red);
      expect(updatedStyle.chipLabelColor, Colors.blue);
      expect(updatedStyle.chipLabelDisabledColor, Colors.grey);
      expect(updatedStyle.borderReadOnlyColor, Colors.black);
      expect(updatedStyle.borderDisabledColor, Colors.white);
      expect(updatedStyle.borderDefaultColor, Colors.green);
      expect(updatedStyle.borderPressedColor, Colors.yellow);
      expect(updatedStyle.iconPressedColor, Colors.orange);
      expect(updatedStyle.iconDisabledColor, Colors.purple);
      expect(updatedStyle.iconDefaultColor, Colors.teal);
      expect(updatedStyle.deleteButtonBackgroundColor, Colors.cyan);
      expect(updatedStyle.deleteButtonSplashColor, Colors.lime);
      expect(updatedStyle.borderCompactChipColor, Colors.indigo);
      expect(updatedStyle.compactBorderRadius, 10.0);
      expect(updatedStyle.standardBorderRadius, 10.0);
      expect(updatedStyle.elevation, 5.0);
      expect(updatedStyle.pressedElevation, 7.0);
      expect(updatedStyle.chipLabelTextStyle, TextStyle(fontSize: 16));
    });

    test('lerp should interpolate between two styles', () {
      const style1 = VChipRemovableStyle(
        backgroundColor: Colors.red,
        chipLabelColor: Colors.blue,
        chipLabelDisabledColor: Colors.grey,
        borderReadOnlyColor: Colors.black,
        borderDisabledColor: Colors.white,
        borderDefaultColor: Colors.green,
        borderPressedColor: Colors.yellow,
        iconPressedColor: Colors.orange,
        iconDisabledColor: Colors.purple,
        iconDefaultColor: Colors.teal,
        deleteButtonBackgroundColor: Colors.cyan,
        deleteButtonSplashColor: Colors.lime,
        borderCompactChipColor: Colors.indigo,
        compactBorderRadius: 10.0,
        standardBorderRadius: 20.0,
        elevation: 5.0,
        pressedElevation: 7.0,
        chipLabelTextStyle: TextStyle(fontSize: 16),
      );

      const style2 = VChipRemovableStyle(
        backgroundColor: Colors.amber,
        chipLabelColor: Colors.pink,
        chipLabelDisabledColor: Colors.brown,
        borderReadOnlyColor: Colors.grey,
        borderDisabledColor: Colors.black,
        borderDefaultColor: Colors.blue,
        borderPressedColor: Colors.green,
        iconPressedColor: Colors.orange,
        iconDisabledColor: Colors.purple,
        iconDefaultColor: Colors.teal,
        deleteButtonBackgroundColor: Colors.cyan,
        deleteButtonSplashColor: Colors.lime,
        borderCompactChipColor: Colors.indigo,
        compactBorderRadius: 10.0,
        standardBorderRadius: 20.0,
        elevation: 5.0,
        pressedElevation: 7.0,
        chipLabelTextStyle: TextStyle(fontSize: 16),
      );

      final lerpedStyle = style1.lerp(style2, 0.5);

      expect(lerpedStyle.backgroundColor,
          Color.lerp(Colors.red, Colors.amber, 0.5));
      expect(lerpedStyle.chipLabelColor,
          Color.lerp(Colors.blue, Colors.pink, 0.5));
      expect(lerpedStyle.chipLabelDisabledColor,
          Color.lerp(Colors.grey, Colors.brown, 0.5));
      expect(lerpedStyle.borderReadOnlyColor,
          Color.lerp(Colors.black, Colors.grey, 0.5));
      expect(lerpedStyle.borderDisabledColor,
          Color.lerp(Colors.white, Colors.black, 0.5));
      expect(lerpedStyle.borderDefaultColor,
          Color.lerp(Colors.green, Colors.blue, 0.5));
      expect(lerpedStyle.borderPressedColor,
          Color.lerp(Colors.yellow, Colors.green, 0.5));
      expect(lerpedStyle.iconPressedColor,
          Color.lerp(Colors.orange, Colors.orange, 0.5));
      expect(lerpedStyle.iconDisabledColor,
          Color.lerp(Colors.purple, Colors.purple, 0.5));
      expect(lerpedStyle.iconDefaultColor,
          Color.lerp(Colors.teal, Colors.teal, 0.5));
      expect(lerpedStyle.deleteButtonBackgroundColor,
          Color.lerp(Colors.cyan, Colors.cyan, 0.5));
      expect(lerpedStyle.deleteButtonSplashColor,
          Color.lerp(Colors.lime, Colors.lime, 0.5));
      expect(lerpedStyle.borderCompactChipColor,
          Color.lerp(Colors.indigo, Colors.indigo, 0.5));
      expect(lerpedStyle.compactBorderRadius, 10.0);
      expect(lerpedStyle.standardBorderRadius, 20.0);
      expect(lerpedStyle.elevation, 5.0);
      expect(lerpedStyle.pressedElevation, 7.0);
      expect(lerpedStyle.chipLabelTextStyle, TextStyle(fontSize: 16));
    });
  });

  group('VChipsSelection', () {
    testWidgets('renders chip label correctly', (WidgetTester tester) async {
      const chipLabel = 'Test Chip';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VChipsSelection(
              chipLabel: chipLabel,
              onSelected: (isSelected) {},
            ),
          ),
        ),
      );

      final chipLabelFinder = find.text(chipLabel);
      expect(chipLabelFinder, findsOneWidget);
    });

    testWidgets('renders chip label correctly with dark theme',
        (WidgetTester tester) async {
      const chipLabel = 'Test Chip';
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: Brightness.dark),
          home: Scaffold(
            body: VChipsSelection(
              chipLabel: chipLabel,
              onSelected: (isSelected) {},
            ),
          ),
        ),
      );

      final chipLabelFinder = find.text(chipLabel);
      expect(chipLabelFinder, findsOneWidget);
    });

    testWidgets('renders chip label correctly with dark Alt theme',
        (WidgetTester tester) async {
      const chipLabel = 'Test Chip';
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: Brightness.dark),
          home: Scaffold(
            body: VChipsSelection(
              chipLabel: chipLabel,
              onSelected: (isSelected) {},
              vExt: VAlt(),
            ),
          ),
        ),
      );

      final chipLabelFinder = find.text(chipLabel);
      expect(chipLabelFinder, findsOneWidget);
    });

    testWidgets('calls onSelected callback when chip is selected',
        (WidgetTester tester) async {
      bool isSelected = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VChipsSelection(
              chipLabel: 'Test Chip',
              onSelected: (value) {
                isSelected = value;
              },
            ),
          ),
        ),
      );

      final chip = find.byType(VChipsSelection);
      await tester.tap(chip);
      await tester.pump();

      expect(isSelected, true);
    });

    testWidgets('disables chip when isDisabled is true',
        (WidgetTester tester) async {
      bool isSelected = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VChipsSelection(
              chipLabel: 'Test Chip',
              onSelected: (value) {
                isSelected = value;
              },
              isDisabled: true,
            ),
          ),
        ),
      );

      final chip = find.byType(VChipsSelection);
      await tester.tap(chip);
      await tester.pump();

      expect(isSelected, false);
    });

    testWidgets('does not call onSelected callback when chip is read-only',
        (WidgetTester tester) async {
      bool isSelected = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VChipsSelection(
              chipLabel: 'Test Chip',
              onSelected: (value) {
                isSelected = value;
              },
              isReadOnly: true,
            ),
          ),
        ),
      );

      final chip = find.byType(VChipsSelection);
      await tester.tap(chip);
      await tester.pump();

      expect(isSelected, false);
    });
  });

  testWidgets('renders chip label correctly', (WidgetTester tester) async {
    const chipLabel = 'Test Chip';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VChipsRemovable(
            chipLabel: chipLabel,
            onDeleted: () {},
          ),
        ),
      ),
    );

    final chipLabelFinder = find.text(chipLabel);
    expect(chipLabelFinder, findsOneWidget);
  });

  testWidgets('renders chip label correctly with dark',
      (WidgetTester tester) async {
    const chipLabel = 'Test Chip';
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VChipsRemovable(
            chipLabel: chipLabel,
            onDeleted: () {},
          ),
        ),
      ),
    );

    final chipLabelFinder = find.text(chipLabel);
    expect(chipLabelFinder, findsOneWidget);
  });

  testWidgets('renders chip label correctly', (WidgetTester tester) async {
    const chipLabel = 'Test Chip';
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VChipsRemovable(
            chipLabel: chipLabel,
            onDeleted: () {},
            vExt: VAlt(),
          ),
        ),
      ),
    );

    final chipLabelFinder = find.text(chipLabel);
    expect(chipLabelFinder, findsOneWidget);
  });

  testWidgets('calls onDeleted callback when chip is deleted',
      (WidgetTester tester) async {
    bool isDeleted = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VChipsRemovable(
            chipLabel: 'Test Chip',
            onDeleted: () {
              isDeleted = true;
            },
          ),
        ),
      ),
    );

    final deleteIcon = find.byType(VIcon);
    await tester.tap(deleteIcon);
    await tester.pump();

    expect(isDeleted, true);
  });

  testWidgets('disables chip when isDisabled is true',
      (WidgetTester tester) async {
    bool isDeleted = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VChipsRemovable(
            chipLabel: 'Test Chip',
            onDeleted: () {
              isDeleted = true;
            },
            isDisabled: true,
          ),
        ),
      ),
    );

    final deleteIcon = find.byType(VIcon);
    await tester.tap(deleteIcon);
    await tester.pump();

    expect(isDeleted, false);
  });

  // testWidgets('does not call onDeleted callback when chip is read-only',
  //     (WidgetTester tester) async {
  //   bool isDeleted = false;
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: VChipsRemovable(
  //           chipLabel: 'Test Chip',
  //           onDeleted: () {
  //             isDeleted = true;
  //           },
  //           isReadOnly: true,
  //         ),
  //       ),
  //     ),
  //   );

  //   final deleteIcon = find.byType(VIcon);
  //   await tester.tap(deleteIcon);
  //   await tester.pump();

  //   expect(isDeleted, false);
  // });

  testWidgets('does not call onDeleted callback when chip not standard',
      (WidgetTester tester) async {
    const chipLabel = 'Test Chip';
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VChipsRemovable(
            chipsRemovableType: ChipsRemovableType.compactRemovable,
            chipLabel: chipLabel,
            onDeleted: () {},
            vExt: VAlt(),
          ),
        ),
      ),
    );

    final chipLabelFinder = find.text(chipLabel);
    expect(chipLabelFinder, findsOneWidget);
  });
}
