// Copyright (c) 2025 Visa, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and
// limitations under the License.
//
// Visa Dialog
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// VDialogStyle using ThemeExtension
class VDialogStyle extends ThemeExtension<VDialogStyle> {
  const VDialogStyle({
    this.normalColor,
    this.warningIconColor,
    this.warningHLColor,
    this.errorIconColor,
    this.errorHLColor,
    this.successIconColor,
    this.successHLColor,
  });

  final Color? normalColor,
      warningIconColor,
      warningHLColor,
      errorIconColor,
      errorHLColor,
      successIconColor,
      successHLColor;

  @override
  VDialogStyle copyWith({
    Color? normalColor,
    warningIconColor,
    warningHLColor,
    errorIconColor,
    errorHLColor,
    successIconColor,
    successHLColor,
  }) =>
      VDialogStyle(
        normalColor: normalColor ?? this.normalColor,
        warningIconColor: warningIconColor ?? this.warningIconColor,
        warningHLColor: warningHLColor ?? this.warningHLColor,
        errorIconColor: errorIconColor ?? this.errorIconColor,
        errorHLColor: errorHLColor ?? this.errorHLColor,
        successIconColor: successIconColor ?? this.successIconColor,
        successHLColor: successHLColor ?? this.successHLColor,
      );

  @override
  VDialogStyle lerp(ThemeExtension<VDialogStyle>? other, double t) {
    if (other is! VDialogStyle) {
      return this;
    }

    return VDialogStyle(
      normalColor: Color.lerp(normalColor, other.normalColor, t),
      warningIconColor: Color.lerp(warningIconColor, other.warningIconColor, t),
      warningHLColor: Color.lerp(warningHLColor, other.warningHLColor, t),
      errorIconColor: Color.lerp(errorIconColor, other.errorIconColor, t),
      errorHLColor: Color.lerp(errorHLColor, other.errorHLColor, t),
      successIconColor: Color.lerp(successIconColor, other.successIconColor, t),
      successHLColor: Color.lerp(successHLColor, other.successHLColor, t),
    );
  }
}

enum DialogState { normal, warning, error, success }

class VDialogContent extends StatelessWidget {
  const VDialogContent({
    Key? key,
    this.dialogState = DialogState.normal,
    this.onClosePressed,
    this.dialogAction,
    this.title,
    this.description,
    this.actionText = visaDialogAction,
    this.dismissText = visaDialogDismiss,
    this.hasX = false,
    this.style,
    this.actionButtonFlex = 1,
    this.dismissButtonFlex = 1,
  })  : assert(title != null || description != null,
            'Both title and description cannot be null'),
        super(key: key);

  final String? title, description, actionText, dismissText;
  final DialogState dialogState;
  final VoidCallback? onClosePressed, dialogAction;
  final bool hasX;
  final VDialogStyle? style;
  final int actionButtonFlex, dismissButtonFlex;

