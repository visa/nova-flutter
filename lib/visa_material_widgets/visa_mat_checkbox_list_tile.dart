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

// This file includes code covered by the following notice

// BSD 3-Clause License
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:

//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above
//       copyright notice, this list of conditions and the following
//       disclaimer in the documentation and/or other materials provided
//       with the distribution.
//     * Neither the name of Google Inc. nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.

// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
// ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

// Examples can assume:
// void setState(VoidCallback fn) { }

/// A [ListTile] with a [Checkbox]. In other words, a checkbox with a label.
///
/// The entire list tile is interactive: tapping anywhere in the tile toggles
/// the checkbox.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=RkSqPAn9szs}
///
/// The [value], [onChanged], [activeColor] and [checkColor] properties of this widget are
/// identical to the similarly-named properties on the [Checkbox] widget.
///
/// The [title], [subtitle], [isThreeLine], [dense], and [contentPadding] properties are like
/// those of the same name on [ListTile].
///
/// The [selected] property on this widget is similar to the [ListTile.selected]
/// property. This tile's [activeColor] is used for the selected item's text color
///
/// This widget does not coordinate the [selected] state and the [value] state; to have the list tile
/// appear selected when the checkbox is checked, pass the same value to both.
///
/// The checkbox is shown on the right by default in left-to-right languages
/// (i.e. the trailing edge). This can be changed using [controlAffinity]. The
/// [secondary] widget is placed on the opposite side. This maps to the
/// [ListTile.leading] and [ListTile.trailing] properties of [ListTile].
///
/// To show the [CheckboxListTile] as disabled, pass null as the [onChanged]
/// callback.
///
/// {@tool dartpad}
/// ![CheckboxListTile sample](https://flutter.github.io/assets-for-api-docs/assets/material/checkbox_list_tile.png)
///
/// This widget shows a checkbox that, when checked, slows down all animations
/// (including the animation of the checkbox itself getting checked!).
///
/// This sample requires that you also import 'package:flutter/scheduler.dart',
/// so that you can reference [timeDilation].
///
/// ** See code in examples/api/lib/material/checkbox_list_tile/checkbox_list_tile.0.dart **
/// {@end-tool}
///
/// ## Semantics in CheckboxListTile
///
/// Since the entirety of the CheckboxListTile is interactive, it should represent
/// itself as a single interactive entity.
///
/// To do so, a CheckboxListTile widget wraps its children with a [MergeSemantics]
/// widget. [MergeSemantics] will attempt to merge its descendant [Semantics]
/// nodes into one node in the semantics tree. Therefore, CheckboxListTile will
/// throw an error if any of its children requires its own [Semantics] node.
///
/// For example, you cannot nest a [RichText] widget as a descendant of
/// CheckboxListTile. [RichText] has an embedded gesture recognizer that
/// requires its own [Semantics] node, which directly conflicts with
/// CheckboxListTile's desire to merge all its descendants' semantic nodes
/// into one. Therefore, it may be necessary to create a custom radio tile
/// widget to accommodate similar use cases.
///
/// {@tool dartpad}
/// ![Checkbox list tile semantics sample](https://flutter.github.io/assets-for-api-docs/assets/material/checkbox_list_tile_semantics.png)
///
/// Here is an example of a custom labeled checkbox widget, called
/// LinkedLabelCheckbox, that includes an interactive [RichText] widget that
/// handles tap gestures.
///
/// ** See code in examples/api/lib/material/checkbox_list_tile/checkbox_list_tile.1.dart **
/// {@end-tool}
///
/// ## CheckboxListTile isn't exactly what I want
///
/// If the way CheckboxListTile pads and positions its elements isn't quite
/// what you're looking for, you can create custom labeled checkbox widgets by
/// combining [Checkbox] with other widgets, such as [Text], [Padding] and
/// [InkWell].
///
/// {@tool dartpad}
/// ![Custom checkbox list tile sample](https://flutter.github.io/assets-for-api-docs/assets/material/checkbox_list_tile_custom.png)
///
/// Here is an example of a custom LabeledCheckbox widget, but you can easily
/// make your own configurable widget.
///
/// ** See code in examples/api/lib/material/checkbox_list_tile/checkbox_list_tile.2.dart **
/// {@end-tool}
///
/// See also:
///
///  * [ListTileTheme], which can be used to affect the style of list tiles,
///    including checkbox list tiles.
///  * [RadioListTile], a similar widget for radio buttons.
///  * [SwitchListTile], a similar widget for switches.
///  * [ListTile] and [Checkbox], the widgets from which this widget is made.

