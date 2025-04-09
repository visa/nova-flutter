import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
import 'dart:ui';

void main() {
  test('VInputStyle copyWith copies values correctly', () {
    final original = VInputStyle(
      textFieldColor: Colors.red,
      borderColor: Colors.green,
      thumbColor: Colors.orange,
      trackColor: Colors.yellow,
      trackBorderColor: Colors.purple,
      leadingIconColor: Colors.cyan,
      inputDisabledColor: Colors.grey,
      inputDefaultColor: Colors.white,
      inputFocusedColor: Colors.blueGrey,
      errorBorderColor: Colors.red,
      containerColor: Colors.transparent,
      trailingIconColor: Colors.teal,
      bottomBarErrorColor: Colors.red,
      bottomBarColor: Colors.blue,
      counterErrorTextColor: Colors.red,
      counterTextColor: Colors.black,
      errorIconColor: Colors.red,
      errorTextColor: Colors.red,
      topLabelErrorTextColor: Colors.red,
      topLabelDisabledTextColor: Colors.grey,
      topLabelFocusedTextColor: Colors.blue,
      topLabelTextColor: Colors.black,
      borderErrorColor: Colors.red,
      borderDisabledColor: Colors.grey,
      borderFocusedColor: Colors.blue,
      borderDefaultColor: Colors.black,
      leadingPrefixColor: Colors.black,
      leadingIconErrorColor: Colors.red,
      leadingIconDisabledColor: Colors.grey,
      leadingIconFocusedColor: Colors.blue,
      leadingIconDefaultColor: Colors.black,
      trailingSuffixColor: Colors.black,
      trailingIconErrorColor: Colors.red,
      trailingIconDisabledColor: Colors.grey,
      trailingIconFocusedColor: Colors.blue,
      trailingIconDefaultColor: Colors.black,
      cursorColor: Colors.black,
      borderRadius: 8.0,
      trackRadius: 4.0,
      inputContainerHeight: 48.0,
      topLabelTextStyle: TextStyle(color: Colors.black),
      inputTextStyle: TextStyle(color: Colors.black),
      errorTextStyle: TextStyle(color: Colors.red),
      counterTextStyle: TextStyle(color: Colors.black),
      validateErrorTextStyle: TextStyle(color: Colors.red),
    );

    final copy = original.copyWith();

    expect(copy.textFieldColor, Colors.red);
    expect(copy.borderColor, Colors.green);
    expect(copy.thumbColor, Colors.orange);
    expect(copy.trackColor, Colors.yellow);
    expect(copy.trackBorderColor, Colors.purple);
    expect(copy.leadingIconColor, Colors.cyan);
    expect(copy.inputDisabledColor, Colors.grey);
    expect(copy.inputDefaultColor, Colors.white);
    expect(copy.inputFocusedColor, Colors.blueGrey);
    expect(copy.errorBorderColor, Colors.red);
    expect(copy.containerColor, Colors.transparent);
    expect(copy.trailingIconColor, Colors.teal);
    expect(copy.bottomBarErrorColor, Colors.red);
    expect(copy.bottomBarColor, Colors.blue);
    expect(copy.counterErrorTextColor, Colors.red);
    expect(copy.counterTextColor, Colors.black);
    expect(copy.errorIconColor, Colors.red);
    expect(copy.errorTextColor, Colors.red);
    expect(copy.topLabelErrorTextColor, Colors.red);
    expect(copy.topLabelDisabledTextColor, Colors.grey);
    expect(copy.topLabelFocusedTextColor, Colors.blue);
    expect(copy.topLabelTextColor, Colors.black);
    expect(copy.borderErrorColor, Colors.red);
    expect(copy.borderDisabledColor, Colors.grey);
    expect(copy.borderFocusedColor, Colors.blue);
    expect(copy.borderDefaultColor, Colors.black);
    expect(copy.leadingPrefixColor, Colors.black);
    expect(copy.leadingIconErrorColor, Colors.red);
    expect(copy.leadingIconDisabledColor, Colors.grey);
    expect(copy.leadingIconFocusedColor, Colors.blue);
    expect(copy.leadingIconDefaultColor, Colors.black);
    expect(copy.trailingSuffixColor, Colors.black);
    expect(copy.trailingIconErrorColor, Colors.red);
    expect(copy.trailingIconDisabledColor, Colors.grey);
    expect(copy.trailingIconFocusedColor, Colors.blue);
    expect(copy.trailingIconDefaultColor, Colors.black);
    expect(copy.cursorColor, Colors.black);
    expect(copy.borderRadius, 8.0);
    expect(copy.trackRadius, 4.0);
    expect(copy.inputContainerHeight, 48.0);
    expect(copy.topLabelTextStyle?.color, Colors.black);
    expect(copy.inputTextStyle?.color, Colors.black);
    expect(copy.errorTextStyle?.color, Colors.red);
    expect(copy.counterTextStyle?.color, Colors.black);
    expect(copy.validateErrorTextStyle?.color, Colors.red);
  });

  test('VInputStyle lerps correctly', () {
    final original = VInputStyle(
      textFieldColor: Colors.red,
      borderColor: Colors.green,
      thumbColor: Colors.orange,
      trackColor: Colors.yellow,
      trackBorderColor: Colors.purple,
      leadingIconColor: Colors.cyan,
      inputDisabledColor: Colors.grey,
      inputDefaultColor: Colors.white,
      inputFocusedColor: Colors.blueGrey,
      errorBorderColor: Colors.red,
      containerColor: Colors.transparent,
      trailingIconColor: Colors.teal,
      bottomBarErrorColor: Colors.red,
      bottomBarColor: Colors.blue,
      counterErrorTextColor: Colors.red,
      counterTextColor: Colors.black,
      errorIconColor: Colors.red,
      errorTextColor: Colors.red,
      topLabelErrorTextColor: Colors.red,
      topLabelDisabledTextColor: Colors.grey,
      topLabelFocusedTextColor: Colors.blue,
      topLabelTextColor: Colors.black,
      borderErrorColor: Colors.red,
      borderDisabledColor: Colors.grey,
      borderFocusedColor: Colors.blue,
      borderDefaultColor: Colors.black,
      leadingPrefixColor: Colors.black,
      leadingIconErrorColor: Colors.red,
      leadingIconDisabledColor: Colors.grey,
      leadingIconFocusedColor: Colors.blue,
      leadingIconDefaultColor: Colors.black,
      trailingSuffixColor: Colors.black,
      trailingIconErrorColor: Colors.red,
      trailingIconDisabledColor: Colors.grey,
      trailingIconFocusedColor: Colors.blue,
      trailingIconDefaultColor: Colors.black,
      cursorColor: Colors.black,
      borderRadius: 8.0,
      trackRadius: 4.0,
      inputContainerHeight: 48.0,
      topLabelTextStyle: TextStyle(color: Colors.black),
      inputTextStyle: TextStyle(color: Colors.black),
      errorTextStyle: TextStyle(color: Colors.red),
      counterTextStyle: TextStyle(color: Colors.black),
      validateErrorTextStyle: TextStyle(color: Colors.red),
    );

    final end = VInputStyle(
      inputDefaultColor: Colors.white,
      textFieldColor: Colors.blue,
      borderColor: Colors.red,
      thumbColor: Colors.green,
      trackColor: Colors.yellow,
      trackBorderColor: Colors.purple,
      leadingIconColor: Colors.cyan,
      inputDisabledColor: Colors.grey,
      errorBorderColor: Colors.red,
      containerColor: Colors.transparent,
      trailingIconColor: Colors.teal,
      bottomBarErrorColor: Colors.red,
      bottomBarColor: Colors.blue,
      counterErrorTextColor: Colors.red,
      counterTextColor: Colors.black,
      errorIconColor: Colors.red,
      errorTextColor: Colors.red,
      inputFocusedColor: Colors.blueGrey,
      topLabelErrorTextColor: Colors.red,
      topLabelDisabledTextColor: Colors.grey,
      topLabelFocusedTextColor: Colors.blue,
      topLabelDefaultColor: Colors.white,
      borderErrorColor: Colors.red,
      borderDisabledColor: Colors.grey,
      borderFocusedColor: Colors.blue,
      borderDefaultColor: Colors.black,
      leadingPrefixColor: Colors.black,
      leadingIconErrorColor: Colors.red,
      leadingIconDisabledColor: Colors.grey,
      leadingIconFocusedColor: Colors.blue,
      leadingIconDefaultColor: Colors.black,
      trailingSuffixColor: Colors.black,
      trailingIconErrorColor: Colors.red,
      trailingIconDisabledColor: Colors.grey,
      trailingIconFocusedColor: Colors.blue,
      trailingIconDefaultColor: Colors.black,
      cursorColor: Colors.black,
      borderRadius: 10.0,
      trackRadius: 5.0,
      inputContainerHeight: 50.0,
      topLabelTextStyle: TextStyle(color: Colors.black),
      inputTextStyle: TextStyle(color: Colors.black),
      errorTextStyle: TextStyle(color: Colors.red),
      counterTextStyle: TextStyle(color: Colors.black),
      validateErrorTextStyle: TextStyle(color: Colors.red),
    );

    final middle = original.lerp(end, 0.5);

    expect(middle.textFieldColor, Color.lerp(original.textFieldColor, end.textFieldColor, 0.5));
    expect(middle.borderColor, Color.lerp(original.borderColor, end.borderColor, 0.5));
    expect(middle.thumbColor, Color.lerp(original.thumbColor, end.thumbColor, 0.5));
    expect(middle.trackColor, Color.lerp(original.trackColor, end.trackColor, 0.5));
    expect(middle.trackBorderColor, Color.lerp(original.trackBorderColor, end.trackBorderColor, 0.5));
    expect(middle.leadingIconColor, Color.lerp(original.leadingIconColor, end.leadingIconColor, 0.5));
    expect(middle.inputDisabledColor, Color.lerp(original.inputDisabledColor, end.inputDisabledColor, 0.5));
    expect(middle.inputDefaultColor, Color.lerp(original.inputDefaultColor, end.inputDefaultColor, 0.5));
    expect(middle.inputFocusedColor, Color.lerp(original.inputFocusedColor, end.inputFocusedColor, 0.5));
    expect(middle.errorBorderColor, Color.lerp(original.errorBorderColor, end.errorBorderColor, 0.5));
    expect(middle.containerColor, Color.lerp(original.containerColor, end.containerColor, 0.5));
    expect(middle.trailingIconColor, Color.lerp(original.trailingIconColor, end.trailingIconColor, 0.5));
    expect(middle.bottomBarErrorColor, Color.lerp(original.bottomBarErrorColor, end.bottomBarErrorColor, 0.5));
    expect(middle.bottomBarColor, Color.lerp(original.bottomBarColor, end.bottomBarColor, 0.5));
    expect(middle.counterErrorTextColor, Color.lerp(original.counterErrorTextColor, end.counterErrorTextColor, 0.5));
    expect(middle.counterTextColor, Color.lerp(original.counterTextColor, end.counterTextColor, 0.5));
    expect(middle.errorIconColor, Color.lerp(original.errorIconColor, end.errorIconColor, 0.5));
    expect(middle.errorTextColor, Color.lerp(original.errorTextColor, end.errorTextColor, 0.5));
    expect(middle.topLabelErrorTextColor, Color.lerp(original.topLabelErrorTextColor, end.topLabelErrorTextColor, 0.5));
    expect(middle.topLabelDisabledTextColor, Color.lerp(original.topLabelDisabledTextColor, end.topLabelDisabledTextColor, 0.5));
    expect(middle.topLabelFocusedTextColor, Color.lerp(original.topLabelFocusedTextColor, end.topLabelFocusedTextColor, 0.5));
    expect(middle.topLabelTextColor, Color.lerp(original.topLabelTextColor, end.topLabelTextColor, 0.5));
    expect(middle.borderErrorColor, Color.lerp(original.borderErrorColor, end.borderErrorColor, 0.5));
    expect(middle.borderDisabledColor, Color.lerp(original.borderDisabledColor, end.borderDisabledColor, 0.5));
    expect(middle.borderFocusedColor, Color.lerp(original.borderFocusedColor, end.borderFocusedColor, 0.5));
    expect(middle.borderDefaultColor, Color.lerp(original.borderDefaultColor, end.borderDefaultColor, 0.5));
    expect(middle.leadingPrefixColor, Color.lerp(original.leadingPrefixColor, end.leadingPrefixColor, 0.5));
    expect(middle.leadingIconErrorColor, Color.lerp(original.leadingIconErrorColor, end.leadingIconErrorColor, 0.5));
    expect(middle.leadingIconDisabledColor, Color.lerp(original.leadingIconDisabledColor, end.leadingIconDisabledColor, 0.5));
    expect(middle.leadingIconFocusedColor, Color.lerp(original.leadingIconFocusedColor, end.leadingIconFocusedColor, 0.5));
    expect(middle.leadingIconDefaultColor, Color.lerp(original.leadingIconDefaultColor, end.leadingIconDefaultColor, 0.5));
    expect(middle.trailingSuffixColor, Color.lerp(original.trailingSuffixColor, end.trailingSuffixColor, 0.5));
    expect(middle.trailingIconErrorColor, Color.lerp(original.trailingIconErrorColor, end.trailingIconErrorColor, 0.5));
    expect(middle.trailingIconDisabledColor, Color.lerp(original.trailingIconDisabledColor, end.trailingIconDisabledColor, 0.5));
    expect(middle.trailingIconFocusedColor, Color.lerp(original.trailingIconFocusedColor, end.trailingIconFocusedColor, 0.5));
    expect(middle.trailingIconDefaultColor, Color.lerp(original.trailingIconDefaultColor, end.trailingIconDefaultColor, 0.5));
    expect(middle.cursorColor, Color.lerp(original.cursorColor, end.cursorColor, 0.5));
    expect(middle.borderRadius, lerpDouble(original.borderRadius, end.borderRadius, 0.5));
    expect(middle.trackRadius, lerpDouble(original.trackRadius, end.trackRadius, 0.5));
    expect(middle.inputContainerHeight, lerpDouble(original.inputContainerHeight, end.inputContainerHeight, 0.5));
    expect(middle.topLabelTextStyle, original.topLabelTextStyle);
    expect(middle.inputTextStyle, original.inputTextStyle);
    expect(middle.errorTextStyle, original.errorTextStyle);
    expect(middle.counterTextStyle, original.counterTextStyle);
    expect(middle.validateErrorTextStyle, original.validateErrorTextStyle);
  });

  group('VInput', () {
    late TextEditingController controller;
    late Widget widget;

    setUp(() {
      controller = TextEditingController();
      widget = VInput(
        myLocalController: controller,
        topLabelText: 'Label',
      );
    });

    testWidgets('Should render VInput widget', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      expect(find.byType(VInput), findsOneWidget);
    });

    testWidgets('Should display top label text', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      expect(find.text('Label'), findsOneWidget);
    });

    testWidgets('Should update text when onChanged is called', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      await tester.enterText(find.byType(TextFormField), 'Hello');

      expect(controller.text, 'Hello');
    });

    testWidgets('Should call onSubmitted when form is submitted', (WidgetTester tester) async {
      String? submittedValue;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: VInput(
            myLocalController: controller,
            onSubmitted: (value) {
              submittedValue = value;
            },
          ),
        ),
      ));

      await tester.enterText(find.byType(TextFormField), 'Hello');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      expect(submittedValue, 'Hello');
    });

    testWidgets('Should show error message when hasError is true', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: VInput(
            myLocalController: controller,
            hasError: true,
            errorText: 'This field is required',
          ),
        ),
      ));

      expect(find.text('This field is required'), findsOneWidget);
    });
  });

  testWidgets('Test for Column widget when widget.textLength is not null', (WidgetTester tester) async {
    var containerLength = 20;
    var textLength = 30;
    var counterTextStyle = TextStyle(color: Colors.black);
    var counterErrorTextColor = Colors.red;
    var counterTextColor = Colors.green;

    await tester.pumpWidget(MaterialApp(
      home: MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  containerLength > textLength ? "-$containerLength/$textLength" : "$containerLength/$textLength",
                  style: counterTextStyle.copyWith(
                    fontWeight: containerLength > textLength ? FontWeight.bold : null,
                    fontSize: 14.0,
                    color: containerLength > textLength ? counterErrorTextColor : counterTextColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));

    // Verify the Column is displayed
    expect(find.byType(Column), findsOneWidget);

    // Verify the text is displayed correctly
    expect(find.text(containerLength > textLength ? "-$containerLength/$textLength" : "$containerLength/$textLength"), findsOneWidget);

    // Verify the correct style is applied
    final Text textWidget = tester.widget(find.text(containerLength > textLength ? "-$containerLength/$textLength" : "$containerLength/$textLength"));
    expect(textWidget.style?.color, containerLength > textLength ? counterErrorTextColor : counterTextColor);
    expect(textWidget.style?.fontWeight, containerLength > textLength ? FontWeight.bold : null);
    expect(textWidget.style?.fontSize, 14.0);
  });

  testWidgets('Test for Padding widget when widget.leadingSvgIcon is not null', (WidgetTester tester) async {
    // var leadingSvgIcon = 'assets/icons/icon.svg';
    var leadingIconColor = Colors.red;

    await tester.pumpWidget(MaterialApp(
      home: MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              left: 8,
            ),
            child: VIcon(
              svgIcon: VIcons.menuLow,
              iconColor: leadingIconColor,
            ),
          ),
        ),
      ),
    ));

    // Verify the Padding is displayed
    expect(find.byType(Padding), findsOneWidget);

    // Verify the VIcon is displayed
    expect(find.byType(VIcon), findsOneWidget);
  });

  testWidgets('Test for VInput widget with isLabelInLine true', (WidgetTester tester) async {
    var topLabelText = 'Label (required)';
    var inlineMessageText = 'Inline message';
    TextEditingController? inLineLabelController;

    // Create a VInput widget with isLabelInLine true
    await tester.pumpWidget(MaterialApp(
      home: MaterialApp(
        home: Scaffold(
          body: VInput(
            topLabelText: topLabelText,
            myLocalController: inLineLabelController,
            isLabelInLine: true,
            inlineMessage: Text(inlineMessageText),
            hasInlineMessage: true,
          ),
        ),
      ),
    ));

    // Verify the top label text is displayed correctly
    expect(find.text(topLabelText), findsOneWidget);

    // Verify the inline message is displayed correctly
    expect(find.text(inlineMessageText), findsOneWidget);
  });

  testWidgets('Test for VInput widget', (WidgetTester tester) async {
    TextEditingController controller = TextEditingController();
    final vInputKey = UniqueKey();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VInput(
          key: vInputKey,
          showScrollbar: true,
          myLocalController: controller,
          topLabelText: "Label (required)",
          maxNumOfLines: 5,
          expand: true,
          textLength: 200,
        ),
      ),
    ));

    // Verify the VInput is displayed
    expect(find.byKey(vInputKey), findsOneWidget);

    // Verify the TextFormField is displayed which is a part of VInput
    expect(find.byType(TextFormField), findsOneWidget);

    // Verify that the topLabelText is displayed correctly
    expect(find.text('Label (required)'), findsOneWidget);

    // Verify the scrollbar is displayed
    expect(find.byType(RawScrollbar), findsOneWidget);
  });

  testWidgets('Test for VInput widget with leading icon', (WidgetTester tester) async {
    TextEditingController controller = TextEditingController();
    final vInputKey = UniqueKey();
    // final vIconKey = UniqueKey();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VInput(
          key: vInputKey,
          myLocalController: controller,
          leadingSvgIcon: VIcons.accountTiny,
          topLabelText: "Label (required)",
          isLeading: true,
        ),
      ),
    ));

    // Verify the VInput is displayed
    expect(find.byKey(vInputKey), findsOneWidget);

    // Verify the TextFormField is displayed which is a part of VInput
    expect(find.byType(TextFormField), findsOneWidget);

    // Verify that the topLabelText is displayed correctly
    expect(find.text('Label (required)'), findsOneWidget);

    // Verify the leading icon is displayed
    expect(find.byType(VIcon), findsOneWidget); // use the key to find the icon
  });

  testWidgets('Test for VInput widget with leading icon in Row', (WidgetTester tester) async {
    TextEditingController controller = TextEditingController();
    final vInputKey = UniqueKey();
    // final vIconKey = UniqueKey();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VInput(
          key: vInputKey,
          isLabelInLine: true,
          myLocalController: controller,
          leadingSvgIcon: VIcons.accountTiny,
          topLabelText: "Label (required)",
          isLeading: true,
        ),
      ),
    ));

    // Verify the VInput is displayed
    expect(find.byKey(vInputKey), findsOneWidget);

    // Verify the TextFormField is displayed which is a part of VInput
    expect(find.byType(TextFormField), findsOneWidget);

    // Verify that the topLabelText is displayed correctly
    expect(find.text('Label (required)'), findsOneWidget);

    // Verify the leading icon is displayed
    expect(find.byType(VIcon), findsOneWidget); // use the key to find the icon
  });

  testWidgets('Test for VInput widget with trailing icon', (WidgetTester tester) async {
    TextEditingController controller = TextEditingController();
    final vInputKey = UniqueKey();
    // final vIconKey = UniqueKey();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VInput(
          key: vInputKey,
          myLocalController: controller,
          trailingSvgIcon: VIcons.accountTiny,
          topLabelText: "Label (required)",
          isTrailing: true,
        ),
      ),
    ));

    // Verify the VInput is displayed
    expect(find.byKey(vInputKey), findsOneWidget);

    // Verify the TextFormField is displayed which is a part of VInput
    expect(find.byType(TextFormField), findsOneWidget);

    // Verify that the topLabelText is displayed correctly
    expect(find.text('Label (required)'), findsOneWidget);

    // Verify the trailing icon is displayed
    expect(find.byType(VIcon), findsOneWidget); // use the key to find the icon
  });

  testWidgets('Test for topLabelTextColor when VInput is enabled', (WidgetTester tester) async {
    TextEditingController controller = TextEditingController();
    final vInputKey = UniqueKey();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VInput(
          key: vInputKey,
          myLocalController: controller,
          topLabelText: "Label (required)",
          isEnabled: false,
        ),
      ),
    ));

    // Verify the VInput is displayed
    expect(find.byKey(vInputKey), findsOneWidget);

    // Verify that the topLabelText is displayed with the correct color when enabled
    final topLabelFinder = find.text('Label (required)');
    final topLabelWidget = tester.widget<Text>(topLabelFinder);
    expect(topLabelWidget.style?.color, equals(VColors.defaultDisabled)); // Replace `Colors.black` with the expected color value
  });

  testWidgets('Test for VInput widget with inline label', (WidgetTester tester) async {
    TextEditingController controller = TextEditingController();
    final vInputKey = UniqueKey();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VInput(
          key: vInputKey,
          showScrollbar: true,
          myLocalController: controller,
          topLabelText: "Label (required)",
          maxNumOfLines: 5,
          expand: true,
          textLength: 200,
          isLabelInLine: true,
        ),
      ),
    ));

    // Verify the VInput is displayed
    expect(find.byKey(vInputKey), findsOneWidget);

    // Verify the TextFormField is displayed which is a part of VInput
    expect(find.byType(TextFormField), findsOneWidget);

    // Verify that the topLabelText is displayed correctly
    expect(find.text('Label (required)'), findsOneWidget);

    // Verify the scrollbar is displayed
    expect(find.byType(RawScrollbar), findsOneWidget);
  });

  testWidgets('Should update the TextEditingController text when text is entered into VInput', (WidgetTester tester) async {
    // Initialize the controller and widget
    TextEditingController controller = TextEditingController();
    Widget widget = MaterialApp(
      home: Scaffold(
        body: VInput(
          myLocalController: controller,
          topLabelText: 'Label',
          isLabelInLine: true,
        ),
      ),
    );

    // Pump the widget into the widget tree
    await tester.pumpWidget(widget);

    // Enter text into the TextFormField
    await tester.enterText(find.byType(TextFormField), 'Hello');

    // Verify that the controller's text was updated
    expect(controller.text, 'Hello');
  });
}
