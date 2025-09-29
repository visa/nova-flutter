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
// Visa Nova Flutter Demo Combobox Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class Combobox extends StatefulWidget {
  const Combobox({Key? key}) : super(key: key);

  @override
  State<Combobox> createState() => _ComboboxState();
}

class _ComboboxState extends State<Combobox> {
  final withDisabledController = TextEditingController();
  final withReadOnlyController = TextEditingController();
  final withInlineMessageController = TextEditingController();
  final withSelectedController = TextEditingController();
  final onPageSearchComboController = TextEditingController();
  final customComboController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final List<String> _list = [
    "Option A",
    "Option B",
    "Option C",
    "Option D",
    "Option E",
  ];

  @override
  Widget build(BuildContext context) {
    setPageTitle('Combobox', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Combobox"),
        drawer: const MyDrawer(pageTitle: "Combobox"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getHeader("Default comboboxes"),
                largeHeight(),
                _getSubHeader("Default combobox"),
                smallHeight(),
                _getCombobox(),
                mediumHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VComboboxDefault,
                  componentName: 'Combobox',
                  exampleName: 'Default_Combobox',
                  copyLabel: "Default Combobox",
                ),
                mediumHeight(),
                _getSubHeader("Combobox with selected option"),
                smallHeight(),
                VComboboxWithSelectedOption(
                  searchController: withSelectedController,
                  searchList: _list,
                ),
                mediumHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VComboboxWithSelectedOption,
                  componentName: 'Combobox',
                  exampleName: 'Combobox_with_selected_option',
                  copyLabel: "Combobox with selected option",
                ),
                mediumHeight(),
                _getSubHeader("Combobox with inline message"),
                smallHeight(),
                VComboboxWithInlineMessage(
                  searchController: withInlineMessageController,
                  searchList: _list,
                ),
                mediumHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VComboboxWithInlineMessage,
                  componentName: 'Combobox',
                  exampleName: 'Combo_box_with_inline_message',
                  copyLabel: "Combobox with inline message",
                ),
                mediumHeight(),
                _getSubHeader("Read-only combobox"),
                smallHeight(),
                VComboboxReadOnly(
                  searchController: withReadOnlyController,
                  searchList: _list,
                ),
                mediumHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VComboboxReadOnly,
                  componentName: 'Combobox',
                  exampleName: 'Readonly_Combobox',
                  copyLabel: "Readonly Combobox",
                ),
                mediumHeight(),
                _getSubHeader("Disabled combobox"),
                smallHeight(),
                VComboboxDisabled(
                  searchController: withDisabledController,
                  searchList: _list,
                ),
                mediumHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VComboboxDisabled,
                  componentName: 'Combobox',
                  exampleName: 'Disabled_Combobox',
                  copyLabel: "Disabled Combobox",
                ),
                smallHeight(),
                _getSubHeader("Custom combobox"),
                smallHeight(),
                _getCombobox(isDefault: false),
                mediumHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VComboboxDefault,
                  componentName: 'Combobox',
                  exampleName: 'Custom_Combobox',
                  copyLabel: "Custom Combobox",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getCombobox({bool isDefault = true}) {
    return VComboboxDefault(
      style: isDefault
          ? null
          : VComboboxStyle(
              backgroundColor: const Color(0xFFF65036D),
              errorTextColor: const Color(0xFFFFFFFF),
              resultTextColor: const Color(0xFFFFFFFF),
              appBarTitleTextColor: VColors.defaultText,
              listTileColor: VColors.defaultSurface1,
              listTileResultIconColor: VColors.defaultActive,
              clearIconColor: VColors.defaultActiveSubtle.withOpacity(0.5),
              inputStyle: const VInputStyle(
                inputDefaultColor: Color(0xFFFFFFFF),
                borderColor: Color(0xFFFFFFFF),
                topLabelFocusedTextColor: Color(0xFFFFFFFF),
                topLabelDefaultColor: Color(0xFFFFFFFF),
                borderDefaultColor: Color(0xFFFFFFFF),
                borderFocusedColor: Color(0xFFFFFFFF),
                bottomBarColor: VColors.defaultTextSubtle,
                errorBorderColor: VColors.negativeText,
                errorIconColor: VColors.negativeGraphics,
                errorTextColor: VColors.negativeText,
                topLabelErrorTextColor: VColors.negativeText,
                borderRadius: 0,
              ),
              appBarStyle: const VAppBarStyle(
                backgroundColor: VColors.defaultSurface1,
                iconColor: VColors.defaultActive,
                elevation: 0,
              ),
              errorTextStyle: defaultVTheme.textStyles.uiLabelLarge,
              resultTextStyle: defaultVTheme.textStyles.uiLabelLarge,
            ),
      searchController:
          isDefault ? onPageSearchComboController : customComboController,
      searchList: _list,
    );
  }

  Widget _getHeader(String text) {
    return SemanticHeader(
      title: text,
      style: defaultVTheme.textStyles.headline2.copyWith(
        fontWeight: VFontWeight.semiBold,
      ),
    );
  }

  Widget _getSubHeader(String text) {
    return SemanticHeader(
      title: text,
      style: defaultVTheme.textStyles.headline3.copyWith(
        fontWeight: VFontWeight.semiBold,
      ),
    );
  }
}

