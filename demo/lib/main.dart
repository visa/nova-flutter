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
import 'package:demo/patterns/application_layout.dart';
import 'package:demo/patterns/chats.dart';
import 'package:demo/patterns/file_upload.dart';
import 'package:demo/patterns/wizard.dart';
import 'package:demo/ui/accordion/accordion.dart';
import 'package:demo/ui/avatar/avatar.dart';
import 'package:demo/ui/badge/badge.dart';
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
import 'package:demo/utilities.dart';
import 'package:demo/ui/typography/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo/ui/checkboxes/checkbox.dart';
import 'package:demo/ui/tabs/tab_horizontal.dart';
import 'package:demo/ui/tabs/tab_stacked.dart';
import 'package:demo/ui/buttons/buttons.dart';
import 'package:demo/ui/links/links.dart';
import 'package:demo/ui/banners/banners.dart';
import 'package:demo/ui/dialogs/dialogs.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
import "package:demo/ui/section_messages/section_messages.dart";
import 'package:demo/ui/tab_bar/tab_bar.dart';
import 'package:demo/ui/app_bar/app_bar.dart';
import 'package:demo/ui/content_card/content_card.dart';
import 'package:demo/ui/getting_started/getting_started.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class SemanticsSwitch extends ChangeNotifier {
  bool _isOn = false;

  bool get isOn => _isOn;

  void toggle() {
    _isOn = !_isOn;
    notifyListeners();
  }
}

class ThemeProvider with ChangeNotifier {
  VDef vDef = VDef();
  bool isDefaultLightTheme = true;
  bool isDefaultDarkTheme = true;
  bool setSemantics = false;

  // ThemeProvider() {
  //   defaultVTheme = VTheme(fontFamily: "Raleway");
  // }

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
    notifyListeners();
  }

  final customLightTheme = VDefaultThemeProps(
    active: const Color(0xFF288756),
    activePressed: const Color(0xFFE5BC18),
    surfaceLowlight: const Color(0xFFEAF6D7),
    text: VColors.defaultText,
    textSubtle: VColors.defaultTextSubtle,
    vButtonProperties: VButtonProperties(
      minimumSize: const Size(100, 100),
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
    text: VColors.defaultSurface1,
    textSubtle: VColors.defaultTextSubtle,
    vButtonProperties: VButtonProperties(
      minimumSize: const Size(0, 46),
    ),
  );

  void triggerSemantics(bool newValue) {
    newValue = setSemantics;
    notifyListeners();
  }

  // Instance of SemanticsSwitch
  final SemanticsSwitch _semanticsSwitch = SemanticsSwitch();

  // Getter
  bool get isSemanticsOn => _semanticsSwitch.isOn;

  // Method to toggle semantics switch
  void toggleSemanticsSwitch() {
    _semanticsSwitch.toggle();
    notifyListeners(); // Notify listeners about change
  }

  ThemeMode themeMode = ThemeMode.system;

  void toggleTheme(BuildContext context) {
    if (themeMode == ThemeMode.system &&
        Theme.of(context).brightness == Brightness.dark) {
      themeMode = ThemeMode.light;
    } else if (themeMode == ThemeMode.system &&
        Theme.of(context).brightness == Brightness.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode =
          (themeMode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
    }
    notifyListeners();
  }
}

// This function is used to update the page title
void setPageTitle(String title, BuildContext context) {
  SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
    label: title == ""
        ? "Flutter | Visa Product Design System"
        : " $title | Flutter | Visa Product Design System",

    primaryColor: Theme.of(context).primaryColor.value, // This line is required
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  List<Page> pages = [
    Page(
      'Getting Started',
      '/',
      GettingStarted(),
      'Getting started with Visa Nova Design System.',
    ),
    Page(
      "Typography",
      "typography",
      const TypographyPage(),
      "Typography is the visual component of the written word.",
    ),
    Page(
      "Buttons",
      "buttons",
      const Buttons(),
      "Buttons trigger an action/event on press.",
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
      "App Bar",
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => /*kIsWeb ?*/
            GettingStarted(), // : const FlutterComponents(),
        for (var page in pages) "/" + page.path: (context) => page.page,
        for (var page in patternPages) "/" + page.path: (context) => page.page,
      },
    );
  }
}

