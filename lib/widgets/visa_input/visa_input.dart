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
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

// VInputStyle using ThemeExtension
class VInputStyle extends ThemeExtension<VInputStyle> {
  const VInputStyle({
    this.borderColor,
    this.borderRadius,
    this.bottomBarColor,
    this.bottomBarErrorColor,
    this.containerColor,
    this.counterErrorTextColor,
    this.counterTextColor,
    this.counterTextStyle,
    this.errorBorderColor,
    this.errorIconColor,
    this.errorTextColor,
    this.errorTextStyle,
    this.inputContainerHeight,
    this.inputDefaultColor,
    this.inputDisabledColor,
    this.inputFocusedColor,
    this.inputTextStyle,
    this.leadingIconColor,
    this.textFieldColor,
    this.thumbColor,
    this.topLabelDefaultColor,
    this.topLabelTextStyle,
    this.trackBorderColor,
    this.trackColor,
    this.trackRadius,
    this.trailingIconColor,
    this.validateErrorTextStyle,
    this.borderDefaultColor,
    this.borderDisabledColor,
    this.borderErrorColor,
    this.borderFocusedColor,
    this.leadingIconDefaultColor,
    this.leadingIconDisabledColor,
    this.leadingIconErrorColor,
    this.leadingIconFocusedColor,
    this.leadingPrefixColor,
    this.topLabelDisabledTextColor,
    this.topLabelErrorTextColor,
    this.topLabelFocusedTextColor,
    this.trailingIconDefaultColor,
    this.trailingIconDisabledColor,
    this.trailingIconErrorColor,
    this.trailingIconFocusedColor,
    this.trailingSuffixColor,
    this.cursorColor,
    this.topLabelTextColor,
    this.hintTextStyle,
  });

  final Color? textFieldColor,
      topLabelTextColor,
      borderColor,
      thumbColor,
      trackColor,
      trackBorderColor,
      leadingIconColor,
      inputDisabledColor,
      inputDefaultColor,
      inputFocusedColor,
      errorBorderColor,
      containerColor,
      trailingIconColor,
      bottomBarErrorColor,
      bottomBarColor,
      counterErrorTextColor,
      counterTextColor,
      errorIconColor,
      errorTextColor,
      topLabelErrorTextColor,
      topLabelDisabledTextColor,
      topLabelFocusedTextColor,
      topLabelDefaultColor,
      borderErrorColor,
      borderDisabledColor,
      borderFocusedColor,
      borderDefaultColor,
      leadingPrefixColor,
      leadingIconErrorColor,
      leadingIconDisabledColor,
      leadingIconFocusedColor,
      leadingIconDefaultColor,
      trailingSuffixColor,
      trailingIconErrorColor,
      trailingIconDisabledColor,
      trailingIconFocusedColor,
      trailingIconDefaultColor,
      cursorColor;
  final double? borderRadius, trackRadius, inputContainerHeight;
  final TextStyle? topLabelTextStyle,
      inputTextStyle,
      errorTextStyle,
      counterTextStyle,
      validateErrorTextStyle,
      hintTextStyle;

