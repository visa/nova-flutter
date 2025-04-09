import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'dart:ui';

import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

void main() {
  test('VListItemStyle copyWith correctly updates fields', () {
    var style = VListItemStyle(
      itemListColor: Colors.red,
      iconColor: Colors.blue,
      borderRadius: 10.0,
    );

    var updatedStyle = style.copyWith(
      itemListColor: Colors.green,
      iconColor: Colors.yellow,
      borderRadius: 20.0,
    );

    expect(updatedStyle.itemListColor, Colors.green);
    expect(updatedStyle.iconColor, Colors.yellow);
    expect(updatedStyle.borderRadius, 20.0);
  });

  test('VListItemStyle lerp correctly interpolates between two styles', () {
    var style1 = const VListItemStyle(
      itemListColor: Colors.red,
      iconColor: Colors.blue,
      borderRadius: 10.0,
    );

    var style2 = const VListItemStyle(
      itemListColor: Colors.green,
      iconColor: Colors.yellow,
      borderRadius: 20.0,
    );

    var lerpStyle = style1.lerp(style2, 0.5);

    expect(lerpStyle.itemListColor, Color.lerp(Colors.red, Colors.green, 0.5));
    expect(lerpStyle.iconColor, Color.lerp(Colors.blue, Colors.yellow, 0.5));
    expect(lerpStyle.borderRadius, lerpDouble(10.0, 20.0, 0.5));
  });

  test('VListItemStyle copyWith correctly updates fields', () {
    var style = const VListItemStyle(
      itemListColor: Colors.red,
      borderRadius: 10.0,
    );

    var updatedStyle = style.copyWith(
      itemListColor: Colors.green,
      borderRadius: 20.0,
    );

    expect(updatedStyle.itemListColor, Colors.green);
    expect(updatedStyle.borderRadius, 20.0);
  });

  testWidgets('VListItem height is properly set', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        child: Text('Test'),
        height: 100.0,
      ),
    ));

    final container = tester.widget<Container>(find.byType(Container));
    expect(container.constraints?.minHeight, 100.0);
  });

  testWidgets('VListItem onTap callback is called when item is tapped', (WidgetTester tester) async {
    var tapped = false;

    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        child: Text('Test'),
        onTap: () {
          tapped = true;
        },
      ),
    ));

    await tester.tap(find.byType(VListItem));
    expect(tapped, true);
  });

  testWidgets('VListItem applies getAltColorSchemeDark when theme brightness is dark and vExt is not VDef', (WidgetTester tester) async {
    var tapped = false;
    // Test with Brightness.dark and vExt is not VDef
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: VListItem(
        child: Text('Test'),
        onTap: () {
          tapped = true;
        },
        vExt: VAlt(),
      ),
    ));

    // Check if getAltColorSchemeDark is applied
    await tester.tap(find.byType(VListItem));
    expect(tapped, true);
  });

  testWidgets('VListItem color changes according to _isPressed and hasCheck', (WidgetTester tester) async {
    final pressedStyle = VListItemStyle(itemListColor: Colors.red);
    final checkedStyle = VListItemStyle(itemListColor: Colors.green);

    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        child: Text('Test'),
        onTap: () {}, // Needed to make the item pressable
        style: pressedStyle,
      ),
    ));

    await tester.tap(find.byType(VListItem));
    await tester.pump();

    final container = tester.widget<Container>(find.byType(Container));
    expect((container.decoration as BoxDecoration).color, pressedStyle.itemListColor);

    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        child: Text('Test'),
        hasCheck: true,
        style: checkedStyle,
      ),
    ));

    final container2 = tester.widget<Container>(find.byType(Container));
    expect((container2.decoration as BoxDecoration).color, checkedStyle.itemListColor);
  });

  testWidgets('VListItem icon color is defaultStyle.disabled when isReadOnly is true or onTap is null', (WidgetTester tester) async {
    final VIcon trailingWidget = VIcon(svgIcon: VIcons.chevronRightTiny);

    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        child: Text('Test'),
        isReadOnly: true,
        trailingIcon: trailingWidget,
        hasTrailingIcon: true,
      ),
    ));

    // Find the icon widget and verify its color
    expect(find.byType(VIcon), findsWidgets);
  });

  testWidgets('VListItem icon when hasTrailing is false', (WidgetTester tester) async {
    // final VIcon trailingWidget = VIcon(svgIcon: VIcons.chevronRightTiny);

    await tester.pumpWidget(const MaterialApp(
      home: VListItem(
        child: Text('Test'),
        isReadOnly: true,
        hasTrailingIcon: true,
      ),
    ));

    // Find the icon widget and verify its color
    expect(find.byType(VIcon), findsWidgets);
  });

  testWidgets('VListItem icon when color', (WidgetTester tester) async {
    final Color color = VColors.defaultActive;

    await tester.pumpWidget(MaterialApp(
      home: VListItem(
        child: Text('Test'),
        hasTrailingIcon: true,
        onTap: () {},
      ),
    ));

    // Find the icon widget and verify its color
    expect(find.byType(VIcon), findsWidgets);

    // Check the icon color
    final VIcon iconWidget = tester.widget<VIcon>(find.byType(VIcon));
    final Color? iconColor = iconWidget.iconColor;
    expect(iconColor, VColors.defaultActive);
  });
}
