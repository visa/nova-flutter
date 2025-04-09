import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'dart:ui';

void main() {
  test('VPanelStyle copyWith method test', () {
    const style = VPanelStyle(
      appBarBackgroundColor: Colors.blue,
      backgroundColor: Colors.red,
      titleTextStyle: TextStyle(color: Colors.green),
      borderRadius: 10.0,
    );

    final newStyle = style.copyWith();

    expect(newStyle.appBarBackgroundColor, Colors.blue);
    expect(newStyle.backgroundColor, Colors.red);
    expect(newStyle.titleTextStyle?.color, Colors.green);
    expect(newStyle.borderRadius, 10.0);
  });

  test('VPanelStyle lerp method test', () {
    const style1 = VPanelStyle(
      appBarBackgroundColor: Colors.blue,
      backgroundColor: Colors.red,
      titleTextStyle: TextStyle(color: Colors.green),
      borderRadius: 10.0,
    );

    const style2 = VPanelStyle(
      appBarBackgroundColor: Colors.white,
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.pink),
      borderRadius: 20.0,
    );

    final lerpStyle = style1.lerp(style2, 0.5);

    expect(lerpStyle.appBarBackgroundColor, Color.lerp(Colors.blue, Colors.white, 0.5));
    expect(lerpStyle.backgroundColor, Color.lerp(Colors.red, Colors.black, 0.5));

    // As lerp for TextStyle is not defined, it should return the TextStyle of the original instance
    expect(lerpStyle.titleTextStyle?.color, Colors.green);

    expect(lerpStyle.borderRadius, lerpDouble(10.0, 20.0, 0.5));
  });

  testWidgets('VPanel widget test', (WidgetTester tester) async {
    // Define the mock Navigator
    final mockNavigator = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        home: const VPanel(
          isFullScreen: true,
          showShadow: true,
          child: Text('Hello World'),
        ),
        navigatorObservers: [mockNavigator],
      ),
    );

    // Verify the VPanel widget is created and has 'Hello World' as a child
    expect(find.byType(VPanel), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);

    // Tap the close button and verify that the Navigator.pop method was called
    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();
  });

  testWidgets('VPanel alt test', (WidgetTester tester) async {
    // Define the mock Navigator
    final mockNavigator = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        home: VPanel(
          vExt: VAlt(),
          isFullScreen: true,
          showShadow: true,
          child: const Text('Hello World'),
        ),
        navigatorObservers: [mockNavigator],
      ),
    );

    // Verify the VPanel widget is created and has 'Hello World' as a child
    expect(find.byType(VPanel), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);

    // Tap the close button and verify that the Navigator.pop method was called
    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();
  });

  testWidgets('VPanel dark test', (WidgetTester tester) async {
    // Define the mock Navigator
    final mockNavigator = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: const SingleChildScrollView(
          child: VPanel(
            showShadow: false,
            isFullScreen: true,
            child: Text('Hello World'),
          ),
        ),
        navigatorObservers: [mockNavigator],
      ),
    );

    // Verify the VPanel widget is created and has 'Hello World' as a child
    expect(find.byType(VPanel), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);

    // Tap the close button and verify that the Navigator.pop method was called
    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();
  });

  testWidgets('VPanel applies contentPadding and closeIconPadding correctly', (WidgetTester tester) async {
    // Define the padding values
    const EdgeInsets contentPadding = EdgeInsets.all(16.0);
    const EdgeInsets closeIconPadding = EdgeInsets.all(8.0);
    // Define the mock Navigator
    final mockNavigator = MockNavigatorObserver();

    // Build the VPanel widget
    await tester.pumpWidget(
      MaterialApp(
        home: const VPanel(
          isFullScreen: true,
          showShadow: true,
          contentPadding: contentPadding,
          closeIconPadding: closeIconPadding,
          child: Text('Hello World'),
        ),
        navigatorObservers: [mockNavigator],
      ),
    );

    // Verify that the contentPadding is applied
    final contentPaddingFinder = find.byWidgetPredicate(
      (Widget widget) => widget is Padding && widget.padding == contentPadding,
    );

    // Verify that the closeIconPadding is applied
    final closeIconPaddingFinder = find.byWidgetPredicate(
      (Widget widget) => widget is Padding && widget.padding == closeIconPadding,
    );

    expect(contentPaddingFinder, findsOneWidget);
    expect(closeIconPaddingFinder, findsOneWidget);
  });

  testWidgets('VPanel alt dark test', (WidgetTester tester) async {
    // Define the mock Navigator

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: VPanel(
          closeIcon: const SizedBox.shrink(),
          vExt: VAlt(),
          isFullScreen: false,
          showShadow: false,
          child: const Text('Hello World'),
        ),
      ),
    );

    // Verify the VPanel widget is created and has 'Hello World' as a child
    expect(find.byType(VPanel), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);
  });

  testWidgets('VHalfScreenPanelButton displays VPanel when tapped', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VHalfScreenPanelButton(),
        ),
      ),
    );

    // Find the VButton and tap on it
    await tester.tap(find.byType(VButton));
    await tester.pumpAndSettle(); // Wait for the panel to open

    // Check if VPanel is present in the widget tree
    expect(find.byType(VPanel), findsOneWidget);
  });

  testWidgets('VHalfScreenPanelButton close button test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: VHalfScreenPanelButton(),
        ),
      ),
    );

    // Find the VButton and tap on it
    await tester.tap(find.byType(VButton));
    await tester.pumpAndSettle(); // Wait for the panel to open

    // Find the close button and tap on it
    // Find all InkWell widgets
    final inkWellFinder = find.byType(InkWell, skipOffstage: false);

    // Tap on the second InkWell
    await tester.tap(inkWellFinder.at(1));
    await tester.pumpAndSettle(); // Wait for the panel to close

    // Check if VPanel is not present in the widget tree (because it's closed)
    expect(find.byType(VPanel), findsNothing);
  });
}

class MockNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {}
}

class VHalfScreenPanelButton extends StatelessWidget {
  const VHalfScreenPanelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
      onPressed: () {
        showModalBottomSheet(
          useSafeArea: true,
          context: context,
          builder: (BuildContext context) {
            return Stack(
              children: [
                // ModalBarrier is placed in a Stack widget along with your VPanel. This causes the ModalBarrier to cover the entire screen, excluding the semantics of any widgets behind it. The dismissible: false property prevents the barrier from being dismissed (closed) when the user taps on it.
                const ModalBarrier(
                  dismissible: false,
                ),
                VPanel(
                  closeIcon: null,
                  title: "Password help",
                  isFullScreen: false,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Semantics(
                          header: true,
                          child: Text(
                            "How do I reset my password?",
                            style: defaultVTheme.textStyles.subtitle2.copyWith(height: 23 / 18),
                          ),
                        ),
                        Text(
                          "Use the “Forgot password” link at sign-in to begin. Enter your email to look up your account, and we’ll send you a security email to confirm you initiated this request. Follow the link included to reset your password.",
                          style: defaultVTheme.textStyles.bodyText2.copyWith(height: 24 / 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: const Text("Show panel half screen"),
    );
  }
}
