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
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:flutter/semantics.dart';
import 'package:visa_nova_flutter/widgets/visa_checkbox/models/nested_indeterminate_controller.dart';
import 'package:visa_nova_flutter/widgets/visa_checkbox/models/nested_indeterminate_item.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// VCheckboxStyle using ThemeExtension
class VCheckboxStyle extends ThemeExtension<VCheckboxStyle> {
  const VCheckboxStyle({
    this.borderColor,
    this.borderColorDisabled,
    this.borderColorError,
    this.fillColor,
    this.fillColorPressed,
    this.fillColorDisabled,
    this.iconColor,
    this.iconColorError,
    this.textColorError,
    this.textColor,
    this.textColorDisabled,
    this.overlayColor,
    this.crossAxisAlignment,
  });

  final Color? borderColor,
      borderColorDisabled,
      borderColorError,
      fillColor,
      fillColorPressed,
      fillColorDisabled,
      iconColor,
      iconColorError,
      textColorError,
      textColor,
      textColorDisabled,
      overlayColor;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  VCheckboxStyle copyWith(
          {Color? borderColor,
          borderColorDisabled,
          borderColorError,
          fillColor,
          fillColorPressed,
          fillColorDisabled,
          iconColor,
          iconColorError,
          textColor,
          textColorDisabled,
          textColorError,
          overlayColor,
          crossAxisAlignment}) =>
      VCheckboxStyle(
        borderColor: borderColor ?? this.borderColor,
        borderColorDisabled: borderColorDisabled ?? this.borderColorDisabled,
        borderColorError: borderColorError ?? this.borderColorError,
        fillColor: fillColor ?? this.fillColor,
        fillColorPressed: fillColorPressed ?? this.fillColorPressed,
        fillColorDisabled: fillColorDisabled ?? this.fillColorDisabled,
        iconColor: iconColor ?? this.iconColor,
        iconColorError: iconColorError ?? this.iconColorError,
        textColor: textColor ?? this.textColor,
        textColorError: textColorError ?? this.textColorError,
        textColorDisabled: textColorDisabled ?? this.textColorDisabled,
        overlayColor: overlayColor ?? this.overlayColor,
        crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      );

  @override
  VCheckboxStyle lerp(ThemeExtension<VCheckboxStyle>? other, double t) {
    if (other is! VCheckboxStyle) {
      return this;
    }

    return VCheckboxStyle(
        borderColor: Color.lerp(borderColor, other.borderColor, t),
        borderColorDisabled:
            Color.lerp(borderColorDisabled, other.borderColorDisabled, t),
        borderColorError:
            Color.lerp(borderColorError, other.borderColorError, t),
        fillColor: Color.lerp(fillColor, other.fillColor, t),
        fillColorPressed:
            Color.lerp(fillColorPressed, other.fillColorPressed, t),
        fillColorDisabled:
            Color.lerp(fillColorDisabled, other.fillColorDisabled, t),
        iconColor: Color.lerp(iconColor, other.iconColor, t),
        iconColorError: Color.lerp(iconColorError, other.iconColorError, t),
        textColor: Color.lerp(textColor, other.textColor, t),
        textColorError: Color.lerp(textColorError, other.textColorError, t),
        textColorDisabled:
            Color.lerp(textColorDisabled, other.textColorDisabled, t),
        overlayColor: Color.lerp(overlayColor, other.overlayColor, t),
        crossAxisAlignment: crossAxisAlignment);
  }
}

// Regular Checkbox tile
@immutable
class VCheckboxTile extends StatefulWidget {
  VCheckboxTile({
    Key? key,
    this.title,
    this.subtitle,
    this.isDisabled = false,
    this.isChecked = false,
    this.tristate = false,
    this.validate = false,
    this.isPressed = false,
    this.controlAffinity = ListTileControlAffinity.leading,
    this.vExt,
    this.style,
    this.titleStyle,
    this.subtitleStyle,
    this.secondary,
    this.child,
    this.onChanged,
  }) : super(key: key);

  final String? subtitle, title;
  final Widget? secondary, child;
  final TextStyle? titleStyle, subtitleStyle;
  final bool isDisabled;
  bool? isChecked;
  final bool tristate;
  final bool validate;
  final bool isPressed;
  final VExt? vExt;
  final VCheckboxStyle? style;
  final ListTileControlAffinity controlAffinity;
  final void Function(bool?)? onChanged;

  @override
  State<VCheckboxTile> createState() => _VCheckboxTileState();
}

