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
// Visa Chips constructor
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

class VChipSelectionStyle extends ThemeExtension<VChipSelectionStyle> {
  const VChipSelectionStyle({
    this.backgroundDisabledColor,
    this.backgroundReadOnlyColor,
    this.backgroundIsSelectedColor,
    this.backgroundPressedColor,
    this.backgroundSelectedPressed,
    this.backgroundDefaultColor,
    this.chipLabelReadOnlyColor,
    this.chipLabelDisabledColor,
    this.chipLabelSelectedColor,
    this.chipLabelDefaultColor,
    this.borderReadOnlyColor,
    this.borderDisabledColor,
    this.borderSelectedColor,
    this.borderDefaultColor,
    this.iconReadOnlyColor,
    this.iconDisabledColor,
    this.iconDefaultColor,
    this.borderRadius,
    this.elevation,
    this.pressedElevation,
    this.chipLabelTextStyle,
  });

  final Color? backgroundDisabledColor,
      backgroundReadOnlyColor,
      backgroundIsSelectedColor,
      backgroundPressedColor,
      backgroundDefaultColor,
      backgroundSelectedPressed,
      chipLabelReadOnlyColor,
      chipLabelDisabledColor,
      chipLabelSelectedColor,
      chipLabelDefaultColor,
      borderReadOnlyColor,
      borderDisabledColor,
      borderSelectedColor,
      borderDefaultColor,
      iconReadOnlyColor,
      iconDisabledColor,
      iconDefaultColor;
  final double? borderRadius, elevation, pressedElevation;
  final TextStyle? chipLabelTextStyle;

  @override
  VChipSelectionStyle copyWith({
    Color? backgroundDisabledColor,
    backgroundReadOnlyColor,
    backgroundIsSelectedColor,
    backgroundPressedColor,
    backgroundDefaultColor,
    backgroundSelectedPressed,
    chipLabelReadOnlyColor,
    chipLabelDisabledColor,
    chipLabelSelectedColor,
    chipLabelDefaultColor,
    borderReadOnlyColor,
    borderDisabledColor,
    borderSelectedColor,
    borderDefaultColor,
    iconReadOnlyColor,
    iconDisabledColor,
    iconDefaultColor,
    double? borderRadius,
    elevation,
    pressedElevation,
    TextStyle? chipLabelTextStyle,
  }) =>
      VChipSelectionStyle(
        backgroundDisabledColor: backgroundDisabledColor ?? this.backgroundDisabledColor,
        backgroundReadOnlyColor: backgroundReadOnlyColor ?? this.backgroundReadOnlyColor,
        backgroundIsSelectedColor: backgroundIsSelectedColor ?? this.backgroundIsSelectedColor,
        backgroundPressedColor: backgroundPressedColor ?? this.backgroundPressedColor,
        backgroundDefaultColor: backgroundDefaultColor ?? this.backgroundDefaultColor,
        backgroundSelectedPressed: backgroundSelectedPressed ?? this.backgroundSelectedPressed,
        chipLabelReadOnlyColor: chipLabelReadOnlyColor ?? this.chipLabelReadOnlyColor,
        chipLabelDisabledColor: chipLabelDisabledColor ?? this.chipLabelDisabledColor,
        chipLabelSelectedColor: chipLabelSelectedColor ?? this.chipLabelSelectedColor,
        chipLabelDefaultColor: chipLabelDefaultColor ?? this.chipLabelDefaultColor,
        borderReadOnlyColor: borderReadOnlyColor ?? this.borderReadOnlyColor,
        borderDisabledColor: borderDisabledColor ?? this.borderDisabledColor,
        borderSelectedColor: borderSelectedColor ?? this.borderSelectedColor,
        borderDefaultColor: borderDefaultColor ?? this.borderDefaultColor,
        iconReadOnlyColor: iconReadOnlyColor ?? this.iconReadOnlyColor,
        iconDisabledColor: iconDisabledColor ?? this.iconDisabledColor,
        iconDefaultColor: iconDefaultColor ?? this.iconDefaultColor,
        borderRadius: borderRadius ?? this.borderRadius,
        elevation: elevation ?? this.elevation,
        pressedElevation: pressedElevation ?? this.pressedElevation,
        chipLabelTextStyle: chipLabelTextStyle ?? this.chipLabelTextStyle,
      );

