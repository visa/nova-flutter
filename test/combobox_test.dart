import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

void main() {
  test('VComboboxStyle lerp interpolates values correctly', () {
    const style1 = VComboboxStyle(
      backgroundColor: Colors.red,
      listTileColor: Colors.blue,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.yellow,
      resultTextColor: Colors.orange,
      appBarTitleTextColor: Colors.pink,
      clearIconColor: Colors.purple,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.blue),
    );

    const style2 = VComboboxStyle(
      backgroundColor: Colors.pink,
      listTileColor: Colors.indigo,
      listTileResultIconColor: Colors.grey,
      errorTextColor: Colors.teal,
      resultTextColor: Colors.cyan,
      appBarTitleTextColor: Colors.lime,
      clearIconColor: Colors.amber,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.pink),
      resultTextStyle: TextStyle(color: Colors.indigo),
    );

    final result = style1.lerp(style2, 0.5);

    expect(result.backgroundColor, Color.lerp(Colors.red, Colors.pink, 0.5));
    expect(result.listTileColor, Color.lerp(Colors.blue, Colors.indigo, 0.5));
    expect(result.listTileResultIconColor, Color.lerp(Colors.green, Colors.grey, 0.5));
    expect(result.errorTextColor, Color.lerp(Colors.yellow, Colors.teal, 0.5));
    expect(result.resultTextColor, Color.lerp(Colors.orange, Colors.cyan, 0.5));
    expect(result.appBarTitleTextColor, Color.lerp(Colors.pink, Colors.lime, 0.5));
    expect(result.clearIconColor, Color.lerp(Colors.purple, Colors.amber, 0.5));
    expect(result.inputStyle, style1.inputStyle);
    expect(result.appBarStyle, style1.appBarStyle);
    expect(result.errorTextStyle, style1.errorTextStyle);
    expect(result.resultTextStyle, style1.resultTextStyle);
  });

  test('VComboboxStyle copyWith copies values correctly', () {
    const style1 = VComboboxStyle(
      backgroundColor: Colors.red,
      listTileColor: Colors.blue,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.yellow,
      resultTextColor: Colors.orange,
      appBarTitleTextColor: Colors.pink,
      clearIconColor: Colors.purple,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.blue),
    );

    final style2 = style1.copyWith();

    // Check that the values were copied correctly
    expect(style2.backgroundColor, Colors.red);
    expect(style2.listTileColor, Colors.blue);
    expect(style2.listTileResultIconColor, Colors.green);
    expect(style2.errorTextColor, Colors.yellow);
    expect(style2.resultTextColor, Colors.orange);
    expect(style2.appBarTitleTextColor, Colors.pink);
    expect(style2.clearIconColor, Colors.purple);
    expect(style2.errorTextStyle?.color, Colors.red);
    expect(style2.resultTextStyle?.color, Colors.blue);
    expect(style2.inputStyle, style1.inputStyle);
    expect(style2.appBarStyle, style1.appBarStyle);
  });

  testWidgets('VComboboxScreen displays search results correctly', (WidgetTester tester) async {
    final searchList = ['Apple', 'Banana', 'Cherry', 'Durian'];
    final searchController = TextEditingController();
    const appBarTitle = 'Fruits';
    const topLabelText = 'Search';
    const style = VComboboxStyle(
      backgroundColor: Colors.white,
      listTileColor: Colors.grey,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.red,
      resultTextColor: Colors.black,
      appBarTitleTextColor: Colors.blue,
      clearIconColor: Colors.orange,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.black),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: VComboboxScreen(
          searchList: searchList,
          searchController: searchController,
          appBarTitle: appBarTitle,
          topLabelText: topLabelText,
          style: style,
        ),
      ),
    );

    // Verify the initial state
    expect(find.text(appBarTitle), findsOneWidget);
    expect(find.text(topLabelText), findsOneWidget);
    // expect(find.text('No result'), findsOneWidget);
    expect(find.byType(VInput), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(searchList.length));

    // Enter a search query
    await tester.enterText(find.byType(VInput), 'Banana');
    await tester.pump();

    // Verify the search results
    expect(find.text('Banana'), findsWidgets);
    expect(find.text('Apple'), findsNothing);
    expect(find.text('Cherry'), findsNothing);
    expect(find.text('Durian'), findsNothing);
  });

  testWidgets('VComboboxScreen displays error text when search result is empty', (WidgetTester tester) async {
    final searchList = [];
    final searchController = TextEditingController();
    const appBarTitle = 'Fruits';
    const topLabelText = 'Search';
    const style = VComboboxStyle(
      backgroundColor: Colors.white,
      listTileColor: Colors.grey,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.red,
      resultTextColor: Colors.black,
      appBarTitleTextColor: Colors.blue,
      clearIconColor: Colors.orange,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.black),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: VComboboxScreen(
          searchList: searchList,
          searchController: searchController,
          appBarTitle: appBarTitle,
          topLabelText: topLabelText,
          style: style,
        ),
      ),
    );

    // Verify the error text is displayed
    expect(find.text('No result'), findsOneWidget);
  });

  testWidgets('VComboboxScreen with alternate theme', (WidgetTester tester) async {
    final searchList = [];
    final searchController = TextEditingController();
    const appBarTitle = 'Fruits';
    const topLabelText = 'Search';
    const style = VComboboxStyle(
      backgroundColor: Colors.white,
      listTileColor: Colors.grey,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.red,
      resultTextColor: Colors.black,
      appBarTitleTextColor: Colors.blue,
      clearIconColor: Colors.orange,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.black),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: VComboboxScreen(
          searchList: searchList,
          searchController: searchController,
          appBarTitle: appBarTitle,
          topLabelText: topLabelText,
          style: style,
          vExt: VAlt(),
        ),
      ),
    );

    // Verify the error text is displayed
    expect(find.text('No result'), findsOneWidget);
  });

  testWidgets('VComboboxScreen with alternate theme is dark', (WidgetTester tester) async {
    final searchList = [];
    final searchController = TextEditingController();
    const appBarTitle = 'Fruits';
    const topLabelText = 'Search';
    const style = VComboboxStyle(
      backgroundColor: Colors.white,
      listTileColor: Colors.grey,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.red,
      resultTextColor: Colors.black,
      appBarTitleTextColor: Colors.blue,
      clearIconColor: Colors.orange,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.black),
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: VComboboxScreen(
          searchList: searchList,
          searchController: searchController,
          appBarTitle: appBarTitle,
          topLabelText: topLabelText,
          style: style,
          vExt: VAlt(),
        ),
      ),
    );

    // Verify the error text is displayed
    expect(find.text('No result'), findsOneWidget);
  });

  testWidgets('VComboboxScreen with alternate theme is dark', (WidgetTester tester) async {
    final searchList = [];
    final searchController = TextEditingController();
    const appBarTitle = 'Fruits';
    const topLabelText = 'Search';
    const style = VComboboxStyle(
      backgroundColor: Colors.white,
      listTileColor: Colors.grey,
      listTileResultIconColor: Colors.green,
      errorTextColor: Colors.red,
      resultTextColor: Colors.black,
      appBarTitleTextColor: Colors.blue,
      clearIconColor: Colors.orange,
      inputStyle: VInputStyle(),
      appBarStyle: VAppBarStyle(),
      errorTextStyle: TextStyle(color: Colors.red),
      resultTextStyle: TextStyle(color: Colors.black),
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        home: VComboboxScreen(
          searchList: searchList,
          searchController: searchController,
          appBarTitle: appBarTitle,
          topLabelText: topLabelText,
          style: style,
          // vExt: VAlt(),
        ),
      ),
    );

    // Verify the error text is displayed
    expect(find.text('No result'), findsOneWidget);
  });
}
