import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

void main() {
  test('VAccordionStyle copyWith and lerp testing', () {
    // Create an initial style
    var style = const VAccordionStyle(
      headerTextColorDefault: Colors.blue,
      headerOpenColor: Colors.red,
      iconColorDefault: Colors.green,
      headerBorderRadius: 1.0,
      headerTextStyle: TextStyle(color: Colors.yellow),
    );

    // Test copyWith with non-null values
    var copiedStyle = style.copyWith();
    expect(copiedStyle.headerTextColorDefault, Colors.blue);
    expect(
      copiedStyle.headerOpenColor,
      Colors.red,
    );
    expect(
      copiedStyle.iconColorDefault,
      Colors.green,
    );
    expect(copiedStyle.headerBorderRadius, 1.0);
    expect(copiedStyle.headerTextStyle?.color, Colors.yellow);

    // Create another style for lerp testing
    var anotherStyle = const VAccordionStyle(
      headerTextColorDefault: Colors.black,
      headerOpenColor: Colors.white,
      iconColorDefault: Colors.grey,
      headerBorderRadius: 3.0,
      headerTextStyle: TextStyle(color: Colors.teal),
    );

    // Test lerp
    var lerpedStyle = style.lerp(anotherStyle, 0.5);
    expect(lerpedStyle.headerTextColorDefault, Color.lerp(Colors.blue, Colors.black, 0.5));
    expect(lerpedStyle.headerOpenColor, Color.lerp(Colors.red, Colors.white, 0.5));
    expect(lerpedStyle.iconColorDefault, Color.lerp(Colors.green, Colors.grey, 0.5));
    expect(lerpedStyle.headerBorderRadius, 2.0); // Changed to expect the mid-point value
    expect(lerpedStyle.headerTextStyle, isNotNull);
  });

  testWidgets('VAccordion builds correctly in initial state', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: true,
          isSubtle: true,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'), findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });
  testWidgets('VAccordion dark', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: true,
          isSubtle: true,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'), findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });
  testWidgets('VAccordion alt', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: true,
          isSubtle: true,
          vExt: VAlt(),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'), findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });
  testWidgets('VAccordion disabled', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: false,
          isSubtle: true,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'), findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion subtle', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: true,
          isSubtle: false,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'), findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion subtle alt', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: true,
          isSubtle: false,
          vExt: VAlt(),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'), findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion disabled subtle', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: false,
          isSubtle: false,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'), findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion disabled subtle alt', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: false,
          isSubtle: false,
          vExt: VAlt(),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'), findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion subtle disabled', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: false,
          isSubtle: true,
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'), findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion subtle disabled alt', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: false,
          isSubtle: true,
          vExt: VAlt(),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'), findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('VAccordion disabled subtle disabled alt', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: false,
          isSubtle: false,
          vExt: VAlt(),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Body'), findsNothing); // Body should not be visible initially
    expect(find.byType(VAccordion), findsOneWidget);
  });

  testWidgets('Test if the widget and its children are rendered', (WidgetTester tester) async {
    // Build and render your widget.
    await tester.pumpWidget(
      MaterialApp(
        home: VAccordion(
          title: 'Test Title',
          body: Text('Test Body'),
          isEnabled: false,
          isSubtle: false,
          vExt: VAlt(),
        ),
      ),
    );

    expect(find.byType(Container), findsWidgets);
    expect(find.byType(Card), findsWidgets);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(InkWell), findsOneWidget);
  });

  testWidgets('VAccordion should toggle body visibility when tapped', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: 'Test title',
          body: Column(
            children: <Widget>[
              Text('Line 1'),
              Text('Line 2'),
              Text('Line 3'),
            ],
          ),
        ),
      ),
    ));

    // Initially the body should not be visible.
    expect(find.text('Line 1'), findsNothing);
    expect(find.text('Line 2'), findsNothing);
    expect(find.text('Line 3'), findsNothing);

    // Tap the VAccordion to open it.
    await tester.tap(find.text('Test title'));
    await tester.pumpAndSettle();

    // Now the body should be visible.
    expect(find.text('Line 1'), findsOneWidget);
    expect(find.text('Line 2'), findsOneWidget);
    expect(find.text('Line 3'), findsOneWidget);

    // Tap the VAccordion again to close it.
    await tester.tap(find.text('Test title'));
    await tester.pumpAndSettle();

    // The body should not be visible again.
    expect(find.text('Line 1'), findsNothing);
    expect(find.text('Line 2'), findsNothing);
    expect(find.text('Line 3'), findsNothing);
  });

  testWidgets('VAccordion should render title, leading icon and trailing widget correctly', (WidgetTester tester) async {
    final title = 'Test title';
    final leadingSvgIcon = VIcons.cloudTiny; // use your preferred SVG icon
    final trailingWidget = Icon(Icons.more_vert); // replace with your actual trailing widget
    final body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          leadingSvgIcon: leadingSvgIcon,
          trailing: trailingWidget,
          body: body,
        ),
      ),
    ));

    // Check that the title, leading icon, and trailing widget are rendered.
    expect(find.text(title), findsOneWidget);
    expect(find.byType(VIcon), findsWidgets); // Check that VIcon is present
    expect(find.byIcon(Icons.more_vert), findsOneWidget);
  });

  testWidgets('VAccordion should render title correctly', (WidgetTester tester) async {
    final title = 'Test title';
    final leadingSvgIcon = VIcons.cloudTiny; // use your preferred SVG icon
    final trailingWidget = Icon(Icons.more_vert); // replace with your actual trailing widget
    final body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          leadingSvgIcon: leadingSvgIcon,
          trailing: trailingWidget,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check that the title is within an Expanded widget.
    final Finder expandedFinder = find.byType(Expanded);
    final Finder textFinder = find.text(title);
    final Finder expandedTextFinder = find.descendant(of: expandedFinder, matching: textFinder);
    expect(expandedTextFinder, findsOneWidget);
  });

  testWidgets('VAccordion should render title text with correct style', (WidgetTester tester) async {
    final title = 'Test title';
    final isSubtle = false; // change this as per your test requirement
    final leadingSvgIcon = VIcons.cloudTiny; // use your preferred SVG icon
    final trailingWidget = Icon(Icons.more_vert); // replace with your actual trailing widget
    final body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          leadingSvgIcon: leadingSvgIcon,
          trailing: trailingWidget,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final TextStyle? textStyle = textWidget.style;

    // Add your asserts for non-subtle style here
    expect(textStyle?.color, VColors.defaultText);
    // Add more assertions as needed
  });

  testWidgets('VAccordion should render title text with correct color', (WidgetTester tester) async {
    final title = 'Test title';
    final isSubtle = false; // change this as per your test requirement
    final leadingSvgIcon = VIcons.cloudTiny; // use your preferred SVG icon
    final trailingWidget = Icon(Icons.more_vert); // replace with your actual trailing widget
    final body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          leadingSvgIcon: leadingSvgIcon,
          trailing: trailingWidget,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle color of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final Color? textStyleColor = textWidget.style?.color;

    // Check color of headerBoldTextStyleBold or bodyTextStyle
    final Color expectedColor = VColors.defaultText;
    expect(textStyleColor, expectedColor);
  });

  testWidgets('VAccordion should render title text with correct font size', (WidgetTester tester) async {
    final title = 'Test title';
    final isSubtle = false; // change this as per your test requirement
    final leadingSvgIcon = VIcons.cloudTiny; // use your preferred SVG icon
    final trailingWidget = Icon(Icons.more_vert); // replace with your actual trailing widget
    final body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          leadingSvgIcon: leadingSvgIcon,
          trailing: trailingWidget,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle fontSize of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final double? textStyleFontSize = textWidget.style?.fontSize;

    // Check fontSize of headerBoldTextStyleBold or bodyTextStyle
    final double expectedFontSize = 16.0;
    expect(textStyleFontSize, expectedFontSize);
  });

  testWidgets('VAccordion should render title text with correct style', (WidgetTester tester) async {
    final title = 'Test Title';
    final isSubtle = false;
    final body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final TextStyle? textStyle = textWidget.style;

    // Add your asserts for non-subtle style here

    expect(textStyle?.color, VColors.defaultText);
    // Add more assertions as needed
  });

  testWidgets('VAccordion should render title text with correct color', (WidgetTester tester) async {
    final title = 'Test Title';
    final isSubtle = false;
    final body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle color of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final Color? textStyleColor = textWidget.style?.color;

    // Check color of headerBoldTextStyleBold or bodyTextStyle
    final Color expectedColor = VColors.defaultText;
    expect(textStyleColor, expectedColor);
  });

  testWidgets('VAccordion should render title text with correct color', (WidgetTester tester) async {
    final title = 'Test Title';
    final isSubtle = true;
    final body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle color of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final Color? textStyleColor = textWidget.style?.color;

    // Check color of headerBoldTextStyleBold or bodyTextStyle
    final Color expectedColor = VColors.defaultActive;
    expect(textStyleColor, expectedColor);
  });

  testWidgets('VAccordion should render title text with correct color when isSubtle is false and isEnabled is false', (WidgetTester tester) async {
    final title = 'Test Title';
    final isSubtle = false;
    final isEnabled = false;
    final body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          isEnabled: isEnabled,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle color of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final Color? textStyleColor = textWidget.style?.color;

    // Check the color when the widget is disabled and not subtle
    final Color expectedColor = VColors.defaultDisabled;
    expect(textStyleColor, expectedColor);
  });

  testWidgets('VAccordion should render title text with correct color when isSubtle is true and isDown is true', (WidgetTester tester) async {
    final title = 'Test Title';
    final isSubtle = true;
    final isEnabled = true; // Assuming that the widget must be enabled for isDown to be true
    final body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          isEnabled: isEnabled,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Simulate pressing down on the widget and then releasing it
    await tester.press(find.text(title));
    await tester.pump();

    // Check the TextStyle color of the Text widget
    final Text textWidgetAfterPress = tester.widget<Text>(find.text(title));
    final Color? textStyleColorAfterPress = textWidgetAfterPress.style?.color;

    // Check the color when the widget is subtle and pressed down
    final Color expectedColorAfterPress = VColors.defaultActivePressed;
    expect(textStyleColorAfterPress, expectedColorAfterPress);

    await tester.press(find.text(title));

    // Check the TextStyle color of the Text widget after release
    final Text textWidgetAfterRelease = tester.widget<Text>(find.text(title));
    final Color? textStyleColorAfterRelease = textWidgetAfterRelease.style?.color;

    // Add your expected color after release
    final Color expectedColorAfterRelease = VColors.defaultActivePressed; // Replace with your actual color
    expect(textStyleColorAfterRelease, expectedColorAfterRelease);
  });

  testWidgets('VAccordion should render title text with correct color when isSubtle is true and isDown is true', (WidgetTester tester) async {
    final title = 'Test Title';
    final isSubtle = true;
    final isEnabled = true; // Assuming that the widget must be enabled for isDown to be true
    final body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          isEnabled: isEnabled,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Simulate pressing down on the widget
    await tester.press(find.text(title));
    await tester.pump();

    // Check the TextStyle color of the Text widget
    final Text textWidgetAfterPress = tester.widget<Text>(find.text(title));
    final Color? textStyleColorAfterPress = textWidgetAfterPress.style?.color;

    // Check the color when the widget is subtle and pressed down
    final Color expectedColorAfterPress = VColors.defaultActivePressed;
    expect(textStyleColorAfterPress, expectedColorAfterPress);
  });

  testWidgets('VAccordion should render title text with correct color when isSubtle is true and isEnabled is false', (WidgetTester tester) async {
    final title = 'Test Title';
    final isSubtle = true;
    final isEnabled = false;
    final body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          isEnabled: isEnabled,
          body: body,
        ),
      ),
    ));

    // Check that the title is rendered.
    expect(find.text(title), findsOneWidget);

    // Check the TextStyle color of the Text widget
    final Text textWidget = tester.widget<Text>(find.text(title));
    final Color? textStyleColor = textWidget.style?.color;

    // Check the color when the widget is subtle and disabled
    final Color expectedColor = VColors.defaultDisabled;
    expect(textStyleColor, expectedColor);
  });

  testWidgets('VAccordion should render icon with correct color when isDown is true', (WidgetTester tester) async {
    final title = 'Test Title';
    final isEnabled = true; // Assuming that the widget must be enabled for isDown to be true
    final isSubtle = false; // Assuming that you want to test when isSubtle is false
    final body = Column(
      children: <Widget>[
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAccordion(
          title: title,
          isSubtle: isSubtle,
          isEnabled: isEnabled,
          body: body,
        ),
      ),
    ));

    // Simulate pressing down on the widget
    await tester.press(find.byType(VAccordion));
    await tester.pump();

    // Check the icon color
    final VIcon iconWidget = tester.widget<VIcon>(find.byType(VIcon));
    final Color? iconColor = iconWidget.iconColor;

    // Check the color when the widget is pressed down
    final Color expectedColor = VColors.defaultActive; // Replace with your actual color
    expect(iconColor, expectedColor);
  });
}