  @override
  VChipSelectionStyle lerp(ThemeExtension<VChipSelectionStyle>? other, double t) {
    if (other is! VChipSelectionStyle) {
      return this;
    }

    return VChipSelectionStyle(
      backgroundDisabledColor: Color.lerp(backgroundDisabledColor, other.backgroundDisabledColor, t),
      backgroundReadOnlyColor: Color.lerp(backgroundReadOnlyColor, other.backgroundReadOnlyColor, t),
      backgroundIsSelectedColor: Color.lerp(backgroundIsSelectedColor, other.backgroundIsSelectedColor, t),
      backgroundPressedColor: Color.lerp(backgroundPressedColor, other.backgroundPressedColor, t),
      backgroundDefaultColor: Color.lerp(backgroundDefaultColor, other.backgroundDefaultColor, t),
      backgroundSelectedPressed: Color.lerp(backgroundSelectedPressed, other.backgroundSelectedPressed, t),
      chipLabelReadOnlyColor: Color.lerp(chipLabelReadOnlyColor, other.chipLabelReadOnlyColor, t),
      chipLabelDisabledColor: Color.lerp(chipLabelDisabledColor, other.chipLabelDisabledColor, t),
      chipLabelSelectedColor: Color.lerp(chipLabelSelectedColor, other.chipLabelSelectedColor, t),
      chipLabelDefaultColor: Color.lerp(chipLabelDefaultColor, other.chipLabelDefaultColor, t),
      borderReadOnlyColor: Color.lerp(borderReadOnlyColor, other.borderReadOnlyColor, t),
      borderDisabledColor: Color.lerp(borderDisabledColor, other.borderDisabledColor, t),
      borderSelectedColor: Color.lerp(borderSelectedColor, other.borderSelectedColor, t),
      borderDefaultColor: Color.lerp(borderDefaultColor, other.borderDefaultColor, t),
      iconReadOnlyColor: Color.lerp(iconReadOnlyColor, other.iconReadOnlyColor, t),
      iconDisabledColor: Color.lerp(iconDisabledColor, other.iconDisabledColor, t),
      iconDefaultColor: Color.lerp(iconDefaultColor, other.iconDefaultColor, t),
      borderRadius: borderRadius,
      elevation: elevation,
      pressedElevation: pressedElevation,
      chipLabelTextStyle: chipLabelTextStyle,
    );
  }
}

class VChipsSelection extends StatefulWidget {
  const VChipsSelection({
    Key? key,
    required this.chipLabel,
    required this.onSelected,
    this.isSelected = false,
    this.isReadOnly = false,
    this.isDisabled = false,
    this.vExt,
    this.style,
  }) : super(key: key);

  // BEGIN Properties
  final String chipLabel;
  final bool isSelected, isReadOnly, isDisabled;
  final void Function(bool)? onSelected;
  final VChipSelectionStyle? style;
  final VExt? vExt;
  // END

  @override
  State<VChipsSelection> createState() => _VChipsSelectionState();
}

