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
// ignore_for_file: unnecessary_null_comparison

import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/rendering.dart';

import 'package:flutter/material.dart';

const double _kVMatTabHeight = 46.0;
const double _kTextAndIconVMatTabHeight = 72.0;

/// Defines how the bounds of the selected vTab indicator are computed.
///
/// See also:
///
///  * [VMatTabBar], which displays a row of vTabs.
///  * [VMatTabBarView], which displays a widget for the currently selected vTab.
///  * [VMatTabBar.indicator], which defines the appearance of the selected vTab
///    indicator relative to the vTab's bounds.
enum VMatTabBarIndicatorSize {
  /// The vTab indicator's bounds are as wide as the space occupied by the vTab
  /// in the vTab bar: from the right edge of the previous vTab to the left edge
  /// of the next vTab.
  vTab,

  /// The vTab's bounds are only as wide as the (centered) vTab widget itself.
  ///
  /// This value is used to align the vTab's label, typically a [VMatTab]
  /// widget's text or icon, with the selected vTab indicator.
  label,
}

/// A material design [VMatTabBar] vTab.
///
/// If both [icon] and [text] are provided, the text is displayed below
/// the icon.
///
/// See also:
///
///  * [VMatTabBar], which displays a row of vTabs.
///  * [VMatTabBarView], which displays a widget for the currently selected vTab.
///  * [TabController], which coordinates vTab selection between a [VMatTabBar] and a [VMatTabBarView].
///  * <https://material.io/design/components/vTabs.html>
class VMatTab extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a material design [VMatTabBar] vTab.
  ///
  /// At least one of [text], [icon], and [child] must be non-null. The [text]
  /// and [child] arguments must not be used at the same time. The
  /// [iconMargin] is only useful when [icon] and either one of [text] or
  /// [child] is non-null.
  const VMatTab({
    Key? key,
    this.text,
    this.icon,
    this.iconMargin = const EdgeInsets.only(bottom: 8.0),
    this.height,
    this.child,
  })  : assert(text != null || child != null || icon != null),
        assert(text == null || child == null),
        super(key: key);

  /// The text to display as the vTab's label.
  ///
  /// Must not be used in combination with [child].
  final String? text;

  /// The widget to be used as the vTab's label.
  ///
  /// Usually a [Text] widget, possibly wrapped in a [Semantics] widget.
  ///
  /// Must not be used in combination with [text].
  final Widget? child;

  /// An icon to display as the vTab's label.
  final Widget? icon;

  /// The margin added around the vTab's icon.
  ///
  /// Only useful when used in combination with [icon], and either one of
  /// [text] or [child] is non-null.
  final EdgeInsetsGeometry iconMargin;

  /// The height of the [VMatTab].
  ///
  /// If null, the height will be calculated based on the content of the [VMatTab].  When `icon` is not
  /// null along with `child` or `text`, the default height is 72.0 pixels. Without an `icon`, the
  /// height is 46.0 pixels.
  final double? height;

  Widget _buildLabelText() {
    return child ??
        Flexible(
            fit: FlexFit.loose,
            child: Text(text!, softWrap: false, overflow: TextOverflow.fade));
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    final double calculatedHeight;
    final Widget label;
    if (icon == null) {
      calculatedHeight = _kVMatTabHeight;
      label = _buildLabelText();
    } else if (text == null && child == null) {
      calculatedHeight = _kVMatTabHeight;
      label = icon!;
    } else {
      calculatedHeight = _kTextAndIconVMatTabHeight;
      label = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: iconMargin,
            child: icon,
          ),
          _buildLabelText(),
        ],
      );
    }

    return SizedBox(
      height: height ?? calculatedHeight,
      child: Center(
        widthFactor: 1.0,
        child: label,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text, defaultValue: null));
    properties
        .add(DiagnosticsProperty<Widget>('icon', icon, defaultValue: null));
  }

  @override
  Size get preferredSize {
    if (height != null) {
      return Size.fromHeight(height!);
    } else if ((text != null || child != null) && icon != null) {
      return const Size.fromHeight(_kTextAndIconVMatTabHeight);
    } else {
      return const Size.fromHeight(_kVMatTabHeight);
    }
  }
}

// VMatTabStyle using Animated Widget
class _VMatTabStyle extends AnimatedWidget {
  const _VMatTabStyle({
    Key? key,
    required Animation<double> animation,
    required this.selected,
    required this.labelColor,
    required this.unselectedLabelColor,
    required this.labelStyle,
    required this.unselectedLabelStyle,
    required this.child,
  }) : super(key: key, listenable: animation);

  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final bool selected;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TabBarThemeData vTabBarTheme = TabBarTheme.of(context);
    final Animation<double> animation = listenable as Animation<double>;

    // To enable TextStyle.lerp(style1, style2, value), both styles must have
    // the same value of inherit. Force that to be inherit=true here.
    final TextStyle defaultStyle = (labelStyle ??
            vTabBarTheme.labelStyle ??
            themeData.primaryTextTheme.bodyLarge!)
        .copyWith(inherit: true);
    final TextStyle defaultUnselectedStyle = (unselectedLabelStyle ??
            vTabBarTheme.unselectedLabelStyle ??
            labelStyle ??
            themeData.primaryTextTheme.bodyLarge!)
        .copyWith(inherit: true);
    final TextStyle textStyle = selected
        ? TextStyle.lerp(defaultStyle, defaultUnselectedStyle, animation.value)!
        : TextStyle.lerp(
            defaultUnselectedStyle, defaultStyle, animation.value)!;

    final Color selectedColor = labelColor ??
        vTabBarTheme.labelColor ??
        themeData.primaryTextTheme.bodyLarge!.color!;
    final Color unselectedColor = unselectedLabelColor ??
        vTabBarTheme.unselectedLabelColor ??
        selectedColor.withAlpha(0xB2); // 70% alpha
    final Color color = selected
        ? Color.lerp(selectedColor, unselectedColor, animation.value)!
        : Color.lerp(unselectedColor, selectedColor, animation.value)!;

    return DefaultTextStyle(
      style: textStyle.copyWith(color: color),
      child: IconTheme.merge(
        data: IconThemeData(
          size: 24.0,
          color: color,
        ),
        child: child,
      ),
    );
  }
}

typedef _LayoutCallback = void Function(
    List<double> xOffsets, TextDirection textDirection, double width);

class _VMatTabLabelBarRenderer extends RenderFlex {
  _VMatTabLabelBarRenderer({
    List<RenderBox>? children,
    required Axis direction,
    required MainAxisSize mainAxisSize,
    required MainAxisAlignment mainAxisAlignment,
    required CrossAxisAlignment crossAxisAlignment,
    required TextDirection textDirection,
    required VerticalDirection verticalDirection,
    required this.onPerformLayout,
  })  : assert(onPerformLayout != null),
        assert(textDirection != null),
        super(
          children: children,
          direction: direction,
          mainAxisSize: mainAxisSize,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
        );

  _LayoutCallback onPerformLayout;

