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
import 'dart:convert';

import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
import 'package:intl/intl.dart'; // Import the intl package

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _chat_key = GlobalKey();

  List<String> iconPopUpMenuItems = [
    "Pin chat",
    "Start a new chat",
    "Download",
    "Share conversation",
    "Delete chat",
  ];

  List<String> iconItems = [
    VIcons.pinOutlineTiny,
    VIcons.addAltLow,
    VIcons.fileDownloadTiny,
    VIcons.shareTiny,
    VIcons.deleteTiny
  ];

  List<String> panelItems = [
    "Attachment files",
    "Add photos",
    "Open camera",
    "Record audio",
  ];

  List<String> panelIconItems = [
    VIcons.attachmentTiny,
    VIcons.questionTiny, //!photo is not in the current icon set
    VIcons.cameraTiny,
    VIcons.microphoneTiny,
  ];

  @override
  Widget build(BuildContext context) {
    setPageTitle('Chats', context);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        drawer: const MyDrawer(pageTitle: "Chats"),
        appBar: CustomAppBar(
          globalKey: _key,
          title: "Chats",
        ),
        backgroundColor: VColors.alternateActiveDark,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ChatFrame(
                scaffoldKey: _chat_key,
              ) /*Scaffold(
              key: _chat_key,
              resizeToAvoidBottomInset: true,
              drawer: /*const ChatNavDrawer(),*/
                  const ChatDrawer(), //! Can't use VNavDrawer here due to sizing issues
              appBar: VAppBar(
                title: const Text("Chat name"),
                leading: Semantics(
                  label: "Menu",
                  button: true,
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    splashColor: VColors.defaultSurfaceLowlight,
                    child: Container(
                      width: 44,
                      height: 44,
                      padding: const EdgeInsets.all(16),
                      child: const ExcludeSemantics(
                        child: VIcon(
                          iconColor: VColors.defaultActive,
                          svgIcon: VIcons.menuLow,
                          iconHeight: 24,
                          iconWidth: 24,
                        ),
                      ),
                    ),
                    onTap: () {
                      _chat_key.currentState?.openDrawer();
                    },
                  ),
                ),
                actionList: [
                  ChatDropDown(
                    itemBuilder: (BuildContext context) {
                      return List<PopupMenuEntry<String>>.generate(
                          iconPopUpMenuItems.length, (index) {
                        return PopupMenuItem<String>(
                          value: iconPopUpMenuItems[index],
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              VIcon(
                                svgIcon: iconItems[index],
                                iconColor: index + 1 == iconItems.length
                                    ? VColors.negativeGraphics
                                    : VColors.alternateSurface3Dark,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                iconPopUpMenuItems[index],
                                style: TextStyle(
                                  color: index + 1 == iconItems.length
                                      ? VColors.negativeText
                                      : VColors.alternateSurface3Dark,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList();
                    },
                    onSelected: (_) {},
                  )
                ],
              ),
              body: Stack(
                children: [
                  Listener(
                    behavior: HitTestBehavior.opaque,
                    onPointerDown: (_) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Welcome!",
                                textAlign: TextAlign.left,
                                style: defaultVTheme.textStyles.headline3),
                            Text(
                              "I'm your friendly AI chatbot, here to assist you. I'm powered by artificial intelligence, which allows me to learn and adapt to better serve your needs. Our conversations are stored to improve our services, but you have the right to access, correct, or delete your personal information at any time.",
                              textAlign: TextAlign.left,
                              style: defaultVTheme.textStyles.bodyText2,
                            ),
                          ],
                        ),
                        color: Colors.transparent,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Spacer(),
                      Row(
                        children: [
                          ChatAddButton(
                            panelItems: panelItems,
                            panelIconItems: panelIconItems,
                          ),
                          Expanded(
                            child: VInput(
                              inputAction: TextInputAction.newline,
                              expand: true,
                              flexHeight: true,
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () {},
                              child: SizedBox(
                                height: 46,
                                width: 46,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: VIcon(
                                    svgIcon: VIcons.sendLow,
                                    iconColor: VColors.defaultActiveSubtle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom > 20
                            ? 10
                            : 32,
                      ),
                    ],
                  ),
                ],
              ),
            ),*/
              ),
        ),
      ),
    );
  }
}

