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
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

// VToggleStyle using ThemeExtension

class VToggleStyle extends ThemeExtension<VToggleStyle> {
  const VToggleStyle({
    this.pressedSplashColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.toggleFillColor,
    this.disabledBorderColor,
    this.bottomBarColor,
    this.bottomBarDisabledColor,
    this.bottomBarUnselectedColor,
    this.borderRadius,
    this.height,
    this.minimumWidth,
  });

  final Color? pressedSplashColor,
      selectedBorderColor,
      unselectedBorderColor,
      toggleFillColor,
      disabledBorderColor,
      bottomBarDisabledColor,
      bottomBarUnselectedColor,
      bottomBarColor;
  final double? height, minimumWidth, borderRadius;

  @override
  VToggleStyle copyWith({
    Color? pressedSplashColor,
    selectedBorderColor,
    unselectedBorderColor,
    toggleFillColor,
    disabledBorderColor,
    bottomBarDisabledColor,
    bottomBarUnselectedColor,
    bottomBarColor,
    double? height,
    borderRadius,
    minimumWidth,
  }) =>
      VToggleStyle(
        pressedSplashColor: pressedSplashColor ?? this.pressedSplashColor,
        selectedBorderColor: selectedBorderColor ?? this.selectedBorderColor,
        unselectedBorderColor:
            unselectedBorderColor ?? this.unselectedBorderColor,
        toggleFillColor: toggleFillColor ?? this.toggleFillColor,
        disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
        bottomBarDisabledColor:
            bottomBarDisabledColor ?? this.bottomBarDisabledColor,
        bottomBarUnselectedColor:
            bottomBarUnselectedColor ?? this.bottomBarUnselectedColor,
        bottomBarColor: bottomBarColor ?? this.bottomBarColor,
        height: height ?? this.height,
        borderRadius: borderRadius ?? this.borderRadius,
        minimumWidth: minimumWidth ?? this.minimumWidth,
      );

  @override
  VToggleStyle lerp(ThemeExtension<VToggleStyle>? other, double t) {
    if (other is! VToggleStyle) {
      return this;
    }

    return VToggleStyle(
      pressedSplashColor:
          Color.lerp(pressedSplashColor, other.pressedSplashColor, t),
      selectedBorderColor:
          Color.lerp(selectedBorderColor, other.selectedBorderColor, t),
      unselectedBorderColor:
          Color.lerp(unselectedBorderColor, other.unselectedBorderColor, t),
      toggleFillColor: Color.lerp(toggleFillColor, other.toggleFillColor, t),
      disabledBorderColor:
          Color.lerp(disabledBorderColor, other.disabledBorderColor, t),
      bottomBarDisabledColor:
          Color.lerp(bottomBarDisabledColor, other.bottomBarDisabledColor, t),
      bottomBarUnselectedColor: Color.lerp(
          bottomBarUnselectedColor, other.bottomBarUnselectedColor, t),
      bottomBarColor: Color.lerp(bottomBarColor, other.bottomBarColor, t),
      height: lerpDouble(height, other.height, t),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
      minimumWidth: lerpDouble(minimumWidth, other.minimumWidth, t),
    );
  }
}

class VToggle extends StatefulWidget {
  const VToggle({
    Key? key,
    required this.isSelected,
    required this.toggleListItems,
    this.topLabelAlignment,
    this.topLabel,
    this.disabledItems,
    this.axis = Axis.horizontal,
    this.onPressed,
    this.isDisabled = false,
    this.toggleTextStyle,
    this.style,
    this.vExt,
  }) : super(key: key);

// BEGIN Properties
  final Axis axis;
  final List<bool> isSelected;
  final List<Widget> toggleListItems;
  final Function(int)? onPressed;
  final bool isDisabled;
  final TextStyle? toggleTextStyle;
  final VToggleStyle? style;
  final VExt? vExt;
  final CrossAxisAlignment? topLabelAlignment;
  final Widget? topLabel;
  final List<bool>? disabledItems;
  // END