// BEGIN VComboboxDefault
class VComboboxDefault extends StatefulWidget {
  const VComboboxDefault({
    Key? key,
    required this.searchController,
    required this.searchList,
    this.style,
  }) : super(key: key);

  final List searchList;
  final TextEditingController searchController;
  final VComboboxStyle? style;

  @override
  State<VComboboxDefault> createState() => _VComboboxDefaultState();
}

class _VComboboxDefaultState extends State<VComboboxDefault> {
  Future<void> _navigateAndDisplaySelection(
    BuildContext context,
    TextEditingController _control,
    bool isFocused,
  ) async {
    final result = await Navigator.of(context).push(
      _createRoute(widget.searchList, _control, "Label", "Label (required)",
          isFocused, widget.style),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;
    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    if (result != null) {
      widget.searchController.text = result;
    }
  }

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    super.dispose();
    widget.searchController.removeListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return VInput(
      isFocused: widget.searchController.text.trim().isNotEmpty,
      myLocalController: widget.searchController,
      topLabelText: "Label (required)",
      isReadOnly: true,
      tapped: () {
        _navigateAndDisplaySelection(
          context,
          widget.searchController,
          true,
        );
      },
      trailingIcon: InkWell(
        excludeFromSemantics: true,
        canRequestFocus: false,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          _navigateAndDisplaySelection(
            context,
            widget.searchController,
            true,
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          // Using "chevronDownTiny" causes a semantic readout of "text detected less than"
          child: RotatedBox(
            quarterTurns: 2,
            child: VIcon(
              svgIcon: VIcons.chevronUpTiny,
            ),
          ),
        ),
      ),
      isComboBox: true,
    );
  }
}

