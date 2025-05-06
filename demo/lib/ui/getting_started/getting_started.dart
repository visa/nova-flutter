// 
//              © 2025 Visa
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//        http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//
// Visa Nova Flutter Demo GettingStarted Page
import 'package:demo/patterns/application_layout.dart';
import 'package:demo/patterns/chats.dart';
import 'package:demo/patterns/file_upload.dart';
import 'package:demo/patterns/wizard.dart';
import 'package:demo/ui/badge/badge.dart';
import 'package:demo/ui/buttons/buttons.dart';
import 'package:demo/ui/typography/typography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';
import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
// Demo app imports
import 'package:demo/main.dart';
import 'package:demo/utilities.dart';

import 'package:demo/ui/accordion/accordion.dart';
import 'package:demo/ui/avatar/avatar.dart';
import 'package:demo/ui/chips/chips.dart';
import 'package:demo/ui/combo_box/combo_box.dart';
import 'package:demo/ui/divider/divider.dart';
import 'package:demo/ui/dropdown_menu/dropdown_menu.dart';
import 'package:demo/ui/flags/flags.dart';
import 'package:demo/ui/list_item/list_item.dart';
import 'package:demo/ui/nav_drawer/nav_drawer.dart';
import 'package:demo/ui/panel/panel.dart';
import 'package:demo/ui/progress/progress.dart';
import 'package:demo/ui/radio/radio.dart';
import 'package:demo/ui/inputs/input.dart';
import 'package:demo/ui/select/select.dart';
import 'package:demo/ui/switch/switch.dart';
import 'package:demo/ui/toggle/toggle.dart';
import 'package:demo/ui/checkboxes/checkbox.dart';
import 'package:demo/ui/tabs/tab_horizontal.dart';
import 'package:demo/ui/tabs/tab_stacked.dart';
import 'package:demo/ui/links/links.dart';
import 'package:demo/ui/banners/banners.dart';
import 'package:demo/ui/dialogs/dialogs.dart';
import "package:demo/ui/section_messages/section_messages.dart";
import 'package:demo/ui/tab_bar/tab_bar.dart';
import 'package:demo/ui/app_bar/app_bar.dart';
import 'package:demo/ui/content_card/content_card.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

var importCode = """
  visa_nova_flutter:
    version: ^8.1.2
    hosted:
      name: visa_nova_flutter
      url: https://artifactory.trusted.visa.com/api/pub/visa-commons-flutter/
""";
var appLevelThemeCode = """
  void main() {
    setPathUrlStrategy();
    runApp(ChangeNotifierProvider(
        create: (_) => ThemeProvider(), child: const MyApp()));
  }

class ThemeProvider with ChangeNotifier {
  VDef vDef = VDef();
  bool isDefaultLightTheme = true;
  bool isDefaultDarkTheme = true;

  ThemeProvider() {
    defaultVTheme = VTheme(fontFamily: "MyFont");
  }

  void setLightTheme(VDefaultThemeProps? themeData) {
    vDef.switchLightTheme(themeData);
    notifyListeners();
  }

  void switchLightTheme() {
    if (isDefaultLightTheme) {
      setLightTheme(customLightTheme);
    } else {
      setLightTheme(null);
    }
    isDefaultLightTheme = !isDefaultLightTheme;
  }

  final customLightTheme = VDefaultThemeProps(
    active: const Color(0xFF288756),
    activePressed: const Color(0xFFE5BC18),
    surfaceLowlight: const Color(0xFFEAF6D7),
    text: VColors.defaultText,
    textSubtle: VColors.defaultTextSubtle,
    vButtonProperties: VButtonProperties(
      minimumSize: const Size(0, 46),
    ),
  );

  void setDarkTheme(VDefaultThemeProps? themeData) {
    vDef.switchDarkTheme(themeData);
    notifyListeners();
  }

  void switchDarkTheme() {
    if (isDefaultDarkTheme) {
      setDarkTheme(customDarkTheme);
    } else {
      setDarkTheme(null);
    }
    isDefaultDarkTheme = !isDefaultDarkTheme;
  }

  final customDarkTheme = VDefaultThemeProps(
    active: Colors.red,
    activePressed: const Color(0xFFE5BC18),
    surfaceLowlight: const Color(0xFFEAF6D7),
    text: VColors.defaultText,
    textSubtle: VColors.defaultTextSubtle,
    vButtonProperties: VButtonProperties(
      minimumSize: const Size(0, 46),
    ),
  );
}
""";
var lightDarkThemeCode = """
  return MaterialApp(
      title: 'My App',
      theme: defaultVTheme.primaryTheme,
      darkTheme: defaultVTheme.primaryThemeDark,
      ...
  );
""";
var fontYaml = """
  fonts:
    - family: MyFont
      fonts:
        - asset: fonts/MyFont-Regular.ttf
        - asset: fonts/MyFont-Italic.ttf
          style: italic
""";