class _VCheckboxTileState extends State<VCheckboxTile> {
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
    final borderColor = widget.style?.borderColor ?? defaultStyle?.active;
    final borderColorDisabled =
        widget.style?.borderColorDisabled ?? defaultStyle?.disabled;
    final fillColor = widget.style?.fillColor ?? defaultStyle?.active;
    final fillColorPressed =
        widget.style?.fillColorPressed ?? defaultStyle?.activePressed;
    final fillColorDisabled =
        widget.style?.fillColorPressed ?? defaultStyle?.disabled;
    final overlayColor =
        widget.style?.overlayColor ?? defaultStyle?.surfaceLowlight;
    final crossAxisAlignment =
        widget.style?.crossAxisAlignment ?? CrossAxisAlignment.center;

    return VMatCheckboxListTile(
      // Pressed state is not working in this case since fillColor only resolves with
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return fillColorDisabled;
        }
        if (states.contains(MaterialState.pressed)) {
          return fillColorPressed;
        } else {
          return fillColor;
        }
      }),
      // Reduce the space between each tile
      dense: true,
      tristate: widget.tristate,
      // Using Transform.translate to reduce the padding between checkbox and its title
      title: widget.title,
      subtitle: widget.subtitle,
      secondary: widget.secondary,
      isThreeLine: widget.subtitle != null,
      controlAffinity: widget.controlAffinity,
      crossAxisAlignment: crossAxisAlignment,
      value: widget.isChecked,
      onChanged: widget.isDisabled
          ? null
          : (bool? value) {
              widget.onChanged != null
                  ? widget.onChanged!(value)
                  : setState(() {
                      widget.isChecked = value;
                    });
            },
      contentPadding: EdgeInsets.zero,
      overlayColor: MaterialStateColor.resolveWith((states) => overlayColor!),
      side: BorderSide(
          width: 2,
          color: widget.isDisabled ? borderColorDisabled! : borderColor!),
      focusNode: FocusNode(skipTraversal: true),
      titleStyle: widget.titleStyle,
      subtitleStyle: widget.subtitleStyle,
      child: widget.child,
    );
  }
}

class NestedCheckbox extends StatefulWidget {
  const NestedCheckbox({
    super.key,
    required this.options,
    this.controller,
    this.setSelectedValues,
    this.vExt,
    this.style,
    this.selectedValues = const <VNestedCheckboxItem>[],
  });

  ///
  /// Theme
  ///
  final VExt? vExt;

  ///
  /// Style of Checkbox.
  ///
  final VCheckboxStyle? style;

  ///
  /// Use this controller to get access to internal state of the Multiselect
  ///
  final NestedCheckboxController? controller;

  ///
  /// Preselected options
  ///
  final List<VNestedCheckboxItem> selectedValues;

  ///
  /// The options which a user can see and select
  ///
  final List<VNestedCheckboxItem> options;

  ///
  /// Callback to pass the selectedValues to the parent
  /// It's triggered when you add or remove elements from the selected items
  ///
  final Function(List<VNestedCheckboxItem>)? setSelectedValues;

  @override
  State<NestedCheckbox> createState() => _NestedCheckboxState();
}

class _NestedCheckboxState extends State<NestedCheckbox> {
  final List<VNestedCheckboxItem> _localSelectedOptions = [];
  final List<VNestedCheckboxItem> _localSelectedParents = [];
  final List<VNestedCheckboxItem> _localIndeterminateParents = [];

  @override
  void initState() {
    super.initState();
    _localSelectedOptions.addAll(widget.selectedValues);
    if (widget.controller != null) {
      widget.controller!.getAllSelectedItems = _getAllValues;
      widget.controller!.clearValues = _clearValues;
    }
  }

