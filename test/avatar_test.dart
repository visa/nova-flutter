import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'dart:ui';

void main() {
// START GENAI@CHATGPT4
  test('VAvatarStyle copyWith and lerp testing', () {
    // Create an initial style
    var style = const VAvatarStyle(
      splashColor: Colors.blue,
      backgroundColor: Colors.red,
      borderColor: Colors.green,
      foregroundColor: Colors.orange,
      verticalHighLightColor: Colors.purple,
      borderRadius: 1.0,
      radius: 2.0,
      verticalAvatarBorderRadius: 3.0,
    );

    // Test copyWith with non-null values
    var copiedStyle = style.copyWith(
      splashColor: Colors.brown,
      backgroundColor: Colors.yellow,
      borderColor: Colors.indigo,
      foregroundColor: Colors.teal,
      verticalHighLightColor: Colors.grey,
      borderRadius: 2.0,
      radius: 3.0,
      verticalAvatarBorderRadius: 4.0,
    );
    expect(copiedStyle.splashColor, Colors.brown);
    expect(copiedStyle.backgroundColor, Colors.yellow);
    expect(copiedStyle.borderColor, Colors.indigo);
    expect(copiedStyle.foregroundColor, Colors.teal);
    expect(copiedStyle.verticalHighLightColor, Colors.grey);
    expect(copiedStyle.borderRadius, 2.0);
    expect(copiedStyle.radius, 3.0);
    expect(copiedStyle.verticalAvatarBorderRadius, 4.0);

    // Test copyWith with null values
    var copiedStyleWithNulls = style.copyWith();
    expect(copiedStyleWithNulls.splashColor, Colors.blue);
    expect(copiedStyleWithNulls.backgroundColor, Colors.red);
    expect(copiedStyleWithNulls.borderColor, Colors.green);
    expect(copiedStyleWithNulls.foregroundColor, Colors.orange);
    expect(copiedStyleWithNulls.verticalHighLightColor, Colors.purple);
    expect(copiedStyleWithNulls.borderRadius, 1.0);
    expect(copiedStyleWithNulls.radius, 2.0);
    expect(copiedStyleWithNulls.verticalAvatarBorderRadius, 3.0);

    // Create another style for lerp testing
    var anotherStyle = const VAvatarStyle(
      splashColor: Colors.black,
      backgroundColor: Colors.white,
      borderColor: Colors.grey,
      foregroundColor: Colors.cyan,
      verticalHighLightColor: Colors.lime,
      borderRadius: 3.0,
      radius: 4.0,
      verticalAvatarBorderRadius: 5.0,
    );

    // Test lerp
    var lerpedStyle = style.lerp(anotherStyle, 0.5);
    expect(lerpedStyle.splashColor, Color.lerp(Colors.blue, Colors.black, 0.5));
    expect(lerpedStyle.backgroundColor, Color.lerp(Colors.red, Colors.white, 0.5));
    expect(lerpedStyle.borderColor, Color.lerp(Colors.green, Colors.grey, 0.5));
    expect(lerpedStyle.foregroundColor, Color.lerp(Colors.orange, Colors.cyan, 0.5));
    expect(lerpedStyle.verticalHighLightColor, Color.lerp(Colors.purple, Colors.lime, 0.5));
    expect(lerpedStyle.borderRadius, 1.0);
    expect(lerpedStyle.radius, 2.0);
    expect(lerpedStyle.verticalAvatarBorderRadius, 3.0);
  });

  testWidgets('VAvatarProfile widget test', (WidgetTester tester) async {
    final backgroundImage = AssetImage("test/assets/avatarImage.png");
    final foregroundImage = AssetImage("test/assets/avatarImage.png");
    final child = Text('Test child');
    final semanticLabel = 'Test label';
    final hadBorder = true;
    final style = VAvatarStyle(
      backgroundColor: Colors.blue,
      borderColor: Colors.red,
      foregroundColor: Colors.green,
      radius: 10,
      borderRadius: 5,
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAvatarProfile(
          backgroundImage: backgroundImage,
          foregroundImage: foregroundImage,
          child: child,
          semanticLabel: semanticLabel,
          hadBorder: hadBorder,
          style: style,
        ),
      ),
    ));

    final avatarProfile = tester.firstWidget<VAvatarProfile>(find.byType(VAvatarProfile));
    expect(avatarProfile.backgroundImage, backgroundImage);
    expect(avatarProfile.foregroundImage, foregroundImage);
    expect(avatarProfile.child, child);
    expect(avatarProfile.semanticLabel, semanticLabel);
    expect(avatarProfile.hadBorder, hadBorder);
    expect(avatarProfile.style, style);
  });

  testWidgets('VAvatarProfile default dark', (WidgetTester tester) async {
    final backgroundImage = AssetImage("test/assets/avatarImage.png");

    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: VAvatarProfile(
          backgroundImage: backgroundImage,
        ),
      ),
    ));

    final avatarProfile = tester.firstWidget<VAvatarProfile>(find.byType(VAvatarProfile));
    expect(avatarProfile.backgroundImage, backgroundImage);
  });

  testWidgets('VAvatarProfile VAlt', (WidgetTester tester) async {
    final backgroundImage = AssetImage("test/assets/avatarImage.png");

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAvatarProfile(
          vExt: VAlt(),
          backgroundImage: backgroundImage,
        ),
      ),
    ));

    final avatarProfile = tester.firstWidget<VAvatarProfile>(find.byType(VAvatarProfile));
    expect(avatarProfile.backgroundImage, backgroundImage);
  });

  testWidgets('VAvatarProfile VAlt dark', (WidgetTester tester) async {
    final backgroundImage = AssetImage("test/assets/avatarImage.png");

    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: VAvatarProfile(
          vExt: VAlt(),
          backgroundImage: backgroundImage,
        ),
      ),
    ));

    final avatarProfile = tester.firstWidget<VAvatarProfile>(find.byType(VAvatarProfile));
    expect(avatarProfile.backgroundImage, backgroundImage);
  });

  testWidgets('VAvatarVertical default', (WidgetTester tester) async {
    final child = Text('Test child');
    final leading = Icon(Icons.home);
    final onTap = () {};
    final style = VAvatarStyle(
      verticalHighLightColor: Colors.blue,
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAvatarVertical(
          child: child,
          leading: leading,
          onTap: onTap,
          style: style,
        ),
      ),
    ));

    final avatarVertical = tester.firstWidget<VAvatarVertical>(find.byType(VAvatarVertical));
    expect(avatarVertical.child, child);
    expect(avatarVertical.leading, leading);
    expect(avatarVertical.onTap, onTap);
    expect(avatarVertical.style, style);
  });

  testWidgets('VAvatarVertical alt', (WidgetTester tester) async {
    final child = Text('Test child');
    final leading = Icon(Icons.home);
    final onTap = () {};
    final style = VAvatarStyle(
      verticalHighLightColor: Colors.blue,
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: VAvatarVertical(
          vExt: VAlt(),
          child: child,
          leading: leading,
          onTap: onTap,
          style: style,
        ),
      ),
    ));

    final avatarVertical = tester.firstWidget<VAvatarVertical>(find.byType(VAvatarVertical));
    expect(avatarVertical.child, child);
    expect(avatarVertical.leading, leading);
    expect(avatarVertical.onTap, onTap);
    expect(avatarVertical.style, style);
  });
}