  @override
  VInputStyle copyWith({
    Color? textFieldColor,
    topLabelDefaultColor,
    borderColor,
    thumbColor,
    trackColor,
    trackBorderColor,
    leadingIconColor,
    inputDisabledColor,
    inputDefaultColor,
    inputFocusedColor,
    errorBorderColor,
    containerColor,
    trailingIconColor,
    bottomBarErrorColor,
    bottomBarColor,
    counterErrorTextColor,
    counterTextColor,
    errorIconColor,
    errorTextColor,
    topLabelErrorTextColor,
    topLabelDisabledTextColor,
    topLabelFocusedTextColor,
    topLabelTextColor,
    borderErrorColor,
    borderDisabledColor,
    borderFocusedColor,
    borderDefaultColor,
    leadingPrefixColor,
    leadingIconErrorColor,
    leadingIconDisabledColor,
    leadingIconFocusedColor,
    leadingIconDefaultColor,
    trailingSuffixColor,
    trailingIconErrorColor,
    trailingIconDisabledColor,
    trailingIconFocusedColor,
    trailingIconDefaultColor,
    cursorColor,
    double? borderRadius,
    trackRadius,
    inputContainerHeight,
    TextStyle? topLabelTextStyle,
    inputTextStyle,
    errorTextStyle,
    counterTextStyle,
    validateErrorTextStyle,
    hintTextStyle,
  }) =>
      VInputStyle(
        topLabelTextColor: topLabelTextColor ?? this.topLabelTextColor,
        inputDefaultColor: inputDefaultColor ?? this.inputDefaultColor,
        textFieldColor: textFieldColor ?? this.textFieldColor,
        borderColor: borderColor ?? this.borderColor,
        thumbColor: thumbColor ?? this.thumbColor,
        trackColor: trackColor ?? this.trackColor,
        trackBorderColor: trackBorderColor ?? this.trackBorderColor,
        leadingIconColor: leadingIconColor ?? this.leadingIconColor,
        inputDisabledColor: inputDisabledColor ?? this.inputDisabledColor,
        errorBorderColor: errorBorderColor ?? this.errorBorderColor,
        containerColor: containerColor ?? this.containerColor,
        trailingIconColor: trailingIconColor ?? this.trailingIconColor,
        bottomBarErrorColor: bottomBarErrorColor ?? this.bottomBarErrorColor,
        bottomBarColor: bottomBarColor ?? this.bottomBarColor,
        counterErrorTextColor:
            counterErrorTextColor ?? this.counterErrorTextColor,
        counterTextColor: counterTextColor ?? this.counterTextColor,
        errorIconColor: errorIconColor ?? this.errorIconColor,
        errorTextColor: errorTextColor ?? this.errorTextColor,
        inputFocusedColor: inputFocusedColor ?? this.inputFocusedColor,
        topLabelErrorTextColor:
            topLabelErrorTextColor ?? this.topLabelErrorTextColor,
        topLabelDisabledTextColor:
            topLabelDisabledTextColor ?? this.topLabelDisabledTextColor,
        topLabelFocusedTextColor:
            topLabelFocusedTextColor ?? this.topLabelFocusedTextColor,
        topLabelDefaultColor: topLabelDefaultColor ?? this.topLabelDefaultColor,
        borderErrorColor: borderErrorColor ?? this.borderErrorColor,
        borderDisabledColor: borderDisabledColor ?? this.borderDisabledColor,
        borderFocusedColor: borderFocusedColor ?? this.borderFocusedColor,
        borderDefaultColor: borderDefaultColor ?? this.borderDefaultColor,
        leadingPrefixColor: leadingPrefixColor ?? this.leadingPrefixColor,
        leadingIconErrorColor:
            leadingIconErrorColor ?? this.leadingIconErrorColor,
        leadingIconDisabledColor:
            leadingIconDisabledColor ?? this.leadingIconDisabledColor,
        leadingIconFocusedColor:
            leadingIconFocusedColor ?? this.leadingIconFocusedColor,
        leadingIconDefaultColor:
            leadingIconDefaultColor ?? this.leadingIconDefaultColor,
        trailingSuffixColor: trailingSuffixColor ?? this.trailingSuffixColor,
        trailingIconErrorColor:
            trailingIconErrorColor ?? this.trailingIconErrorColor,
        trailingIconDisabledColor:
            trailingIconDisabledColor ?? this.trailingIconDisabledColor,
        trailingIconFocusedColor:
            trailingIconFocusedColor ?? this.trailingIconFocusedColor,
        trailingIconDefaultColor:
            trailingIconDefaultColor ?? this.trailingIconDefaultColor,
        cursorColor: cursorColor ?? this.cursorColor,
        borderRadius: borderRadius ?? this.borderRadius,
        trackRadius: trackRadius ?? this.trackRadius,
        inputContainerHeight: inputContainerHeight ?? this.inputContainerHeight,
        topLabelTextStyle: topLabelTextStyle ?? this.topLabelTextStyle,
        inputTextStyle: inputTextStyle ?? this.inputTextStyle,
        errorTextStyle: errorTextStyle ?? this.errorTextStyle,
        counterTextStyle: counterTextStyle ?? this.counterTextStyle,
        validateErrorTextStyle:
            validateErrorTextStyle ?? this.validateErrorTextStyle,
        hintTextStyle: hintTextStyle ?? this.hintTextStyle,
      );

