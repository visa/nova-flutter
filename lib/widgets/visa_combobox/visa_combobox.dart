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
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

//VComboboxStyle using ThemeExtension
class VComboboxStyle extends ThemeExtension<VComboboxStyle> {
  const VComboboxStyle({
    this.backgroundColor,
    this.listTileColor,
    this.listTileResultIconColor,
    this.errorTextColor,
    this.resultTextColor,
    this.appBarTitleTextColor,
    this.clearIconColor,
    this.inputStyle,
    this.appBarStyle,
    this.errorTextStyle,
    this.resultTextStyle,
  });

  final Color? backgroundColor,
      listTileColor,
      listTileResultIconColor,
      errorTextColor,
      resultTextColor,
      appBarTitleTextColor,
      clearIconColor;
  final VInputStyle? inputStyle;
  final VAppBarStyle? appBarStyle;
  final TextStyle? errorTextStyle, resultTextStyle;

  @override
  VComboboxStyle copyWith({
    Color? backgroundColor,
    listTileColor,
    listTileResultIconColor,
    errorTextColor,
    resultTextColor,
    appBarTitleTextColor,
    clearIconColor,
    VInputStyle? inputStyle,
    VAppBarStyle? appBarStyle,
    TextStyle? errorTextStyle,
    resultTextStyle,
  }) =>
      VComboboxStyle(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        listTileColor: listTileColor ?? this.listTileColor,
        listTileResultIconColor:
            listTileResultIconColor ?? this.listTileResultIconColor,
        errorTextColor: errorTextColor ?? this.errorTextColor,
        resultTextColor: resultTextColor ?? this.resultTextColor,
        appBarTitleTextColor: appBarTitleTextColor ?? this.appBarTitleTextColor,
        clearIconColor: clearIconColor ?? this.clearIconColor,
        inputStyle: inputStyle ?? this.inputStyle,
        appBarStyle: appBarStyle ?? this.appBarStyle,
        errorTextStyle: errorTextStyle ?? this.errorTextStyle,
        resultTextStyle: resultTextStyle ?? this.resultTextStyle,
      );

  @override
  VComboboxStyle lerp(ThemeExtension<VComboboxStyle>? other, double t) {
    if (other is! VComboboxStyle) {
      return this;
    }

    return VComboboxStyle(
      backgroundColor: Color.lerp(
        backgroundColor,
        other.backgroundColor,
        t,
      ),
      listTileColor: Color.lerp(
        listTileColor,
        other.listTileColor,
        t,
      ),
      listTileResultIconColor: Color.lerp(
        listTileResultIconColor,
        other.listTileResultIconColor,
        t,
      ),
      errorTextColor: Color.lerp(
        errorTextColor,
        other.errorTextColor,
        t,
      ),
      resultTextColor: Color.lerp(
        resultTextColor,
        other.resultTextColor,
        t,
      ),
      appBarTitleTextColor: Color.lerp(
        appBarTitleTextColor,
        other.appBarTitleTextColor,
        t,
      ),
      clearIconColor: Color.lerp(
        clearIconColor,
        other.clearIconColor,
        t,
      ),
      inputStyle: inputStyle ?? other.inputStyle,
      appBarStyle: appBarStyle ?? other.appBarStyle,
      errorTextStyle: errorTextStyle ?? other.errorTextStyle,
      resultTextStyle: resultTextStyle ?? other.resultTextStyle,
    );
  }
}

class VComboboxScreen extends StatefulWidget {
  const VComboboxScreen({
    Key? key,
    required this.searchList,
    required this.searchController,
    required this.topLabelText,
    required this.appBarTitle,
    this.errorText,
    this.listTileResultIcon,
    this.closeIcon,
    this.isFocused = false,
    this.style,
    this.vExt,
  }) : super(key: key);

// BEGIN Properties
  final List searchList;
  final TextEditingController searchController;
  final String appBarTitle, topLabelText;
  final String? errorText;
  final Widget? listTileResultIcon;
  final Widget? closeIcon;
  final VComboboxStyle? style;
  final VExt? vExt;
  final bool isFocused;
// END
  @override
  State<VComboboxScreen> createState() => _VComboboxScreenState();
}

class _VComboboxScreenState extends State<VComboboxScreen> {
  TextEditingController onPageSearchComboController = TextEditingController();
  var _searchIndexList = [];
  @override
  void initState() {
    _searchIndexList = widget.searchList;
    onPageSearchComboController.text = widget.searchController.text;
    super.initState();
  }

  _VComboboxScreenState() {
    onPageSearchComboController.addListener(() {
      if (onPageSearchComboController.text.isEmpty) {
        setState(() {
          _searchIndexList = widget.searchList;
        });
      } else {
        setState(() {
          _searchIndexList = widget.searchList
              .where(
                (element) => element.toLowerCase().contains(
                      onPageSearchComboController.text.trim().toLowerCase(),
                    ),
              )
              .toList();
        });
      }
    });
  }