  @override
  void performLayout() {
    super.performLayout();
    // xOffsets will contain childCount+1 values, giving the offsets of the
    // leading edge of the first vTab as the first value, of the leading edge of
    // the each subsequent vTab as each subsequent value, and of the trailing
    // edge of the last vTab as the last value.
    RenderBox? child = firstChild;
    final List<double> xOffsets = <double>[];
    while (child != null) {
      final FlexParentData childParentData =
          child.parentData! as FlexParentData;
      xOffsets.add(childParentData.offset.dx);
      assert(child.parentData == childParentData);
      child = childParentData.nextSibling;
    }
    assert(textDirection != null);
    switch (textDirection!) {
      case TextDirection.rtl:
        xOffsets.insert(0, size.width);
        break;
      case TextDirection.ltr:
        xOffsets.add(size.width);
        break;
    }
    onPerformLayout(xOffsets, textDirection!, size.width);
  }
}

// This class and its renderer class only exist to report the widths of the vTabs
// upon layout. The vTab widths are only used at paint time (see _IndicatorPainter)
// or in response to input.
class _VMatTabLabelBar extends Flex {
  const _VMatTabLabelBar({
    Key? key,
    List<Widget> children = const <Widget>[],
    required this.onPerformLayout,
  }) : super(
          key: key,
          children: children,
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
        );

  final _LayoutCallback onPerformLayout;

  @override
  RenderFlex createRenderObject(BuildContext context) {
    return _VMatTabLabelBarRenderer(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: getEffectiveTextDirection(context)!,
      verticalDirection: verticalDirection,
      onPerformLayout: onPerformLayout,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, _VMatTabLabelBarRenderer renderObject) {
    super.updateRenderObject(context, renderObject);
    renderObject.onPerformLayout = onPerformLayout;
  }
}

double _indexChangeProgress(TabController controller) {
  final double controllerValue = controller.animation!.value;
  final double previousIndex = controller.previousIndex.toDouble();
  final double currentIndex = controller.index.toDouble();

  // The controller's offset is changing because the user is dragging the
  // VMatTabBarView's PageView to the left or right.
  if (!controller.indexIsChanging) {
    return (currentIndex - controllerValue).abs().clamp(0.0, 1.0);
  }

  // The TabController animation's value is changing from previousIndex to currentIndex.
  return (controllerValue - currentIndex).abs() /
      (currentIndex - previousIndex).abs();
}

class _IndicatorPainter extends CustomPainter {
  _IndicatorPainter({
    required this.controller,
    required this.indicator,
    required this.indicatorSize,
    required this.vTabKeys,
    required _IndicatorPainter? old,
    required this.indicatorPadding,
  })  : assert(controller != null),
        assert(indicator != null),
        super(repaint: controller.animation) {
    if (old != null) {
      saveVMatTabOffsets(old._currentVMatTabOffsets, old._currentTextDirection);
    }
  }

  final TabController controller;
  final Decoration indicator;
  final VMatTabBarIndicatorSize? indicatorSize;
  final EdgeInsetsGeometry indicatorPadding;
  final List<GlobalKey> vTabKeys;

  // _currentVMatTabOffsets and _currentTextDirection are set each time VMatTabBar
  // layout is completed. These values can be null when VMatTabBar contains no
  // vTabs, since there are nothing to lay out.
  List<double>? _currentVMatTabOffsets;
  TextDirection? _currentTextDirection;

  Rect? _currentRect;
  BoxPainter? _painter;
  bool _needsPaint = false;
  void markNeedsPaint() {
    _needsPaint = true;
  }

  void dispose() {
    _painter?.dispose();
  }

  void saveVMatTabOffsets(
      List<double>? vTabOffsets, TextDirection? textDirection) {
    _currentVMatTabOffsets = vTabOffsets;
    _currentTextDirection = textDirection;
  }

  // _currentVMatTabOffsets[index] is the offset of the start edge of the vTab at index, and
  // _currentVMatTabOffsets[_currentVMatTabOffsets.length] is the end edge of the last vTab.
  int get maxVMatTabIndex => _currentVMatTabOffsets!.length - 2;

  double centerOf(int vTabIndex) {
    assert(_currentVMatTabOffsets != null);
    assert(_currentVMatTabOffsets!.isNotEmpty);
    assert(vTabIndex >= 0);
    assert(vTabIndex <= maxVMatTabIndex);
    return (_currentVMatTabOffsets![vTabIndex] +
            _currentVMatTabOffsets![vTabIndex + 1]) /
        2.0;
  }

  Rect indicatorRect(Size vTabBarSize, int vTabIndex) {
    assert(_currentVMatTabOffsets != null);
    assert(_currentTextDirection != null);
    assert(_currentVMatTabOffsets!.isNotEmpty);
    assert(vTabIndex >= 0);
    assert(vTabIndex <= maxVMatTabIndex);
    double vTabLeft, vTabRight;
    switch (_currentTextDirection!) {
      case TextDirection.rtl:
        vTabLeft = _currentVMatTabOffsets![vTabIndex + 1];
        vTabRight = _currentVMatTabOffsets![vTabIndex];
        break;
      case TextDirection.ltr:
        vTabLeft = _currentVMatTabOffsets![vTabIndex];
        vTabRight = _currentVMatTabOffsets![vTabIndex + 1];
        break;
    }

    if (indicatorSize == VMatTabBarIndicatorSize.label) {
      final double vTabWidth = vTabKeys[vTabIndex].currentContext!.size!.width;
      final double delta = ((vTabRight - vTabLeft) - vTabWidth) / 2.0;
      vTabLeft += delta;
      vTabRight -= delta;
    }

    final EdgeInsets insets = indicatorPadding.resolve(_currentTextDirection);
    final Rect rect =
        Rect.fromLTWH(vTabLeft, 0.0, vTabRight - vTabLeft, vTabBarSize.height);

    if (!(rect.size >= insets.collapsedSize)) {
      throw FlutterError(
        'indicatorPadding insets should be less than VMatTab Size\n'
        'Rect Size : ${rect.size}, Insets: ${insets.toString()}',
      );
    }
    return insets.deflateRect(rect);
  }

  @override
  void paint(Canvas canvas, Size size) {
    _needsPaint = false;
    _painter ??= indicator.createBoxPainter(markNeedsPaint);

    final double index = controller.index.toDouble();
    final double value = controller.animation!.value;
    final bool ltr = index > value;
    final int from =
        (ltr ? value.floor() : value.ceil()).clamp(0, maxVMatTabIndex);
    final int to = (ltr ? from + 1 : from - 1).clamp(0, maxVMatTabIndex);
    final Rect fromRect = indicatorRect(size, from);
    final Rect toRect = indicatorRect(size, to);
    _currentRect = Rect.lerp(fromRect, toRect, (value - from).abs());
    assert(_currentRect != null);

    final ImageConfiguration configuration = ImageConfiguration(
      size: _currentRect!.size,
      textDirection: _currentTextDirection,
    );
    _painter!.paint(canvas, _currentRect!.topLeft, configuration);
  }

