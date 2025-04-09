import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'dart:ui';

void main() {
  // ! This is Button unit test
  testWidgets("Button theme testing", (WidgetTester tester) async {
    // Button theme
    var theme = VButtonStyle(
      backgroundColorActive: VColors.defaultActive,
      backgroundColorDisabled: VColors.defaultDisabled,
      foregroundColorActive: VColors.defaultSurface1,
      foregroundColorDisabled: VColors.defaultDisabled,
      overlayColorFocused: VColors.defaultSurfaceLowlight,
      overlayColorPressed: VColors.defaultActivePressed,
      shadowColor: VColors.transparent,
      elevation: 0.0,
      minimumSize: const Size(0, 46),
      borderRadiusActive: 8.0,
      borderRadiusDisabled: 8.0,
      borderSideActive: BorderSide.none,
      borderSideDisabled: BorderSide.none,
      padding: const EdgeInsets.all(8.0),
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VButton(
              onPressed: () {},
              style: VButtonStyle(
                backgroundColorActive: theme.backgroundColorActive,
                backgroundColorDisabled: theme.backgroundColorDisabled,
                foregroundColorActive: theme.foregroundColorActive,
                foregroundColorDisabled: theme.foregroundColorDisabled,
                overlayColorFocused: theme.overlayColorFocused,
                overlayColorPressed: theme.overlayColorPressed,
                shadowColor: theme.shadowColor,
                elevation: theme.elevation,
                minimumSize: theme.minimumSize,
                borderRadiusActive: theme.borderRadiusActive,
                borderRadiusDisabled: theme.borderRadiusDisabled,
                borderSideActive: theme.borderSideActive,
                borderSideDisabled: theme.borderSideDisabled,
                padding: theme.padding,
              ),
              child: const Text("Button Test"),
            ),
          ),
        ),
      ),
    );

    // Find my widget
    final widgetFinder = find.byType(VButton);

    // Expect my widget uses the theme's color
    VButton button = tester.widget(widgetFinder);
    expect(button.style?.backgroundColorActive, theme.backgroundColorActive);
    expect(
        button.style?.backgroundColorDisabled, theme.backgroundColorDisabled);
    expect(button.style?.foregroundColorActive, theme.foregroundColorActive);
    expect(
        button.style?.foregroundColorDisabled, theme.foregroundColorDisabled);
    expect(button.style?.overlayColorFocused, theme.overlayColorFocused);
    expect(button.style?.overlayColorPressed, theme.overlayColorPressed);
    expect(button.style?.shadowColor, theme.shadowColor);
    expect(button.style?.elevation, theme.elevation);
    expect(button.style?.minimumSize, theme.minimumSize);
    expect(button.style?.borderRadiusActive, theme.borderRadiusActive);
    expect(button.style?.borderRadiusDisabled, theme.borderRadiusDisabled);
    expect(button.style?.borderSideActive, theme.borderSideActive);
    expect(button.style?.borderSideDisabled, theme.borderSideDisabled);
    expect(button.style?.padding, theme.padding);
  });

  //! This is Button golden test

  testWidgets('Button golden(snapshot) testing', (WidgetTester tester) async {
    // Build widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: RepaintBoundary(
          child: Center(
            child: SizedBox(
              width: 230,
              height: 48,
              child: VButton(
                child: const Text("Button Test"),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );

    // Take a snapshot of the widget.
    await expectLater(
      find.byType(VButton),
      matchesGoldenFile('goldens/button.png'),
    );
  });

  test('VButtonStyle copyWith method', () {
    const original = VButtonStyle(
      backgroundColorDisabled: Colors.red,
      backgroundColorActive: Colors.blue,
      foregroundColorDisabled: Colors.yellow,
      foregroundColorActive: Colors.green,
      overlayColorPressed: Colors.orange,
      overlayColorFocused: Colors.purple,
      shadowColor: Colors.brown,
      elevation: 1.0,
      borderRadiusActive: 2.0,
      borderRadiusDisabled: 3.0,
      minimumSize: Size(10, 20),
      borderSideActive: BorderSide(color: Colors.cyan),
      borderSideDisabled: BorderSide(color: Colors.indigo),
      padding: EdgeInsets.all(8.0),
    );

    final copied = original.copyWith();

    expect(copied.backgroundColorDisabled, original.backgroundColorDisabled);
    expect(copied.backgroundColorActive, original.backgroundColorActive);
    expect(copied.foregroundColorDisabled, original.foregroundColorDisabled);
    expect(copied.foregroundColorActive, original.foregroundColorActive);
    expect(copied.overlayColorPressed, original.overlayColorPressed);
    expect(copied.overlayColorFocused, original.overlayColorFocused);
    expect(copied.shadowColor, original.shadowColor);
    expect(copied.elevation, original.elevation);
    expect(copied.borderRadiusActive, original.borderRadiusActive);
    expect(copied.borderRadiusDisabled, original.borderRadiusDisabled);
    expect(copied.minimumSize, original.minimumSize);
    expect(copied.borderSideActive, original.borderSideActive);
    expect(copied.borderSideDisabled, original.borderSideDisabled);
    expect(copied.padding, original.padding);
  });

  test('VButtonStyle lerp method', () {
    const style1 = VButtonStyle(
      backgroundColorDisabled: Colors.red,
      backgroundColorActive: Colors.blue,
      foregroundColorDisabled: Colors.yellow,
      foregroundColorActive: Colors.green,
      overlayColorPressed: Colors.orange,
      overlayColorFocused: Colors.purple,
      shadowColor: Colors.brown,
      elevation: 1.0,
      borderRadiusActive: 2.0,
      borderRadiusDisabled: 3.0,
      minimumSize: Size(10, 20),
      borderSideActive: BorderSide(color: Colors.cyan, width: 1.0),
      borderSideDisabled: BorderSide(color: Colors.indigo, width: 2.0),
      padding: EdgeInsets.all(8.0),
    );

    const style2 = VButtonStyle(
      backgroundColorDisabled: Colors.green,
      backgroundColorActive: Colors.yellow,
      foregroundColorDisabled: Colors.blue,
      foregroundColorActive: Colors.red,
      overlayColorPressed: Colors.purple,
      overlayColorFocused: Colors.orange,
      shadowColor: Colors.grey,
      elevation: 2.0,
      borderRadiusActive: 3.0,
      borderRadiusDisabled: 4.0,
      minimumSize: Size(30, 40),
      borderSideActive: BorderSide(color: Colors.deepPurple, width: 3.0),
      borderSideDisabled: BorderSide(color: Colors.deepOrange, width: 4.0),
      padding: EdgeInsets.all(10.0),
    );

    final lerped = style1.lerp(style2, 0.5);

    expect(lerped.backgroundColorDisabled,
        Color.lerp(Colors.red, Colors.green, 0.5));
    expect(lerped.backgroundColorActive,
        Color.lerp(Colors.blue, Colors.yellow, 0.5));
    expect(lerped.foregroundColorDisabled,
        Color.lerp(Colors.yellow, Colors.blue, 0.5));
    expect(lerped.foregroundColorActive,
        Color.lerp(Colors.green, Colors.red, 0.5));
    expect(lerped.overlayColorPressed,
        Color.lerp(Colors.orange, Colors.purple, 0.5));
    expect(lerped.overlayColorFocused,
        Color.lerp(Colors.purple, Colors.orange, 0.5));
    expect(lerped.shadowColor, Color.lerp(Colors.brown, Colors.grey, 0.5));
    expect(lerped.elevation, lerpDouble(1.0, 2.0, 0.5));
    expect(lerped.borderRadiusActive, lerpDouble(2.0, 3.0, 0.5));
    expect(lerped.borderRadiusDisabled, lerpDouble(3.0, 4.0, 0.5));
    expect(lerped.minimumSize, style1.minimumSize ?? style2.minimumSize);
    expect(lerped.borderSideActive,
        style1.borderSideActive ?? style2.borderSideActive);
    expect(lerped.borderSideDisabled,
        style1.borderSideDisabled ?? style2.borderSideDisabled);
    expect(lerped.padding, style1.padding ?? style2.padding);
  });

  testWidgets('VButton build method with non-VDef',
      (WidgetTester tester) async {
    // Build the VButton widget with a non-VDef value for vExt
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VButton(
          style: const VButtonStyle(
              backgroundColorActive: VColors.alternateActive),
          onPressed: () {},
          vExt: VAlt(),
          child: const Text('Button'),
        ),
      ),
    ));

    // Verify that the alternate color scheme was applied
    final button = tester.widget<VButton>(find.byType(VButton));
    expect(button.style?.backgroundColorActive, getAltColorScheme().active);
  });

  testWidgets(
      'VButton applies defaultColorSchemeDark when theme brightness is dark and vExt is VDef',
      (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is VDef
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: VButton(
          style: const VButtonStyle(
              backgroundColorActive: VColors.defaultActiveDark),
          onPressed: () {},
          vExt: VDef(),
          child: const Text('Button'),
        ),
      ),
    ));

    // Check if defaultColorSchemeDark is applied
    final buttonDark = tester.widget<VButton>(find.byType(VButton));
    expect(buttonDark.style?.backgroundColorActive,
        equals(getDefaultColorSchemeDark().active));
  });

  testWidgets(
      'VButton applies altColorSchemeDark when theme brightness is dark and vExt is not VDef',
      (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is not VDef
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: VButton(
          style: const VButtonStyle(
              backgroundColorActive: VColors.alternateActiveDark),
          onPressed: () {},
          vExt: VAlt(),
          child: const Text('Button'),
        ),
      ),
    ));

    // Check if altColorSchemeDark is applied
    final buttonAltDark = tester.widget<VButton>(find.byType(VButton));
    expect(buttonAltDark.style?.backgroundColorActive,
        equals(getAltColorSchemeDark().active));
  });

  testWidgets('VButton overlay color changes based on state',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VButton(
          onPressed: () {},
          style: const VButtonStyle(
            overlayColorPressed: Colors.red,
            overlayColorFocused: Colors.blue,
          ),
          child: const Text('Button'),
        ),
      ),
    ));

    final buttonFinder = find.byType(ElevatedButton);
    final button = tester.widget<ElevatedButton>(buttonFinder);

    // Check initial color (no state)
    expect(button.style?.overlayColor?.resolve({}), null);

    // Check color when button is pressed
    expect(button.style?.overlayColor?.resolve({MaterialState.pressed}),
        Colors.red);

    // Check color when button is focused
    expect(button.style?.overlayColor?.resolve({MaterialState.focused}),
        Colors.blue);
  });

  testWidgets('VIconButton properties test', (WidgetTester tester) async {
    // Build the VIconButton widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VIconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
          style: const VButtonStyle(
            backgroundColorActive: Colors.red,
            backgroundColorDisabled: Colors.grey,
            foregroundColorActive: Colors.white,
            foregroundColorDisabled: Colors.black,
            overlayColorPressed: Colors.blue,
            overlayColorFocused: Colors.green,
            shadowColor: Colors.yellow,
            elevation: 5,
            minimumSize: Size(50, 50),
            borderSideActive: BorderSide(color: Colors.orange, width: 2),
            borderSideDisabled: BorderSide(color: Colors.purple, width: 2),
            padding: EdgeInsets.all(10),
          ),
          vExt: VAlt(),
        ),
      ),
    ));

    final buttonFinder = find.byType(ElevatedButton);
    final button = tester.widget<ElevatedButton>(buttonFinder);

    // Check properties
    expect(button.style?.backgroundColor?.resolve({MaterialState.disabled}),
        Colors.grey);
    expect(button.style?.backgroundColor?.resolve({}), Colors.red);
    expect(button.style?.foregroundColor?.resolve({MaterialState.disabled}),
        Colors.black);
    expect(button.style?.foregroundColor?.resolve({}), Colors.white);
    expect(button.style?.overlayColor?.resolve({MaterialState.pressed}),
        Colors.blue);
    expect(button.style?.overlayColor?.resolve({MaterialState.focused}),
        Colors.green);
    expect(button.style?.shadowColor?.resolve({}), Colors.yellow);
    expect(button.style?.elevation?.resolve({}), 5);
    expect(button.style?.minimumSize?.resolve({}), const Size(50, 50));
    expect(
        button.style?.shape?.resolve({MaterialState.disabled}),
        isA<CircleBorder>().having((b) => b.side, 'side',
            const BorderSide(color: Colors.purple, width: 2)));
    expect(
        button.style?.shape?.resolve({}),
        isA<CircleBorder>().having((b) => b.side, 'side',
            const BorderSide(color: Colors.orange, width: 2)));
    expect(button.style?.padding?.resolve({}), const EdgeInsets.all(10));
  });

  testWidgets('VIconButton uses default border sides when not provided',
      (WidgetTester tester) async {
    // Build the VIconButton widget without providing borderSideActive and borderSideDisabled
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VIconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
          style: const VButtonStyle(
              // Other properties...
              ),
        ),
      ),
    ));

    final buttonFinder = find.byType(ElevatedButton);
    final button = tester.widget<ElevatedButton>(buttonFinder);

    // Check if borderSideActive and borderSideDisabled are BorderSide.none
    expect(button.style?.shape?.resolve({}),
        isA<CircleBorder>().having((b) => b.side, 'side', BorderSide.none));
    expect(button.style?.shape?.resolve({MaterialState.disabled}),
        isA<CircleBorder>().having((b) => b.side, 'side', BorderSide.none));
  });
}
