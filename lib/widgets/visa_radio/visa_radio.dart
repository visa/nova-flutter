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
// Visa radio constructor
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

// VRadioStyle using ThemeExtension

class VRadioStyle extends ThemeExtension<VRadioStyle> {
  const VRadioStyle({
    this.fillColor,
    this.fillColorPressed,
    this.fillColorDisabled,
    this.titleTextColor,
    this.titleTextColorDisabled,
    this.subtitleTextColor,
    this.subtitleTextColorDisabled,
    this.overlayColor,
  });

  final Color? fillColor,
      fillColorPressed,
      fillColorDisabled,
      titleTextColor,
      titleTextColorDisabled,
      subtitleTextColor,
      subtitleTextColorDisabled,
      overlayColor;

  @override
  VRadioStyle copyWith({
    Color? fillColor,
    fillColorPressed,
    fillColorDisabled,
    iconColor,
    iconColorError,
    titleTextColor,
    titleTextColorDisabled,
    titleTextColorError,
    subtitleTextColor,
    subtitleTextColorDisabled,
    subtitleTextColorError,
    overlayColor,
  }) =>
      VRadioStyle(
        fillColor: fillColor ?? this.fillColor,
        fillColorPressed: fillColorPressed ?? this.fillColorPressed,
        fillColorDisabled: fillColorDisabled ?? this.fillColorDisabled,
        titleTextColor: titleTextColor ?? this.titleTextColor,
        titleTextColorDisabled:
            titleTextColorDisabled ?? this.titleTextColorDisabled,
        subtitleTextColor: subtitleTextColor ?? this.subtitleTextColor,
        subtitleTextColorDisabled:
            subtitleTextColorDisabled ?? this.subtitleTextColorDisabled,
        overlayColor: overlayColor ?? this.overlayColor,
      );

  @override
  VRadioStyle lerp(ThemeExtension<VRadioStyle>? other, double t) {
    if (other is! VRadioStyle) {
      return this;
    }

    return VRadioStyle(
      fillColor: Color.lerp(fillColor, other.fillColor, t),
      fillColorPressed: Color.lerp(fillColorPressed, other.fillColorPressed, t),
      fillColorDisabled:
          Color.lerp(fillColorDisabled, other.fillColorDisabled, t),
      titleTextColor: Color.lerp(titleTextColor, other.titleTextColor, t),
      titleTextColorDisabled:
          Color.lerp(titleTextColorDisabled, other.titleTextColorDisabled, t),
      subtitleTextColor:
          Color.lerp(subtitleTextColor, other.subtitleTextColor, t),
      subtitleTextColorDisabled: Color.lerp(
          subtitleTextColorDisabled, other.subtitleTextColorDisabled, t),
      overlayColor: Color.lerp(overlayColor, other.overlayColor, t),
    );
  }
}

class VRadio<T> extends StatelessWidget {
  const VRadio({
    Key? key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.style,
    this.vExt,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final dynamic value;
  final dynamic groupValue;
  final ValueChanged<T?>? onChanged;
  final VRadioStyle? style;
  final VExt? vExt;

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (vExt == null || vExt is VDef) {
      defaultStyle = Theme.of(context).brightness == Brightness.dark
          ? getDefaultColorSchemeDark()!
          : getDefaultColorScheme()!;
    } else {
      defaultStyle = Theme.of(context).brightness == Brightness.dark
          ? getAltColorSchemeDark()!
          : getAltColorScheme()!;
    }
    final fillColor = style?.fillColor ?? defaultStyle?.active;
    final fillColorPressed =
        style?.fillColorPressed ?? defaultStyle?.activePressed;
    final fillColorDisabled = style?.fillColorPressed ?? defaultStyle?.disabled;
    final titleTextColor = style?.titleTextColor ?? defaultStyle?.text;
    final titleTextColorDisabled =
        style?.titleTextColorDisabled ?? defaultStyle?.disabled;
    final subtitleTextColor =
        style?.subtitleTextColor ?? defaultStyle?.textSubtle;
    final subtitleTextColorDisabled =
        style?.subtitleTextColorDisabled ?? defaultStyle?.disabled;
    final overlayColor = style?.overlayColor ?? defaultStyle?.surfaceLowlight;
    return VMatRadioListTile<T>(
      fillColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return fillColorDisabled;
        }
        if (states.contains(MaterialState.selected)) {
          return fillColorPressed;
        }
        return fillColor;
      }),
      overlayColor: MaterialStateColor.resolveWith((states) => overlayColor!),
      title: Transform(
        transform: Matrix4.translationValues(-14, 0, 0),
        child: Text(
          title,
          style: defaultVTheme.textStyles.uiLabelLarge.copyWith(
              color:
                  onChanged == null ? titleTextColorDisabled : titleTextColor),
        ),
      ),
      subtitle: subtitle == null
          ? null
          : Transform(
              transform: Matrix4.translationValues(-14, 0, 0),
              child: Text(
                subtitle!,
                style: defaultVTheme.textStyles.uiLabel.copyWith(
                    color: onChanged == null
                        ? subtitleTextColorDisabled
                        : subtitleTextColor),
              ),
            ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      dense: true,
      focusNode: FocusNode(skipTraversal: true),
    );
  }
}