  @override
  bool shouldRepaint(_IndicatorPainter old) {
    return _needsPaint ||
        controller != old.controller ||
        indicator != old.indicator ||
        vTabKeys.length != old.vTabKeys.length ||
        (!listEquals(_currentVMatTabOffsets, old._currentVMatTabOffsets)) ||
        _currentTextDirection != old._currentTextDirection;
  }
}

class _ChangeAnimation extends Animation<double>
    with AnimationWithParentMixin<double> {
  _ChangeAnimation(this.controller);

  final TabController controller;

  @override
  Animation<double> get parent => controller.animation!;

  @override
  void removeStatusListener(AnimationStatusListener listener) {
    if (controller.animation != null) super.removeStatusListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    if (controller.animation != null) super.removeListener(listener);
  }

  @override
  double get value => _indexChangeProgress(controller);
}

class _DragAnimation extends Animation<double>
    with AnimationWithParentMixin<double> {
  _DragAnimation(this.controller, this.index);

  final TabController controller;
  final int index;

  @override
  Animation<double> get parent => controller.animation!;

  @override
  void removeStatusListener(AnimationStatusListener listener) {
    if (controller.animation != null) super.removeStatusListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    if (controller.animation != null) super.removeListener(listener);
  }

  @override
  double get value {
    assert(!controller.indexIsChanging);
    final double controllerMaxValue = (controller.length - 1).toDouble();
    final double controllerValue =
        controller.animation!.value.clamp(0.0, controllerMaxValue);
    return (controllerValue - index.toDouble()).abs().clamp(0.0, 1.0);
  }
}

// This class, and VMatTabBarScrollController, only exist to handle the case
// where a scrollable VMatTabBar has a non-zero initialIndex. In that case we can
// only compute the scroll position's initial scroll offset (the "correct"
// pixels value) after the VMatTabBar viewport width and scroll limits are known.
class _VMatTabBarScrollPosition extends ScrollPositionWithSingleContext {
  _VMatTabBarScrollPosition({
    required ScrollPhysics physics,
    required ScrollContext context,
    required ScrollPosition? oldPosition,
    required this.vTabBar,
  }) : super(
          physics: physics,
          context: context,
          initialPixels: null,
          oldPosition: oldPosition,
        );

  final _VMatTabBarState vTabBar;

  bool? _initialViewportDimensionWasZero;

  @override
  bool applyContentDimensions(double minScrollExtent, double maxScrollExtent) {
    bool result = true;
    if (_initialViewportDimensionWasZero != true) {
      // If the viewport never had a non-zero dimension, we just want to jump
      // to the initial scroll position to avoid strange scrolling effects in
      // release mode: In release mode, the viewport temporarily may have a
      // dimension of zero before the actual dimension is calculated. In that
      // scenario, setting the actual dimension would cause a strange scroll
      // effect without this guard because the super call below would starts a
      // ballistic scroll activity.
      assert(viewportDimension != null);
      _initialViewportDimensionWasZero = viewportDimension != 0.0;
      correctPixels(vTabBar._initialScrollOffset(
          viewportDimension, minScrollExtent, maxScrollExtent));
      result = false;
    }
    return super.applyContentDimensions(minScrollExtent, maxScrollExtent) &&
        result;
  }
}

// This class, and VMatTabBarScrollPosition, only exist to handle the case
// where a scrollable VMatTabBar has a non-zero initialIndex.
class _VMatTabBarScrollController extends ScrollController {
  _VMatTabBarScrollController(this.vTabBar);

  final _VMatTabBarState vTabBar;

  @override
  ScrollPosition createScrollPosition(ScrollPhysics physics,
      ScrollContext context, ScrollPosition? oldPosition) {
    return _VMatTabBarScrollPosition(
      physics: physics,
      context: context,
      oldPosition: oldPosition,
      vTabBar: vTabBar,
    );
  }
}

/// A material design widget that displays a horizontal row of vTabs.
///
/// Typically created as the [AppBar.bottom] part of an [AppBar] and in
/// conjunction with a [VMatTabBarView].
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=POtoEH-5l40}
///
/// If a [TabController] is not provided, then a [DefaultTabController] ancestor
/// must be provided instead. The vTab controller's [TabController.length] must
/// equal the length of the [vTabs] list and the length of the
/// [VMatTabBarView.children] list.
///
/// Requires one of its ancestors to be a [Material] widget.
///
/// Uses values from [TabBarTheme] if it is set in the current context.
///
/// {@tool dartpad}
/// This sample shows the implementation of [VMatTabBar] and [VMatTabBarView] using a [DefaultTabController].
/// Each [VMatTab] corresponds to a child of the [VMatTabBarView] in the order they are written.
///
/// ** See code in examples/api/lib/material/vTabs/vTab_bar.0.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// [VMatTabBar] can also be implemented by using a [TabController] which provides more options
/// to control the behavior of the [VMatTabBar] and [VMatTabBarView]. This can be used instead of
/// a [DefaultTabController], demonstrated below.
///
/// ** See code in examples/api/lib/material/vTabs/vTab_bar.1.dart **
/// {@end-tool}
///
/// See also:
///
///  * [VMatTabBarView], which displays page views that correspond to each vTab.
///  * [VMatTabBar], which is used to display the [VMatTab] that corresponds to each page of the [VMatTabBarView].
class VMatTabBar extends StatefulWidget implements PreferredSizeWidget {
  /// Creates a material design vTab bar.
  ///
  /// The [vTabs] argument must not be null and its length must match the [controller]'s
  /// [TabController.length].
  ///
  /// If a [TabController] is not provided, then there must be a
  /// [DefaultTabController] ancestor.
  ///
  /// The [indicatorWeight] parameter defaults to 2, and must not be null.
  ///
  /// The [indicatorPadding] parameter defaults to [EdgeInsets.zero], and must not be null.
  ///
  /// If [indicator] is not null or provided from [TabBarTheme],
  /// then [indicatorWeight], [indicatorPadding], and [indicatorColor] are ignored.
  const VMatTabBar({
    Key? key,
    required this.vTabs,
    this.controller,
    this.isScrollable = false,
    this.padding,
    this.indicatorColor,
    this.automaticIndicatorColorAdjustment = true,
    this.indicatorWeight = 2.0,
    this.indicatorPadding = EdgeInsets.zero,
    this.indicator,
    this.indicatorSize = VMatTabBarIndicatorSize.vTab,
    this.labelColor,
    this.labelStyle,
    this.labelPadding,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.selectedBackgroundColor,
    this.unselectedBackgroundColor,
    this.dragStartBehavior = DragStartBehavior.start,
    this.overlayColor,
    this.mouseCursor,
    this.enableFeedback,
    this.onTap,
    this.physics,
  })  : assert(vTabs != null),
        assert(isScrollable != null),
        assert(dragStartBehavior != null),
        assert(indicator != null ||
            (indicatorWeight != null && indicatorWeight > 0.0)),
        assert(indicator != null || (indicatorPadding != null)),
        super(key: key);