class VMatCheckboxListTile extends StatefulWidget {
  /// Creates a combination of a list tile and a checkbox.
  ///
  /// The checkbox tile itself does not maintain any state. Instead, when the
  /// state of the checkbox changes, the widget calls the [onChanged] callback.
  /// Most widgets that use a checkbox will listen for the [onChanged] callback
  /// and rebuild the checkbox tile with a new [value] to update the visual
  /// appearance of the checkbox.
  ///
  /// The following arguments are required:
  ///
  /// * [value], which determines whether the checkbox is checked. The [value]
  ///   can only be null if [tristate] is true.
  /// * [onChanged], which is called when the value of the checkbox should
  ///   change. It can be set to null to disable the checkbox.
  ///
  /// The value of [tristate] must not be null.
  const VMatCheckboxListTile({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.checkColor,
    this.tileColor,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.isThreeLine = false,
    this.dense,
    this.secondary,
    this.selected = false,
    this.controlAffinity = ListTileControlAffinity.leading,
    this.autofocus = false,
    this.contentPadding,
    this.tristate = false,
    this.shape,
    this.selectedTileColor,
    this.side,
    this.visualDensity,
    this.focusNode,
    this.enableFeedback,
    this.fillColor,
    this.overlayColor,
    this.child,
  })  : assert(tristate || value != null),
        assert(!isThreeLine || subtitle != null),
        super(key: key);

  /// Determines how the checkbox is positioned in the vertical axis for CheckboxListTile
  ///
  /// Defaults to CrossAxisAlignment.center.
  final CrossAxisAlignment crossAxisAlignment;

  /// Whether this checkbox is checked.
  final bool? value;

  /// Called when the value of the checkbox should change.
  ///
  /// The checkbox passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the checkbox tile with the
  /// new value.
  ///
  /// If null, the checkbox will be displayed as disabled.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// CheckboxListTile(
  ///   value: _throwShotAway,
  ///   onChanged: (bool newValue) {
  ///     setState(() {
  ///       _throwShotAway = newValue;
  ///     });
  ///   },
  ///   title: Text('Throw away your shot'),
  /// )
  /// ```
  final ValueChanged<bool?>? onChanged;

  /// The color to use when this checkbox is checked.
  ///
  /// Defaults to accent color of the current [Theme].
  final Color? activeColor;

  /// The color to use for the check icon when this checkbox is checked.
  ///
  /// Defaults to Color(0xFFFFFFFF).
  final Color? checkColor;

  /// {@macro flutter.material.ListTile.tileColor}
  final Color? tileColor;

  /// The primary content of the list tile.
  final String? title;

  /// The style of primary content of the list tile.
  final TextStyle? titleStyle;

  /// Additional content displayed below the title.
  final String? subtitle;

  /// The style of additional content displayed below the title.
  final TextStyle? subtitleStyle;

  /// A widget to display the content if primary or additional content is not a Text widget.
  final Widget? child;

  /// A widget to display on the opposite side of the tile from the checkbox.
  ///
  /// Typically an [Icon] widget.
  final Widget? secondary;

  /// Whether this list tile is intended to display three lines of text.
  ///
  /// If false, the list tile is treated as having one line if the subtitle is
  /// null and treated as having two lines if the subtitle is non-null.
  final bool isThreeLine;

  /// Whether this list tile is part of a vertically dense list.
  ///
  /// If this property is null then its value is based on [ListTileThemeData.dense].
  final bool? dense;

  /// Whether to render icons and text in the [activeColor].
  ///
  /// No effort is made to automatically coordinate the [selected] state and the
  /// [value] state. To have the list tile appear selected when the checkbox is
  /// checked, pass the same value to both.
  ///
  /// Normally, this property is left to its default value, false.
  final bool selected;

  /// Where to place the control relative to the text.
  final ListTileControlAffinity controlAffinity;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Defines insets surrounding the tile's contents.
  ///
  /// This value will surround the [Checkbox], [title], [subtitle], and [secondary]
  /// widgets in [CheckboxListTile].
  ///
  /// When the value is null, the `contentPadding` is `EdgeInsets.symmetric(horizontal: 16.0)`.
  final EdgeInsetsGeometry? contentPadding;

  /// If true the checkbox's [value] can be true, false, or null.
  ///
  /// Checkbox displays a dash when its value is null.
  ///
  /// When a tri-state checkbox ([tristate] is true) is tapped, its [onChanged]
  /// callback will be applied to true if the current value is false, to null if
  /// value is true, and to false if value is null (i.e. it cycles through false
  /// => true => null => false when tapped).
  ///
  /// If tristate is false (the default), [value] must not be null.
  final bool tristate;

  /// {@macro flutter.material.ListTile.shape}
  final ShapeBorder? shape;

  /// If non-null, defines the background color when [CheckboxListTile.selected] is true.
  final Color? selectedTileColor;

  /// {@macro flutter.material.checkbox.side}
  ///
  /// The given value is passed directly to [Checkbox.side].
  ///
  /// If this property is null, then [CheckboxThemeData.side] of
  /// [ThemeData.checkboxTheme] is used. If that is also null, then the side
  /// will be width 2.
  final BorderSide? side;