  Widget _searchTextField() {
    onPageSearchComboController.selection = TextSelection.fromPosition(
      TextPosition(offset: onPageSearchComboController.text.length),
    );

    return VInput(
      style: widget.style?.inputStyle,
      isFocused: widget.isFocused,
      myLocalController: onPageSearchComboController,
      topLabelText: widget.topLabelText,
      suffix: onPageSearchComboController.text.trim().isNotEmpty
          ? InkWell(
              splashColor: VColors.transparent,
              highlightColor: VColors.transparent,
              onTap: () {
                onPageSearchComboController.clear();
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Semantics(
                  label: "clear text input",
                  child: Container(
                    color: Colors.transparent,
                    height: 44,
                    width: 44,
                    child: VIcon(
                      iconFit: BoxFit.none,
                      svgIcon: VIcons.clearAltTiny,
                      iconColor: widget.style?.clearIconColor ??
                          VColors.defaultActiveSubtle.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            )
          : null,
      onSubmitted: (p0) {
        Navigator.pop(
          context,
          onPageSearchComboController.text.trim(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (widget.vExt == null || widget.vExt is VDef) {
      defaultStyle = Theme.of(context).brightness == Brightness.dark
          ? getDefaultColorSchemeDark()!
          : getDefaultColorScheme()!;
    } else {
      defaultStyle = Theme.of(context).brightness == Brightness.dark
          ? getAltColorSchemeDark()!
          : getAltColorScheme()!;
    }

    final backgroundColor =
        widget.style?.backgroundColor ?? defaultStyle.surface1;
    final listTileColor = widget.style?.listTileColor ?? defaultStyle.surface3;
    final listTileResultIconColor =
        widget.style?.listTileResultIconColor ?? defaultStyle.active;
    final errorTextColor = widget.style?.errorTextColor ?? defaultStyle.text;
    final resultTextColor = widget.style?.resultTextColor ?? defaultStyle.text;
    final appBarTitleTextColor =
        widget.style?.appBarTitleTextColor ?? defaultStyle.text;
    final closeIconColor =
        widget.style?.appBarStyle?.iconColor ?? defaultStyle.active;
    final errorTextStyle = widget.style?.errorTextStyle ??
        defaultStyle.vComboboxProperties?.errorTextStyle;
    final resultTextStyle = widget.style?.resultTextStyle ??
        defaultStyle.vComboboxProperties?.resultTextStyle;
    final appBarTitleTextStyle = widget.style?.appBarStyle?.titleTextStyle ??
        defaultStyle.vAppBarProperties?.titleTextStyle;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: VAppBar(
        style: widget.style?.appBarStyle,
        leading: widget.closeIcon ??
            Semantics(
              label: "Close ",
              value: "",
              button: true,
              child: InkWell(
                child: Container(
                  width: 44,
                  height: 44,
                  padding: const EdgeInsets.all(15.0),
                  child: VIcon(
                    svgIcon: VIcons.closeLow,
                    iconColor: closeIconColor,
                    iconFit: BoxFit.none,
                  ),
                ),
                onTap: () {
                  Navigator.pop(
                    context,
                    onPageSearchComboController.text.trim(),
                  );
                },
              ),
            ),
        title: Text(
          widget.appBarTitle,
          style: appBarTitleTextStyle?.copyWith(
            color: appBarTitleTextColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            _searchTextField(),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: _searchIndexList.isEmpty
                  ? Center(
                      child: Text(
                        widget.errorText ?? "No results found",
                        style: errorTextStyle?.copyWith(
                          color: errorTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                      ),
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          shrinkWrap: true,
                          itemCount: _searchIndexList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  onPageSearchComboController.text =
                                      _searchIndexList[index];
                                });
                                Navigator.pop(
                                  context,
                                  onPageSearchComboController.text.trim(),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Semantics(
                                  onDidGainAccessibilityFocus: () {
                                    if (onPageSearchComboController.text
                                            .trim() ==
                                        _searchIndexList[index]) {
                                      SemanticsService.announce(
                                          "Selected", TextDirection.ltr);
                                    } else {
                                      SemanticsService.announce(
                                          "${index + 1} of ${_searchIndexList.length} in list",
                                          TextDirection.ltr);
                                    }
                                  },
                                  child: ListTile(
                                    tileColor:
                                        (onPageSearchComboController.text ==
                                                _searchIndexList[index])
                                            ? listTileColor
                                            : null,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    title: Row(
                                      children: [
                                        onPageSearchComboController.text ==
                                                _searchIndexList[index]
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: widget
                                                        .listTileResultIcon ??
                                                    VIcon(
                                                        svgIcon: VIcons
                                                            .checkmarkTiny,
                                                        iconColor:
                                                            listTileResultIconColor),
                                              )
                                            : const SizedBox(
                                                width: 24,
                                              ),
                                        Flexible(
                                          child: Text(
                                            _searchIndexList[index],
                                            style: resultTextStyle?.copyWith(
                                              color: resultTextColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