  @override
  VInputStyle lerp(ThemeExtension<VInputStyle>? other, double t) {
    if (other is! VInputStyle) {
      return this;
    }

    return VInputStyle(
      topLabelTextColor:
          Color.lerp(topLabelTextColor, other.topLabelTextColor, t),
      inputDefaultColor:
          Color.lerp(inputDefaultColor, other.inputDefaultColor, t),
      textFieldColor: Color.lerp(textFieldColor, other.textFieldColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      thumbColor: Color.lerp(thumbColor, other.thumbColor, t),
      trackColor: Color.lerp(trackColor, other.trackColor, t),
      trackBorderColor: Color.lerp(trackBorderColor, other.trackBorderColor, t),
      leadingIconColor: Color.lerp(leadingIconColor, other.leadingIconColor, t),
      inputDisabledColor:
          Color.lerp(inputDisabledColor, other.inputDisabledColor, t),
      errorBorderColor: Color.lerp(errorBorderColor, other.errorBorderColor, t),
      containerColor: Color.lerp(containerColor, other.containerColor, t),
      trailingIconColor:
          Color.lerp(trailingIconColor, other.trailingIconColor, t),
      bottomBarErrorColor:
          Color.lerp(bottomBarErrorColor, other.bottomBarErrorColor, t),
      bottomBarColor: Color.lerp(bottomBarColor, other.bottomBarColor, t),
      counterErrorTextColor:
          Color.lerp(counterErrorTextColor, other.counterErrorTextColor, t),
      counterTextColor: Color.lerp(counterTextColor, other.counterTextColor, t),
      errorIconColor: Color.lerp(errorIconColor, other.errorIconColor, t),
      errorTextColor: Color.lerp(errorTextColor, other.errorTextColor, t),
      inputFocusedColor:
          Color.lerp(inputFocusedColor, other.inputFocusedColor, t),
      topLabelErrorTextColor:
          Color.lerp(topLabelErrorTextColor, other.topLabelErrorTextColor, t),
      topLabelDisabledTextColor: Color.lerp(
          topLabelDisabledTextColor, other.topLabelDisabledTextColor, t),
      topLabelFocusedTextColor: Color.lerp(
          topLabelFocusedTextColor, other.topLabelFocusedTextColor, t),
      topLabelDefaultColor:
          Color.lerp(topLabelDefaultColor, other.topLabelDefaultColor, t),
      borderErrorColor: Color.lerp(borderErrorColor, other.borderErrorColor, t),
      borderDisabledColor:
          Color.lerp(borderDisabledColor, other.borderDisabledColor, t),
      borderFocusedColor:
          Color.lerp(borderFocusedColor, other.borderFocusedColor, t),
      borderDefaultColor:
          Color.lerp(borderDefaultColor, other.borderDefaultColor, t),
      leadingPrefixColor:
          Color.lerp(leadingPrefixColor, other.leadingPrefixColor, t),
      leadingIconErrorColor:
          Color.lerp(leadingIconErrorColor, other.leadingIconErrorColor, t),
      leadingIconDisabledColor: Color.lerp(
          leadingIconDisabledColor, other.leadingIconDisabledColor, t),
      leadingIconFocusedColor:
          Color.lerp(leadingIconFocusedColor, other.leadingIconFocusedColor, t),
      leadingIconDefaultColor:
          Color.lerp(leadingIconDefaultColor, other.leadingIconDefaultColor, t),
      trailingSuffixColor:
          Color.lerp(trailingSuffixColor, other.trailingSuffixColor, t),
      trailingIconErrorColor:
          Color.lerp(trailingIconErrorColor, other.trailingIconErrorColor, t),
      trailingIconDisabledColor: Color.lerp(
          trailingIconDisabledColor, other.trailingIconDisabledColor, t),
      trailingIconFocusedColor: Color.lerp(
          trailingIconFocusedColor, other.trailingIconFocusedColor, t),
      trailingIconDefaultColor: Color.lerp(
          trailingIconDefaultColor, other.trailingIconDefaultColor, t),
      cursorColor: Color.lerp(cursorColor, other.cursorColor, t),
      borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
      trackRadius: lerpDouble(trackRadius, other.trackRadius, t),
      inputContainerHeight:
          lerpDouble(inputContainerHeight, other.inputContainerHeight, t),
      topLabelTextStyle: topLabelTextStyle,
      inputTextStyle: inputTextStyle,
      errorTextStyle: errorTextStyle,
      counterTextStyle: counterTextStyle,
      validateErrorTextStyle: validateErrorTextStyle,
      hintTextStyle: hintTextStyle,
    );
  }
}

class VInput extends StatefulWidget {
  VInput({
    Key? key,
    this.myLocalController,
    this.leadingSvgIcon,
    this.trailingSvgIcon,
    this.maxNumOfLines,
    this.minNumOfLines,
    this.topLabelText,
    this.hasError = false,
    this.isEnabled = true,
    this.hideText = false,
    this.textLength,
    this.maxLengthEnforced = false,
    this.alignText = TextAlign.left,
    this.keyboardType,
    this.inputAction,
    this.expand = false,
    this.showScrollbar = false,
    this.saved,
    this.editingComplete,
    this.onSubmitted,
    this.changed,
    this.tapped,
    this.onPressed,
    this.errorText = "This field can't be empty",
    this.inlineMessage,
    this.inputFocusNode,
    this.isTopLabelCenter = false,
    this.textSize,
    this.isPrefix = false,
    this.isSuffix = false,
    this.isLeading = false,
    this.isTrailing = false,
    this.trailingSemanticLabel,
    this.letterSpacing,
    this.cursorHeight,
    this.trailingIcon,
    this.appearOnFocus = false,
    this.isReadOnly = false,
    this.isFocused = false,
    this.hasInlineMessage = false,
    this.prefix,
    this.suffix,
    this.style,
    this.vExt,
    this.isLabelInLine = false,
    this.inputFormatters,
    this.onDidGainAccessibilityFocus,
    this.isComboBox = false,
    this.textCapitalization = TextCapitalization.none,
    this.autoCorrect = false,
    this.autofillHints,
    this.enableSuggestions = true,
    this.inputSemanticReadout,
    this.hintText = "",
    this.hintTextStyle,
    this.obscuringCharacter,
    this.initialValue,
    this.semanticsError = "Error",
    this.flexHeight = false,
    this.onTapOutside,
    this.enableInteractiveSelection,
  }) : super(key: key);

