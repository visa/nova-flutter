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
// Visa Wizard
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
import 'dart:ui';

class VWizardStyle extends ThemeExtension<VWizardStyle> {
  const VWizardStyle({
    this.defaultBackgroundColor,
    this.inProgressColor,
    this.successColor,
    this.incompleteColor,
    this.numberTextStyle,
    this.borderRadius,
    this.errorIconColor,
    this.errorIconBgColor,
  });

  final Color? defaultBackgroundColor,
      inProgressColor,
      successColor,
      incompleteColor,
      errorIconColor,
      errorIconBgColor;
  final TextStyle? numberTextStyle;
  final double? borderRadius;

  @override
  VWizardStyle copyWith({
    Color? defaultBackgroundColor,
    Color? inProgressColor,
    Color? successColor,
    Color? incompleteColor,
    Color? errorIconColor,
    Color? errorIconBgColor,
    TextStyle? numberTextStyle,
    double? borderRadius,
  }) {
    return VWizardStyle(
      defaultBackgroundColor:
          defaultBackgroundColor ?? this.defaultBackgroundColor,
      inProgressColor: inProgressColor ?? this.inProgressColor,
      successColor: successColor ?? this.successColor,
      incompleteColor: incompleteColor ?? this.incompleteColor,
      numberTextStyle: numberTextStyle ?? this.numberTextStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      errorIconColor: errorIconColor ?? this.errorIconColor,
      errorIconBgColor: errorIconBgColor ?? this.errorIconBgColor,
    );
  }

  @override
  VWizardStyle lerp(ThemeExtension<VWizardStyle>? other, double t) {
    if (other is! VWizardStyle) {
      return this;
    }

    return VWizardStyle(
      defaultBackgroundColor:
          Color.lerp(defaultBackgroundColor, other.defaultBackgroundColor, t),
      inProgressColor: Color.lerp(inProgressColor, other.inProgressColor, t),
      successColor: Color.lerp(successColor, other.successColor, t),
      incompleteColor: Color.lerp(incompleteColor, other.incompleteColor, t),
      numberTextStyle: numberTextStyle ?? other.numberTextStyle,
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
      errorIconColor: Color.lerp(errorIconColor, other.errorIconColor, t),
      errorIconBgColor: Color.lerp(errorIconBgColor, other.errorIconBgColor, t),
    );
  }
}

class VWizard extends StatelessWidget {
  final int currentStep;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;
  final VoidCallback? onDismiss;
  final int totalSteps;
  final VWizardStyle? style;
  final VExt? vExt;
  final bool hasError;
  final Widget? errorIcon;
  final Widget child;

  const VWizard({
    super.key,
    required this.currentStep,
    this.onNext,
    this.onPrevious,
    this.onDismiss,
    required this.totalSteps,
    this.style,
    this.vExt,
    this.errorIcon,
    this.hasError = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (vExt == null || vExt is VDef) {
      defaultStyle = getDefaultColorScheme()!;
    } else {
      defaultStyle = getAltColorScheme()!;
    }

    final messageStyle = getMessageColorScheme()!;

    final defaultBackgroundColor =
        style?.defaultBackgroundColor ?? defaultStyle.surface1;
    final inProgressColor = style?.inProgressColor ?? defaultStyle.active;
    final successColor = style?.successColor ?? messageStyle.positiveText;
    final errorIconColor = style?.errorIconColor ?? defaultStyle.surface1;

    final errorIconBgColor = style?.errorIconColor ?? messageStyle.negativeText;
    final incompleteColor = style?.incompleteColor ?? defaultStyle.activeSubtle;
    final numberTextStyle = style?.numberTextStyle ??
        defaultStyle.vWizardProperties.numberTextStyle;
    final borderRadius =
        style?.borderRadius ?? defaultStyle.vWizardProperties.borderRadius;

    return Column(
      children: [
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(totalSteps * 2 - 1, (index) {
              if (index % 2 == 0) {
                // This is a step
                int stepNumber = index ~/ 2 + 1;
                bool isCompleted = stepNumber < currentStep;
                bool isInProgress = stepNumber == currentStep;
                return Container(
                  decoration: BoxDecoration(
                    color: hasError && isInProgress
                        ? errorIconBgColor
                        : isInProgress
                            ? inProgressColor
                            : defaultBackgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isCompleted
                          ? successColor
                          : (hasError && isInProgress
                              ? errorIconBgColor
                              : isInProgress
                                  ? inProgressColor
                                  : incompleteColor),
                      width: 2.0,
                    ),
                  ),
                  width: borderRadius,
                  height: borderRadius,
                  child: Center(
                    child: isCompleted
                        ? Semantics(
                            label: "Completed, step $stepNumber of $totalSteps",
                            child: VIcon(
                              svgIcon: VIcons.checkmarkTiny,
                              iconHeight: 10,
                              iconWidth: 10,
                              iconColor: successColor,
                            ),
                          )
                        : (isInProgress
                            ? Transform.translate(
                                offset: const Offset(0, -1),
                                child: hasError
                                    ? Semantics(
                                        label:
                                            "Error, step $currentStep of $totalSteps",
                                        child: VIcon(
                                          svgIcon: VIcons.errorAltTiny,
                                          iconHeight: 10,
                                          iconWidth: 10,
                                          iconColor: errorIconColor,
                                        ),
                                      )
                                    : Semantics(
                                        label:
                                            "Current step, step $currentStep of $totalSteps",
                                        child: Center(
                                          child: ExcludeSemantics(
                                            child: Text(
                                              '$stepNumber',
                                              style: numberTextStyle,
                                            ),
                                          ),
                                        ),
                                      ),
                              )
                            : Transform.translate(
                                offset: const Offset(0, -1),
                                child: Semantics(
                                  label:
                                      "Incomplete step, step $stepNumber of $totalSteps",
                                  child: ExcludeSemantics(
                                    child: Text(
                                      '$stepNumber',
                                      style: defaultVTheme
                                          .textStyles.uiLabelSmall
                                          .copyWith(
                                        color: incompleteColor,
                                        fontSize: 12,
                                        fontWeight: VFontWeight.medium,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                  ),
                );
              } else {
                // This is a line
                bool isCompleted = index ~/ 2 + 1 < currentStep;
                return Container(
                  width: 38.0,
                  height: 2.0,
                  color: isCompleted ? successColor : incompleteColor,
                );
              }
            }),
          ),
        ),
        child
      ],
    );
  }
}