  /// Typically a list of two or more [VMatTab] widgets.
  ///
  /// The length of this list must match the [controller]'s [TabController.length]
  /// and the length of the [VMatTabBarView.children] list.
  final List<Widget> vTabs;

  /// This widget's selection and animation state.
  ///
  /// If [TabController] is not provided, then the value of [DefaultTabController.of]
  /// will be used.
  final TabController? controller;

  /// Whether this vTab bar can be scrolled horizontally.
  ///
  /// If [isScrollable] is true, then each vTab is as wide as needed for its label
  /// and the entire [VMatTabBar] is scrollable. Otherwise each vTab gets an equal
  /// share of the available space.
  final bool isScrollable;

  /// The amount of space by which to inset the vTab bar.
  ///
  /// When [isScrollable] is false, this will yield the same result as if you had wrapped your
  /// [VMatTabBar] in a [Padding] widget. When [isScrollable] is true, the scrollable itself is inset,
  /// allowing the padding to scroll with the vTab bar, rather than enclosing it.
  final EdgeInsetsGeometry? padding;

  /// The color of the line that appears below the selected vTab.
  ///
  /// If this parameter is null, then the value of the Theme's indicatorColor
  /// property is used.
  ///
  /// If [indicator] is specified or provided from [TabBarTheme],
  /// this property is ignored.
  final Color? indicatorColor;

  /// The thickness of the line that appears below the selected vTab.
  ///
  /// The value of this parameter must be greater than zero and its default
  /// value is 2.0.
  ///
  /// If [indicator] is specified or provided from [TabBarTheme],
  /// this property is ignored.
  final double indicatorWeight;

  /// Padding for indicator.
  /// This property will now no longer be ignored even if indicator is declared
  /// or provided by [TabBarTheme]
  ///
  /// For [isScrollable] vTab bars, specifying [kVMatTabLabelPadding] will align
  /// the indicator with the vTab's text for [VMatTab] widgets and all but the
  /// shortest [VMatTab.text] values.
  ///
  /// The default value of [indicatorPadding] is [EdgeInsets.zero].
  final EdgeInsetsGeometry indicatorPadding;

  /// Defines the appearance of the selected vTab indicator.
  ///
  /// If [indicator] is specified or provided from [TabBarTheme],
  /// the [indicatorColor], and [indicatorWeight] properties are ignored.
  ///
  /// The default, underline-style, selected vTab indicator can be defined with
  /// [UnderlineTabIndicator].
  ///
  /// The indicator's size is based on the vTab's bounds. If [indicatorSize]
  /// is [VMatTabBarIndicatorSize.vTab] the vTab's bounds are as wide as the space
  /// occupied by the vTab in the vTab bar. If [indicatorSize] is
  /// [VMatTabBarIndicatorSize.label], then the vTab's bounds are only as wide as
  /// the vTab widget itself.
  final Decoration? indicator;

  /// Whether this vTab bar should automatically adjust the [indicatorColor].
  ///
  /// If [automaticIndicatorColorAdjustment] is true,
  /// then the [indicatorColor] will be automatically adjusted to [Colors.white]
  /// when the [indicatorColor] is same as [Material.color] of the [Material] parent widget.
  final bool automaticIndicatorColorAdjustment;

  /// Defines how the selected vTab indicator's size is computed.
  ///
  /// The size of the selected vTab indicator is defined relative to the
  /// vTab's overall bounds if [indicatorSize] is [VMatTabBarIndicatorSize.vTab]
  /// (the default) or relative to the bounds of the vTab's widget if
  /// [indicatorSize] is [VMatTabBarIndicatorSize.label].
  ///
  /// The selected vTab's location appearance can be refined further with
  /// the [indicatorColor], [indicatorWeight], [indicatorPadding], and
  /// [indicator] properties.
  final VMatTabBarIndicatorSize? indicatorSize;

  /// The color of selected vTab labels.
  ///
  /// Unselected vTab labels are rendered with the same color rendered at 70%
  /// opacity unless [unselectedLabelColor] is non-null.
  ///
  /// If this parameter is null, then the color of the [ThemeData.primaryTextTheme]'s
  /// bodyText1 text color is used.
  final Color? labelColor;

  /// The color of unselected vTab labels.
  ///
  /// If this property is null, unselected vTab labels are rendered with the
  /// [labelColor] with 70% opacity.
  final Color? unselectedLabelColor;

  /// The color of selected vTab background.
  ///
  /// If this parameter is null, then the color of the [VDef.defaultColorScheme]'s
  /// surface1 color is used.
  final Color? selectedBackgroundColor;

  /// The color of unselected vTab background.
  ///
  /// If this parameter is null, then the color of the [VDef.defaultColorScheme]'s
  /// surface1 color is used.
  final Color? unselectedBackgroundColor;

  /// The text style of the selected vTab labels.
  ///
  /// If [unselectedLabelStyle] is null, then this text style will be used for
  /// both selected and unselected label styles.
  ///
  /// If this property is null, then the text style of the
  /// [ThemeData.primaryTextTheme]'s bodyText1 definition is used.
  final TextStyle? labelStyle;

  /// The padding added to each of the vTab labels.
  ///
  /// If there are few vTabs with both icon and text and few
  /// vTabs with only icon or text, this padding is vertically
  /// adjusted to provide uniform padding to all vTabs.
  ///
  /// If this property is null, then kVMatTabLabelPadding is used.
  final EdgeInsetsGeometry? labelPadding;

  /// The text style of the unselected vTab labels.
  ///
  /// If this property is null, then the [labelStyle] value is used. If [labelStyle]
  /// is null, then the text style of the [ThemeData.primaryTextTheme]'s
  /// bodyText1 definition is used.
  final TextStyle? unselectedLabelStyle;

  /// Defines the ink response focus, hover, and splash colors.
  ///
  /// If non-null, it is resolved against one of [MaterialState.focused],
  /// [MaterialState.hovered], and [MaterialState.pressed].
  ///
  /// [MaterialState.pressed] triggers a ripple (an ink splash), per
  /// the current Material Design spec. The [overlayColor] doesn't map
  /// a state to [InkResponse.highlightColor] because a separate highlight
  /// is not used by the current design guidelines. See
  /// https://material.io/design/interaction/states.html#pressed
  ///
  /// If the overlay color is null or resolves to null, then the default values
  /// for [InkResponse.focusColor], [InkResponse.hoverColor], [InkResponse.splashColor]
  /// will be used instead.
  final MaterialStateProperty<Color?>? overlayColor;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// individual vTab widgets.
  ///
  /// If this property is null, [SystemMouseCursors.click] will be used.
  final MouseCursor? mouseCursor;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a long-press
  /// will produce a short vibration, when feedback is enabled.
  ///
  /// Defaults to true.
  final bool? enableFeedback;

  /// An optional callback that's called when the [VMatTabBar] is tapped.
  ///
  /// The callback is applied to the index of the vTab where the tap occurred.
  ///
  /// This callback has no effect on the default handling of taps. It's for
  /// applications that want to do a little extra work when a vTab is tapped,
  /// even if the tap doesn't change the TabController's index. VMatTabBar [onTap]
  /// callbacks should not make changes to the TabController since that would
  /// interfere with the default tap handler.
  final ValueChanged<int>? onTap;