  @override
  State<VToggle> createState() => _VToggleState();
}

class _VToggleState extends State<VToggle> {
  @override
  Widget build(BuildContext context) {
    final disabledItems = widget.disabledItems ??
        List<bool>.filled(widget.toggleListItems.length, false);
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
    final height =
        widget.style?.height ?? defaultStyle.vToggleProperties?.height;
    final minimumWidth = widget.style?.minimumWidth ??
        defaultStyle.vToggleProperties?.minimumWidth;
    final borderRadius = widget.style?.borderRadius ??
        defaultStyle.vToggleProperties?.borderRadius;
    final pressedSplashColor =
        widget.style?.pressedSplashColor ?? defaultStyle.surfaceLowlight;
    final selectedBorderColor =
        widget.style?.selectedBorderColor ?? defaultStyle.active;
    final unselectedBorderColor =
        widget.style?.unselectedBorderColor ?? defaultStyle.active;
    final toggleFillColor =
        widget.style?.toggleFillColor ?? defaultStyle.surface3;
    final disabledBorderColor =
        widget.style?.disabledBorderColor ?? defaultStyle.disabled;
    final bottomBarUnselectedColor =
        widget.style?.bottomBarUnselectedColor ?? defaultStyle.transparent;
    final bottomBarColor = widget.style?.bottomBarColor ?? defaultStyle.active;
    final bottomBarDisabledColor =
        widget.style?.bottomBarDisabledColor ?? defaultStyle.disabled;

    return SingleChildScrollView(
      scrollDirection: widget.axis,
      child: Column(
        crossAxisAlignment:
            widget.topLabelAlignment ?? CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.topLabel != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: widget.topLabel == null
                  ? const SizedBox.shrink()
                  : widget.topLabel!,
            ),
          ),
          ToggleButtons(
            splashColor: pressedSplashColor,
            direction: widget.axis,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius!),
            ),
            selectedBorderColor: selectedBorderColor,
            borderColor: unselectedBorderColor,
            fillColor: toggleFillColor,
            disabledBorderColor: disabledBorderColor,
            isSelected: widget.isSelected,
            constraints: BoxConstraints(minHeight: height),
            onPressed: widget.onPressed == null
                ? null
                : (int index) {
                    if (!disabledItems[index]) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < widget.isSelected.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            widget.isSelected[buttonIndex] = true;
                          } else {
                            widget.isSelected[buttonIndex] = false;
                          }
                        }
                      });
                      widget.onPressed!(index);
                    }
                  },
            children: List.generate(widget.toggleListItems.length, (index) {
              return IntrinsicWidth(
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: minimumWidth!,
                  ),
                  decoration: widget.isSelected[index]
                      ? BoxDecoration(
                          shape: BoxShape.rectangle,
                          boxShadow: const [
                            // Top Shadow
                            BoxShadow(
                              color: Color.fromARGB(51, 0, 0, 0),
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 8,
                              blurRadius: 8,
                            ),
                            // Innermost color
                            BoxShadow(
                              color: VColors.defaultSurface3,
                              spreadRadius: 0,
                              blurRadius: 3,
                            ),
                          ],
                          border: Border(
                            bottom: BorderSide(
                              width: 2,
                              color:
                                  widget.onPressed == null || widget.isDisabled
                                      ? widget.isSelected[index]
                                          ? bottomBarDisabledColor
                                          : bottomBarUnselectedColor
                                      : widget.isSelected[index]
                                          ? bottomBarColor
                                          : bottomBarUnselectedColor,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(index == 0 ? borderRadius! : 0),
                            topRight: Radius.circular(
                                index == widget.toggleListItems.length - 1
                                    ? borderRadius!
                                    : 0),
                            bottomLeft:
                                Radius.circular(index == 0 ? borderRadius! : 0),
                            bottomRight: Radius.circular(
                                index == widget.toggleListItems.length - 1
                                    ? borderRadius!
                                    : 0),
                          ),
                        )
                      : null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: widget.toggleListItems[index],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