class Page {
  String description;
  Widget page;
  String path;
  String title;

  Page(this.title, this.path, this.page, this.description);
}

class MyDrawer extends StatefulWidget {
  final String pageTitle;
  const MyDrawer({
    Key? key,
    required this.pageTitle,
  }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List<Page> pages = [
    Page(
      "Buttons",
      "buttons",
      const Buttons(),
      "Buttons trigger an action/event on press.",
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
      "App Bar",
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

  bool showSemantic = false;
  int selectedIndex = 0;
  String? route;

  @override
  void initState() {
    super.initState();
    pages.sort((a, b) => a.title.compareTo(b.title));
    patternPages.sort((a, b) => a.title.compareTo(b.title));
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode currentThemeMode = Provider.of<ThemeProvider>(context).themeMode;
    IconData themeIcon;
    if (currentThemeMode == ThemeMode.dark) {
      themeIcon = Icons.dark_mode;
    } else if (currentThemeMode == ThemeMode.light) {
      themeIcon = Icons.light_mode;
    } else {
      themeIcon = Icons.brightness_auto;
    }

    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: kIsWeb ? 0 : 40,
          ),
          Semantics(
            label: "Close",
            child: SizedBox(
              height: 60,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    icon: const VIcon(
                      svgIcon: VIcons.closeLow,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the drawer
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                "Getting started",
                style: defaultVTheme.textStyles.baseTextStyle,
              ),
              tileColor: widget.pageTitle.toLowerCase() ==
                      "Getting started".toLowerCase()
                  ? VColors.defaultSurfaceLowlight
                  : VColors.transparent,
              onTap: widget.pageTitle.toLowerCase() ==
                      "Getting started".toLowerCase()
                  ? null
                  : () {
                      Navigator.canPop(context) ? Navigator.pop(context) : null;
                      Navigator.of(context).pushReplacementNamed("/");
                    },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                "Typography",
                style: defaultVTheme.textStyles.baseTextStyle,
              ),
              tileColor:
                  widget.pageTitle.toLowerCase() == "Typography".toLowerCase()
                      ? VColors.defaultSurfaceLowlight
                      : VColors.transparent,
              onTap: () {
                Navigator.canPop(context) ? Navigator.pop(context) : null;
                Navigator.of(context).pushReplacementNamed("/typography");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                'Device Theme: ' +
                    (Provider.of<ThemeProvider>(context).themeMode ==
                            ThemeMode.dark
                        ? 'Dark'
                        : Provider.of<ThemeProvider>(context).themeMode ==
                                ThemeMode.light
                            ? 'Light'
                            : 'System'),
                style: defaultVTheme.textStyles.baseTextStyle,
              ),
              trailing: Icon(themeIcon),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ThemeSelectionDialog();
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                'VPDS Theme: ' +
                    (Provider.of<ThemeProvider>(context).isDefaultLightTheme
                        ? 'Light'
                        : 'Dark'),
                style: defaultVTheme.textStyles.baseTextStyle,
              ),
              trailing: VSwitch(
                switchValue:
                    Provider.of<ThemeProvider>(context).isDefaultLightTheme,
                onPressed: () {
                  if (Provider.of<ThemeProvider>(context, listen: false)
                      .isDefaultDarkTheme) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .switchLightTheme();
                  } else {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .switchDarkTheme();
                  }
                },
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Version $versionNumber",
                style: defaultVTheme.textStyles.baseTextStyle.copyWith(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: VDivider(
              dividerType: VDividerType.decorative,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  VAccordion(
                    title: "Patterns",
                    body: Column(
                      children: patternPages.map((page) {
                        return VListItem(
                          child: Text(
                            page.title,
                            style: widget.pageTitle.toLowerCase() ==
                                    page.title.toLowerCase()
                                ? defaultVTheme.textStyles.bodyText2Medium
                                : defaultVTheme.textStyles.baseTextStyle,
                          ),
                          hasTrailingIcon: true,
                          style: VListItemStyle(
                            itemListColor:
                                widget.pageTitle.toLowerCase().contains(
                                          page.title.toLowerCase(),
                                        )
                                    ? VColors.defaultSurfaceLowlight
                                    : VColors.transparent,
                          ),
                          onTap: () {
                            Navigator.canPop(context)
                                ? Navigator.pop(context)
                                : null;
                            route = page.path;
                            Navigator.of(context)
                                .pushReplacementNamed("/$route");
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  VAccordion(
                    title: "Components",
                    body: Column(
                      children: pages.map((page) {
                        return VListItem(
                          child: Text(
                            page.title,
                            style: widget.pageTitle.toLowerCase() ==
                                    page.title.toLowerCase()
                                ? defaultVTheme.textStyles.bodyText2Medium
                                : defaultVTheme.textStyles.baseTextStyle,
                          ),
                          hasTrailingIcon: true,
                          style: VListItemStyle(
                            itemListColor:
                                widget.pageTitle.toLowerCase().contains(
                                          page.title.toLowerCase(),
                                        )
                                    ? VColors.defaultSurfaceLowlight
                                    : VColors.transparent,
                          ),
                          onTap: () {
                            Navigator.canPop(context)
                                ? Navigator.pop(context)
                                : null;
                            route = page.path;
                            Navigator.of(context)
                                .pushReplacementNamed("/$route");
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ! Add:
// - Light / Dark Theme from the app bar
// - Search for component from Drawer (Search bar)
// - Resources page to show, Report issue, Get in touch, Jira link etc.

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> globalKey;
  final String title;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actionList;

  @override
  final Size preferredSize;

  CustomAppBar({
    required this.globalKey,
    required this.title,
    this.bottom,
    this.actionList,
    Size? preferredSize,
  }) : preferredSize = preferredSize ?? const Size.fromHeight(kToolbarHeight);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  Size get preferredSize => widget.preferredSize;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: kIsWeb
          ? VAppBar(
              leading: Semantics(
                label: "Menu",
                child: IconButton(
                  icon: Icon(Icons.menu,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                  onPressed: () {
                    widget.globalKey.currentState!
                        .openDrawer(); // this opens drawer
                  },
                ),
              ),
              title: Row(
                children: [
                  const VIconAsset(
                    svgIcon: "assets/icons/visa.svg",
                    iconHeight: 23,
                    iconWidth: 71,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SemanticHeader(
                    title: widget.title,
                  ),
                ],
              ),
              bottom: widget.bottom,
              actionList: widget.actionList)
          : VAppBar(
              leading: Semantics(
                label: "Menu",
                child: IconButton(
                  icon: Icon(Icons.menu,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black),
                  onPressed: () {
                    widget.globalKey.currentState!
                        .openDrawer(); // this opens drawer
                  },
                ),
              ),
              title: SemanticHeader(
                title: widget.title,
              ),
              bottom: widget.bottom,
              actionList: widget.actionList),
    );
  }
}

class ThemeSelectionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Theme'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: const Text('Light'),
            trailing: const Icon(Icons.light_mode),
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).themeMode =
                  ThemeMode.light;
              Provider.of<ThemeProvider>(context, listen: false)
                  .notifyListeners();
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Dark'),
            trailing: const Icon(Icons.dark_mode),
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).themeMode =
                  ThemeMode.dark;
              Provider.of<ThemeProvider>(context, listen: false)
                  .notifyListeners();
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text('System'),
            trailing: const Icon(Icons.brightness_auto),
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).themeMode =
                  ThemeMode.system;
              Provider.of<ThemeProvider>(context, listen: false)
                  .notifyListeners();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