  // BEGIN Properties
  final TextEditingController? myLocalController;
  final String? leadingSvgIcon;
  final String? trailingSvgIcon;
  final int? maxNumOfLines, minNumOfLines;
  final String? topLabelText;
  final String? trailingSemanticLabel;
  final bool hasError, hasInlineMessage;
  final bool isEnabled;
  final bool hideText;
  final int? textLength;
  final bool maxLengthEnforced;
  final TextAlign alignText;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final bool expand;
  final bool showScrollbar;
  final String? errorText;
  final Widget? inlineMessage;
  final Function()? editingComplete;
  final Function()? tapped;
  final Function(String?)? onSubmitted;
  final Function(String?)? saved;
  final Function(String?)? changed;
  final Function()? onPressed;
  final FocusNode? inputFocusNode;
  final bool isTopLabelCenter;
  final bool isPrefix, isSuffix, isLeading, isTrailing;
  final double? textSize, letterSpacing, cursorHeight;
  final Widget? trailingIcon;
  final bool? appearOnFocus;
  final bool isReadOnly;
  final Widget? prefix, suffix;
  bool? isFocused;
  final VInputStyle? style;
  final VExt? vExt;
  final bool? isLabelInLine;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onDidGainAccessibilityFocus;
  final bool isComboBox;
  final TextCapitalization textCapitalization;
  final bool autoCorrect;
  final List<String>? autofillHints;
  final bool enableSuggestions;
  final String? inputSemanticReadout;
  final String hintText;
  final TextStyle? hintTextStyle;
  final String? obscuringCharacter;
  final String? initialValue;
  final String? semanticsError;
  final bool? flexHeight;
  final void Function(PointerDownEvent)? onTapOutside;
  final bool? enableInteractiveSelection;