  /// How the [VMatTabBar]'s scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to animate after the
  /// user stops dragging the scroll view.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? physics;

  /// A size whose height depends on if the vTabs have both icons and text.
  ///
  /// [AppBar] uses this size to compute its own preferred size.
  @override
  Size get preferredSize {
    double maxHeight = _kVMatTabHeight;
    for (final Widget item in vTabs) {
      if (item is PreferredSizeWidget) {
        final double itemHeight = item.preferredSize.height;
        maxHeight = math.max(itemHeight, maxHeight);
      }
    }
    return Size.fromHeight(maxHeight + indicatorWeight);
  }

  /// Returns whether the [VMatTabBar] contains a vTab with both text and icon.
  ///
  /// [VMatTabBar] uses this to give uniform padding to all vTabs in cases where
  /// there are some vTabs with both text and icon and some which contain only
  /// text or icon.
  bool get vTabHasTextAndIcon {
    for (final Widget item in vTabs) {
      if (item is PreferredSizeWidget) {
        if (item.preferredSize.height == _kTextAndIconVMatTabHeight) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  State<VMatTabBar> createState() => _VMatTabBarState();
}

class _VMatTabBarState extends State<VMatTabBar> {
  ScrollController? _scrollController;
  TabController? _controller;
  _IndicatorPainter? _indicatorPainter;
  int? _currentIndex;
  late double _vTabStripWidth;
  late List<GlobalKey> _vTabKeys;

  @override
  void initState() {
    super.initState();
    // If indicatorSize is VMatTabIndicatorSize.label, _vTabKeys[i] is used to find
    // the width of vTab widget i. See _IndicatorPainter.indicatorRect().
    _vTabKeys = widget.vTabs.map((Widget vTab) => GlobalKey()).toList();
  }

  Decoration get _indicator {
    if (widget.indicator != null) return widget.indicator!;
    final TabBarThemeData vTabBarTheme = TabBarTheme.of(context);
    if (vTabBarTheme.indicator != null) return vTabBarTheme.indicator!;

    Color color = widget.indicatorColor ?? Theme.of(context).indicatorColor;
    // ThemeData tries to avoid this by having indicatorColor avoid being the
    // primaryColor. However, it's possible that the vTab bar is on a
    // Material that isn't the primaryColor. In that case, if the indicator
    // color ends up matching the material's color, then this overrides it.
    // When that happens, automatic transitions of the theme will likely look
    // ugly as the indicator color suddenly snaps to white at one end, but it's
    // not clear how to avoid that any further.
    //
    // The material's color might be null (if it's a transparency). In that case
    // there's no good way for us to find out what the color is so we don't.
    //
    if (widget.automaticIndicatorColorAdjustment &&
        color.value == Material.of(context).color?.value) color = Colors.white;

    return UnderlineTabIndicator(
      borderSide: BorderSide(
        width: widget.indicatorWeight,
        color: color,
      ),
    );
  }

  // If the VMatTabBar is rebuilt with a new vTab controller, the caller should
  // dispose the old one. In that case the old controller's animation will be
  // null and should not be accessed.
  bool get _controllerIsValid => _controller?.animation != null;

  void _updateTabController() {
    final TabController newController =
        widget.controller ?? DefaultTabController.of(context);
    assert(() {
      if (newController == null) {
        throw FlutterError(
          'No TabController for ${widget.runtimeType}.\n'
          'When creating a ${widget.runtimeType}, you must either provide an explicit '
          'TabController using the "controller" property, or you must ensure that there '
          'is a DefaultTabController above the ${widget.runtimeType}.\n'
          'In this case, there was neither an explicit controller nor a default controller.',
        );
      }
      return true;
    }());

    if (newController == _controller) return;

    if (_controllerIsValid) {
      _controller!.animation!.removeListener(_handleTabControllerAnimationTick);
      _controller!.removeListener(_handleTabControllerTick);
    }
    _controller = newController;
    if (_controller != null) {
      _controller!.animation!.addListener(_handleTabControllerAnimationTick);
      _controller!.addListener(_handleTabControllerTick);
      _currentIndex = _controller!.index;
    }
  }

  void _initIndicatorPainter() {
    _indicatorPainter = !_controllerIsValid
        ? null
        : _IndicatorPainter(
            controller: _controller!,
            indicator: _indicator,
            indicatorSize: widget.indicatorSize!,
            indicatorPadding: widget.indicatorPadding,
            vTabKeys: _vTabKeys,
            old: _indicatorPainter,
          );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    assert(debugCheckHasMaterial(context));
    _updateTabController();
    _initIndicatorPainter();
  }

  @override
  void didUpdateWidget(VMatTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _updateTabController();
      _initIndicatorPainter();
    } else if (widget.indicatorColor != oldWidget.indicatorColor ||
        widget.indicatorWeight != oldWidget.indicatorWeight ||
        widget.indicatorSize != oldWidget.indicatorSize ||
        widget.indicator != oldWidget.indicator) {
      _initIndicatorPainter();
    }

    if (widget.vTabs.length > oldWidget.vTabs.length) {
      final int delta = widget.vTabs.length - oldWidget.vTabs.length;
      _vTabKeys.addAll(List<GlobalKey>.generate(delta, (int n) => GlobalKey()));
    } else if (widget.vTabs.length < oldWidget.vTabs.length) {
      _vTabKeys.removeRange(widget.vTabs.length, oldWidget.vTabs.length);
    }
  }

  @override
  void dispose() {
    _indicatorPainter!.dispose();
    if (_controllerIsValid) {
      _controller!.animation!.removeListener(_handleTabControllerAnimationTick);
      _controller!.removeListener(_handleTabControllerTick);
    }
    _controller = null;
    // We don't own the _controller Animation, so it's not disposed here.
    super.dispose();
  }

  int get maxVMatTabIndex => _indicatorPainter!.maxVMatTabIndex;

  double _vTabScrollOffset(
      int index, double viewportWidth, double minExtent, double maxExtent) {
    if (!widget.isScrollable) return 0.0;
    double vTabCenter = _indicatorPainter!.centerOf(index);
    switch (Directionality.of(context)) {
      case TextDirection.rtl:
        vTabCenter = _vTabStripWidth - vTabCenter;
        break;
      case TextDirection.ltr:
        break;
    }
    return (vTabCenter - viewportWidth / 2.0).clamp(minExtent, maxExtent);
  }

  double _vTabCenteredScrollOffset(int index) {
    final ScrollPosition position = _scrollController!.position;
    return _vTabScrollOffset(index, position.viewportDimension,
        position.minScrollExtent, position.maxScrollExtent);
  }

  double _initialScrollOffset(
      double viewportWidth, double minExtent, double maxExtent) {
    return _vTabScrollOffset(
        _currentIndex!, viewportWidth, minExtent, maxExtent);
  }

  void _scrollToCurrentIndex() {
    final double offset = _vTabCenteredScrollOffset(_currentIndex!);
    _scrollController!
        .animateTo(offset, duration: kTabScrollDuration, curve: Curves.ease);
  }

  void _scrollToControllerValue() {
    final double? leadingPosition = _currentIndex! > 0
        ? _vTabCenteredScrollOffset(_currentIndex! - 1)
        : null;
    final double middlePosition = _vTabCenteredScrollOffset(_currentIndex!);
    final double? trailingPosition = _currentIndex! < maxVMatTabIndex
        ? _vTabCenteredScrollOffset(_currentIndex! + 1)
        : null;

    final double index = _controller!.index.toDouble();
    final double value = _controller!.animation!.value;
    final double offset;
    if (value == index - 1.0) {
      offset = leadingPosition ?? middlePosition;
    } else if (value == index + 1.0) {
      offset = trailingPosition ?? middlePosition;
    } else if (value == index) {
      offset = middlePosition;
    } else if (value < index) {
      offset = leadingPosition == null
          ? middlePosition
          : lerpDouble(middlePosition, leadingPosition, index - value)!;
    } else {
      offset = trailingPosition == null
          ? middlePosition
          : lerpDouble(middlePosition, trailingPosition, value - index)!;
    }

    _scrollController!.jumpTo(offset);
  }

  void _handleTabControllerAnimationTick() {
    assert(mounted);
    if (!_controller!.indexIsChanging && widget.isScrollable) {
      // Sync the VMatTabBar's scroll position with the VMatTabBarView's PageView.
      _currentIndex = _controller!.index;
      _scrollToControllerValue();
    }
  }

  void _handleTabControllerTick() {
    if (_controller!.index != _currentIndex) {
      _currentIndex = _controller!.index;
      if (widget.isScrollable) _scrollToCurrentIndex();
    }
    setState(() {
      // Rebuild the vTabs after a (potentially animated) index change
      // has completed.
    });
  }

  // Called each time layout completes.
  void _saveVMatTabOffsets(
      List<double> vTabOffsets, TextDirection textDirection, double width) {
    _vTabStripWidth = width;
    _indicatorPainter?.saveVMatTabOffsets(vTabOffsets, textDirection);
  }

  void _handleTap(int index) {
    assert(index >= 0 && index < widget.vTabs.length);
    _controller!.animateTo(index);
    widget.onTap?.call(index);
  }

  Widget _buildStyledVMatTab(
      Widget child, bool selected, Animation<double> animation) {
    return _VMatTabStyle(
      animation: animation,
      selected: selected,
      labelColor: widget.labelColor,
      unselectedLabelColor: widget.unselectedLabelColor,
      labelStyle: widget.labelStyle,
      unselectedLabelStyle: widget.unselectedLabelStyle,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    assert(() {
      if (_controller!.length != widget.vTabs.length) {
        throw FlutterError(
          "Controller's length property (${_controller!.length}) does not match the "
          "number of vTabs (${widget.vTabs.length}) present in VMatTabBar's vTabs property.",
        );
      }
      return true;
    }());
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    if (_controller!.length == 0) {
      return Container(
        height: _kVMatTabHeight + widget.indicatorWeight,
      );
    }

    final TabBarThemeData vTabBarTheme = TabBarTheme.of(context);

    final List<Widget> wrappedVMatTabs =
        List<Widget>.generate(widget.vTabs.length, (int index) {
      const double verticalAdjustment =
          (_kTextAndIconVMatTabHeight - _kVMatTabHeight) / 2.0;
      EdgeInsetsGeometry? adjustedPadding;

      if (widget.vTabs[index] is PreferredSizeWidget) {
        final PreferredSizeWidget vTab =
            widget.vTabs[index] as PreferredSizeWidget;
        if (widget.vTabHasTextAndIcon &&
            vTab.preferredSize.height == _kVMatTabHeight) {
          if (widget.labelPadding != null ||
              vTabBarTheme.labelPadding != null) {
            adjustedPadding = (widget.labelPadding ??
                    vTabBarTheme.labelPadding!)
                .add(const EdgeInsets.symmetric(vertical: verticalAdjustment));
          } else {
            adjustedPadding = const EdgeInsets.symmetric(
                vertical: verticalAdjustment, horizontal: 16.0);
          }
        }
      }

      return Center(
        heightFactor: 1.0,
        child: Padding(
          padding: adjustedPadding ??
              widget.labelPadding ??
              vTabBarTheme.labelPadding ??
              kTabLabelPadding,
          child: KeyedSubtree(
            key: _vTabKeys[index],
            child: widget.vTabs[index],
          ),
        ),
      );
    });

    // If the controller was provided by DefaultTabController and we're part
    // of a Hero (typically the AppBar), then we will not be able to find the
    // controller during a Hero transition. See https://github.com/flutter/flutter/issues/213.
    if (_controller != null) {
      final int previousIndex = _controller!.previousIndex;

      if (_controller!.indexIsChanging) {
        // The user tapped on a vTab, the vTab controller's animation is running.
        assert(_currentIndex != previousIndex);
        final Animation<double> animation = _ChangeAnimation(_controller!);
        wrappedVMatTabs[_currentIndex!] = _buildStyledVMatTab(
            wrappedVMatTabs[_currentIndex!], true, animation);
        wrappedVMatTabs[previousIndex] = _buildStyledVMatTab(
            wrappedVMatTabs[previousIndex], false, animation);
      } else {
        // The user is dragging the VMatTabBarView's PageView left or right.
        final int vTabIndex = _currentIndex!;
        final Animation<double> centerAnimation =
            _DragAnimation(_controller!, vTabIndex);
        wrappedVMatTabs[vTabIndex] = _buildStyledVMatTab(
            wrappedVMatTabs[vTabIndex], true, centerAnimation);
        if (_currentIndex! > 0) {
          final int vTabIndex = _currentIndex! - 1;
          final Animation<double> previousAnimation =
              ReverseAnimation(_DragAnimation(_controller!, vTabIndex));
          wrappedVMatTabs[vTabIndex] = _buildStyledVMatTab(
              wrappedVMatTabs[vTabIndex], false, previousAnimation);
        }
        if (_currentIndex! < widget.vTabs.length - 1) {
          final int vTabIndex = _currentIndex! + 1;
          final Animation<double> nextAnimation =
              ReverseAnimation(_DragAnimation(_controller!, vTabIndex));
          wrappedVMatTabs[vTabIndex] = _buildStyledVMatTab(
              wrappedVMatTabs[vTabIndex], false, nextAnimation);
        }
      }
    }

    // Add the tap handler to each vTab. If the vTab bar is not scrollable,
    // then give all of the vTabs equal flexibility so that they each occupy
    // the same share of the vTab bar's overall width.
    final int vTabCount = widget.vTabs.length;
    for (int index = 0; index < vTabCount; index += 1) {
      wrappedVMatTabs[index] = InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        mouseCursor: widget.mouseCursor ?? SystemMouseCursors.click,
        onTap: () {
          _handleTap(index);
        },
        enableFeedback: widget.enableFeedback ?? true,
        overlayColor: widget.overlayColor,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: _currentIndex == index
                ? widget.selectedBackgroundColor
                : widget.unselectedBackgroundColor,
          ),
          padding: EdgeInsets.only(bottom: widget.indicatorWeight),
          child: Stack(
            children: <Widget>[
              wrappedVMatTabs[index],
              Semantics(
                selected: index == _currentIndex,
                label: localizations.tabLabel(
                    tabIndex: index + 1, tabCount: vTabCount),
              ),
            ],
          ),
        ),
      );
      if (!widget.isScrollable) {
        wrappedVMatTabs[index] = Expanded(child: wrappedVMatTabs[index]);
      }
    }

    Widget vTabBar = CustomPaint(
      painter: _indicatorPainter,
      child: _VMatTabStyle(
        animation: kAlwaysDismissedAnimation,
        selected: false,
        labelColor: widget.labelColor,
        unselectedLabelColor: widget.unselectedLabelColor,
        labelStyle: widget.labelStyle,
        unselectedLabelStyle: widget.unselectedLabelStyle,
        child: _VMatTabLabelBar(
          onPerformLayout: _saveVMatTabOffsets,
          children: wrappedVMatTabs,
        ),
      ),
    );

    if (widget.isScrollable) {
      _scrollController ??= _VMatTabBarScrollController(this);
      vTabBar = SingleChildScrollView(
        dragStartBehavior: widget.dragStartBehavior,
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        padding: widget.padding,
        physics: widget.physics,
        child: vTabBar,
      );
    } else if (widget.padding != null) {
      vTabBar = Padding(
        padding: widget.padding!,
        child: vTabBar,
      );
    }

    return vTabBar;
  }
}

