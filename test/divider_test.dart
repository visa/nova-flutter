import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'dart:ui';

void main() {
  test('VDividerStyle copyWith and lerp testing', () {
    // Create an initial style
    var style = const VDividerStyle(
      dividerColor: Colors.blue,
      thickness: 1.0,
      height: 2.0,
      indent: 3.0,
      endIndent: 4.0,
    );

    // Test copyWith with non-null values
    var copiedStyle = style.copyWith(
      backgroundColor: Colors.orange,
      thickness: 2.0,
      height: 3.0,
      indent: 4.0,
      endIndent: 5.0,
    );
    expect(copiedStyle.dividerColor, Colors.orange);
    expect(copiedStyle.thickness, 2.0);
    expect(copiedStyle.height, 3.0);
    expect(copiedStyle.indent, 4.0);
    expect(copiedStyle.endIndent, 5.0);

    // Test copyWith with null values
    var copiedStyleWithNulls = style.copyWith();
    expect(copiedStyleWithNulls.dividerColor, Colors.blue);
    expect(copiedStyleWithNulls.thickness, 1.0);
    expect(copiedStyleWithNulls.height, 2.0);
    expect(copiedStyleWithNulls.indent, 3.0);
    expect(copiedStyleWithNulls.endIndent, 4.0);

    // Create another style for lerp testing
    var anotherStyle = const VDividerStyle(
      dividerColor: Colors.black,
      thickness: 2.5,
      height: 3.5,
      indent: 4.5,
      endIndent: 5.5,
    );

    // Test lerp
    var lerpedStyle = style.lerp(anotherStyle, 0.5);
    expect(lerpedStyle.dividerColor, Color.lerp(Colors.blue, Colors.black, 0.5));
    expect(lerpedStyle.thickness, lerpDouble(1.0, 2.5, 0.5));
    expect(lerpedStyle.height, lerpDouble(2.0, 3.5, 0.5));
    expect(lerpedStyle.indent, lerpDouble(3.0, 4.5, 0.5));
    expect(lerpedStyle.endIndent, lerpDouble(4.0, 5.5, 0.5));
  });

  testWidgets('VDivider builds correctly for each VDividerType', (WidgetTester tester) async {
    // Test VDivider of type 'section'
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: VDivider(dividerType: VDividerType.section),
        ),
      ),
    );
    expect(find.byType(VDivider), findsOneWidget);

    // Test VDivider of type 'decorative'
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: VDivider(dividerType: VDividerType.decorative),
        ),
      ),
    );
    expect(find.byType(VDivider), findsOneWidget);

    // Test VDivider of type 'standard'
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: VDivider(dividerType: VDividerType.standard),
        ),
      ),
    );
    expect(find.byType(VDivider), findsOneWidget);
  });

  testWidgets('VDivider applies getAltColorSchemeDark when theme brightness is dark and vExt is not VDef', (WidgetTester tester) async {
    // Test with Brightness.dark and vExt is not VDef
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Material(
        child: VDivider(
          vExt: VAlt(),
        ),
      ),
    ));

    // Check if getAltColorSchemeDark is applied
    final dividerWidget = tester.widget<Divider>(find.byType(Divider));
    expect(dividerWidget.color, equals(getAltColorSchemeDark().activeSubtle.withOpacity(0.5)));
  });

  testWidgets('VDivider applies getAltColorScheme when theme brightness is light and vExt is not VDef', (WidgetTester tester) async {
    // Test with Brightness.light and vExt is not VDef
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: VDivider(
          vExt: VAlt(),
        ),
      ),
    ));

    // Check if getAltColorScheme is applied
    final dividerWidget = tester.widget<Divider>(find.byType(Divider));
    expect(dividerWidget.color, equals(getAltColorScheme().activeSubtle.withOpacity(0.5)));
  });
}
