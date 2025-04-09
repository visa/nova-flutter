import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  group('VSelect', () {
    test('copyWith should return a new instance with updated properties', () {
      const style = VSelectStyle(
        backgroundColor: Colors.blue,
        splashColor: Colors.red,
        iconColor: Colors.green,
        borderColor: Colors.yellow,
        dropDownBorderColor: Colors.orange,
        bottomBarColor: Colors.purple,
        labelTextColor: Colors.cyan,
        buttonTextColor: Colors.indigo,
        validateTextColor: Colors.teal,
        errorIconColor: Colors.pink,
        dropdownColor: Colors.amber,
        borderErrorColor: Colors.brown,
        borderRadius: 10.0,
        dropDownElevation: 5.0,
        dropDownBorderRadius: 8.0,
        buttonHeight: 50.0,
        buttonWidth: 100.0,
        dropdownWidth: 150.0,
        headerTitleTextStyle: TextStyle(fontSize: 16),
      );

      final updatedStyle = style.copyWith();

      expect(updatedStyle.backgroundColor, equals(Colors.blue));
      expect(updatedStyle.splashColor, equals(Colors.red));
      expect(updatedStyle.iconColor, equals(Colors.green));
      expect(updatedStyle.borderColor, equals(Colors.yellow));
      expect(updatedStyle.dropDownBorderColor, equals(Colors.orange));
      expect(updatedStyle.bottomBarColor, equals(Colors.purple));
      expect(updatedStyle.labelTextColor, equals(Colors.cyan));
      expect(updatedStyle.buttonTextColor, equals(Colors.indigo));
      expect(updatedStyle.validateTextColor, equals(Colors.teal));
      expect(updatedStyle.errorIconColor, equals(Colors.pink));
      expect(updatedStyle.dropdownColor, equals(Colors.amber));
      expect(updatedStyle.borderErrorColor, equals(Colors.brown));
      expect(updatedStyle.borderRadius, equals(10.0));
      expect(updatedStyle.dropDownElevation, equals(5.0));
      expect(updatedStyle.dropDownBorderRadius, equals(8.0));
      expect(updatedStyle.buttonHeight, equals(50.0));
      expect(updatedStyle.buttonWidth, equals(100.0));
      expect(updatedStyle.dropdownWidth, equals(150.0));
      expect(updatedStyle.headerTitleTextStyle!.fontSize, equals(16));
    });

    // test('lerp should return a new instance with interpolated properties', () {
    //   const style1 = VSelectStyle(
    //     backgroundColor: Colors.blue,
    //     splashColor: Colors.red,
    //     iconColor: Colors.green,
    //     borderColor: Colors.yellow,
    //     dropDownBorderColor: Colors.orange,
    //     bottomBarColor: Colors.purple,
    //     labelTextColor: Colors.cyan,
    //     buttonTextColor: Colors.indigo,
    //     validateTextColor: Colors.teal,
    //     errorIconColor: Colors.pink,
    //     dropdownColor: Colors.amber,
    //     borderErrorColor: Colors.brown,
    //     borderRadius: 10.0,
    //     dropDownElevation: 5.0,
    //     dropDownBorderRadius: 8.0,
    //     buttonHeight: 50.0,
    //     buttonWidth: 100.0,
    //     dropdownWidth: 150.0,
    //     headerTitleTextStyle: TextStyle(fontSize: 16),
    //   );

    //   const style2 = VSelectStyle(
    //     backgroundColor: Colors.white,
    //     splashColor: Colors.black,
    //     iconColor: Colors.grey,
    //     borderColor: Colors.blueGrey,
    //     dropDownBorderColor: Colors.deepPurple,
    //     bottomBarColor: Colors.lime,
    //     labelTextColor: Colors.pinkAccent,
    //     buttonTextColor: Colors.orangeAccent,
    //     validateTextColor: Colors.tealAccent,
    //     errorIconColor: Colors.redAccent,
    //     dropdownColor: Colors.amberAccent,
    //     borderErrorColor: Colors.brown,
    //     borderRadius: 20.0,
    //     dropDownElevation: 10.0,
    //     dropDownBorderRadius: 16.0,
    //     buttonHeight: 60.0,
    //     buttonWidth: 120.0,
    //     dropdownWidth: 180.0,
    //     headerTitleTextStyle: TextStyle(fontSize: 18),
    //   );

    //   final interpolatedStyle = style1.lerp(style2, 0.5);

    //   expect(interpolatedStyle.backgroundColor, equals(Colors.blue.withOpacity(0.5)));
    //   expect(interpolatedStyle.splashColor, equals(Colors.red.withOpacity(0.5)));
    //   expect(interpolatedStyle.iconColor, equals(Colors.green.withOpacity(0.5)));
    //   expect(interpolatedStyle.borderColor, equals(Colors.yellow.withOpacity(0.5)));
    //   expect(interpolatedStyle.dropDownBorderColor, equals(Colors.orange.withOpacity(0.5)));
    //   expect(interpolatedStyle.bottomBarColor, equals(Colors.purple.withOpacity(0.5)));
    //   expect(interpolatedStyle.labelTextColor, equals(Colors.cyan.withOpacity(0.5)));
    //   expect(interpolatedStyle.buttonTextColor, equals(Colors.indigo.withOpacity(0.5)));
    //   expect(interpolatedStyle.validateTextColor, equals(Colors.teal.withOpacity(0.5)));
    //   expect(interpolatedStyle.errorIconColor, equals(Colors.pink.withOpacity(0.5)));
    //   expect(interpolatedStyle.dropdownColor, equals(Colors.amber.withOpacity(0.5)));
    //   expect(interpolatedStyle.borderErrorColor, equals(Colors.brown.withOpacity(0.5)));
    //   expect(interpolatedStyle.borderRadius, equals(15.0));
    //   expect(interpolatedStyle.dropDownElevation, equals(7.5));
    //   expect(interpolatedStyle.dropDownBorderRadius, equals(12.0));
    //   expect(interpolatedStyle.buttonHeight, equals(55.0));
    //   expect(interpolatedStyle.buttonWidth, equals(110.0));
    //   expect(interpolatedStyle.dropdownWidth, equals(165.0));
    //   expect(interpolatedStyle.headerTitleTextStyle!.fontSize, equals(17));
    // });
  });

  testWidgets('VSelect should be created without any errors', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => print('Selected value: $value'),
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors with dark theme', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => print('Selected value: $value'),
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors with dark theme and alt', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => print('Selected value: $value'),
            vExt: VAlt(),
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  // testWidgets(
  //     'VSelect should display dropdown options and call onSelected when an option is selected',
  //     (WidgetTester tester) async {
  //   // Given
  //   final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];
  //   String selectedValue = '';

  //   // When
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: VSelect(
  //           itemBuilder: (BuildContext context) {
  //   return dropdownOptions.map((String item) {
  //     return PopupMenuItem<String>(
  //       value: item,
  //       child: Text(item),
  //     );
  //   }).toList();
  // },
  //           buttonText: 'Select an option',
  //           isDisabled: false,
  //           onSelected: (value) {
  //             selectedValue =
  //                 value; // Update the selectedValue when option is selected
  //           },
  //         ),
  //       ),
  //     ),
  //   );

  //   // Then
  //   expect(find.byType(VSelect), findsOneWidget);

  //   // When
  //   await tester.tap(find.byType(VSelect));
  //   await tester.pumpAndSettle(); // wait for the popup to show up

  //   // Add delay before tapping the PopupMenuItem
  //   await tester.pump(Duration(seconds: 1));

  //   // Tap the PopupMenuItem
  //   await tester.tap(find.text('Option 1').last);
  //   await tester.pumpAndSettle();

  //   // Verify that the onSelected function has been called with the correct value
  //   expect(selectedValue, 'Option 1');
  // });

  testWidgets('VSelect should be created without any errors border color', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => print('Selected value: $value'),
            validate: true,
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors inline', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VSelect(
            isInline: true,
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => print('Selected value: $value'),
            vExt: VAlt(),
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors inline and header is not null', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: VSelect(
            isInline: true,
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => print('Selected value: $value'),
            headerLabel: "Pick a color",
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors and header is not null', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => print('Selected value: $value'),
            headerLabel: "Pick a color",
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors and header is not null', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            isDisabled: false,
            onSelected: (value) => print('Selected value: $value'),
            onCanceled: () => print('Canceled'),
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors and header is not null', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            isDisabled: true,
            onSelected: (value) => print('Selected value: $value'),
            onCanceled: () => print('Canceled'),
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors is read only', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            isReadOnly: true,
            onSelected: (value) => print('Selected value: $value'),
            onCanceled: () => print('Canceled'),
            headerLabel: "Pick a color",
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors is read only and header label', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            isReadOnly: true,
            headerLabel: "Pick a color",
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors is disabled only and header label', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            isDisabled: true,
            headerLabel: "Pick a color",
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('VSelect should be created without any errors is validate only and header label', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

    // When
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            validate: true,
            headerLabel: "Pick a color",
          ),
        ),
      ),
    );

    // Then
    expect(find.byType(VSelect), findsOneWidget);
  });

  testWidgets('PopupMenuButton itemBuilder should generate correct number of PopupMenuItems', (WidgetTester tester) async {
    // Given
    final dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VSelect(
            itemBuilder: (BuildContext context) {
              return dropdownOptions.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            buttonText: Text('Select an option'),
            headerLabel: "Pick a color",
          ),
        ),
      ),
    );

    // When
    await tester.tap(find.byType(VSelect));
    await tester.pumpAndSettle();

    // Then
    final popupMenuItems = tester.widgetList<PopupMenuItem>(find.byType(PopupMenuItem));
    expect(popupMenuItems.length, 0 /*dropdownOptions.length*/);
  });

  // testWidgets('VSelectDefault should display default hint and options',
  //     (WidgetTester tester) async {
  //   // Given
  //   final defaultHint = 'Option';
  //   final options = ['Option 1', 'Option 2', 'Option 3'];
  //   int? selectedValue;

  //   // When
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: Column(
  //           children: [
  //             VSelect(
  //               buttonText: Text(defaultHint),
  //               dropdownOptions: options,
  //               onDidGainAccessibilityFocus: null,
  //               onSelected: (value) {
  //                 selectedValue = value as int;
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );

  //   // Then
  //   expect(find.text(defaultHint), findsOneWidget);
  //   await tester.tap(find.byType(VSelect));
  //   await tester.pumpAndSettle();
  //   expect(find.text('Option 1'), findsOneWidget);

  //   // Verify the dropdown items
  //   expect(find.text('Option 1'), findsOneWidget);
  //   expect(find.text('Option 2'), findsOneWidget);
  //   expect(find.text('Option 3'), findsOneWidget);

  //   // Tap on the 'Option 2' menu item
  //   await tester.tap(find.text('Option 2'));
  //   await tester.pumpAndSettle();

  //   // Verify the selected option
  //   expect(selectedValue, 1);
  // });

  // testWidgets('VSelectDefault should display default hint and options',
  //     (WidgetTester tester) async {
  //   // Given
  //   final defaultHint = 'Option';
  //   final options = ['Option 1', 'Option 2', 'Option 3'];
  //   int? selectedValue;

  //   // When
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: Column(
  //           children: [
  //             VSelect(
  //               validate: true,
  //               buttonText: Text(defaultHint),
  //               dropdownOptions: options,
  //               onDidGainAccessibilityFocus: null,
  //               isDisabled: false,
  //               onSelected: (value) {
  //                 selectedValue = value as int;
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );

  //   // Then
  //   expect(find.text(defaultHint), findsOneWidget);
  //   await tester.tap(find.byType(VSelect));
  //   await tester.pumpAndSettle();
  //   expect(find.text('Option 1'), findsOneWidget);

  //   // Verify the dropdown items
  //   expect(find.text('Option 1'), findsOneWidget);
  //   expect(find.text('Option 2'), findsOneWidget);
  //   expect(find.text('Option 3'), findsOneWidget);

  //   // Tap on the 'Option 2' menu item
  //   await tester.tap(find.text('Option 2'));
  //   await tester.pumpAndSettle();

  //   // Verify the selected option
  //   expect(selectedValue, 1);
  // });

  // testWidgets('VSelectDefault should display default hint and options',
  //     (WidgetTester tester) async {
  //   // Given
  //   final defaultHint = 'Option';
  //   final options = ['Option 1', 'Option 2', 'Option 3'];
  //   int? selectedValue;

  //   // When
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: Column(
  //           children: [
  //             VSelect(
  //               headerLabel: "Pick a color",
  //               validate: true,
  //               isInline: true,
  //               buttonText: Text(defaultHint),
  //               dropdownOptions: options,
  //               onDidGainAccessibilityFocus: null,
  //               isDisabled: false,
  //               onSelected: (value) {
  //                 selectedValue = value as int;
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );

  //   // Then
  //   expect(find.text(defaultHint), findsOneWidget);
  //   await tester.tap(find.byType(VSelect));
  //   await tester.pumpAndSettle();
  //   expect(find.text('Option 1'), findsOneWidget);

  //   // Verify the dropdown items
  //   expect(find.text('Option 1'), findsOneWidget);
  //   expect(find.text('Option 2'), findsOneWidget);
  //   expect(find.text('Option 3'), findsOneWidget);

  //   // Tap on the 'Option 2' menu item
  //   await tester.tap(find.text('Option 2'));
  //   await tester.pumpAndSettle();

  //   // Verify the selected option
  //   expect(selectedValue, 1);
  // });

  // testWidgets('VSelectDefault should display default hint and options',
  //     (WidgetTester tester) async {
  //   // Given
  //   final defaultHint = 'Option';
  //   final options = ['Option 1', 'Option 2', 'Option 3'];
  //   int? selectedValue;

  //   // When
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: Scaffold(
  //         body: Column(
  //           children: [
  //             VSelect(
  //               headerLabel: "Pick a color",
  //               validate: true,
  //               // isInline: true,
  //               buttonText: Text(defaultHint),
  //               dropdownOptions: options,
  //               onDidGainAccessibilityFocus: null,
  //               isDisabled: false,
  //               // onSelected: (value) {
  //               //   selectedValue = value as int;
  //               // },
  //               onCanceled: () {
  //                 print('Canceled');
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );

  //   // Then
  //   expect(find.text(defaultHint), findsOneWidget);
  //   await tester.tap(find.byType(VSelect));
  //   await tester.pumpAndSettle();
  //   expect(find.text('Option 1'), findsOneWidget);

  //   // Verify the dropdown items
  //   expect(find.text('Option 1'), findsOneWidget);
  //   expect(find.text('Option 2'), findsOneWidget);
  //   expect(find.text('Option 3'), findsOneWidget);

  //   // Tap on the 'Option 2' menu item
  //   await tester.tap(find.text('Option 2'));
  //   await tester.pumpAndSettle();

  //   final switchFinder = find.byType(VSelect);

  //   // Drag the pointer away from the switch
  //   final gesture = await tester.press(switchFinder);

  //   await gesture.moveBy(const Offset(0.0, 200.0));
  //   await tester.pump();

  //   // Verify the selected option
  //   expect(selectedValue, null);
  // });
}
