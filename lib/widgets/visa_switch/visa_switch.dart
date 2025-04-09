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
// Visa switch constructor
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

// VSwitchStyle using ThemeExtension
class VSwitchStyle extends ThemeExtension<VSwitchStyle> {
  const VSwitchStyle({
    this.switchColor,
    this.tagColor,
    this.tagBorderColor,
    this.borderColor,
  });

  final Color? switchColor, tagColor, tagBorderColor, borderColor;

  @override
  VSwitchStyle copyWith({
    Color? switchColor,
    tagColor,
    tagBorderColor,
    borderColor,
  }) =>
      VSwitchStyle(
        switchColor: switchColor ?? this.switchColor,
        tagColor: tagColor ?? this.tagColor,
        tagBorderColor: tagBorderColor ?? this.tagBorderColor,
        borderColor: borderColor ?? this.borderColor,
      );

  @override
  VSwitchStyle lerp(ThemeExtension<VSwitchStyle>? other, double t) {
    if (other is! VSwitchStyle) {
      return this;
    }

    return VSwitchStyle(
      switchColor: Color.lerp(switchColor, other.switchColor, t),
      tagColor: Color.lerp(tagColor, other.tagColor, t),
      tagBorderColor: Color.lerp(tagBorderColor, other.tagBorderColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
    );
  }
}

class VSwitch extends StatefulWidget {
  const VSwitch({
    Key? key,
    required this.switchValue,
    this.isDisabled = false,
    required this.onPressed,
    this.style,
    this.vExt,
  }) : super(key: key);

  // BEGIN Properties
  final bool switchValue;
  final bool isDisabled;
  final VSwitchStyle? style;
  final VExt? vExt;
  // button on pressed
  final Function()? onPressed;
  // END

  @override
  State<VSwitch> createState() => _VSwitchState();
}

class _VSwitchState extends State<VSwitch> {
  bool isPressed = false;
  double switchTagWidth() {
    if (widget.isDisabled && widget.switchValue ||
        widget.isDisabled && !widget.switchValue) {
      return 1;
    }
    if (isPressed || widget.isDisabled || widget.switchValue) {
      return 2;
    }
    return 1;
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
    final tagColor = widget.style?.tagColor ?? defaultStyle.surface1;

    Color? switchStateColor() {
      if (isPressed && !widget.switchValue) {
        return widget.style?.switchColor ?? defaultStyle.surfaceLowlight;
      }
      if (isPressed && widget.switchValue) {
        return widget.style?.switchColor ?? defaultStyle.activePressed;
      }
      if (widget.isDisabled && widget.switchValue) {
        return widget.style?.switchColor ?? defaultStyle.disabled;
      }
      if (widget.isDisabled && !widget.switchValue) {
        return widget.style?.switchColor ?? defaultStyle.surface3;
      }
      if (widget.isDisabled) {
        return widget.style?.switchColor ?? defaultStyle.disabled;
      }
      if (widget.switchValue) {
        return widget.style?.switchColor ?? defaultStyle.active;
      }
      if (!widget.switchValue) {
        return widget.style?.switchColor ?? defaultStyle.surface3;
      }
      return widget.style?.switchColor ?? defaultStyle.surface3;
    }

    Color switchBorderStateColor() {
      if (isPressed && !widget.switchValue) {
        return widget.style?.borderColor ?? defaultStyle.active;
      }
      if (widget.isDisabled && !widget.switchValue) {
        return widget.style?.borderColor ??
            defaultStyle.subtle.withOpacity(0.2);
      }
      if (widget.isDisabled && widget.switchValue) {
        return widget.style?.borderColor ??
            defaultStyle.disabled.withOpacity(0.2);
      }
      if (widget.isDisabled) {
        return widget.style?.borderColor ?? defaultStyle.disabled;
      }
      if (widget.switchValue) {
        return widget.style?.borderColor ?? defaultStyle.active;
      }
      if (!widget.switchValue) {
        return widget.style?.borderColor ?? defaultStyle.subtle;
      }
      return widget.style?.borderColor ?? defaultStyle.surface3;
    }

    Color switchTagStateColor() {
      if (isPressed && !widget.switchValue) {
        return widget.style?.tagBorderColor ?? defaultStyle.active;
      }
      if (widget.isDisabled && !widget.switchValue) {
        return widget.style?.tagBorderColor ??
            defaultStyle.subtle.withOpacity(0.2);
      }
      if (widget.isDisabled && widget.switchValue) {
        return widget.style?.tagBorderColor ?? defaultStyle.surface1;
      }
      if (widget.isDisabled) {
        return widget.style?.tagBorderColor ?? defaultStyle.disabled;
      }
      if (!widget.switchValue) {
        return widget.style?.tagBorderColor ?? defaultStyle.subtle;
      }
      if (widget.switchValue) {
        return widget.style?.tagBorderColor ?? defaultStyle.surface1;
      }
      return widget.style?.tagBorderColor ?? defaultStyle.surface3;
    }

    return Semantics(
      container: true,
      toggled: widget.switchValue,
      enabled: widget.onPressed != null,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: widget.onPressed == null || widget.isDisabled == true
              ? null
              : widget.onPressed,
          onTapDown: widget.onPressed == null || widget.isDisabled == true
              ? null
              : ((_) {
                  setState(() {
                    isPressed = !isPressed;
                  });
                }),
          onTapUp: widget.onPressed == null || widget.isDisabled == true
              ? null
              : (_) {
                  setState(() {
                    isPressed = !isPressed;
                  });
                },
          onTapCancel: (() {
            setState(() {
              isPressed = !isPressed;
            });
          }),
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 300,
            ),
            curve: Curves.decelerate,
            width: 55,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: switchStateColor(),
              border: Border.all(
                color: switchBorderStateColor(),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: AnimatedAlign(
                duration: const Duration(
                  milliseconds: 300,
                ),
                alignment: widget.switchValue
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: tagColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: switchTagStateColor(),
                      width: switchTagWidth(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