  @override
  Widget build(BuildContext context) {
    final messageStyle = getMessageColorScheme()!;
    final normalColor = style?.normalColor ?? messageStyle.normalColor;
    final warningIconColor =
        style?.warningIconColor ?? messageStyle.warningText;
    final warningHLColor =
        style?.warningHLColor ?? messageStyle.warningGraphics;
    final errorIconColor = style?.errorIconColor ?? messageStyle.negativeText;
    final errorHLColor = style?.errorHLColor ?? messageStyle.negativeGraphics;
    final successIconColor =
        style?.successIconColor ?? messageStyle.positiveText;
    final successHLColor =
        style?.successHLColor ?? messageStyle.positiveGraphics;
    Color? getDialogColor(dialogState) {
      if (dialogState == DialogState.normal) {
        return normalColor;
      }
      if (dialogState == DialogState.warning) {
        return warningHLColor;
      }
      if (dialogState == DialogState.error) {
        return errorHLColor;
      }
      if (dialogState == DialogState.success) {
        return successHLColor;
      }
      return normalColor;
    }

    Widget getDialogIcon(dialogState) {
      if (dialogState == DialogState.warning) {
        return Row(
          children: [
            VIcon(
              svgIcon: VIcons.warningLow,
              iconHeight: 31,
              iconWidth: 31,
              iconColor: warningIconColor,
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        );
      }
      if (dialogState == DialogState.error) {
        return Row(
          children: [
            VIcon(
              svgIcon: VIcons.errorLow,
              iconHeight: 31,
              iconWidth: 31,
              iconColor: errorIconColor,
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        );
      }
      if (dialogState == DialogState.success) {
        return Row(
          children: [
            VIcon(
              svgIcon: VIcons.successLow,
              iconHeight: 31,
              iconWidth: 31,
              iconColor: successIconColor,
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        );
      }
      return const SizedBox.shrink();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: getDialogColor(dialogState)!, width: 3),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null)
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getDialogIcon(dialogState),
                      Expanded(
                        child: Text(
                          title!,
                          style: defaultVTheme.textStyles.headline3.copyWith(
                            fontWeight: VFontWeight.semiBold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            if (description != null)
              Column(
                children: [
                  Text(
                    description!,
                    style: defaultVTheme.textStyles.bodyText2
                        .copyWith(height: 1.5),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (dialogAction != null)
                  Expanded(
                    flex: actionButtonFlex,
                    child: VButton(
                      onPressed: dialogAction,
                      child: Text(actionText!),
                    ),
                  ),
                if (dialogAction != null)
                  const SizedBox(
                    width: 10,
                  ),
                Expanded(
                  flex: dismissButtonFlex,
                  child: VButton(
                    style: dialogAction != null
                        ? VButtonStyle(
                            backgroundColorActive: VColors.defaultSurface1,
                            backgroundColorDisabled: VColors.defaultSurface1,
                            foregroundColorActive: VColors.defaultActive,
                            foregroundColorDisabled: VColors.disabled,
                            overlayColorFocused: VColors.defaultSurfaceLowlight,
                            overlayColorPressed: VColors.defaultSurfaceLowlight,
                            borderSideActive: const BorderSide(
                              color: VColors.defaultActive,
                              style: BorderStyle.solid,
                            ),
                            borderSideDisabled: BorderSide(
                              color: VColors.defaultDisabled,
                              style: BorderStyle.solid,
                            ),
                          )
                        : null,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(dismissText!),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VDialogNestedContent extends StatelessWidget {
  const VDialogNestedContent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.pageNumber,
    required this.pageNumberBackgroundColor,
  }) : super(key: key);

  final String title, subtitle, description, pageNumber;
  final Color pageNumberBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MergeSemantics(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: defaultVTheme.textStyles.headline3.copyWith(
                      fontWeight: VFontWeight.semiBold,
                      height: 1.3,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: pageNumberBackgroundColor,
                  ),
                  child: Center(
                    child: Text(
                      pageNumber,
                      style: defaultVTheme.textStyles.subtitle2,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7.5,
                ),
                Text(
                  subtitle,
                  style: defaultVTheme.textStyles.bodyText2.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: defaultVTheme.textStyles.bodyText2.copyWith(height: 1.5),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class VDialogNested extends StatefulWidget {
  final List<VDialogNestedContent> pages;

  const VDialogNested({
    Key? key,
    required this.pages,
  }) : super(key: key);

  @override
  VDialogNestedState createState() => VDialogNestedState();
}

class VDialogNestedState extends State<VDialogNested> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: VColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: List.generate(widget.pages.length,
                      (index) => widget.pages[_currentPage]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${_currentPage + 1} of ${widget.pages.length}"),
                  const Spacer(),
                  _currentPage == 0
                      ? VButton(
                          onPressed: () => Navigator.pop(context),
                          style: VButtonStyle(
                            backgroundColorActive: VColors.defaultSurface1,
                            backgroundColorDisabled: VColors.defaultSurface1,
                            foregroundColorActive: VColors.defaultActive,
                            foregroundColorDisabled: VColors.disabled,
                            overlayColorFocused: VColors.defaultSurfaceLowlight,
                            overlayColorPressed: VColors.defaultSurfaceLowlight,
                            borderSideActive: const BorderSide(
                              color: VColors.defaultActive,
                              style: BorderStyle.solid,
                            ),
                            borderSideDisabled: BorderSide(
                              color: VColors.defaultDisabled,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: const Text("Close"),
                        )
                      : VButton(
                          onPressed: _goToPreviousPage,
                          style: VButtonStyle(
                            backgroundColorActive: VColors.defaultSurface1,
                            backgroundColorDisabled: VColors.defaultSurface1,
                            foregroundColorActive: VColors.defaultActive,
                            foregroundColorDisabled: VColors.disabled,
                            overlayColorFocused: VColors.defaultSurfaceLowlight,
                            overlayColorPressed: VColors.defaultSurfaceLowlight,
                            borderSideActive: const BorderSide(
                              color: VColors.defaultActive,
                              style: BorderStyle.solid,
                            ),
                            borderSideDisabled: BorderSide(
                              color: VColors.defaultDisabled,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: const Text("Previous"),
                        ),
                  const SizedBox(
                    width: 20,
                  ),
                  _currentPage == widget.pages.length - 1
                      ? VButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Done"),
                        )
                      : VButton(
                          onPressed: _goToNextPage,
                          child: const Text("Next"),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(microseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(microseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