/// A page view that displays the widget which corresponds to the currently
/// selected vTab.
///
/// This widget is typically used in conjunction with a [VMatTabBar].
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=POtoEH-5l40}
///
/// If a [TabController] is not provided, then there must be a [DefaultTabController]
/// ancestor.
///
/// The vTab controller's [TabController.length] must equal the length of the
/// [children] list and the length of the [VMatTabBar.vTabs] list.
///
/// To see a sample implementation, visit the [TabController] documentation.
class VMatTabBarView extends StatefulWidget {
  /// Creates a page view with one child per vTab.
  ///
  /// The length of [children] must be the same as the [controller]'s length.
  const VMatTabBarView({
    Key? key,
    required this.children,
    this.controller,
    this.physics,
    this.dragStartBehavior = DragStartBehavior.start,
  })  : assert(children != null),
        assert(dragStartBehavior != null),
        super(key: key);

  /// This widget's selection and animation state.
  ///
  /// If [TabController] is not provided, then the value of [DefaultTabController.of]
  /// will be used.
  final TabController? controller;

  /// One widget per vTab.
  ///
  /// Its length must match the length of the [VMatTabBar.vTabs]
  /// list, as well as the [controller]'s [TabController.length].
  final List<Widget> children;

  /// How the page view should respond to user input.
  ///
  /// For example, determines how the page view continues to animate after the
  /// user stops dragging the page view.
  ///
  /// The physics are modified to snap to page boundaries using
  /// [PageScrollPhysics] prior to being used.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? physics;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  @override
  State<VMatTabBarView> createState() => _VMatTabBarViewState();
}

