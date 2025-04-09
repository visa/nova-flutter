import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'dart:ui';

void main() {
  test('VWizardStyle copyWith and lerp test', () {
    // Create two VWizardStyle objects
    const style1 = VWizardStyle(
      defaultBackgroundColor: Colors.red,
      inProgressColor: Colors.green,
      successColor: Colors.blue,
      incompleteColor: Colors.yellow,
      numberTextStyle: TextStyle(fontSize: 12),
      borderRadius: 5.0,
    );

    const style2 = VWizardStyle(
      defaultBackgroundColor: Colors.white,
      inProgressColor: Colors.black,
      successColor: Colors.purple,
      incompleteColor: Colors.orange,
      numberTextStyle: TextStyle(fontSize: 16),
      borderRadius: 10.0,
    );

    // Test copyWith method
    final copiedStyle = style1.copyWith();
    expect(copiedStyle.defaultBackgroundColor, style1.defaultBackgroundColor);
    expect(copiedStyle.numberTextStyle, style1.numberTextStyle);
    expect(copiedStyle.inProgressColor,
        style1.inProgressColor); // Not copied, should remain as in style1

    // Test lerp method
    final lerpedStyle = style1.lerp(style2, 0.5);
    expect(
        lerpedStyle.defaultBackgroundColor,
        Color.lerp(
            style1.defaultBackgroundColor, style2.defaultBackgroundColor, 0.5));
    expect(
        lerpedStyle.numberTextStyle,
        style1
            .numberTextStyle); // lerp not implemented for TextStyle, should remain as in style1
    expect(lerpedStyle.borderRadius,
        lerpDouble(style1.borderRadius, style2.borderRadius, 0.5));
  });

  testWidgets('VWizard test', (WidgetTester tester) async {
    // Create the VWizard widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VWizard(
            currentStep: 2,
            totalSteps: 5,
            child: Container(),
          ),
        ),
      ),
    );

    // Verify the total steps
    expect(
        find.byType(Container), findsNWidgets(5 * 2 - 1)); // totalSteps * 2 - 1

    // Verify the current step
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('VWizard alt test', (WidgetTester tester) async {
    // Create the VWizard widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VWizard(
            vExt: VAlt(),
            currentStep: 2,
            totalSteps: 5,
            child: Container(),
          ),
        ),
      ),
    );

    // Verify the total steps
    expect(
        find.byType(Container), findsNWidgets(5 * 2 - 1)); // totalSteps * 2 - 1

    // Verify the current step
    expect(find.text('2'), findsOneWidget);
  });
}
