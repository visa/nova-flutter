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
// Visa Nova Flutter Panel

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:flutter/semantics.dart';

// VPanelStyle using ThemeExtension
class VPanelStyle extends ThemeExtension<VPanelStyle> {
  const VPanelStyle({
    this.appBarBackgroundColor,
    this.backgroundColor,
    this.titleTextStyle,
    this.borderRadius,
  });

  final Color? backgroundColor, appBarBackgroundColor;
  final TextStyle? titleTextStyle;
  final double? borderRadius;

  @override
  VPanelStyle copyWith({
    Color? backgroundColor,
    Color? appBarBackgroundColor,
    double? borderRadius,
    TextStyle? titleTextStyle,
  }) =>
      VPanelStyle(
          backgroundColor: backgroundColor ?? this.backgroundColor,
          appBarBackgroundColor: appBarBackgroundColor ?? this.appBarBackgroundColor,
          titleTextStyle: titleTextStyle ?? this.titleTextStyle,
          borderRadius: borderRadius ?? this.borderRadius);

  @override
  VPanelStyle lerp(ThemeExtension<VPanelStyle>? other, double t) {
    if (other is! VPanelStyle) {
      return this;
    }

    return VPanelStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      appBarBackgroundColor: Color.lerp(appBarBackgroundColor, other.appBarBackgroundColor, t),
      titleTextStyle: titleTextStyle ?? other.titleTextStyle,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
    );
  }
}

class VPanel extends StatefulWidget {
  const VPanel({
    super.key,
    this.title,
    required this.isFullScreen,
    required this.child,
    this.closeIcon,
    this.style,
    this.contentPadding,
    this.closeIconPadding,
    this.vExt,
    this.showShadow = true,
  });

  final String? title;
  final Widget child;
  final Widget? closeIcon;
  final VPanelStyle? style;
  final EdgeInsets? contentPadding, closeIconPadding;
  final bool? isFullScreen, showShadow;
  final VExt? vExt;

  @override
  State<VPanel> createState() => _VPanelState();
}

class _VPanelState extends State<VPanel> {
  // Semantics focus node
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Request focus when the widget is inserted into the tree.
    Future.microtask(() {
      SemanticsService.announce(widget.title ?? '', TextDirection.ltr);
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    // Clean up the focus node when the widget is disposed.
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (widget.vExt == null || widget.vExt is VDef) {
      defaultStyle =
          Theme.of(context).brightness == Brightness.dark ? getDefaultColorSchemeDark()! : getDefaultColorScheme()!;
    } else {
      defaultStyle = Theme.of(context).brightness == Brightness.dark ? getAltColorSchemeDark()! : getAltColorScheme()!;
    }
    final backgroundColor = widget.style?.backgroundColor ?? defaultStyle.surface1;
    final appBarBackgroundColor = widget.style?.appBarBackgroundColor ?? defaultStyle.surface1;
    final titleTextStyle = widget.style?.titleTextStyle ?? defaultStyle.vPanelProperties?.titleTextStyle;
    final borderRadius = widget.style?.borderRadius ?? defaultStyle.vPanelProperties?.borderRadius;
    EdgeInsets? closeIconPadding = widget.closeIconPadding ?? (widget.isFullScreen! ? const EdgeInsets.fromLTRB(14, 16, 14, 12) : const EdgeInsets.all(14));
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        color: backgroundColor,
      ),
      child: Column(
        children: [
          if (widget.isFullScreen!)
            Container(
              margin: const EdgeInsets.only(bottom: 6.0),
              decoration: BoxDecoration(
                boxShadow: widget.showShadow!
                    ? [
                        const BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ]
                    : [],
              ),
              child: VAppBar(
                style: VAppBarStyle(
                    backgroundColor: appBarBackgroundColor,
                    borderRadius: borderRadius,
                    elevation: widget.showShadow! ? 1 : 0),
                title: Text(
                  widget.title ?? '',
                  style: titleTextStyle,
                ),
                leading: const SizedBox.shrink(),
                actionList: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 4, 16, 4),
                    child: Focus(
                      focusNode: _focusNode,
                      child: Semantics(
                        label: "close",
                        button: true,
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          splashColor: VColors.defaultSurfaceLowlight,
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 44,
                            height: 44,
                            padding: closeIconPadding,
                            child: const ExcludeSemantics(
                              child: VIcon(
                                svgIcon: VIcons.closeTiny,
                                iconHeight: 16,
                                iconWidth: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Wrap(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  color: backgroundColor,
                  padding: widget.contentPadding ?? EdgeInsets.fromLTRB(24, widget.isFullScreen! ? 0 : 24, 24, 48),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (widget.isFullScreen == false)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Semantics(
                              header: true,
                              child: Text(
                                widget.title ?? '',
                                style: titleTextStyle,
                              ),
                            ),
                            const Spacer(),
                            widget.closeIcon ??
                                Focus(
                                  focusNode: _focusNode,
                                  child: Semantics(
                                    label: "close",
                                    button: true,
                                    child: InkWell(
                                      customBorder: const CircleBorder(),
                                      splashColor: VColors.defaultSurfaceLowlight,
                                      onTap: () => Navigator.pop(context),
                                      child: Container(
                                        width: 44,
                                        height: 44,
                                        padding: closeIconPadding,
                                        child: const ExcludeSemantics(
                                          child: VIcon(
                                            svgIcon: VIcons.closeTiny,
                                            iconHeight: 16,
                                            iconWidth: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          ],
                        ),
                      widget.child
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
