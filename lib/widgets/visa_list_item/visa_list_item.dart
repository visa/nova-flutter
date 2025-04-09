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
// Visa List Item constructor

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// VListItemStyle using ThemeExtension
class VListItemStyle extends ThemeExtension<VListItemStyle> {
  const VListItemStyle({
    this.itemListColor,
    this.iconColor,
    this.borderRadius,
  });

  final Color? itemListColor, iconColor;
  final double? borderRadius;

  @override
  VListItemStyle copyWith({
    Color? itemListColor,
    iconColor,
    double? borderRadius,
  }) =>
      VListItemStyle(
        itemListColor: itemListColor ?? this.itemListColor,
        iconColor: iconColor ?? this.iconColor,
        borderRadius: borderRadius ?? this.borderRadius,
      );

  @override
  VListItemStyle lerp(ThemeExtension<VListItemStyle>? other, double t) {
    if (other is! VListItemStyle) {
      return this;
    }
    return VListItemStyle(
      itemListColor: Color.lerp(itemListColor, other.itemListColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
    );
  }
}

class VListItem extends StatefulWidget {
  const VListItem({
    Key? key,
    required this.child,
    this.onTap,
    this.trailingIcon,
    this.isThreeLine = false,
    this.isReadOnly = false,
    this.hasTrailingIcon = false,
    this.leadingPadding = const EdgeInsets.fromLTRB(10, 8, 10, 8),
    this.trailingPadding = const EdgeInsets.only(right: 5),
    this.hasCheck = false,
    this.onDidGainAccessibilityFocus,
    this.height,
    this.style,
    this.vExt,
  }) : super(key: key);

  // BEGIN Properties
  final Function()? onTap;
  final Widget child;
  final Widget? trailingIcon;
  final bool hasTrailingIcon;
  final bool isThreeLine;
  final bool isReadOnly;
  final EdgeInsets leadingPadding;
  final EdgeInsets trailingPadding;
  final bool hasCheck;
  final Function()? onDidGainAccessibilityFocus;
  final double? height;
  final VListItemStyle? style;
  final VExt? vExt;

  // END

  @override
  State<VListItem> createState() => _VListItemState();
}

class _VListItemState extends State<VListItem> {
  bool _isPressed = false;

  _onInteraction(bool val) {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (widget.vExt == null || widget.vExt is VDef) {
      defaultStyle = Theme.of(context).brightness == Brightness.dark ? getDefaultColorSchemeDark()! : getDefaultColorScheme()!;
    } else {
      defaultStyle = Theme.of(context).brightness == Brightness.dark ? getAltColorSchemeDark()! : getAltColorScheme()!;
    }
    final borderRadius = widget.style?.borderRadius ?? defaultStyle.vListItemProperties.borderRadius;

    Color itemListColor() {
      if (_isPressed) {
        return widget.style?.itemListColor ?? defaultStyle.surfaceLowlight;
      }
      if (widget.hasCheck) {
        return widget.style?.itemListColor ?? defaultStyle.surface3;
      }
      return widget.style?.itemListColor ?? defaultStyle.surface1;
    }

    Color iconColor() {
      if (widget.isReadOnly || widget.onTap == null) {
        return widget.style?.iconColor ?? defaultStyle.disabled;
      }
      return widget.style?.iconColor ?? defaultStyle.active;
    }

    double containerHeight() {
      if (widget.height != null) {
        return widget.height!;
      }
      return widget.isThreeLine ? 78 : 64;
    }

    return Semantics(
      onDidGainAccessibilityFocus: widget.onDidGainAccessibilityFocus,
      enabled: widget.onTap == null ? false : true,
      child: GestureDetector(
        onTapCancel: widget.onTap != null
            ? () {
                _onInteraction(_isPressed);
              }
            : null,
        onTapDown: widget.onTap != null
            ? (_) {
                _onInteraction(_isPressed);
              }
            : null,
        onTapUp: widget.onTap != null
            ? (_) {
                _onInteraction(_isPressed);
              }
            : null,
        onTap: widget.onTap,
        child: Container(
          constraints: BoxConstraints(minHeight: containerHeight()),
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: itemListColor(),
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: widget.leadingPadding,
                  child: widget.child,
                ),
              ),
              if (widget.hasTrailingIcon)
                Padding(
                  padding: widget.trailingPadding,
                  child: widget.trailingIcon ??
                      VIcon(
                        svgIcon: VIcons.chevronRightTiny,
                        iconHeight: 12,
                        iconWidth: 12,
                        iconColor: iconColor(),
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