  void _parentChanged(
      VNestedCheckboxItem origin, VNestedCheckboxItem current, bool? value) {
    if (current.parent != null) {
      for (int i = 0; i < current.parent!.children!.length; i++) {
        VNestedCheckboxItem currentParent = current.parent!;
        VNestedCheckboxItem currentChild = current.parent!.children![i];
        if (value == true) {
          if (currentChild.id != origin.id) {
            if (currentChild.children!.isEmpty) {
              if (!_localSelectedOptions.contains(currentChild)) {
                if (!_localIndeterminateParents.contains(currentParent)) {
                  if (_localSelectedParents.contains(currentParent)) {
                    _localSelectedParents.remove(currentParent);
                  }
                  _localIndeterminateParents.add(currentParent);
                }
                break;
              }
            } else {
              // PASS TRUE BUT IF SIBLING IS NULL OR TRUE
              if ((!_localIndeterminateParents.contains(currentChild) &&
                      !_localSelectedParents.contains(currentChild)) ||
                  !_localSelectedParents.contains(currentChild)) {
                if (!_localIndeterminateParents.contains(currentParent)) {
                  if (_localSelectedParents.contains(currentParent)) {
                    _localSelectedParents.remove(currentParent);
                  }
                  _localIndeterminateParents.add(currentParent);
                }
                break;
              }
            }
          }
        } else if (value == false) {
          if (currentChild.id != origin.id) {
            if (currentChild.children!.isEmpty) {
              if (_localSelectedOptions.contains(currentChild)) {
                if (!_localIndeterminateParents.contains(currentParent)) {
                  if (_localSelectedParents.contains(currentParent)) {
                    _localSelectedParents.remove(currentParent);
                  }
                  _localIndeterminateParents.add(currentParent);
                }
                break;
              }
            } else {
              if (_localIndeterminateParents.contains(currentChild) ||
                  _localSelectedParents.contains(currentChild)) {
                if (!_localIndeterminateParents.contains(currentParent)) {
                  if (_localSelectedParents.contains(currentParent)) {
                    _localSelectedParents.remove(currentParent);
                  }
                  _localIndeterminateParents.add(currentParent);
                }
                break;
              }
            }
          }
        }

        if (i == currentParent.children!.length - 1) {
          if (value == true) {
            if (_localIndeterminateParents.contains(current.parent!)) {
              _localIndeterminateParents.remove(current.parent!);
            }
            _localSelectedParents.add(current.parent!);
          } else if (value == false) {
            if (_localIndeterminateParents.contains(current.parent!)) {
              _localIndeterminateParents.remove(current.parent!);
            }
          }
        }
      }
      _parentChanged(origin, current.parent!, value);
    }
  }

  void _childrenChanged(
      {required bool? value,
      required VNestedCheckboxItem current,
      List<VNestedCheckboxItem>? children}) {
    if (children!.isNotEmpty) {
      for (int i = 0; i < children.length; i++) {
        _childrenChanged(
            value: value, current: children[i], children: children[i].children);
      }
    }
    setState(() {
      if (value == true) {
        if (current.children!.isEmpty) {
          if (!_localSelectedOptions.contains(current)) {
            _localSelectedOptions.add(current);
          }
        } else {
          if (!_localSelectedParents.contains(current)) {
            _localIndeterminateParents.remove(current);
            _localSelectedParents.add(current);
          }
        }
      } else {
        if (current.children!.isEmpty) {
          _localSelectedOptions.remove(
            current,
          );
        } else {
          _localSelectedParents.remove(current);
        }
      }
      _updateValue();
    });
  }

  void _updateValue() {
    widget.setSelectedValues!(_localSelectedOptions);
  }

  void _clearValues() {
    _localSelectedOptions.clear();
    _localIndeterminateParents.clear();
    _localSelectedParents.clear();
  }

  Map<String, List<VNestedCheckboxItem>> _getAllValues() {
    return {
      "selectedOptions": _localSelectedOptions,
      "selectedParentsOptions": _localSelectedParents,
      "indeterminateParentsOptions": _localIndeterminateParents
    };
  }

  bool _checkIsSelected(VNestedCheckboxItem item) {
    return _localSelectedOptions.indexWhere((option) => option.id == item.id) ==
            -1
        ? false
        : true;
  }

  bool? _checkParent(VNestedCheckboxItem item) {
    return _localIndeterminateParents
                .indexWhere((option) => option.id == item.id) ==
            -1
        ? _localSelectedParents.indexWhere((option) => option.id == item.id) ==
                -1
            ? false
            : true
        : null;
  }