class _VMatTabBarViewState extends State<VMatTabBarView> {
  TabController? _controller;
  late PageController _pageController;
  late List<Widget> _children;
  late List<Widget> _childrenWithKey;
  int? _currentIndex;
  int _warpUnderwayCount = 0;

  // If the VMatTabBarView is rebuilt with a new vTab controller, the caller should
  // dispose the old one. In that case the old controller's animation will be
  // null and should not be accessed.
  bool get _controllerIsValid => _controller?.animation != null;

  void _updateTabController() {
    final TabController newController =
        widget.controller ?? DefaultTabController.of(context);
    assert(() {
      if (newController == null) {
        throw FlutterError(
          'No TabController for ${widget.runtimeType}.\n'
          'When creating a ${widget.runtimeType}, you must either provide an explicit '
          'TabController using the "controller" property, or you must ensure that there '
          'is a DefaultTabController above the ${widget.runtimeType}.\n'
          'In this case, there was neither an explicit controller nor a default controller.',
        );
      }
      return true;
    }());

    if (newController == _controller) return;

    if (_controllerIsValid) {
      _controller!.animation!.removeListener(_handleTabControllerAnimationTick);
    }
    _controller = newController;
    if (_controller != null) {
      _controller!.animation!.addListener(_handleTabControllerAnimationTick);
    }
  }

  @override
  void initState() {
    super.initState();
    _updateChildren();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTabController();
    _currentIndex = _controller!.index;
    _pageController = PageController(initialPage: _currentIndex!);
  }