  /// Defines how compact the list tile's layout will be.
  ///
  /// {@macro flutter.material.themedata.visualDensity}
  final VisualDensity? visualDensity;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  final MaterialStateProperty<Color?>? fillColor;

  /// {@macro flutter.material.ListTile.enableFeedback}
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;

  final MaterialStateProperty<Color?>? overlayColor;

  @override
  _VMatCheckboxListTileState createState() => _VMatCheckboxListTileState();
}

class _VMatCheckboxListTileState extends State<VMatCheckboxListTile> {
  final GlobalKey _checkboxKey = GlobalKey();
  double _checkboxHeight = 40;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? checkbox =
          _checkboxKey.currentContext?.findRenderObject() as RenderBox?;
      if (checkbox != null) {
        setState(() {
          _checkboxHeight = checkbox.size.height;
        });
      }
    });
  }

  void _handleValueChange() {
    assert(widget.onChanged != null);
    switch (widget.value) {
      case false:
        widget.onChanged!(true);
        break;
      case true:
        widget.onChanged!(widget.tristate ? null : false);
        break;
      case null:
        widget.onChanged!(false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = MediaQuery.textScalerOf(context).scale(1);
    final Widget control = VMatCheckbox(
      key: _checkboxKey,
      overlayColor: widget.overlayColor,
      value: widget.value,
      onChanged: widget.onChanged,
      activeColor: widget.activeColor,
      checkColor: widget.checkColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      autofocus: widget.autofocus,
      tristate: widget.tristate,
      side: widget.side,
      fillColor: widget.fillColor,
    );
    Widget? leading, trailing;
    switch (widget.controlAffinity) {
      case ListTileControlAffinity.leading:
        leading = control;
        trailing = widget.secondary;
        break;
      case ListTileControlAffinity.trailing:
      case ListTileControlAffinity.platform:
        leading = Container(
          margin: const EdgeInsets.only(
            right: 8,
          ),
          child: Center(
            child: widget.secondary,
          ),
        );
        trailing = control;
        break;
    }

    Offset offset = const Offset(0, 0);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final textStyle =
          widget.titleStyle ?? defaultVTheme.textStyles.uiLabelLarge;
      final titleFontSize = textStyle.fontSize;

      switch (widget.crossAxisAlignment) {
        case CrossAxisAlignment.start:
          offset = Offset(
              0,
              titleFontSize! * textScaleFactor < _checkboxHeight
                  ? -(_checkboxHeight - titleFontSize * textScaleFactor) / 2
                  : ((titleFontSize * textScaleFactor - _checkboxHeight) / 2));
          break;
        case CrossAxisAlignment.end:
          if (widget.subtitle != null) {
            final textStyle =
                widget.subtitleStyle ?? defaultVTheme.textStyles.uiLabel;
            final subtitleFontSize = textStyle.fontSize;
            offset = Offset(
                0,
                subtitleFontSize! * textScaleFactor < _checkboxHeight
                    ? (_checkboxHeight - subtitleFontSize * textScaleFactor) / 2
                    : ((subtitleFontSize * textScaleFactor - _checkboxHeight) /
                        2));
          } else {
            offset = Offset(
                0,
                titleFontSize! * textScaleFactor < _checkboxHeight
                    ? (_checkboxHeight - titleFontSize * textScaleFactor) / 2
                    : (titleFontSize * textScaleFactor - _checkboxHeight) / 2);
          }

          break;
        case CrossAxisAlignment.center:
        // TODO: Handle this case.
        case CrossAxisAlignment.stretch:
        // TODO: Handle this case.
        case CrossAxisAlignment.baseline:
        // TODO: Handle this case.
      }

      return Theme(
        data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: MergeSemantics(
          child: ListTileTheme.merge(
            selectedColor:
                widget.activeColor ?? Theme.of(context).colorScheme.secondary,
            child: InkWell(
              onTap: widget.onChanged != null ? _handleValueChange : null,
              child: Padding(
                padding: widget.contentPadding!,
                child: Row(
                    crossAxisAlignment: widget.crossAxisAlignment,
                    children: [
                      Transform.translate(offset: offset, child: leading!),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.title != null)
                              DefaultTextStyle.merge(
                                style: defaultVTheme.textStyles.uiLabelLarge
                                    .copyWith(height: 1),
                                child: Text(
                                  widget.title!,
                                  style: widget.titleStyle,
                                ),
                              ),
                            if (widget.subtitle != null) ...[
                              const SizedBox(
                                height: 2,
                              ),
                              DefaultTextStyle.merge(
                                style: defaultVTheme.textStyles.uiLabel
                                    .copyWith(
                                        height: 1,
                                        color: VColors.defaultTextSubtle),
                                child: Text(
                                  widget.subtitle!,
                                  style: widget.subtitleStyle,
                                ),
                              ),
                            ],
                            if (widget.child != null) widget.child!
                          ],
                        ),
                      ),
                      if (trailing != null) trailing
                    ]),
              ),
            ),
          ),
        ),
      );
    });
  }
}