class _VChipsSelectionState extends State<VChipsSelection> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (widget.vExt == null || widget.vExt is VDef) {
      defaultStyle = Theme.of(context).brightness == Brightness.dark ? getDefaultColorSchemeDark()! : getDefaultColorScheme()!;
    } else {
      defaultStyle = Theme.of(context).brightness == Brightness.dark ? getAltColorSchemeDark()! : getAltColorScheme()!;
    }
    final chipLabelTextStyle = widget.style?.chipLabelTextStyle ?? defaultStyle.vChipsSelectionProperties?.chipLabelTextStyle;

    final borderRadius = widget.style?.borderRadius ?? defaultStyle.vChipsSelectionProperties?.borderRadius;
    final elevation = widget.style?.elevation ?? defaultStyle.vChipsSelectionProperties?.elevation;
    final pressedElevation = widget.style?.pressedElevation ?? defaultStyle.vChipsSelectionProperties?.pressedElevation;
    final backgroundDefaultColor = widget.style?.backgroundDefaultColor ?? defaultStyle.surface1;
    final backgroundDisabledColor = widget.style?.backgroundDefaultColor ?? defaultStyle.surface1;
    final backgroundReadOnlyColor = widget.style?.backgroundDefaultColor ?? defaultStyle.surface1;
    final backgroundIsSelectedColor = widget.style?.backgroundDefaultColor ?? defaultStyle.active;
    final backgroundPressedColor = widget.style?.backgroundDefaultColor ?? defaultStyle.surfaceLowlight;
    final iconReadOnlyColor = widget.style?.iconReadOnlyColor ?? defaultStyle.textSubtle;
    final iconDisabledColor = widget.style?.iconDisabledColor ?? defaultStyle.disabled;
    final iconDefaultColor = widget.style?.iconDefaultColor ?? defaultStyle.onActive;
    final chipLabelReadOnlyColor = widget.style?.chipLabelReadOnlyColor ?? defaultStyle.textSubtle;
    final chipLabelDisabledColor = widget.style?.chipLabelDisabledColor ?? defaultStyle.disabled;
    final chipLabelSelectedColor = widget.style?.chipLabelSelectedColor ?? defaultStyle.onActive;
    final chipLabelDefaultColor = widget.style?.chipLabelDefaultColor ?? defaultStyle.active;
    final borderReadOnlyColor = widget.style?.borderReadOnlyColor ?? defaultStyle.border;
    final borderDisabledColor = widget.style?.borderDisabledColor ?? defaultStyle.disabled;
    final borderSelectedColor = widget.style?.borderSelectedColor ?? defaultStyle.active;
    final borderDefaultColor = widget.style?.borderDefaultColor ?? defaultStyle.active;
    final backgroundSelectedPressed = widget.style?.backgroundSelectedPressed ?? defaultStyle.activePressed;

    Color? chipLabelColor() {
      if (widget.isReadOnly) {
        return chipLabelReadOnlyColor;
      }
      if (widget.isDisabled) {
        return chipLabelDisabledColor?.withOpacity(0.8);
      }
      if (widget.isSelected) {
        return chipLabelSelectedColor;
      }
      return chipLabelDefaultColor;
    }

    Color? iconColor() {
      if (widget.isReadOnly) {
        return iconReadOnlyColor;
      }
      if (widget.isDisabled) {
        return iconDisabledColor;
      }
      return iconDefaultColor;
    }

    Color? containerColor() {
      if (widget.isDisabled) {
        return backgroundDisabledColor;
      }
      if (pressed && widget.isSelected) {
        return backgroundSelectedPressed;
      }
      if (widget.isReadOnly) {
        return backgroundReadOnlyColor;
      }
      if (widget.isSelected) {
        return backgroundIsSelectedColor;
      }
      if (pressed) {
        return backgroundPressedColor;
      }
      return backgroundDefaultColor;
    }

    Color? borderColor() {
      if (widget.isReadOnly) {
        return borderReadOnlyColor?.withOpacity(0.9);
      }
      if (widget.isDisabled) {
        return borderDisabledColor.withOpacity(0.1);
      }
      if (widget.isSelected) {
        return borderSelectedColor;
      }
      return borderDefaultColor;
    }

    return GestureDetector(
      onTapDown: widget.isReadOnly || widget.isDisabled
          ? null
          : (_) {
              setState(() {
                pressed = true;
              });
            },
      onTapCancel: widget.isReadOnly || widget.isDisabled
          ? null
          : () {
              setState(() {
                pressed = false;
              });
            },
      child: VRawChip(
        elevation: elevation,
        pressElevation: pressedElevation,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius!,
          ),
        ),
        backgroundColor: containerColor(),
        selectedColor: containerColor(),
        disabledColor: containerColor(),
        side: BorderSide(
          color: borderColor()!,
          width: 1,
        ),
        labelStyle: chipLabelTextStyle?.copyWith(
          color: chipLabelColor(),
          fontWeight: widget.isSelected ? FontWeight.w500 : FontWeight.w400,
        ),
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        label: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 44,
            maxHeight: double.infinity,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    widget.chipLabel,
                    softWrap: true,
                    maxLines: 3,
                  ),
                ),
                Visibility(
                  visible: widget.isSelected,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: VIcon(
                      svgIcon: VIcons.checkmarkTiny,
                      iconColor: iconColor(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        showCheckmark: false,
        onSelected: widget.onSelected,
        isEnabled: !widget.isDisabled,
        selected: widget.isSelected,
        tapEnabled: !widget.isReadOnly,
      ),
    );
  }
}