class Page {
  String description;
  Widget page;
  String path;
  String title;

  Page(this.title, this.path, this.page, this.description);
}

class GettingStarted extends StatelessWidget {
  GettingStarted({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<Page> pages = [
    Page(
      "Buttons",
      "buttons",
      const Buttons(),
      "Buttons trigger an action/event on press.",
    ),
    Page(
      "Typography",
      "typography",
      const TypographyPage(),
      "Typography is the visual component of the written word.",
    ),
    Page(
      "Links",
      "link",
      const Links(),
      "Link is a text-based element that navigates the user to another page within the application or site, either to a different section within the same page or to a new page.",
    ),
    Page(
      "Select",
      "select",
      const Select(),
      "Select allows users to select one option from a list in the form of a dropdown menu.",
    ),
    Page(
      "Tab Horizontal",
      "tabhorizontal",
      const TabHorizontal(),
      "Tabs enable content organization at a high level, such as switching between views or data sets.",
    ),
    Page(
      "Tab Stacked",
      "tabstacked",
      const TabStacked(),
      "Tabs enable content organization at a high level, such as switching between views or data sets.",
    ),
    Page(
      "Checkbox",
      "checkbox",
      const Checkboxes(),
      "Checkbox gives the user a binary choice for selecting several choices in a short list.",
    ),
    Page(
      "Radio",
      "radio",
      const Radios(),
      "A radio lets users select one option from two or more mutually exclusive options.",
    ),
    Page(
      "Input",
      "input",
      const Input(),
      "Input field allows users to input text and edit data in a form.",
    ),
    Page(
      "Banner",
      "banners",
      Banners(),
      "Banners provide global medium-priority messaging on the state of the application or site.",
    ),
    Page(
      "Section Message",
      "section-message",
      SectionMessage(),
      "Section messages provide contextual messaging on the state of a page, or feedback on a user action that was just taken.",
    ),
    Page(
      "Dialog",
      "dialog",
      const Dialogs(),
      "A dialog is a modal interface that appears in the middle of the user's main workflow, and often displays critical information and requires immediate action from the user.",
    ),
    Page(
      "Flag",
      "flag",
      const Flags(),
      "Flags are used to provide contextual, low priority messages to the user.",
    ),
    Page(
      "Switch",
      "switch",
      const SwitchPage(),
      "A switch is used as a binary on/off control.",
    ),
    Page(
      "Accordion",
      "accordion",
      const Accordion(),
      "Accordion is a set of vertical headers that can reveal or hide additional sections of content.",
    ),
    Page(
      "Divider",
      "divider",
      const DividerPage(),
      "Divider is a thin visual element used to help organize information within a page.",
    ),
    Page(
      "Dropdown Menu",
      "dropdown-menu",
      const DropDownScreen(),
      "Dropdown menu allows the user to select a single action from a list of choices.",
    ),
    Page(
      "Tab Bar",
      "tabbar",
      const TabBarPage(),
      "A table is a static component that presents data to the user using columns and rows (tabular data).",
    ),
    Page(
      "Top app bar",
      "appbar",
      const AppBarPage(),
      "The top app bar is one of the the most important parts of any mobile application.",
    ),
    Page(
      "Content Card",
      "content-card",
      const ContentCard(),
      "Content card is a layout bundle utilized when it's helpful to the user to see a preview of the content available in the item's details.",
    ),
    Page(
      "List Item",
      "listitem",
      const ListItem(),
      "A list item is a component for mobile applications used to display list items.",
    ),
    Page(
      "Avatar",
      "avatar",
      Avatar(),
      "Avatars are visual and/or textual representation elements of users and entities within a product",
    ),
    Page(
      "Chips",
      "chip",
      const ChipsPage(),
      "Chips are compact elements that represent an input or attribute tag. They usually appear dynamically as a group of multiple interactive elements.",
    ),
    Page(
      "Navigation Drawer",
      "navigation-drawer",
      const NavDrawerPage(),
      "The navigation drawer is accessible from a hamburger menu in the top app bar.",
    ),
    Page(
      "Badge",
      "badge",
      const BadgePage(),
      "A badge is a supplementary component that calls attention to the user about the status of an element.",
    ),
    Page(
      "Toggle",
      "toggle",
      const TogglePage(),
      "Toggle buttons are a horizontally-oriented selection device. Toggle button choices should be closely-related and affect an object, state, or view.",
    ),
    Page(
      "Combobox",
      "combobox",
      const Combobox(),
      "Combobox is an input component that allows the user to make a selection by typing into the field. The component is composed of a text box and a menu that appears, allowing users to set the value of the text field.",
    ),
    Page(
      "Panel",
      "panel",
      const PanelPage(),
      "Panels are surfaces that provide supplementary information to the user.",
    ),
    Page(
      "Progress",
      "progress",
      const ProgressPage(),
      "Progress components communicate the completion status of a task or workflow.",
    ),
  ];

  List<Page> patternPages = [
    Page(
      "Application Layout",
      "application-layout",
      const ApplicationLayoutPage(),
      "Application layouts are the basic building blocks of a mobile application.",
    ),
    Page(
      "Chats",
      "chats",
      const ChatsPage(),
      "Chat is a real-time communication tool that allows users to send and receive messages instantly.",
    ),
    Page(
      "File Upload",
      "file-upload",
      const FileUploadPage(),
      "The file upload pattern combines File uploader, File card, and Button components with other context-dependent components to enable users to upload files from their device to a platform, server, or Form.",
    ),
    Page(
      "Wizard",
      "Wizard",
      const WizardPage(),
      "A wizard component displays progress through a sequence of steps.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    setPageTitle('Getting started', context);
    return MaterialApp(
      showSemanticsDebugger: Provider.of<ThemeProvider>(
        context,
      ).isSemanticsOn,
      routes: {
        // '/': (context) => /*kIsWeb ?*/ GettingStarted(), // : const FlutterComponents(),
        for (var page in pages) "/" + page.path: (context) => page.page,
        for (var page in patternPages) "/" + page.path: (context) => page.page,
      },
      theme: defaultVTheme.primaryTheme,
      darkTheme: defaultVTheme.primaryThemeDark,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      home: PopScope(
        onPopInvoked: (didPop) {
          ScaffoldMessenger.of(context).clearSnackBars();
        },
        child: Scaffold(
          key: _key,
          appBar: CustomAppBar(globalKey: _key, title: "Getting Started"),
          drawer: const MyDrawer(
            pageTitle: "Getting started",
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.222),
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.blue,
                                Colors.red,
                                Colors.yellow,
                              ],
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "VPDS Nova | Flutter",
                              style: defaultVTheme.textStyles.display1.copyWith(
                                color: VColors.defaultAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: kIsWeb ? null : 32,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "The latest VPDS Flutter components utilizing our new Nova theme.",
                                style: defaultVTheme.textStyles.baseTextStyle
                                    .copyWith(
                                  color: VColors.defaultTextSubtle,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const VDivider(),
                  //! Package section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text("Package",
                        style: defaultVTheme.textStyles.headline2),
                  ),
                  Text.rich(
                    TextSpan(
                      style: defaultVTheme.textStyles.baseTextStyle,
                      children: [
                        const TextSpan(
                          text: "This package contains ",
                        ),
                        TextSpan(
                          text: "VPDS Nova Flutter component library",
                          style: defaultVTheme.textStyles.baseTextStyle
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                            text:
                                " and a demo app showcasing those components.")
                      ],
                    ),
                  ),
                  smallHeight(),
                  Text.rich(
                    TextSpan(
                      style: defaultVTheme.textStyles.baseTextStyle,
                      children: [
                        const TextSpan(
                          text:
                              "The Flutter component library follows the design on Figma: ",
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: VLink(
                            title: "Nova Figma design",
                            isUnderlined: true,
                            onPressed: () {
                              // launchUrl(
                              //   Uri.parse(
                              //     'https://www.figma.com/file/TB1cnlCjIcJV6NfWCNp7KH/Nova%3A-Mobile-components',
                              //   ),
                              //   mode: LaunchMode.externalApplication,
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  smallHeight(),
                  SelectableText(
                    "Currently there are 29 components with dev complete in this library.",
                    style: defaultVTheme.textStyles.baseTextStyle,
                  ),
                  smallHeight(),
                  SelectableText(
                    "The library will be continuously updated and there will be more components added to it.",
                    style: defaultVTheme.textStyles.baseTextStyle,
                  ),
                  const VDivider(
                    dividerType: VDividerType.decorative,
                  ),
                  //! Version section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Version",
                      style: defaultVTheme.textStyles.headline2,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      style: defaultVTheme.textStyles.baseTextStyle,
                      children: [
                        const TextSpan(
                          text:
                              "Version number reflects the number of built components. Currently our version number is ",
                        ),
                        TextSpan(
                            text: versionNumber,
                            style: defaultVTheme.textStyles.baseTextStyle
                                .copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const VDivider(
                    dividerType: VDividerType.decorative,
                  ),
                  //! How to install section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "How to install",
                      style: defaultVTheme.textStyles.headline2,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      style: defaultVTheme.textStyles.baseTextStyle,
                      children: [
                        const TextSpan(
                          text:
                              "To use this package, you need to set up your environment for Artifactory, see: ",
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: VLink(
                            title:
                                "Artifactory for Dart Flutter packages setup",
                            isUnderlined: true,
                            onPressed: () {
                              // launchUrl(
                              //   Uri.parse(
                              //     'https://visawiki.trusted.visa.com/pages/viewpage.action?pageId=1158164839',
                              //   ),
                              //   mode: LaunchMode.externalApplication,
                              // );
                            },
                          ),
                        ),
                        const TextSpan(
                          text: " to learn more.",
                        ),
                      ],
                    ),
                  ),
                  smallHeight(),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: HighlightView(
                        importCode,
                        language: 'yaml',
                        theme: a11yDarkTheme,
                        padding: const EdgeInsets.all(12),
                        textStyle: const TextStyle(
                            fontFamily: 'Monospace', fontSize: 16),
                      ),
                    ),
                  ),
                  const VDivider(
                    dividerType: VDividerType.decorative,
                  ),
                  //! Changelog section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Changelog",
                      style: defaultVTheme.textStyles.headline2,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      style: defaultVTheme.textStyles.baseTextStyle,
                      children: [
                        const TextSpan(
                          text:
                              "To view the changelog of our Visa Nova Flutter library, see: ",
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: VLink(
                            title: "VPDS Flutter CHANGELOG.md",
                            isUnderlined: true,
                            onPressed: () {
                              // launchUrl(
                              //   Uri.parse(
                              //     'https://stash.trusted.visa.com:7990/projects/VC/repos/nova-flutter/browse/CHANGELOG.md',
                              //   ),
                              //   mode: LaunchMode.externalApplication,
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VDivider(
                    dividerType: VDividerType.decorative,
                  ),
                  //! Theming section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Theming",
                      style: defaultVTheme.textStyles.headline2,
                    ),
                  ),
                  Text(
                    "There are two types of theming that can be performed using our library: App level theming and widget style sheet theming. For widget level theming, simply add 'style' property in your widget. For app level theming,ere is an example: \n",
                    style: defaultVTheme.textStyles.baseTextStyle,
                  ),
                  Text(
                    "Under your MaterialApp(), add both light and dark theme:",
                    style: defaultVTheme.textStyles.baseTextStyle,
                  ),
                  smallHeight(),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: HighlightView(
                        lightDarkThemeCode,
                        language: 'dart',
                        theme: a11yDarkTheme,
                        padding: const EdgeInsets.all(12),
                        textStyle: const TextStyle(
                            fontFamily: 'Monospace', fontSize: 16),
                      ),
                    ),
                  ),
                  mediumHeight(),
                  Text(
                    "Add provider package in your pubspec.yaml. In your main.dart file, create a ThemeProvider, provide your themeData, and wrap your app with it:",
                    style: defaultVTheme.textStyles.baseTextStyle,
                  ),
                  mediumHeight(),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: HighlightView(
                        appLevelThemeCode,
                        language: 'dart',
                        theme: a11yDarkTheme,
                        padding: const EdgeInsets.all(12),
                        textStyle: const TextStyle(
                            fontFamily: 'Monospace', fontSize: 16),
                      ),
                    ),
                  ),
                  mediumHeight(),
                  Text(
                    "Then in anywhere of your code, call themeProvider.switchLightTheme() and themeProvider.switchDarkTheme() to switch the theme.",
                    style: defaultVTheme.textStyles.baseTextStyle,
                  ),
                  mediumHeight(),
                  Text(
                    "In the code example above, you will notice that font is now customizable. But don't forget to add your fonts in your pubspec.yaml:",
                    style: defaultVTheme.textStyles.baseTextStyle,
                  ),
                  mediumHeight(),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: HighlightView(
                        fontYaml,
                        language: 'yaml',
                        theme: a11yDarkTheme,
                        padding: const EdgeInsets.all(12),
                        textStyle: const TextStyle(
                            fontFamily: 'Monospace', fontSize: 16),
                      ),
                    ),
                  ),
                ])),
          ),
        ),
      ),
    );
  }
}