  // END
  @override
  State<VInput> createState() => _VInputState();
}

class _VInputState extends State<VInput> {
  final ScrollController scrollController = ScrollController();
  int containerLength = 0;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.myLocalController?.addListener(_onTextChanged);
    if (widget.inputFocusNode != null) {
      widget.inputFocusNode?.addListener(() {
        if (widget.inputFocusNode!.hasFocus) {
          setState(() {
            widget.isFocused = true;
          });
        } else {
          setState(() {
            widget.isFocused = false;
          });
        }
      });
    } else {
      _focusNode.addListener(() {
        if (_focusNode.hasFocus) {
          setState(() {
            widget.isFocused = true;
          });
        } else {
          setState(() {
            widget.isFocused = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    widget.myLocalController?.removeListener(_onTextChanged);
    widget.inputFocusNode?.removeListener(() {});
    widget.inputFocusNode?.dispose();
    _focusNode.removeListener(() {});
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final messageStyle = getMessageColorScheme()!;
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
    final borderRadius = widget.style?.borderRadius ??
        defaultStyle.vInputProperties?.borderRadius;
    final trackRadius =
        widget.style?.trackRadius ?? defaultStyle.vInputProperties?.trackRadius;
    final inputContainerHeight = widget.style?.inputContainerHeight ??
        defaultStyle.vInputProperties?.inputContainerHeight;
    final topLabelTextStyle = widget.style?.topLabelTextStyle ??
        defaultStyle.vInputProperties?.topLabelTextStyle;
    final inputTextStyle = widget.style?.inputTextStyle ??
        defaultStyle.vInputProperties?.inputTextStyle;
    final errorTextStyle = widget.style?.errorTextStyle ??
        defaultStyle.vInputProperties?.errorTextStyle;
    final counterTextStyle = widget.style?.counterTextStyle ??
        defaultStyle.vInputProperties?.counterTextStyle;
    final validateErrorTextStyle = widget.style?.validateErrorTextStyle ??
        defaultStyle.vInputProperties?.validateErrorTextStyle;
    final textFieldColor =
        widget.style?.textFieldColor ?? defaultStyle.transparent;
    final thumbColor = widget.style?.thumbColor ?? defaultStyle.activeSubtle;
    final trackColor = widget.style?.trackColor ?? defaultStyle.transparent;
    final trackBorderColor =
        widget.style?.trackBorderColor ?? defaultStyle.transparent;
    final inputDisabledColor =
        widget.style?.inputDisabledColor ?? defaultStyle.disabled;
    final inputDefaultColor =
        widget.style?.inputDefaultColor ?? defaultStyle.text;
    final errorBorderColor =
        widget.style?.errorBorderColor ?? messageStyle.negativeGraphics;
    final containerColor =
        widget.style?.containerColor ?? defaultStyle.transparent;
    final bottomBarErrorColor =
        widget.style?.bottomBarErrorColor ?? messageStyle.negativeGraphics;
    final bottomBarColor =
        widget.style?.bottomBarColor ?? defaultStyle.activeHover;
    final counterErrorTextColor =
        widget.style?.counterErrorTextColor ?? messageStyle.negativeText;
    final counterTextColor =
        widget.style?.counterTextColor ?? defaultStyle.textSubtle;
    final errorIconColor =
        widget.style?.errorIconColor ?? messageStyle.negativeGraphics;
    final errorTextColor =
        widget.style?.errorTextColor ?? messageStyle.negativeText;
    final cursorColor = widget.style?.cursorColor ?? defaultStyle.active;

    Color? topLabelTextColor() {
      if (widget.textLength != null && containerLength > widget.textLength!) {
        return messageStyle.negativeText;
      }
      if (widget.hasError) {
        return widget.style?.topLabelErrorTextColor ??
            messageStyle.negativeText;
      }
      if (!widget.isEnabled) {
        return widget.style?.topLabelDisabledTextColor ?? defaultStyle.disabled;
      }
      if (widget.isFocused != null && widget.isFocused!) {
        return widget.style?.topLabelFocusedTextColor ??
            defaultStyle.activeHover;
      }
      return widget.style?.topLabelDefaultColor ?? defaultStyle.text;
    }

    Color? borderColor() {
      if (widget.textLength != null && containerLength > widget.textLength!) {
        return widget.style?.borderErrorColor ?? messageStyle.negativeText;
      }
      if (widget.hasError) {
        return widget.style?.borderErrorColor ?? messageStyle.negativeText;
      }
      if (!widget.isEnabled) {
        return widget.style?.borderDisabledColor ?? defaultStyle.disabled;
      }
      if (widget.isFocused != null && widget.isFocused!) {
        return widget.style?.borderFocusedColor ?? defaultStyle.activeHover;
      }
      return widget.style?.borderDefaultColor ?? defaultStyle.activeSubtle;
    }

    Color? leadingIconColor() {
      if (widget.isPrefix) {
        return widget.style?.leadingPrefixColor ?? defaultStyle.text;
      }
      if (widget.hasError) {
        return widget.style?.leadingIconErrorColor ??
            messageStyle.negativeGraphics;
      }
      if (!widget.isEnabled) {
        return widget.style?.leadingIconDisabledColor ?? defaultStyle.disabled;
      }
      if (widget.isFocused != null && widget.isFocused!) {
        return widget.style?.leadingIconFocusedColor ?? defaultStyle.active;
      }
      return widget.style?.leadingIconDefaultColor ?? defaultStyle.active;
    }

    Color? trailingIconColor() {
      if (widget.isSuffix) {
        return widget.style?.trailingSuffixColor ?? defaultStyle.text;
      }
      if (widget.hasError) {
        return widget.style?.trailingIconErrorColor ??
            messageStyle.negativeGraphics;
      }
      if (!widget.isEnabled) {
        return widget.style?.trailingIconDisabledColor ?? defaultStyle.disabled;
      }
      if (widget.isFocused != null && widget.isFocused! ||
          widget.myLocalController!.text.trim().isNotEmpty) {
        return widget.style?.trailingIconFocusedColor ?? defaultStyle.active;
      }
      return widget.style?.trailingIconDefaultColor ?? defaultStyle.active;
    }

    Widget getSuffixWidget() {
      return widget.suffix ?? const SizedBox.shrink();
    }

    bool shouldShowIcon() {
      return widget.appearOnFocus != true ||
          widget.isFocused != null && widget.isFocused!;
    }

    Widget getTrailingIcon() {
      if (widget.trailingIcon != null) {
        return widget.trailingIcon!;
      }
      if (widget.trailingSvgIcon != null) {
        return GestureDetector(
          onTap: widget.onPressed,
          child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Semantics(
                label: widget.trailingSemanticLabel,
                child: Container(
                  color: containerColor,
                  height: 44,
                  width: 44,
                  child: VIcon(
                    iconFit: BoxFit.none,
                    svgIcon: widget.trailingSvgIcon!,
                    iconColor: trailingIconColor(),
                  ),
                ),
              )),
        );
      }
      return const SizedBox.shrink();
    }

    void ifComboBox() {
      if (widget.isComboBox) {
        SemanticsService.announce(
          "Edit text box. Double tap to activate",
          TextDirection.ltr,
        );
      }
    }

    String? readOut() {
      if (!widget.isEnabled) {
        return "Disabled";
      }
      if (widget.isReadOnly) {
        return "Edit box. ${widget.myLocalController?.text.toString()}.";
      }
      if (widget.hideText) {
        return widget.obscuringCharacter?.length.toString();
      }
      if (widget.inputSemanticReadout != null) {
        return "Edit box. Double tap to edit text.  ${widget.inputSemanticReadout.toString()}";
      }
      return ""; //"Edit box.  double tap to edit text. ${widget.myLocalController?.text.toString()}.";
    }

    return widget.isLabelInLine == true
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: (inputContainerHeight / 2) - 7),
                child: Visibility(
                  visible: widget.topLabelText == null ? false : true,
                  child: Row(
                    children: [
                      Text(
                        widget.topLabelText?.isEmpty ?? true
                            ? ""
                            : widget.topLabelText!,
                        style: topLabelTextStyle!.copyWith(
                          color: topLabelTextColor(),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: widget.isTopLabelCenter
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius!),
                      child: Column(
                        children: [
                          Container(
                            height: widget.flexHeight == true
                                ? null
                                : widget.maxNumOfLines == null
                                    ? inputContainerHeight
                                    : null,
                            constraints: BoxConstraints(
                              minHeight: inputContainerHeight!,
                            ),
                            decoration: BoxDecoration(
                              color: textFieldColor,
                              border: Border(
                                top: BorderSide(
                                  width: 1.0,
                                  color: borderColor()!,
                                ),
                                left: BorderSide(
                                  width: 1.0,
                                  color: borderColor()!,
                                ),
                                right: BorderSide(
                                  width: 1.0,
                                  color: borderColor()!,
                                ),
                                bottom: BorderSide(
                                  width: (widget.isFocused != null &&
                                          widget.isFocused!)
                                      ? 2.0
                                      : 1.0,
                                  color: borderColor()!,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                            child: RawScrollbar(
                              padding: const EdgeInsets.only(
                                right: 4,
                                top: 5,
                              ),
                              thumbColor: thumbColor!.withOpacity(0.5),
                              trackColor: trackColor,
                              trackBorderColor: trackBorderColor,
                              interactive: false,
                              thickness: widget.showScrollbar ? 8 : 0,
                              controller: scrollController,
                              thumbVisibility: widget.showScrollbar,
                              trackVisibility: widget.showScrollbar,
                              radius: Radius.circular(trackRadius!),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    widget.prefix ?? const SizedBox.shrink(),
                                    if (widget.leadingSvgIcon != null)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                        ),
                                        child: VIcon(
                                          svgIcon: widget.leadingSvgIcon!,
                                          iconColor: leadingIconColor(),
                                        ),
                                      ),
                                    Expanded(
                                      child: Semantics(
                                        textField: true,
                                        value: readOut(),
                                        label: widget.topLabelText,
                                        onDidGainAccessibilityFocus: widget
                                                .onDidGainAccessibilityFocus ??
                                            ifComboBox,
                                        child: ExcludeSemantics(
                                          excluding: true,
                                          child: TextFormField(
                                            initialValue: widget.initialValue,
                                            autocorrect: widget.autoCorrect,
                                            autofillHints: widget.autofillHints,
                                            enableSuggestions:
                                                widget.enableSuggestions,
                                            autofocus:
                                                widget.isFocused ?? false,
                                            textCapitalization:
                                                widget.textCapitalization,
                                            readOnly: widget.isReadOnly,
                                            controller:
                                                widget.myLocalController,
                                            scrollController: scrollController,
                                            keyboardType: widget.keyboardType,
                                            textInputAction: widget.inputAction,
                                            obscureText: widget.hideText,
                                            obscuringCharacter:
                                                widget.obscuringCharacter ??
                                                    '•',
                                            maxLines: widget.expand
                                                ? widget.maxNumOfLines
                                                : 1,
                                            minLines: widget.minNumOfLines,
                                            textAlign: widget.alignText,
                                            focusNode: widget.inputFocusNode ??
                                                _focusNode,
                                            inputFormatters:
                                                widget.textLength != null &&
                                                        widget.maxLengthEnforced
                                                    ? [
                                                        LengthLimitingTextInputFormatter(
                                                            widget.textLength!),
                                                      ]
                                                    : null,
                                            style: inputTextStyle?.copyWith(
                                              letterSpacing:
                                                  widget.letterSpacing,
                                              height: widget.textSize == null
                                                  ? 1.0
                                                  : 1.3,
                                              fontSize: widget.textSize,
                                              color: !widget.isEnabled
                                                  ? inputDisabledColor
                                                  : inputDefaultColor,
                                              overflow: TextOverflow.fade,
                                            ),
                                            textAlignVertical:
                                                TextAlignVertical.top,
                                            strutStyle: const StrutStyle(
                                                forceStrutHeight: true),
                                            decoration: InputDecoration(
                                              alignLabelWithHint: true,

                                              hintText: widget.hintText,
                                              hintStyle: widget.hintTextStyle,
                                              // constraints: BoxConstraints(
                                              //   minHeight: inputContainerHeight!,
                                              // ),
                                              enabled: widget.isEnabled,
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: widget.flexHeight ==
                                                            true ||
                                                        widget.maxNumOfLines !=
                                                            null
                                                    ? 8
                                                    : 0,
                                              ),
                                              disabledBorder: InputBorder.none,
                                              border: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorStyle:
                                                  errorTextStyle?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: errorBorderColor,
                                              ),
                                            ),
                                            cursorColor: cursorColor,
                                            cursorHeight: widget.cursorHeight,
                                            onSaved: widget.saved,
                                            onEditingComplete:
                                                widget.editingComplete,
                                            onFieldSubmitted:
                                                widget.onSubmitted,
                                            onTap: widget.tapped,
                                            onChanged: (val) {
                                              widget.changed != null
                                                  ? widget.changed!(val)
                                                  : null;
                                              setState(() {
                                                containerLength = val.length;
                                              });
                                              widget.isFocused = true;
                                            },
                                            maxLengthEnforcement: widget
                                                    .maxLengthEnforced
                                                ? MaxLengthEnforcement.enforced
                                                : MaxLengthEnforcement.none,
                                            onTapOutside: widget.onTapOutside,
                                            enableInteractiveSelection: widget
                                                .enableInteractiveSelection,
                                          ),
                                        ),
                                      ),
                                    ),
                                    getSuffixWidget(),
                                    if (shouldShowIcon()) getTrailingIcon()
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.textLength != null)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              containerLength > widget.textLength!
                                  ? "-$containerLength/${widget.textLength!}"
                                  : "$containerLength/${widget.textLength!}",
                              style: counterTextStyle?.copyWith(
                                fontWeight: containerLength > widget.textLength!
                                    ? FontWeight.bold
                                    : null,
                                fontSize: 14.0,
                                color: containerLength > widget.textLength!
                                    ? counterErrorTextColor
                                    : counterTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: widget.hasInlineMessage,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: widget.inlineMessage,
                          ),
                        ),
                        Visibility(
                          visible: widget.hasError,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                VIcon(
                                  svgIcon: VIcons.errorTiny,
                                  iconColor: errorIconColor,
                                  iconHeight: 18,
                                  iconWidth: 18,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Flexible(
                                  child: Text(
                                    widget.errorText!,
                                    style: validateErrorTextStyle?.copyWith(
                                      color: errorTextColor,
                                    ),
                                    semanticsLabel:
                                        "${widget.semanticsError}. ${widget.errorText!}",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: widget.isTopLabelCenter
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: widget.topLabelText == null ? false : true,
                child: Text(
                  widget.topLabelText?.isEmpty ?? true
                      ? ""
                      : widget.topLabelText!,
                  style: topLabelTextStyle!.copyWith(
                    color: topLabelTextColor(),
                  ),
                ),
              ),
              SizedBox(
                height: widget.topLabelText == null ? 0 : 5,
              ),
              Container(
                height: widget.flexHeight == true
                    ? null
                    : widget.maxNumOfLines == null
                        ? inputContainerHeight
                        : null,
                constraints: BoxConstraints(
                  minHeight: inputContainerHeight,
                ),
                decoration: BoxDecoration(
                  color: textFieldColor,
                  border: Border(
                    top: BorderSide(
                      width: 1.0,
                      color: borderColor()!,
                    ),
                    left: BorderSide(
                      width: 1.0,
                      color: borderColor()!,
                    ),
                    right: BorderSide(
                      width: 1.0,
                      color: borderColor()!,
                    ),
                    bottom: BorderSide(
                      width: (widget.isFocused != null && widget.isFocused!)
                          ? 2.0
                          : 1.0,
                      color: borderColor()!,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: RawScrollbar(
                  padding: const EdgeInsets.only(
                    right: 4,
                    top: 5,
                  ),
                  thumbColor: thumbColor!.withOpacity(0.5),
                  trackColor: trackColor,
                  trackBorderColor: trackBorderColor,
                  interactive: false,
                  thickness: widget.showScrollbar ? 8 : 0,
                  controller: scrollController,
                  thumbVisibility: widget.showScrollbar,
                  trackVisibility: widget.showScrollbar,
                  radius: Radius.circular(trackRadius!),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.prefix ?? const SizedBox.shrink(),
                        if (widget.leadingSvgIcon != null)
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: VIcon(
                              svgIcon: widget.leadingSvgIcon!,
                              iconColor: leadingIconColor(),
                            ),
                          ),
                        Expanded(
                          child: Semantics(
                            textField: true,
                            value: readOut(),
                            label: widget.topLabelText,
                            onDidGainAccessibilityFocus:
                                widget.onDidGainAccessibilityFocus ??
                                    ifComboBox,
                            child: ExcludeSemantics(
                              excluding: true,
                              child: TextFormField(
                                initialValue: widget.initialValue,
                                autocorrect: widget.autoCorrect,
                                autofillHints: widget.autofillHints,
                                enableSuggestions: widget.enableSuggestions,
                                autofocus: widget.isFocused ?? false,
                                readOnly: widget.isReadOnly,
                                textCapitalization: widget.textCapitalization,
                                controller: widget.myLocalController,
                                scrollController: scrollController,
                                keyboardType: widget.keyboardType,
                                textInputAction: widget.inputAction,
                                obscureText: widget.hideText,
                                obscuringCharacter:
                                    widget.obscuringCharacter ?? '•',
                                maxLines:
                                    widget.expand ? widget.maxNumOfLines : 1,
                                minLines: widget.minNumOfLines,
                                textAlign: widget.alignText,
                                focusNode: widget.inputFocusNode ?? _focusNode,
                                inputFormatters: widget.textLength != null &&
                                        widget.maxLengthEnforced
                                    ? [
                                        LengthLimitingTextInputFormatter(
                                            widget.textLength!),
                                      ]
                                    : widget.inputFormatters,
                                style: inputTextStyle?.copyWith(
                                  letterSpacing: widget.letterSpacing,
                                  height: widget.textSize == null ? 1.0 : 1.3,
                                  fontSize: widget.textSize,
                                  color: !widget.isEnabled
                                      ? inputDisabledColor
                                      : inputDefaultColor,
                                  overflow: TextOverflow.fade,
                                ),
                                textAlignVertical: TextAlignVertical.top,
                                strutStyle:
                                    const StrutStyle(forceStrutHeight: true),
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  hintText: widget.hintText,
                                  hintStyle: widget.hintTextStyle,
                                  // constraints: BoxConstraints(
                                  //   minHeight: inputContainerHeight!,
                                  // ),
                                  enabled: widget.isEnabled,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: widget.flexHeight == true ||
                                            widget.maxNumOfLines != null
                                        ? 8
                                        : 0,
                                  ),
                                  disabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorStyle: errorTextStyle?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                    color: errorBorderColor,
                                  ),
                                ),
                                cursorColor: cursorColor,
                                cursorHeight: widget.cursorHeight,
                                onSaved: widget.saved,
                                onEditingComplete: widget.editingComplete,
                                onFieldSubmitted: widget.onSubmitted,
                                onTap: widget.tapped,
                                onChanged: (val) {
                                  widget.changed != null
                                      ? widget.changed!(val)
                                      : null;
                                  setState(() {
                                    containerLength = val.length;
                                  });
                                },
                                maxLengthEnforcement: widget.maxLengthEnforced
                                    ? MaxLengthEnforcement.enforced
                                    : MaxLengthEnforcement.none,
                                enableInteractiveSelection:
                                    widget.enableInteractiveSelection,
                              ),
                            ),
                          ),
                        ),
                        getSuffixWidget(),
                        if (shouldShowIcon()) getTrailingIcon()
                      ],
                    ),
                  ),
                ),
              ),
              if (widget.textLength != null)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        containerLength > widget.textLength!
                            ? "-$containerLength/${widget.textLength!}"
                            : "$containerLength/${widget.textLength!}",
                        style: counterTextStyle?.copyWith(
                          fontWeight: containerLength > widget.textLength!
                              ? FontWeight.bold
                              : null,
                          fontSize: 14.0,
                          color: containerLength > widget.textLength!
                              ? counterErrorTextColor
                              : counterTextColor,
                        ),
                      ),
                    )
                  ],
                ),
              Visibility(
                visible: widget.hasError,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      VIcon(
                        svgIcon: VIcons.errorTiny,
                        iconColor: errorIconColor,
                        iconHeight: 18,
                        iconWidth: 18,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Flexible(
                        child: Text(
                          widget.errorText!,
                          style: validateErrorTextStyle?.copyWith(
                            color: errorTextColor,
                          ),
                          semanticsLabel:
                              "${widget.semanticsError}. ${widget.errorText!}",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: widget.hasInlineMessage,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: widget.inlineMessage,
                ),
              ),
            ],
          );
  }
}
