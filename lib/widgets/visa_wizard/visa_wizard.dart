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
  final List<bool> completedSteps;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;
  final VoidCallback? onDismiss;
  final int totalSteps;
  final VWizardStyle? style;
  final VExt? vExt;
  final bool hasError;
  final Widget? errorIcon;

  const VWizard({
    super.key,
    required this.currentStep,
    required this.completedSteps,
    this.onNext,
    this.onPrevious,
    this.onDismiss,
    required this.totalSteps,
    this.style,
    this.vExt,
    this.errorIcon,
    this.hasError = false,
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
    final incompleteColor = style?.incompleteColor ?? defaultStyle.textSubtle;
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
                int stepIndex = index ~/ 2;
                bool isCompleted = completedSteps[stepIndex];
                bool isInProgress = stepIndex == currentStep - 1;

                Color? backgroundColor = defaultBackgroundColor;
                Color? borderColor = incompleteColor;
                Widget? childIcon;

                if (hasError && isInProgress) {
                  backgroundColor = errorIconBgColor;
                  borderColor = errorIconBgColor;
                  childIcon = Semantics(
                    label: "Error, step ${stepIndex + 1} of $totalSteps",
                    child: VIcon(
                      svgIcon: VIcons.errorAltTiny,
                      iconHeight: 10,
                      iconWidth: 10,
                      iconColor: errorIconColor,
                    ),
                  );
                } else if (isCompleted && isInProgress) {
                  // Current step, completed: green bg, white checkmark
                  backgroundColor = successColor;
                  borderColor = successColor;
                  childIcon = Semantics(
                    label:
                        "Current step, completed, step ${stepIndex + 1} of $totalSteps",
                    child: const VIcon(
                      svgIcon: VIcons.checkmarkTiny,
                      iconHeight: 10,
                      iconWidth: 10,
                      iconColor: Colors.white,
                    ),
                  );
                } else if (isCompleted) {
                  // Completed, not current: white bg, green checkmark
                  backgroundColor = Colors.white;
                  borderColor = successColor;
                  childIcon = Semantics(
                    label: "Completed, step ${stepIndex + 1} of $totalSteps",
                    child: VIcon(
                      svgIcon: VIcons.checkmarkTiny,
                      iconHeight: 10,
                      iconWidth: 10,
                      iconColor: successColor,
                    ),
                  );
                } else if (isInProgress) {
                  // In progress, not completed: green bg, white number
                  backgroundColor = inProgressColor;
                  borderColor = inProgressColor;
                  childIcon = Semantics(
                    label:
                        "Current step, incompleted, step ${stepIndex + 1} of $totalSteps",
                    child: ExcludeSemantics(
                      child: Text(
                        '${stepIndex + 1}',
                        style: numberTextStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  );
                } else {
                  // Not completed, not current: default bg, gray number
                  backgroundColor = defaultBackgroundColor;
                  borderColor = incompleteColor;
                  childIcon = Semantics(
                    label:
                        "Incomplete step, step ${stepIndex + 1} of $totalSteps",
                    child: ExcludeSemantics(
                      child: Text(
                        '${stepIndex + 1}',
                        style: defaultVTheme.textStyles.uiLabelActive.copyWith(
                          color: incompleteColor,
                          fontWeight: VFontWeight.medium,
                        ),
                      ),
                    ),
                  );
                }

                return Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: borderColor!,
                      width: 1.0,
                    ),
                  ),
                  width: borderRadius,
                  height: borderRadius,
                  child: Center(
                    child: childIcon,
                  ),
                );
              } else {
                // This is a line
                int leftStep = index ~/ 2;
                bool isCompleted = completedSteps[leftStep];
                return Container(
                  width: 38.0,
                  height: 2.0,
                  color:
                      isCompleted ? successColor : VColors.defaultActiveSubtle,
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}