class VChipRemovableStyle extends ThemeExtension<VChipRemovableStyle> {
  const VChipRemovableStyle({
    this.backgroundColor,
    this.chipLabelDisabledColor,
    this.chipLabelColor,
    this.borderReadOnlyColor,
    this.borderDisabledColor,
    this.borderDefaultColor,
    this.borderCompactChipColor,
    this.borderPressedColor,
    this.iconPressedColor,
    this.iconDisabledColor,
    this.iconDefaultColor,
    this.deleteButtonSplashColor,
    this.deleteButtonBackgroundColor,
    this.standardBorderRadius,
    this.compactBorderRadius,
    this.elevation,
    this.pressedElevation,
    this.chipLabelTextStyle,
  });

  final Color? backgroundColor,
      chipLabelDisabledColor,
      chipLabelColor,
      borderReadOnlyColor,
      borderDisabledColor,
      borderDefaultColor,
      borderCompactChipColor,
      borderPressedColor,
      iconPressedColor,
      iconDisabledColor,
      iconDefaultColor,
      deleteButtonSplashColor,
      deleteButtonBackgroundColor;
  final double? standardBorderRadius, compactBorderRadius, elevation, pressedElevation;
  final TextStyle? chipLabelTextStyle;

  @override
  VChipRemovableStyle copyWith({
    Color? backgroundColor,
    chipLabelDisabledColor,
    chipLabelColor,
    borderReadOnlyColor,
    borderDisabledColor,
    borderDefaultColor,
    borderCompactChipColor,
    borderPressedColor,
    iconPressedColor,
    iconDisabledColor,
    iconDefaultColor,
    deleteButtonSplashColor,
    deleteButtonBackgroundColor,
    double? standardBorderRadius,
    compactBorderRadius,
    elevation,
    pressedElevation,
    TextStyle? chipLabelTextStyle,
  }) =>
      VChipRemovableStyle(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        chipLabelColor: chipLabelColor ?? this.chipLabelColor,
        chipLabelDisabledColor: chipLabelDisabledColor ?? this.chipLabelDisabledColor,
        borderReadOnlyColor: borderReadOnlyColor ?? this.borderReadOnlyColor,
        borderDisabledColor: borderDisabledColor ?? this.borderDisabledColor,
        borderDefaultColor: borderDefaultColor ?? this.borderDefaultColor,
        borderPressedColor: borderPressedColor ?? this.borderPressedColor,
        iconPressedColor: iconPressedColor ?? this.iconPressedColor,
        iconDisabledColor: iconDisabledColor ?? this.iconDisabledColor,
        iconDefaultColor: iconDefaultColor ?? this.iconDefaultColor,
        deleteButtonSplashColor: deleteButtonSplashColor ?? this.deleteButtonSplashColor,
        deleteButtonBackgroundColor: deleteButtonBackgroundColor ?? this.deleteButtonBackgroundColor,
        borderCompactChipColor: borderCompactChipColor ?? this.borderCompactChipColor,
        compactBorderRadius: compactBorderRadius ?? this.compactBorderRadius,
        standardBorderRadius: standardBorderRadius ?? this.compactBorderRadius,
        elevation: elevation ?? this.elevation,
        pressedElevation: pressedElevation ?? this.pressedElevation,
        chipLabelTextStyle: chipLabelTextStyle ?? this.chipLabelTextStyle,
      );

