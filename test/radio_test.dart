import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

enum Options { option1, option2 }

void main() {
  // ! This is Radio unit test
  Options? options;
  testWidgets("Radio theme testing", (WidgetTester tester) async {
    // Radio theme
    var theme = VRadioStyle(
        fillColor: VColors.defaultActive,
        fillColorDisabled: VColors.disabled,
        fillColorPressed: VColors.defaultActivePressed,
        overlayColor: VColors.defaultSurfaceLowlight,
        titleTextColor: VColors.defaultText,
        titleTextColorDisabled: VColors.defaultDisabled,
        subtitleTextColor: VColors.defaultTextSubtle,
        subtitleTextColorDisabled: VColors.defaultDisabled);

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Material(
              child: VRadio(
                onChanged: null,
                groupValue: options,
                value: Options.option1,
                title: "Radio title testing",
                subtitle: "Radio subtitle testing",
                style: VRadioStyle(
                  fillColor: theme.fillColor,
                  fillColorDisabled: theme.fillColorDisabled,
                  fillColorPressed: theme.fillColorPressed,
                  overlayColor: theme.overlayColor,
                  titleTextColor: theme.titleTextColor,
                  titleTextColorDisabled: theme.titleTextColorDisabled,
                  subtitleTextColor: theme.subtitleTextColor,
                  subtitleTextColorDisabled: theme.subtitleTextColorDisabled,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Find my widget
    final widgetFinder = find.byType(VRadio);

    // Expect my widget uses the theme's color
    VRadio radio = tester.widget(widgetFinder);
    expect(radio.style?.fillColor, theme.fillColor);
    expect(radio.style?.fillColorDisabled, theme.fillColorDisabled);
    expect(radio.style?.fillColorPressed, theme.fillColorPressed);
    expect(radio.style?.overlayColor, theme.overlayColor);
    expect(radio.style?.titleTextColor, theme.titleTextColor);
    expect(radio.style?.titleTextColorDisabled, theme.titleTextColorDisabled);
    expect(radio.style?.subtitleTextColor, theme.subtitleTextColor);
    expect(radio.style?.subtitleTextColorDisabled,
        theme.subtitleTextColorDisabled);
    expect(radio.title, "Radio title testing");
    expect(radio.subtitle, "Radio subtitle testing");
  });

  //! This is Radio golden test

  testWidgets('Radio golden(snapshot) testing', (WidgetTester tester) async {
    Options? options;
    // Build widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: RepaintBoundary(
          child: Center(
            child: SizedBox(
              width: 420,
              height: 220,
              child: Material(
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 5),
                          child: Text('Choose shipping speed',
                              style: defaultVTheme.textStyles.uiLabel),
                        ),
                        VRadio<Options>(
                          title: "One-day shipping",
                          subtitle: "Shipping speed in days",
                          value: Options.option1,
                          groupValue: options,
                          onChanged: (Options? value) {
                            setState(() {
                              options = value;
                            });
                          },
                        ),
                        VRadio<Options>(
                          title: "Two-day shipping",
                          subtitle: "Shipping speed in days",
                          value: Options.option2,
                          groupValue: options,
                          onChanged: (Options? value) {
                            setState(() {
                              options = value;
                            });
                          },
                        ),
                        const VRadio(
                          title: "In-store pickup",
                          value: Options.option1,
                          groupValue: null,
                          onChanged: null,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Take a snapshot of the widget.
    await expectLater(
      find.byType(VRadio),
      matchesGoldenFile('goldens/radio.png'),
    );
  });

  test('VRadioStyle copyWith method test', () {
    const style = VRadioStyle(
      fillColor: Colors.blue,
      fillColorPressed: Colors.red,
      fillColorDisabled: Colors.green,
      titleTextColor: Colors.yellow,
      titleTextColorDisabled: Colors.orange,
      subtitleTextColor: Colors.purple,
      subtitleTextColorDisabled: Colors.brown,
      overlayColor: Colors.grey,
    );

    final newStyle = style.copyWith();

    expect(newStyle.fillColor, Colors.blue);
    expect(newStyle.fillColorPressed, Colors.red);
    expect(newStyle.fillColorDisabled, Colors.green);
    expect(newStyle.titleTextColor, Colors.yellow);
    expect(newStyle.titleTextColorDisabled, Colors.orange);
    expect(newStyle.subtitleTextColor, Colors.purple);
    expect(newStyle.subtitleTextColorDisabled, Colors.brown);
    expect(newStyle.overlayColor, Colors.grey);
  });

  test('VRadioStyle lerp method test', () {
    const style1 = VRadioStyle(
      fillColor: Colors.blue,
      fillColorPressed: Colors.red,
      fillColorDisabled: Colors.green,
      titleTextColor: Colors.yellow,
      titleTextColorDisabled: Colors.orange,
      subtitleTextColor: Colors.purple,
      subtitleTextColorDisabled: Colors.brown,
      overlayColor: Colors.grey,
    );

    const style2 = VRadioStyle(
      fillColor: Colors.white,
      fillColorPressed: Colors.black,
      fillColorDisabled: Colors.pink,
      titleTextColor: Colors.cyan,
      titleTextColorDisabled: Colors.lime,
      subtitleTextColor: Colors.indigo,
      subtitleTextColorDisabled: Colors.teal,
      overlayColor: Colors.amber,
    );

    final lerpStyle = style1.lerp(style2, 0.5);

    expect(lerpStyle.fillColor, Color.lerp(Colors.blue, Colors.white, 0.5));
    expect(
        lerpStyle.fillColorPressed, Color.lerp(Colors.red, Colors.black, 0.5));
    expect(lerpStyle.fillColorDisabled,
        Color.lerp(Colors.green, Colors.pink, 0.5));
    expect(
        lerpStyle.titleTextColor, Color.lerp(Colors.yellow, Colors.cyan, 0.5));
    expect(lerpStyle.titleTextColorDisabled,
        Color.lerp(Colors.orange, Colors.lime, 0.5));
    expect(lerpStyle.subtitleTextColor,
        Color.lerp(Colors.purple, Colors.indigo, 0.5));
    expect(lerpStyle.subtitleTextColorDisabled,
        Color.lerp(Colors.brown, Colors.teal, 0.5));
    expect(lerpStyle.overlayColor, Color.lerp(Colors.grey, Colors.amber, 0.5));
  });

  testWidgets("Radio alt testing", (WidgetTester tester) async {
    // Radio theme
    var theme = VRadioStyle(
        fillColor: VColors.defaultActive,
        fillColorDisabled: VColors.disabled,
        fillColorPressed: VColors.defaultActivePressed,
        overlayColor: VColors.defaultSurfaceLowlight,
        titleTextColor: VColors.defaultText,
        titleTextColorDisabled: VColors.defaultDisabled,
        subtitleTextColor: VColors.defaultTextSubtle,
        subtitleTextColorDisabled: VColors.defaultDisabled);

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Material(
              child: VRadio(
                vExt: VAlt(),
                onChanged: null,
                groupValue: options,
                value: Options.option1,
                title: "Radio title testing",
                subtitle: "Radio subtitle testing",
                style: VRadioStyle(
                  fillColor: theme.fillColor,
                  fillColorDisabled: theme.fillColorDisabled,
                  fillColorPressed: theme.fillColorPressed,
                  overlayColor: theme.overlayColor,
                  titleTextColor: theme.titleTextColor,
                  titleTextColorDisabled: theme.titleTextColorDisabled,
                  subtitleTextColor: theme.subtitleTextColor,
                  subtitleTextColorDisabled: theme.subtitleTextColorDisabled,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(VRadio), findsNWidgets(1));
  });

  testWidgets("Radio dark testing", (WidgetTester tester) async {
    // Radio theme
    var theme = VRadioStyle(
        fillColor: VColors.defaultActive,
        fillColorDisabled: VColors.disabled,
        fillColorPressed: VColors.defaultActivePressed,
        overlayColor: VColors.defaultSurfaceLowlight,
        titleTextColor: VColors.defaultText,
        titleTextColorDisabled: VColors.defaultDisabled,
        subtitleTextColor: VColors.defaultTextSubtle,
        subtitleTextColorDisabled: VColors.defaultDisabled);

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: Center(
            child: Material(
              child: VRadio(
                onChanged: null,
                groupValue: options,
                value: Options.option1,
                title: "Radio title testing",
                subtitle: "Radio subtitle testing",
                style: VRadioStyle(
                  fillColor: theme.fillColor,
                  fillColorDisabled: theme.fillColorDisabled,
                  fillColorPressed: theme.fillColorPressed,
                  overlayColor: theme.overlayColor,
                  titleTextColor: theme.titleTextColor,
                  titleTextColorDisabled: theme.titleTextColorDisabled,
                  subtitleTextColor: theme.subtitleTextColor,
                  subtitleTextColorDisabled: theme.subtitleTextColorDisabled,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(VRadio), findsNWidgets(1));
  });

  testWidgets("Radio dark alt testing", (WidgetTester tester) async {
    // Radio theme
    var theme = VRadioStyle(
        fillColor: VColors.defaultActive,
        fillColorDisabled: VColors.disabled,
        fillColorPressed: VColors.defaultActivePressed,
        overlayColor: VColors.defaultSurfaceLowlight,
        titleTextColor: VColors.defaultText,
        titleTextColorDisabled: VColors.defaultDisabled,
        subtitleTextColor: VColors.defaultTextSubtle,
        subtitleTextColorDisabled: VColors.defaultDisabled);

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: Scaffold(
          body: Center(
            child: Material(
              child: VRadio(
                vExt: VAlt(),
                onChanged: null,
                groupValue: options,
                value: Options.option1,
                title: "Radio title testing",
                subtitle: "Radio subtitle testing",
                style: VRadioStyle(
                  fillColor: theme.fillColor,
                  fillColorDisabled: theme.fillColorDisabled,
                  fillColorPressed: theme.fillColorPressed,
                  overlayColor: theme.overlayColor,
                  titleTextColor: theme.titleTextColor,
                  titleTextColorDisabled: theme.titleTextColorDisabled,
                  subtitleTextColor: theme.subtitleTextColor,
                  subtitleTextColorDisabled: theme.subtitleTextColorDisabled,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(VRadio), findsNWidgets(1));
  });
}
