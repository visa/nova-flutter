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
// Visa Nova Flutter Demo Application Layout Page
// BEGIN ApplicationLayoutPage
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// Demo app imports
import 'package:demo/main.dart';

enum Group1 { g1l1, g1l2, g1l3 }

class ApplicationLayoutPage extends StatefulWidget {
  const ApplicationLayoutPage({super.key});

  @override
  State<ApplicationLayoutPage> createState() => _ApplicationLayoutPageState();
}

class _ApplicationLayoutPageState extends State<ApplicationLayoutPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> layoutKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Application Layout', context);

    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(
          globalKey: _key,
          title: "Application Layout",
        ),
        backgroundColor: VColors.alternateActiveDark,
        drawer: const MyDrawer(pageTitle: "Application Layout"),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AppLayoutFrame(
              scaffoldKey: layoutKey,
            ),
          ),
        ),
      ),
    );
  }
}

class AppLayoutFrame extends StatefulWidget {
  const AppLayoutFrame({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<AppLayoutFrame> createState() => _AppLayoutFrameState();
}

class _AppLayoutFrameState extends State<AppLayoutFrame> {
  int _selectedIndex = 0;
  bool successBannerDefault = true;
  bool showSectionMessage = true;
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  String defaultHint = ("Option");
  String? defaultOption;
  Group1? _group1;
  List<String> options = const [
    'Option A',
    'Option B',
    'Option C',
    'Option D',
    'Option E',
  ];
  List<Map<String, dynamic>> dataList = [
    {"title": "Label 1"},
    {"title": "Label 2"},
    {"title": "Label 3"},
    {"title": "Label 4"},
  ];
  List selectedOptions = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print("Tab $index tapped. Updated _selectedIndex to $_selectedIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: const VAppBarDefault(),
      backgroundColor: VColors.defaultSurface2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            VBannerSuccessDefault(
              visible: successBannerDefault,
              onLinkPressed: () {
                setState(() {
                  successBannerDefault = false;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Form title",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "This is an optional description telling the user what to expect.",
                    style: defaultVTheme.textStyles.bodyText2,
                  ),
                  const SizedBox(height: 20),
                  LayoutSectionMessage(
                    successMessagePersistentOn: showSectionMessage,
                  ),
                  const SizedBox(height: 20),
                  VInputDefault(
                    controller: controller1,
                  ),
                  const SizedBox(height: 20),
                  VInputDefault(
                    controller: controller2,
                  ),
                  const SizedBox(height: 20),
                  VSelectDefault(
                    defaultHint: Text(
                      defaultHint,
                      style: defaultVTheme.textStyles.bodyText2,
                    ),
                    itemBuilder: (BuildContext context) {
                      return options.map((String item) {
                        return PopupMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: defaultVTheme.textStyles.bodyText2,
                          ),
                        );
                      }).toList();
                    },
                    pressed: ((p0) {
                      setState(() {
                        defaultHint = p0;
                      });
                    }),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text('Group label (required)',
                        style: defaultVTheme.textStyles.uiLabel),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: dataList.length,
                    itemBuilder: (context, index) => CheckBox(
                      isChecked: selectedOptions.contains(dataList[index]),
                      onChanged: (value) {
                        setState(() {
                          value!
                              ? selectedOptions.add(dataList[index])
                              : selectedOptions.remove(dataList[index]);
                        });
                      },
                      title: dataList[index]["title"],
                    ),
                  ),
                  const SizedBox(height: 20),
                  VInputDefault(
                    controller: controller3,
                    isExpanded: true,
                    showScrollbar: true,
                    maxNumOfLines: 5,
                  ),
                  const SizedBox(height: 20),
                  GroupRadio(
                    onChanged: (Group1? value) {
                      setState(() {
                        _group1 = value;
                      });
                    },
                    group1: _group1,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    spacing: 20,
                    children: [
                      LayoutVButton(
                        title: "Submit",
                        onPressed: () {},
                      ),
                      LayoutVButton(
                        isPrimary: false,
                        isSecondary: true,
                        title: "Save",
                        onPressed: () {},
                      ),
                      LayoutVButton(
                        isPrimary: false,
                        isSecondary: false,
                        isTertiary: true,
                        title: "Cancel",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const VDialogInformational()
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class VDialogInformational extends StatelessWidget {
  const VDialogInformational({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutVButton(
      isPrimary: false,
      isSecondary: true,
      title: "Show dialog",
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.white,
                child: const VDialogContent(
                  hasX: true,
                  dialogState: DialogState.normal,
                  title: "Default title",
                  description:
                      "This is required text that describes the dialog title in more detail.",
                  actionText: "Primary action",
                  dismissText: "Close",
                ),
              );
            });
      },
    );
  }
}

class LayoutVButton extends StatelessWidget {
  const LayoutVButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isPrimary = true,
    this.isSecondary = false,
    this.isTertiary = false,
  });

  final String title;
  final void Function()? onPressed;
  final bool isPrimary;
  final bool isSecondary;
  final bool isTertiary;

  @override
  Widget build(BuildContext context) {
    return VButton(
      child: Text(
        title,
        style: defaultVTheme.textStyles.buttonMedium.copyWith(
          color: isPrimary ? VColors.defaultSurface1 : VColors.defaultActive,
        ),
      ),
      onPressed: onPressed,
      style: isPrimary
          ? null
          : VButtonStyle(
              backgroundColorActive: VColors.transparent,
              backgroundColorDisabled: VColors.transparent,
              foregroundColorActive: VColors.defaultActive,
              foregroundColorDisabled: VColors.disabled,
              overlayColorFocused: VColors.defaultSurfaceLowlight,
              overlayColorPressed: VColors.defaultSurfaceLowlight,
              borderSideActive: isTertiary
                  ? null
                  : const BorderSide(
                      color: VColors.defaultActive,
                      style: BorderStyle.solid,
                    ),
              borderSideDisabled: isTertiary
                  ? null
                  : BorderSide(
                      color: VColors.defaultDisabled,
                      style: BorderStyle.solid,
                    ),
            ),
    );
  }
}

class GroupRadio extends StatelessWidget {
  const GroupRadio(
      {super.key, required this.onChanged, required Group1? group1})
      : _group1 = group1;

  final Group1? _group1;
  final void Function(Group1?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text('Group label (required)',
              style: defaultVTheme.textStyles.uiLabel),
        ),
        VRadio<Group1>(
          title: "Label 1",
          value: Group1.g1l1,
          groupValue: _group1,
          onChanged: onChanged,
        ),
        VRadio<Group1>(
          title: "Label 2",
          value: Group1.g1l2,
          groupValue: _group1,
          onChanged: onChanged,
        ),
        VRadio<Group1>(
          title: "Label 3",
          value: Group1.g1l3,
          groupValue: _group1,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class CheckBox extends StatelessWidget {
  const CheckBox({
    super.key,
    required this.isChecked,
    this.onChanged,
    required this.title,
  });

  final bool isChecked;
  final void Function(bool?)? onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return VCheckboxTile(
      titleStyle: defaultVTheme.textStyles.uiLabelLarge.copyWith(
        color: VColors.defaultText,
      ),
      isChecked: isChecked,
      onChanged: onChanged,
      title: title,
    );
  }
}

class VSelectDefault extends StatelessWidget {
  const VSelectDefault({
    Key? key,
    required this.defaultHint,
    required this.itemBuilder,
    required this.pressed,
  }) : super(key: key);

  final Widget defaultHint;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;
  final Function(dynamic)? pressed;

  @override
  Widget build(BuildContext context) {
    return VSelect(
      style: VSelectStyle(
        dropdownWidth: MediaQuery.of(context).size.width - 52,
      ),
      itemBuilder: itemBuilder,
      headerLabel: "Label (required)",
      onSelected: pressed,
      buttonText: (defaultHint),
    );
  }
}

class VInputDefault extends StatelessWidget {
  const VInputDefault({
    Key? key,
    required this.controller,
    this.isExpanded = false,
    this.showScrollbar = false,
    this.maxNumOfLines = 1,
  }) : super(key: key);

  final TextEditingController controller;
  final bool isExpanded, showScrollbar;
  final int maxNumOfLines;

  @override
  Widget build(BuildContext context) {
    return VInput(
      myLocalController: controller,
      topLabelText: "Label (required)",
      maxNumOfLines: maxNumOfLines,
      expand: isExpanded,
      showScrollbar: showScrollbar,
      style: VInputStyle(
        topLabelTextStyle: defaultVTheme.textStyles.uiLabel,
        textFieldColor: VColors.defaultSurface1,
      ),
      inputAction: TextInputAction.send,
    );
  }
}

class LayoutSectionMessage extends StatelessWidget {
  const LayoutSectionMessage({
    super.key,
    required this.successMessagePersistentOn,
  });

  final bool successMessagePersistentOn;

  @override
  Widget build(BuildContext context) {
    return VSectionMessage(
      sectionMessageState: SectionMessageState.success,
      description:
          "This is required text that describes the section message in more detail.",
      visible: successMessagePersistentOn,
    );
  }
}

class VBannerSuccessDefault extends StatelessWidget {
  const VBannerSuccessDefault({
    Key? key,
    required this.visible,
    this.onClosePressed,
    this.onLinkPressed,
    this.onActionPressed,
  }) : super(key: key);
  final bool visible;
  final Function()? onClosePressed, onLinkPressed, onActionPressed;
  @override
  Widget build(BuildContext context) {
    return VBanner(
      bannerState: BannerState.success,
      description:
          "This is required text that describes the banner in more detail.",
      hasLink: true,
      link: "Close  ",
      onLinkPressed: onLinkPressed,
      visible: visible,
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  final int selectedIndex;
  final dynamic Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return VBottomNavBar(
      visaBottomNavBarItems: [
        VBottomBarItems(
          icon: VIcons.homeLow,
          label: 'Label 1',
        ),
        VBottomBarItems(
          icon: VIcons.historyLow,
          label: 'Label 2',
        ),
        VBottomBarItems(
          icon: VIcons.settingsLow,
          label: 'Label 3',
        ),
        VBottomBarItems(
          icon: VIcons.reportLow,
          label: 'Label 4',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onTap,
    );
  }
}

class VAppBarDefault extends StatelessWidget implements PreferredSizeWidget {
  const VAppBarDefault({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return VAppBar(
      backButtonAction: () {
        Navigator.pop(context);
      },
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
          onTap: () {},
        ),
      ),
      title: Semantics(
        label: "Visa Top App Bar",
        child: const VIconAsset(
          svgIcon: "assets/icons/visa.svg",
          iconHeight: 23,
          iconWidth: 71,
        ),
      ),
      actionList: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 4, 16, 4),
          child: Semantics(
            label: "Profile",
            button: true,
            child: InkWell(
              customBorder: const CircleBorder(),
              splashColor: VColors.defaultSurfaceLowlight,
              child: Container(
                width: 48,
                height: 48,
                padding: const EdgeInsets.all(12),
                child: const ExcludeSemantics(
                  child: VIcon(
                    svgIcon: VIcons.accountLow,
                    iconColor: VColors.defaultActive,
                    iconHeight: 24,
                    iconWidth: 24,
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}


// END