  @override
  VChipRemovableStyle lerp(ThemeExtension<VChipRemovableStyle>? other, double t) {
    if (other is! VChipRemovableStyle) {
      return this;
    }

    return VChipRemovableStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      chipLabelColor: Color.lerp(chipLabelColor, other.chipLabelColor, t),
      chipLabelDisabledColor: Color.lerp(chipLabelDisabledColor, other.chipLabelDisabledColor, t),
      borderReadOnlyColor: Color.lerp(borderReadOnlyColor, other.borderReadOnlyColor, t),
      borderDisabledColor: Color.lerp(borderDisabledColor, other.borderDisabledColor, t),
      borderDefaultColor: Color.lerp(borderDefaultColor, other.borderDefaultColor, t),
      borderPressedColor: Color.lerp(borderPressedColor, other.borderPressedColor, t),
      iconPressedColor: Color.lerp(iconPressedColor, other.iconPressedColor, t),
      iconDisabledColor: Color.lerp(iconDisabledColor, other.iconDisabledColor, t),
      iconDefaultColor: Color.lerp(iconDefaultColor, other.iconDefaultColor, t),
      deleteButtonBackgroundColor: Color.lerp(deleteButtonBackgroundColor, other.deleteButtonBackgroundColor, t),
      deleteButtonSplashColor: Color.lerp(deleteButtonSplashColor, other.deleteButtonSplashColor, t),
      borderCompactChipColor: Color.lerp(borderCompactChipColor, other.borderCompactChipColor, t),
      compactBorderRadius: compactBorderRadius,
      standardBorderRadius: standardBorderRadius,
      elevation: elevation,
      pressedElevation: pressedElevation,
      chipLabelTextStyle: chipLabelTextStyle,
    );
  }
}

enum ChipsRemovableType {
  standard,
  compactStandard,
  compactRemovable,
}

class VChipsRemovable extends StatefulWidget {
  const VChipsRemovable({
    Key? key,
    required this.chipLabel,
    required this.onDeleted,
    this.leading,
    this.isReadOnly = false,
    this.isDisabled = false,
    this.onPressed,
    this.chipsRemovableType = ChipsRemovableType.standard,
    this.vExt,
    this.style,
  }) : super(key: key);

  // BEGIN Properties
  final String chipLabel;
  final Widget? leading;
  final bool isReadOnly, isDisabled;
  final Function()? onPressed, onDeleted;
  final ChipsRemovableType chipsRemovableType;
  final VChipRemovableStyle? style;
  final VExt? vExt;
  // END

  @override
  State<VChipsRemovable> createState() => _VChipsRemovableState();
}

class _VChipsRemovableState extends State<VChipsRemovable> {
  bool delButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (widget.vExt == null || widget.vExt is VDef) {
      defaultStyle = getDefaultColorScheme()!;
    } else {
      defaultStyle = getAltColorScheme()!;
    }
    final chipLabelTextStyle = widget.style?.chipLabelTextStyle ?? defaultStyle.vChipsRemovableProperties?.chipLabelTextStyle;
    final elevation = widget.style?.elevation ?? defaultStyle.vChipsRemovableProperties?.elevation;
    final pressedElevation = widget.style?.pressedElevation ?? defaultStyle.vChipsRemovableProperties?.pressedElevation;
    final compactBorderRadius = widget.style?.compactBorderRadius ?? defaultStyle.vChipsRemovableProperties?.compactBorderRadius;
    final standardBorderRadius = widget.style?.standardBorderRadius ?? defaultStyle.vChipsRemovableProperties?.standardBorderRadius;
    final deleteButtonBackgroundColor = widget.style?.deleteButtonBackgroundColor ?? defaultStyle.transparent;
    final deleteButtonSplashColor = widget.style?.deleteButtonSplashColor ?? defaultStyle.surfaceLowlight;
    final backgroundColor = widget.style?.backgroundColor ?? defaultStyle.surface1;
    final chipLabelDisabledColor = widget.style?.chipLabelDisabledColor ?? defaultStyle.disabled;
    final chipLabelColor = widget.style?.chipLabelColor ?? defaultStyle.text;
    final borderReadOnlyColor = widget.style?.borderReadOnlyColor ?? defaultStyle.border;
    final borderDisabledColor = widget.style?.borderDisabledColor ?? defaultStyle.disabled;
    final borderPressedColor = widget.style?.borderPressedColor ?? defaultStyle.activePressed;
    final borderDefaultColor = widget.style?.borderDefaultColor ?? defaultStyle.active;
    final borderCompactChipColor = widget.style?.borderCompactChipColor ?? defaultStyle.subtle;
    final iconPressedColor = widget.style?.iconPressedColor ?? defaultStyle.activePressed;
    final iconDisabledColor = widget.style?.iconDisabledColor ?? defaultStyle.disabled;
    final iconDefaultColor = widget.style?.iconDefaultColor ?? defaultStyle.activeSubtle;

