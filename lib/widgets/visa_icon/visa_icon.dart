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
import 'package:flutter_svg/flutter_svg.dart';

class VIcon extends StatelessWidget {
  const VIcon({
    Key? key,
    required this.svgIcon,
    this.iconColor,
    this.iconWidth = 16,
    this.iconHeight = 16,
    this.svgImagePlaceholderBuilder,
    this.iconFit = BoxFit.contain,
    this.semanticLabel,
  }) : super(key: key);

  final String svgIcon;
  final Color? iconColor;
  final double? iconWidth;
  final double? iconHeight;
  final Widget Function(BuildContext)? svgImagePlaceholderBuilder;
  final BoxFit iconFit;
  final String? semanticLabel;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      excludeSemantics: semanticLabel == null ? true : false,
      child: SvgPicture.string(
        svgIcon,
        fit: iconFit,
        width: iconWidth,
        height: iconHeight,
        colorFilter: iconColor != null
            ? ColorFilter.mode(
                iconColor!,
                BlendMode.srcIn,
              )
            : null,
        placeholderBuilder: svgImagePlaceholderBuilder ??
            (_) => SizedBox(
                  height: iconHeight,
                  width: iconWidth,
                  child: CircularProgressIndicator(
                    color: iconColor,
                  ),
                ),
      ),
    );
  }
}

class VIconAsset extends StatelessWidget {
  const VIconAsset({
    Key? key,
    required this.svgIcon,
    this.iconColor,
    this.iconWidth = 16,
    this.iconHeight = 16,
    this.svgImagePlaceholderBuilder,
    this.iconFit = BoxFit.contain,
  }) : super(key: key);

  final String svgIcon;
  final Color? iconColor;
  final double? iconWidth;
  final double? iconHeight;
  final Widget Function(BuildContext)? svgImagePlaceholderBuilder;
  final BoxFit iconFit;
  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      excluding: true,
      child: SvgPicture.asset(
        svgIcon,
        fit: iconFit,
        width: iconWidth,
        height: iconHeight,
        colorFilter: iconColor != null
            ? ColorFilter.mode(
                iconColor!,
                BlendMode.srcIn,
              )
            : null,
        placeholderBuilder: svgImagePlaceholderBuilder ??
            (_) => SizedBox(
                  height: iconHeight,
                  width: iconWidth,
                  child: CircularProgressIndicator(
                    color: iconColor,
                  ),
                ),
      ),
    );
  }
}