  Widget _vNestedCheckbox(List<VNestedCheckboxItem> obj) {
    return ListView(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: obj.map((element) {
        return Column(
          children: [
            VNestedCheckboxTile(
              checkboxType: CheckboxType.parent,
              tristate: true,
              label: element.label,
              value: element.children!.isEmpty
                  ? _checkIsSelected(element)
                  : _checkParent(element),
              valueChanged: (bool value) {
                _childrenChanged(
                    value: value, current: element, children: element.children);
                _parentChanged(element, element, value);
              },
              style: widget.style,
            ),
            if (element.children != null)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: _vNestedCheckbox(element.children!),
              )
          ],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _vNestedCheckbox(widget.options);
  }
}

// Nested Checkbox tile
enum CheckboxType {
  parent,
  child,
}

@immutable
class VNestedCheckboxTile extends StatelessWidget {
  const VNestedCheckboxTile({
    super.key,
    required this.label,
    required this.value,
    required this.valueChanged,
    this.tristate = true,
    this.checkboxType = CheckboxType.child,
    this.style,
  });

  final String label;
  final bool? value;
  final bool tristate;
  final ValueChanged<bool> valueChanged;
  final CheckboxType checkboxType;
  final VCheckboxStyle? style;

  void _onChanged() {
    // If it is selected (true) or unselected (false)
    if (value != null) {
      // Change it to the opposite value
      //(for parent, when all selected, change it to all unselected)
      valueChanged(!value!);
    } else {
      // If it is null (indeterminate state), check them all (as the web behaves)
      valueChanged(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultStyle = getDefaultColorScheme();
    final borderColor = style?.borderColor ?? defaultStyle?.active;
    final fillColor = style?.fillColor ?? defaultStyle?.active;
    final fillColorPressed =
        style?.fillColorPressed ?? defaultStyle?.activePressed;
    final fillColorDisabled = style?.fillColorPressed ?? defaultStyle?.disabled;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 1, 0, 1),
      child: VMatCheckboxListTile(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return fillColorDisabled;
          }
          if (states.contains(MaterialState.pressed)) {
            return fillColorPressed;
          } else {
            return fillColor;
          }
        }),
        // Reduce the space between tiles
        dense: true,
        tristate: tristate,
        // Using Transform.translate to reduce the padding between checkbox and its title
        title: label,
        titleStyle: defaultVTheme.textStyles.uiLabelLarge,
        controlAffinity: ListTileControlAffinity.leading,
        value: value,
        onChanged: (_) {
          _onChanged();
        },
        activeColor: fillColor,
        contentPadding: checkboxType == CheckboxType.child
            ? const EdgeInsets.only(left: 16)
            : EdgeInsets.zero,
        side: BorderSide(width: 2, color: borderColor!),
        focusNode: FocusNode(skipTraversal: true),
      ),
    );
  }
}

// Checkbox validation tile
@immutable
class VCheckboxValidationTile extends StatefulWidget {
  VCheckboxValidationTile({
    Key? key,
    required this.label,
    this.isDisabled = false,
    this.isChecked = false,
    this.tristate = false,
    this.validate = false,
    this.displayError = false,
    required this.errorMessage,
    required this.validationButtonText,
    required this.style,
  }) : super(key: key);

  final String label, errorMessage, validationButtonText;
  final bool isDisabled;
  bool? isChecked;
  final bool tristate;
  final bool validate;
  bool displayError;
  final VCheckboxStyle style;

  @override
  State<VCheckboxValidationTile> createState() =>
      _VCheckboxValidationTileState();
}

class _VCheckboxValidationTileState extends State<VCheckboxValidationTile> {
  @override
  Widget build(BuildContext context) {
    final defaultStyle = getDefaultColorScheme();
    final messageStyle = getMessageColorScheme();
    final borderColor = widget.style.borderColor ?? defaultStyle?.active;

    final borderColorError =
        widget.style.borderColorError ?? messageStyle?.negativeGraphics;
    final fillColor = widget.style.fillColor ?? defaultStyle?.active;
    final iconColorError =
        widget.style.iconColorError ?? messageStyle?.negativeGraphics;
    final textColorError =
        widget.style.textColorError ?? messageStyle?.negativeText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MergeSemantics(
          child: Transform.translate(
            offset: const Offset(-5, 0),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              VMatCheckbox(
                value: widget.isChecked,
                onChanged: widget.isDisabled
                    ? null
                    : (bool? value) {
                        setState(() {
                          widget.isChecked = value;
                        });
                      },
                activeColor: fillColor,
                side: BorderSide(
                    width: 2,
                    color:
                        widget.displayError ? borderColorError! : borderColor!),
              ),
              Expanded(
                child: Transform.translate(
                  offset: const Offset(-3, 1),
                  child: Text(
                    widget.label,
                    style: defaultVTheme.textStyles.uiLabelLarge,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
            ]),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ExcludeSemantics(
          child: Visibility(
            visible: widget.displayError,
            child: Text.rich(
                TextSpan(style: defaultVTheme.textStyles.uiLabel, children: [
              WidgetSpan(
                  child: VIcon(
                // errorIcon18 is different from errorIcon, using in validation only
                svgIcon: VIcons.errorTiny,
                iconColor: iconColorError,
              )),
              const WidgetSpan(
                  child: Padding(padding: EdgeInsets.only(left: 5))),
              TextSpan(
                  text: checkboxError, style: TextStyle(color: textColorError))
            ])),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        VButton(
            child: Text(widget.validationButtonText,
                style: defaultVTheme.textStyles.buttonMedium
                    .copyWith(color: VColors.defaultSurface1)),
            onPressed: () async {
              if (widget.isChecked != true) {
                setState(() {
                  widget.displayError = true;
                });
                SemanticsService.announce(
                    widget.errorMessage, TextDirection.ltr);
              } else {
                setState(() {
                  widget.displayError = false;
                });
              }
            })
      ],
    );
  }
}