// this is a custom page route to display the search screen
Route _createRoute(
  List _list,
  TextEditingController controller,
  String appBarTitle,
  topLabelText,
  bool openInFocus,
  VComboboxStyle? style,
) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => VComboboxScreen(
      style: style,
      isFocused: openInFocus,
      appBarTitle: appBarTitle,
      topLabelText: topLabelText,
      searchList: _list,
      searchController: controller,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
// END

// BEGIN VComboboxWithSelectedOption
class VComboboxWithSelectedOption extends StatefulWidget {
  const VComboboxWithSelectedOption({
    Key? key,
    required this.searchController,
    required this.searchList,
    this.style,
  }) : super(key: key);

  final List searchList;
  final TextEditingController searchController;
  final VComboboxStyle? style;

  @override
  State<VComboboxWithSelectedOption> createState() =>
      _VComboboxWithSelectedOptionState();
}

class _VComboboxWithSelectedOptionState
    extends State<VComboboxWithSelectedOption> {
  String initialValue = "Option A";
  Future<void> _navigateAndDisplaySelection(
    BuildContext context,
    TextEditingController _control,
    bool isFocused,
  ) async {
    final result = await Navigator.of(context).push(
      _createRoute(widget.searchList, _control, "Label", "Label (required)",
          isFocused, widget.style),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;
    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    if (result != null) {
      widget.searchController.text = result;
    }
  }

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    super.dispose();
    widget.searchController.removeListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return VInput(
      isFocused: widget.searchController.text.trim().isNotEmpty,
      myLocalController: widget.searchController.text.isEmpty
          ? TextEditingController(text: initialValue)
          : widget.searchController,
      topLabelText: "Label (required)",
      isReadOnly: true,
      tapped: () {
        _navigateAndDisplaySelection(
          context,
          widget.searchController,
          true,
        );
      },
      trailingIcon: InkWell(
        excludeFromSemantics: true,
        canRequestFocus: false,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          _navigateAndDisplaySelection(
            context,
            widget.searchController,
            true,
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          // Using "chevronDownTiny" causes a semantic readout of "text detected less than"
          child: RotatedBox(
            quarterTurns: 2,
            child: VIcon(
              svgIcon: VIcons.chevronUpTiny,
            ),
          ),
        ),
      ),
      isComboBox: true,
    );
  }
}
// END

// BEGIN VComboboxWithInlineMessage
class VComboboxWithInlineMessage extends StatefulWidget {
  const VComboboxWithInlineMessage({
    Key? key,
    required this.searchController,
    required this.searchList,
    this.style,
  }) : super(key: key);

  final List searchList;
  final TextEditingController searchController;
  final VComboboxStyle? style;

  @override
  State<VComboboxWithInlineMessage> createState() =>
      _VComboboxWithInlineMessageState();
}

class _VComboboxWithInlineMessageState
    extends State<VComboboxWithInlineMessage> {
  Future<void> _navigateAndDisplaySelection(
    BuildContext context,
    TextEditingController _control,
    bool isFocused,
  ) async {
    final result = await Navigator.of(context).push(
      _createRoute(widget.searchList, _control, "Label", "Label (required)",
          isFocused, widget.style),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;
    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    if (result != null) {
      widget.searchController.text = result;
    }
  }

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    super.dispose();
    widget.searchController.removeListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return VInput(
      isFocused: widget.searchController.text.trim().isNotEmpty,
      myLocalController: widget.searchController,
      topLabelText: "Label (required)",
      hasInlineMessage: true,
      inlineMessage: const Text(
          "This is optional text that describes the label in more detail."),
      isReadOnly: true,
      tapped: () {
        _navigateAndDisplaySelection(
          context,
          widget.searchController,
          true,
        );
      },
      trailingIcon: InkWell(
        excludeFromSemantics: true,
        canRequestFocus: false,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          _navigateAndDisplaySelection(
            context,
            widget.searchController,
            true,
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          // Using "chevronDownTiny" causes a semantic readout of "text detected less than"
          child: RotatedBox(
            quarterTurns: 2,
            child: VIcon(
              svgIcon: VIcons.chevronUpTiny,
            ),
          ),
        ),
      ),
      isComboBox: true,
    );
  }
}

// END

// BEGIN VComboboxReadOnly

class VComboboxReadOnly extends StatefulWidget {
  VComboboxReadOnly({
    Key? key,
    required this.searchController,
    required this.searchList,
    this.style,
  }) : super(key: key);

  final List searchList;
  final TextEditingController searchController;
  final VComboboxStyle? style;

  @override
  State<VComboboxReadOnly> createState() => _VComboboxReadOnlyState();
}

class _VComboboxReadOnlyState extends State<VComboboxReadOnly> {
  bool isReadOnly = true;
  String initialValue = "Option A";
  Future<void> _navigateAndDisplaySelection(
    BuildContext context,
    TextEditingController _control,
    bool isFocused,
  ) async {
    final result = await Navigator.of(context).push(
      _createRoute(widget.searchList, _control, "Label", "Label (required)",
          isFocused, widget.style),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;
    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    if (result != null) {
      widget.searchController.text = result;
    }
  }

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    super.dispose();
    widget.searchController.removeListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VInput(
          isFocused: widget.searchController.text.trim().isNotEmpty,
          myLocalController: widget.searchController.text.isEmpty
              ? TextEditingController(text: initialValue)
              : widget.searchController,
          topLabelText: "Label (required)",
          isReadOnly: isReadOnly,
          tapped: isReadOnly
              ? null
              : () {
                  _navigateAndDisplaySelection(
                    context,
                    widget.searchController,
                    true,
                  );
                },
          trailingIcon: InkWell(
            excludeFromSemantics: true,
            canRequestFocus: false,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: isReadOnly
                ? null
                : () {
                    _navigateAndDisplaySelection(
                      context,
                      widget.searchController,
                      true,
                    );
                  },
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              // Using "chevronDownTiny" causes a semantic readout of "text detected less than"
              child: RotatedBox(
                quarterTurns: 2,
                child: VIcon(
                  svgIcon: VIcons.chevronUpTiny,
                ),
              ),
            ),
          ),
          isComboBox: true,
        ),
        const SizedBox(
          height: 5,
        ),
        VCheckboxTile(
          title: "Mark input as read-only",
          isChecked: isReadOnly,
          onChanged: (value) => setState(() {
            isReadOnly = value!;
          }),
        ),
      ],
    );
  }
}
// END