  @override
  void didUpdateWidget(VMatTabBarView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _updateTabController();
      _currentIndex = _controller!.index;
      _pageController.jumpToPage(_currentIndex!);
    }
    if (widget.children != oldWidget.children && _warpUnderwayCount == 0) {
      _updateChildren();
    }
  }

  @override
  void dispose() {
    if (_controllerIsValid) {
      _controller!.animation!.removeListener(_handleTabControllerAnimationTick);
    }
    _controller = null;
    // We don't own the _controller Animation, so it's not disposed here.
    super.dispose();
  }

  void _updateChildren() {
    _children = widget.children;
    _childrenWithKey = KeyedSubtree.ensureUniqueKeysForList(widget.children);
  }

  void _handleTabControllerAnimationTick() {
    if (_warpUnderwayCount > 0 || !_controller!.indexIsChanging) {
      return;
    } // This widget is driving the controller's animation.

    if (_controller!.index != _currentIndex) {
      _currentIndex = _controller!.index;
      _warpToCurrentIndex();
    }
  }

  Future<void> _warpToCurrentIndex() async {
    if (!mounted) return Future<void>.value();

    if (_pageController.page == _currentIndex!.toDouble()) {
      return Future<void>.value();
    }

    final Duration duration = _controller!.animationDuration;

    if (duration == Duration.zero) {
      _pageController.jumpToPage(_currentIndex!);
      return Future<void>.value();
    }

    final int previousIndex = _controller!.previousIndex;

    if ((_currentIndex! - previousIndex).abs() == 1) {
      _warpUnderwayCount += 1;
      await _pageController.animateToPage(_currentIndex!,
          duration: duration, curve: Curves.ease);
      _warpUnderwayCount -= 1;
      return Future<void>.value();
    }

    assert((_currentIndex! - previousIndex).abs() > 1);
    final int initialPage = _currentIndex! > previousIndex
        ? _currentIndex! - 1
        : _currentIndex! + 1;
    final List<Widget> originalChildren = _childrenWithKey;
    setState(() {
      _warpUnderwayCount += 1;

      _childrenWithKey = List<Widget>.of(_childrenWithKey, growable: false);
      final Widget temp = _childrenWithKey[initialPage];
      _childrenWithKey[initialPage] = _childrenWithKey[previousIndex];
      _childrenWithKey[previousIndex] = temp;
    });
    _pageController.jumpToPage(initialPage);

    await _pageController.animateToPage(_currentIndex!,
        duration: duration, curve: Curves.ease);
    if (!mounted) return Future<void>.value();
    setState(() {
      _warpUnderwayCount -= 1;
      if (widget.children != _children) {
        _updateChildren();
      } else {
        _childrenWithKey = originalChildren;
      }
    });
  }

  // Called when the PageView scrolls
  bool _handleScrollNotification(ScrollNotification notification) {
    if (_warpUnderwayCount > 0) return false;

    if (notification.depth != 0) return false;

    _warpUnderwayCount += 1;
    if (notification is ScrollUpdateNotification &&
        !_controller!.indexIsChanging) {
      if ((_pageController.page! - _controller!.index).abs() > 1.0) {
        _controller!.index = _pageController.page!.round();
        _currentIndex = _controller!.index;
      }
      _controller!.offset =
          (_pageController.page! - _controller!.index).clamp(-1.0, 1.0);
    } else if (notification is ScrollEndNotification) {
      _controller!.index = _pageController.page!.round();
      _currentIndex = _controller!.index;
      if (!_controller!.indexIsChanging) {
        _controller!.offset =
            (_pageController.page! - _controller!.index).clamp(-1.0, 1.0);
      }
    }
    _warpUnderwayCount -= 1;

    return false;
  }

  @override
  Widget build(BuildContext context) {
    assert(() {
      if (_controller!.length != widget.children.length) {
        throw FlutterError(
          "Controller's length property (${_controller!.length}) does not match the "
          "number of vTabs (${widget.children.length}) present in VMatTabBar's vTabs property.",
        );
      }
      return true;
    }());
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: PageView(
        dragStartBehavior: widget.dragStartBehavior,
        controller: _pageController,
        physics: widget.physics == null
            ? const PageScrollPhysics().applyTo(const ClampingScrollPhysics())
            : const PageScrollPhysics().applyTo(widget.physics),
        children: _childrenWithKey,
      ),
    );
  }
}

/// Displays a single circle with the specified border and background colors.
///
/// Used by [VMatTabPageSelector] to indicate the selected page.
class VMatTabPageSelectorIndicator extends StatelessWidget {
  /// Creates an indicator used by [VMatTabPageSelector].
  ///
  /// The [backgroundColor], [borderColor], and [size] parameters must not be null.
  const VMatTabPageSelectorIndicator({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
  })  : assert(backgroundColor != null),
        assert(borderColor != null),
        assert(size != null),
        super(key: key);

  /// The indicator circle's background color.
  final Color backgroundColor;

  /// The indicator circle's border color.
  final Color borderColor;

  /// The indicator circle's diameter.
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        shape: BoxShape.circle,
      ),
    );
  }
}

/// Displays a row of small circular indicators, one per vTab.
///
/// The selected vTab's indicator is highlighted. Often used in conjunction with
/// a [VMatTabBarView].
///
/// If a [TabController] is not provided, then there must be a
/// [DefaultTabController] ancestor.
class VMatTabPageSelector extends StatelessWidget {
  /// Creates a compact widget that indicates which vTab has been selected.
  const VMatTabPageSelector({
    Key? key,
    this.controller,
    this.indicatorSize = 12.0,
    this.color,
    this.selectedColor,
  })  : assert(indicatorSize != null && indicatorSize > 0.0),
        super(key: key);

  /// This widget's selection and animation state.
  ///
  /// If [TabController] is not provided, then the value of
  /// [DefaultTabController.of] will be used.
  final TabController? controller;

  /// The indicator circle's diameter (the default value is 12.0).
  final double indicatorSize;

  /// The indicator circle's fill color for unselected pages.
  ///
  /// If this parameter is null, then the indicator is filled with [Colors.transparent].
  final Color? color;

  /// The indicator circle's fill color for selected pages and border color
  /// for all indicator circles.
  ///
  /// If this parameter is null, then the indicator is filled with the theme's
  /// [ColorScheme.secondary].
  final Color? selectedColor;

  Widget _buildVMatTabIndicator(
    int vTabIndex,
    TabController vTabController,
    ColorTween selectedColorTween,
    ColorTween previousColorTween,
  ) {
    final Color background;
    if (vTabController.indexIsChanging) {
      // The selection's animation is animating from previousValue to value.
      final double t = 1.0 - _indexChangeProgress(vTabController);
      if (vTabController.index == vTabIndex) {
        background = selectedColorTween.lerp(t)!;
      } else if (vTabController.previousIndex == vTabIndex) {
        background = previousColorTween.lerp(t)!;
      } else {
        background = selectedColorTween.begin!;
      }
    } else {
      // The selection's offset reflects how far the VMatTabBarView has / been dragged
      // to the previous page (-1.0 to 0.0) or the next page (0.0 to 1.0).
      final double offset = vTabController.offset;
      if (vTabController.index == vTabIndex) {
        background = selectedColorTween.lerp(1.0 - offset.abs())!;
      } else if (vTabController.index == vTabIndex - 1 && offset > 0.0) {
        background = selectedColorTween.lerp(offset)!;
      } else if (vTabController.index == vTabIndex + 1 && offset < 0.0) {
        background = selectedColorTween.lerp(-offset)!;
      } else {
        background = selectedColorTween.begin!;
      }
    }
    return VMatTabPageSelectorIndicator(
      backgroundColor: background,
      borderColor: selectedColorTween.end!,
      size: indicatorSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color fixColor = color ?? Colors.transparent;
    final Color fixSelectedColor =
        selectedColor ?? Theme.of(context).colorScheme.secondary;
    final ColorTween selectedColorTween =
        ColorTween(begin: fixColor, end: fixSelectedColor);
    final ColorTween previousColorTween =
        ColorTween(begin: fixSelectedColor, end: fixColor);
    final TabController vTabController =
        controller ?? DefaultTabController.of(context);
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    assert(() {
      if (vTabController == null) {
        throw FlutterError(
          'No TabController for $runtimeType.\n'
          'When creating a $runtimeType, you must either provide an explicit TabController '
          'using the "controller" property, or you must ensure that there is a '
          'DefaultTabController above the $runtimeType.\n'
          'In this case, there was neither an explicit controller nor a default controller.',
        );
      }
      return true;
    }());
    final Animation<double> animation = CurvedAnimation(
      parent: vTabController.animation!,
      curve: Curves.fastOutSlowIn,
    );
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Semantics(
          label: localizations.tabLabel(
              tabIndex: vTabController.index + 1,
              tabCount: vTabController.length),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children:
                List<Widget>.generate(vTabController.length, (int vTabIndex) {
              return _buildVMatTabIndicator(vTabIndex, vTabController,
                  selectedColorTween, previousColorTween);
            }).toList(),
          ),
        );
      },
    );
  }
}