class ChatAddButton extends StatelessWidget {
  const ChatAddButton({
    super.key,
    required this.panelItems,
    required this.panelIconItems,
  });

  final List<String> panelItems;
  final List<String> panelIconItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
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
                    isFullScreen: false,
                    child: ListView(
                      shrinkWrap: true,
                      children: List.generate(
                        panelItems.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: VListItem(
                            child: Row(
                              children: [
                                VIcon(
                                  svgIcon: panelIconItems[index],
                                  iconColor: VColors.defaultActiveSubtle,
                                  iconHeight: 24,
                                  iconWidth: 24,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  panelItems[index],
                                  style: defaultVTheme.textStyles.uiLabelLarge,
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                    // ),
                  ),
                ],
              );
            },
          );
        },
        child: SizedBox(
          height: 46,
          width: 46,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: VIcon(
              svgIcon: VIcons.addLow,
              iconColor: VColors.defaultActiveSubtle,
            ),
          ),
        ),
      ),
    );
  }
}

class ChatDrawer extends StatelessWidget {
  const ChatDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: VColors.defaultSurface1,
        child: Padding(
          padding: const EdgeInsets.only(top: 53, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! No close button in the design file, might not align with a11y
                    /*Padding(
                      padding:
                          const EdgeInsets.all(0), //fromLTRB(0, 4, 4, 0),
                      child: Row(
                        children: [
                          const Spacer(),
                          Material(
                            color: VColors.transparent,
                            child: MergeSemantics(
                              child: Semantics(
                                label: "Close",
                                button: true,
                                child: InkWell(
                                  highlightColor: VColors.transparent,
                                  customBorder: const CircleBorder(),
                                  splashColor: VColors.defaultSurfaceLowlight,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 44,
                                    height: 44,
                                    padding: const EdgeInsets.fromLTRB(
                                        14, 14, 14, 14),
                                    child: VIcon(
                                      svgIcon: VIcons.closeTiny,
                                      iconColor: VColors.defaultActiveSubtle
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),*/
                    Text(
                      "Chat Application",
                      textAlign: TextAlign.left,
                      style: defaultVTheme.textStyles.subtitle1.copyWith(
                        color: VColors.defaultAccent,
                      ),
                    ),
                    const SizedBox(height: 25),
                    VInput(
                      inputAction: TextInputAction.newline,
                      expand: true,
                      flexHeight: true,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      hintText: "Search",
                      prefix: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: VIcon(
                          svgIcon: VIcons.searchLow,
                          iconHeight: 24,
                          iconWidth: 24,
                          iconColor: VColors.defaultAccent,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const VDivider(
                dividerType: VDividerType.decorative,
              ),
              const SizedBox(
                height: 11,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    shrinkWrap: true,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text("PINNED CHATS",
                            textAlign: TextAlign.left,
                            style: defaultVTheme.textStyles.overline),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      VListItem(
                        child: Row(
                          children: [
                            const VIcon(
                              svgIcon: VIcons.pinFillTiny,
                              iconColor: VColors.defaultAccent,
                              iconHeight: 20,
                              iconWidth: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "How do I reset my password",
                                textAlign: TextAlign.left,
                                style: defaultVTheme.textStyles.uiLabelLarge
                                    .copyWith(
                                  color: VColors.defaultTextSubtle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () => {},
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text("2 DAYS AGO",
                            textAlign: TextAlign.left,
                            style: defaultVTheme.textStyles.overline),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      VListItem(
                        child: Text(
                          "How to change password?",
                          textAlign: TextAlign.left,
                          style: defaultVTheme.textStyles.uiLabelLarge.copyWith(
                            color: VColors.defaultTextSubtle,
                          ),
                        ),
                        onTap: () => {},
                      ),
                      VListItem(
                        child: Text(
                          "What's a BIN?",
                          textAlign: TextAlign.left,
                          style: defaultVTheme.textStyles.uiLabelLarge.copyWith(
                            color: VColors.defaultTextSubtle,
                          ),
                        ),
                        onTap: () => {},
                      ),
                    ],
                  )),
              const Spacer(),
              const SizedBox(
                height: 11,
              ),
              const VDivider(
                dividerType: VDividerType.decorative,
              ),
              const SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: VButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const VIcon(
                          svgIcon: VIcons.addTiny,
                          iconColor: VColors.defaultAccent,
                          iconHeight: 20,
                          iconWidth: 20,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Start new chat",
                          style: defaultVTheme.textStyles.buttonMedium.copyWith(
                            color: VColors.defaultActive,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                    style: VButtonStyle(
                      backgroundColorActive: VColors.transparent,
                      backgroundColorDisabled: VColors.transparent,
                      foregroundColorActive: VColors.defaultActive,
                      foregroundColorDisabled: VColors.disabled,
                      overlayColorFocused: VColors.defaultSurfaceLowlight,
                      overlayColorPressed: VColors.defaultSurfaceLowlight,
                      borderSideActive: const BorderSide(
                        color: VColors.defaultActive,
                        style: BorderStyle.solid,
                      ),
                      borderSideDisabled: BorderSide(
                        color: VColors.defaultDisabled,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class ChatNavDrawer extends StatefulWidget {
  const ChatNavDrawer({super.key});

  @override
  State<ChatNavDrawer> createState() => _ChatNavDrawerState();
}

class _ChatNavDrawerState extends State<ChatNavDrawer> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VNavDrawer(
      header: Theme(
        data: Theme.of(context).copyWith(
          dividerTheme: const DividerThemeData(
            color: Colors.transparent,
          ),
        ),
        // Example of Visa style drawer header
        child: SizedBox(
          height: MediaQuery.paddingOf(context).top + 200,
          child: DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 4, 0),
                  child: Row(
                    children: [
                      const Spacer(),
                      Material(
                        color: VColors.transparent,
                        child: MergeSemantics(
                          child: Semantics(
                            label: "Close",
                            button: true,
                            child: InkWell(
                              highlightColor: VColors.transparent,
                              customBorder: const CircleBorder(),
                              splashColor: VColors.defaultSurfaceLowlight,
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 44,
                                height: 44,
                                padding:
                                    const EdgeInsets.fromLTRB(14, 14, 14, 14),
                                child: VIcon(
                                  svgIcon: VIcons.closeTiny,
                                  iconColor: VColors.defaultActiveSubtle
                                      .withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chat Application",
                        textAlign: TextAlign.left,
                        style: defaultVTheme.textStyles.subtitle1.copyWith(
                          color: VColors.defaultAccent,
                        ),
                      ),
                      const SizedBox(height: 25),
                      VInput(
                        // inputAction: TextInputAction.newline,
                        // expand: true,
                        // flexHeight: true,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        hintText: "Search",
                        prefix: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: VIcon(
                            svgIcon: VIcons.searchLow,
                            iconHeight: 24,
                            iconWidth: 24,
                            iconColor: VColors.defaultAccent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const VDivider(
                  dividerType: VDividerType.decorative,
                ),
                const SizedBox(
                  height: 11,
                ),
              ],
            ),
          ),
        ),
      ),
      // Drawer items
      vNavDrawerSections: [
        /*VNavDrawerSection(
          title: 'SECTION TITLE 1',
          items: [
            VNavDrawerItem(
              label: "L1 label 1",
            ),
            VNavDrawerItem(
              label: "L1 label 2",
            ),
            VNavDrawerItem(
              label: "L1 label 3",
            ),
          ],
        ),
        VNavDrawerSection(
          title: 'SECTION TITLE 2',
          items: [
            VNavDrawerItem(
              label: "L1 label 4",
            ),
            VNavDrawerItem(
              label: "L1 label 5",
            ),
          ],
        ),*/
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      // Example of bottom items
      bottomItems: MergeSemantics(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: VDivider(
                dividerType: VDividerType.decorative,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                horizontalTitleGap: 10,
                minLeadingWidth: 10,
                leading: const VIcon(
                  iconHeight: 20,
                  iconWidth: 20,
                  svgIcon: VIcons.accountTiny,
                  iconColor: VColors.defaultActive,
                ),
                title: Text(
                  "Alex Miller",
                  style: defaultVTheme.textStyles.uiLabelLarge,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class ChatDropDown extends StatelessWidget {
  const ChatDropDown({
    Key? key,
    required this.itemBuilder,
    required this.onSelected,
  }) : super(key: key);

  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  final void Function(dynamic) onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: VDropdownIcon(
            itemBuilder: itemBuilder,
            onSelected: onSelected,
            icons: const Icon(
              Icons.more_vert_sharp,
              color: VColors.defaultAccent,
              size: 30,
            ),
            style: const VDropdownIconStyle(
              buttonDefaultColor: VColors.alternateAccent,
              tappedButtonColor: VColors.defaultActiveDark,
              defaultBorderColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}

class ChatFrame extends StatefulWidget {
  const ChatFrame({
    super.key,
    required this.scaffoldKey, // Make the key required
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<ChatFrame> createState() => _ChatFrameState();
}

class _ChatFrameState extends State<ChatFrame> {
  List<String> panelItems = [
    "Attachment files",
    "Add photos",
    "Open camera",
    "Record audio",
  ];

  List<String> panelIconItems = [
    VIcons.attachmentTiny,
    VIcons.questionTiny, //!photo is not in the current icon set
    VIcons.cameraTiny,
    VIcons.microphoneTiny,
  ];
  List<String> iconPopUpMenuItems = [
    "Pin chat",
    "Start a new chat",
    "Download",
    "Share conversation",
    "Delete chat",
  ];

  List<String> iconItems = [
    VIcons.pinOutlineTiny,
    VIcons.addAltLow,
    VIcons.fileDownloadTiny,
    VIcons.shareTiny,
    VIcons.deleteTiny
  ];

  List<dynamic> chatSession = [];

  @override
  void initState() {
    super.initState();
    loadChatData();
  }

  Future<void> loadChatData() async {
    final String response =
        await rootBundle.loadString('assets/chat/chat1.json');
    final data = await json.decode(response);
    setState(() {
      chatSession = data['chatSession'];
    });
  }

  String formatDateTime(String dateTimeStr) {
    DateTime dateTime = DateTime.parse(dateTimeStr);
    return DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      drawer: const ChatDrawer(),
      appBar: VAppBar(
        title: const Text("Chat name"),
        leading: Semantics(
          label: "Menu",
          button: true,
          child: InkWell(
            customBorder: const CircleBorder(),
            splashColor: VColors.defaultSurfaceLowlight,
            child: Container(
              width: 44,
              height: 44,
              padding: const EdgeInsets.all(16),
              child: const ExcludeSemantics(
                child: VIcon(
                  iconColor: VColors.defaultActive,
                  svgIcon: VIcons.menuLow,
                  iconHeight: 24,
                  iconWidth: 24,
                ),
              ),
            ),
            onTap: () {
              widget.scaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        actionList: [
          ChatDropDown(
            itemBuilder: (BuildContext context) {
              return List<PopupMenuEntry<String>>.generate(
                  iconPopUpMenuItems.length, (index) {
                return PopupMenuItem<String>(
                  value: iconPopUpMenuItems[index],
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VIcon(
                        svgIcon: iconItems[index],
                        iconColor: index + 1 == iconItems.length
                            ? VColors.negativeGraphics
                            : VColors.alternateSurface3Dark,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        iconPopUpMenuItems[index],
                        style: TextStyle(
                          color: index + 1 == iconItems.length
                              ? VColors.negativeText
                              : VColors.alternateSurface3Dark,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList();
            },
            onSelected: (_) {},
          )
        ],
      ),
      backgroundColor: VColors.defaultSurface1,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              reverse: true,
              itemCount: chatSession.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
                var message = chatSession[index];
                return Align(
                  alignment: message["username"] != "Alex"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: message["username"] != "Alex"
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            tileColor: message["username"] != "Alex"
                                ? Colors.black12
                                : Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Text(
                              message['username'],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: message["username"] != "Alex"
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message['message'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: message["username"] != "Alex"
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          formatDateTime(message['time']),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ), // <- Chat list view
          ),
          UserChatField(
            panelIconItems: panelIconItems,
            panelItems: panelItems,
          ),
        ],
      ),
    );
  }
}

class UserChatField extends StatelessWidget {
  const UserChatField({
    super.key,
    required this.panelItems,
    required this.panelIconItems,
  });

  final List<String> panelItems;
  final List<String> panelIconItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: VColors.defaultSurface1,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 10),
        child: Row(
          children: [
            ChatAddButton(
              panelItems: panelItems,
              panelIconItems: panelIconItems,
            ),
            Expanded(
              child: VInput(
                inputAction: TextInputAction.newline,
                expand: true,
                flexHeight: true,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: VIcon(
                      svgIcon: VIcons.sendLow,
                      iconColor: VColors.defaultActiveSubtle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