    Color? chiplabelColor() {
      if (widget.isDisabled) {
        return chipLabelDisabledColor?.withOpacity(0.8);
      }
      return chipLabelColor;
    }

    Color? borderColor() {
      if (delButtonPressed) {
        return borderPressedColor;
      }
      if (widget.isReadOnly) {
        return borderReadOnlyColor;
      }
      if (widget.isDisabled) {
        return borderDisabledColor.withOpacity(0.1);
      }
      return widget.chipsRemovableType == ChipsRemovableType.compactRemovable ? borderCompactChipColor : borderDefaultColor?.withOpacity(0.5);
    }

    Color? iconColor() {
      if (delButtonPressed) {
        return iconPressedColor;
      }
      if (widget.isDisabled) {
        return iconDisabledColor;
      }
      return iconDefaultColor!.withOpacity(0.5);
    }

    double leftPadding() {
      if (widget.isReadOnly && widget.leading == null) {
        return 10;
      }
      if (widget.leading == null) {
        return widget.chipsRemovableType == ChipsRemovableType.compactRemovable ? 7 : 10;
      }
      return 5;
    }

    return IgnorePointer(
      ignoring: widget.isReadOnly || widget.isDisabled,
      child: GestureDetector(
        onTapDown: widget.isReadOnly || widget.isDisabled
            ? null
            : (_) {
                setState(() {
                  delButtonPressed = true;
                });
              },
        onTapUp: (_) {
          setState(() {
            delButtonPressed = false;
          });
        },
        onTapCancel: () {
          setState(() {
            delButtonPressed = false;
          });
        },
        child: VRawChip(
          elevation: elevation,
          pressElevation: pressedElevation,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          shape: RoundedRectangleBorder(
            borderRadius: widget.chipsRemovableType == ChipsRemovableType.standard
                ? BorderRadius.circular(
                    standardBorderRadius!,
                  )
                : BorderRadius.circular(
                    compactBorderRadius!,
                  ),
          ),
          side: BorderSide(
            color: borderColor()!,
            width: 1,
          ),
          labelStyle: chipLabelTextStyle!.copyWith(
            color: chiplabelColor(),
          ),
          labelPadding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          padding: EdgeInsets.zero,
          label: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 44,
              maxHeight: double.infinity,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.leading ?? const SizedBox.shrink(),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: leftPadding(),
                      right: widget.isReadOnly ? 10 : 5,
                    ),
                    child: Text(
                      widget.chipLabel,
                      softWrap: true,
                      maxLines: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          deleteIcon: Padding(
            padding: EdgeInsets.zero,
            child: Container(
              height: 44,
              width: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: delButtonPressed ? deleteButtonSplashColor : deleteButtonBackgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: VIcon(
                svgIcon: VIcons.clearAltTiny,
                iconColor: iconColor(),
              ),
            ),
          ),
          deleteButtonTooltipMessage: widget.isDisabled || widget.isReadOnly ? null : "Delete ${widget.chipLabel}",
          deleteIconColor: iconColor(),
          onPressed: widget.isReadOnly || widget.isDisabled ? null : widget.onPressed,
          onDeleted: widget.isReadOnly ? null : widget.onDeleted,
          disabledColor: backgroundColor,
          tapEnabled: !widget.isReadOnly,
          isEnabled: !widget.isDisabled,
        ),
      ),
    );
  }
}
