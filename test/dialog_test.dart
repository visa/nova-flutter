import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  // ! This is Dialog unit test
  testWidgets("Dialog theme testing", (WidgetTester tester) async {
    // Dialog theme
    const theme = VDialogStyle(
      successHLColor: VColors.positiveGraphics,
      successIconColor: VColors.positiveText,
    );

    // Build our app with the theme
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VDialogContent(
              title: "Dialog test",
              description: "Dialog test",
              style: VDialogStyle(
                successHLColor: theme.successHLColor,
                successIconColor: theme.successIconColor,
              ),
            ),
          ),
        ),
      ),
    );

    // Find my widget
    final widgetFinder = find.byType(VDialogContent);

    // Expect my widget uses the theme's color
    VDialogContent dialog = tester.widget(widgetFinder);
    expect(dialog.style?.successHLColor, theme.successHLColor);
    expect(dialog.style?.successIconColor, theme.successIconColor);
  });

  //! Dialog Golden Test
  testWidgets('Dialog popup screenshot testing', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      child: VDialogContent(
        hasX: true,
        dialogState: DialogState.normal,
        title: "You have unsaved changes",
        description:
            "Quitting without saving will cause you to lose unsaved changes.",
        dialogAction: () {},
        actionText: "Save and quit",
        dismissText: "Cancel",
      ),
    )));
    await expectLater(
      find.byType(Dialog),
      matchesGoldenFile('goldens/dialog.png'),
    );
  });

  test('VDialogStyle copyWith and lerp', () {
    const style1 = VDialogStyle(
      normalColor: Colors.red,
      warningIconColor: Colors.orange,
      warningHLColor: Colors.yellow,
      errorIconColor: Colors.green,
      errorHLColor: Colors.blue,
      successIconColor: Colors.indigo,
      successHLColor: Colors.black,
    );

    const style2 = VDialogStyle(
      normalColor: Colors.cyan,
      warningIconColor: Colors.teal,
      warningHLColor: Colors.lime,
      errorIconColor: Colors.amber,
      errorHLColor: Colors.brown,
      successIconColor: Colors.grey,
      successHLColor: Colors.purple,
    );

    // Test copyWith
    final copiedStyle = style1.copyWith();

    expect(copiedStyle.normalColor, Colors.red);
    expect(copiedStyle.warningIconColor, Colors.orange);
    expect(copiedStyle.warningHLColor, Colors.yellow);
    expect(copiedStyle.errorIconColor, Colors.green);
    expect(copiedStyle.errorHLColor, Colors.blue);
    expect(copiedStyle.successIconColor, Colors.indigo);
    expect(copiedStyle.successHLColor, Colors.black);

    // Test lerp
    final lerpedStyle = style1.lerp(style2, 0.5);

    expect(lerpedStyle.normalColor, Color.lerp(Colors.red, Colors.cyan, 0.5));
    expect(lerpedStyle.warningIconColor,
        Color.lerp(Colors.orange, Colors.teal, 0.5));
    expect(lerpedStyle.warningHLColor,
        Color.lerp(Colors.yellow, Colors.lime, 0.5));
    expect(lerpedStyle.errorIconColor,
        Color.lerp(Colors.green, Colors.amber, 0.5));
    expect(
        lerpedStyle.errorHLColor, Color.lerp(Colors.blue, Colors.brown, 0.5));
    expect(lerpedStyle.successIconColor,
        Color.lerp(Colors.indigo, Colors.grey, 0.5));
    expect(lerpedStyle.successHLColor,
        Color.lerp(Colors.black, Colors.purple, 0.5));
  });

  testWidgets(
      "VDialogContent should have correct border color for each DialogState",
      (WidgetTester tester) async {
    const normalColor = Colors.grey;
    const warningColor = Colors.yellow;
    const errorColor = Colors.red;
    const successColor = Colors.green;

    const VDialogStyle style = VDialogStyle(
      normalColor: normalColor,
      warningHLColor: warningColor,
      errorHLColor: errorColor,
      successHLColor: successColor,
    );

    final Map<DialogState, Color> stateToColor = {
      DialogState.normal: normalColor,
      DialogState.warning: warningColor,
      DialogState.error: errorColor,
      DialogState.success: successColor,
    };

    for (var entry in stateToColor.entries) {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: VDialogContent(
                title: "Dialog Title",
                description: "Dialog Description",
                dialogState: entry.key,
                style: style,
                dialogAction: () {},
              ),
            ),
          ),
        ),
      );

      final containerFinder = find.byType(Container);
      final Container container = tester.widget(containerFinder);
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      final Border border = decoration.border as Border;

      expect(border.bottom.color, entry.value);
    }
  });

  testWidgets("VDialogContent should pop dialog when dismiss button is pressed",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: VDialogContent(
              title: "Dialog Title",
              description: "Dialog Description",
              dialogState: DialogState.normal,
              dismissText: "Dismiss",
              dialogAction: () {},
            ),
          ),
        ),
      ),
    );

    // Open the dialog
    await tester.tap(find.byType(VDialogContent));
    await tester.pumpAndSettle();

    // Tap the dismiss button
    await tester.tap(find.text('Dismiss'));
    await tester.pumpAndSettle();

    // Verify that the dialog is popped
    expect(find.byType(VDialogContent), findsNothing);
  });

  testWidgets('VDialogNestedContent displays correct texts and colors',
      (WidgetTester tester) async {
    const title = 'Test Title';
    const subtitle = 'Test Subtitle';
    const description = 'Test Description';
    const pageNumber = '5';
    const pageNumberBackgroundColor = Colors.red;

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: VDialogNestedContent(
          title: title,
          subtitle: subtitle,
          description: description,
          pageNumber: pageNumber,
          pageNumberBackgroundColor: pageNumberBackgroundColor,
        ),
      ),
    ));

    expect(find.text(title), findsOneWidget);
    expect(find.text(subtitle), findsOneWidget);
    expect(find.text(description), findsOneWidget);
    expect(find.text(pageNumber), findsOneWidget);

    final pageNumberBackground =
        tester.firstWidget(find.byType(Container)) as Container;
    expect((pageNumberBackground.decoration as BoxDecoration).color,
        pageNumberBackgroundColor);
  });

  testWidgets('VDialogNested navigation and page count',
      (WidgetTester tester) async {
    final pages = List.generate(
      3,
      (i) => VDialogNestedContent(
        title: 'Title $i',
        subtitle: 'Subtitle $i',
        description: 'Description $i',
        pageNumber: '${i + 1}',
        pageNumberBackgroundColor: Colors.red,
      ),
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VDialogNested(pages: pages),
      ),
    ));

    // Go to next page
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Go to next page
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Go to previous page
    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();

    // Verify page 2 state after going back
    expect(find.text('2 of 3'), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    // Go to next page again
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Verify page 3 state
    expect(find.text('3 of 3'), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);
    expect(find.text('Done'), findsOneWidget);

    // Press "Done" button
    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();

    // Verify that the dialog is closed
    expect(find.byType(VDialogNested), findsNothing);
  });

  testWidgets(
      'VDialogNested should close dialog when "Close" button is pressed',
      (WidgetTester tester) async {
    final pages = List.generate(
      3,
      (i) => VDialogNestedContent(
        title: 'Title $i',
        subtitle: 'Subtitle $i',
        description: 'Description $i',
        pageNumber: '${i + 1}',
        pageNumberBackgroundColor: Colors.red,
      ),
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VDialogNested(pages: pages),
      ),
    ));

    // Verify initial state
    expect(find.text('1 of 3'), findsOneWidget);
    expect(find.text('Close'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    // Press "Close" button
    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();

    // Verify that the dialog is closed
    expect(find.byType(VDialogNested), findsNothing);
  });
}