// BEGIN VComboboxDisabled

class VComboboxDisabled extends StatefulWidget {
  VComboboxDisabled({
    Key? key,
    required this.searchController,
    required this.searchList,
    this.style,
  }) : super(key: key);

  final List searchList;
  final TextEditingController searchController;
  final VComboboxStyle? style;

  @override
  State<VComboboxDisabled> createState() => _VComboboxDisabledState();
}

class _VComboboxDisabledState extends State<VComboboxDisabled> {
  bool isDisabled = true;
  String initialValue = "Option A";
  Future<void> _navigateAndDisplaySelection(
    BuildContext context,
    TextEditingController _control,
    bool isFocused,
  ) async {
    final result = await Navigator.of(context).push(
      _createRoute(widget.searchList, _control, "Label", "Label (required)",
          isFocused, widget.style),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;
    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    if (result != null) {
      widget.searchController.text = result;
    }
  }

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    super.dispose();
    widget.searchController.removeListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VInput(
          isFocused: widget.searchController.text.trim().isNotEmpty,
          myLocalController: widget.searchController.text.isEmpty
              ? TextEditingController(text: initialValue)
              : widget.searchController,
          topLabelText: "Label (required)",
          isEnabled: !isDisabled,
          tapped: isDisabled
              ? null
              : () {
                  _navigateAndDisplaySelection(
                    context,
                    widget.searchController,
                    true,
                  );
                },
          trailingIcon: InkWell(
            excludeFromSemantics: true,
            canRequestFocus: false,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: isDisabled
                ? null
                : () {
                    _navigateAndDisplaySelection(
                      context,
                      widget.searchController,
                      true,
                    );
                  },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              // Using "chevronDownTiny" causes a semantic readout of "text detected less than"
              child: RotatedBox(
                quarterTurns: 2,
                child: VIcon(
                  svgIcon: VIcons.chevronUpTiny,
                  iconColor:
                      isDisabled ? VColors.disabled : VColors.defaultActive,
                ),
              ),
            ),
          ),
          isComboBox: true,
        ),
        const SizedBox(
          height: 5,
        ),
        VCheckboxTile(
          title: "Mark input as disabled",
          isChecked: isDisabled,
          onChanged: (value) => setState(() {
            isDisabled = value!;
          }),
        ),
      ],
    );
  }
}
// END
