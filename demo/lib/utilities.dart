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

smallWidth() => const SizedBox(width: 6);

smallHeight() => const SizedBox(height: 6);

mediumHeight() => const SizedBox(height: 10);

largeHeight() => const SizedBox(height: 20);

// For Headers that need a semantic header
class SemanticHeader extends StatelessWidget {
  const SemanticHeader({
    Key? key,
    required this.title,
    this.style,
    this.vExt,
  }) : super(key: key);

  final String title;
  final TextStyle? style;
  final VExt? vExt;

  @override
  Widget build(BuildContext context) {
    final dynamic defaultStyle;
    if (vExt == null || vExt is VDef) {
      defaultStyle = Theme.of(context).brightness == Brightness.dark
          ? getDefaultColorSchemeDark()!
          : getDefaultColorScheme()!;
    } else {
      defaultStyle = Theme.of(context).brightness == Brightness.dark
          ? getAltColorSchemeDark()!
          : getAltColorScheme()!;
    }
    return Semantics(
      header: true,
      child: Text(
        title,
        style: style ??
            defaultVTheme.textStyles.headline4
                .copyWith(color: defaultStyle.text),
      ),
    );
  }
}

class H3Header extends StatelessWidget {
  const H3Header({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SemanticHeader(
      title: text,
      style: defaultVTheme.textStyles.headline3.copyWith(
        fontWeight: VFontWeight.semiBold,
      ),
    );
  }
}

class CheckeredPatternDefault extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const squareSideLength = 20.0;
    final checkerPaint1 = Paint()..color = Colors.grey.withAlpha(0);
    final checkerPaint2 = Paint()..color = Colors.grey.withAlpha(25);

    for (var y = 0.0; y < size.height; y += squareSideLength * 2) {
      for (var x = 0.0; x < size.width; x += squareSideLength * 2) {
        canvas.drawRect(Rect.fromLTWH(x, y, squareSideLength, squareSideLength),
            checkerPaint1);
        canvas.drawRect(
            Rect.fromLTWH(x + squareSideLength, y + squareSideLength,
                squareSideLength, squareSideLength),
            checkerPaint1);
        canvas.drawRect(
            Rect.fromLTWH(
                x + squareSideLength, y, squareSideLength, squareSideLength),
            checkerPaint2);
        canvas.drawRect(
            Rect.fromLTWH(
                x, y + squareSideLength, squareSideLength, squareSideLength),
            checkerPaint2);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CheckeredPatternDark extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const squareSideLength = 20.0;
    final checkerPaint1 = Paint()..color = const Color.fromRGBO(99, 99, 99, 1);
    final checkerPaint2 = Paint()
      ..color = const Color.fromRGBO(106, 106, 106, 1);

    for (var y = 0.0; y < size.height; y += squareSideLength * 2) {
      for (var x = 0.0; x < size.width; x += squareSideLength * 2) {
        canvas.drawRect(Rect.fromLTWH(x, y, squareSideLength, squareSideLength),
            checkerPaint1);
        canvas.drawRect(
            Rect.fromLTWH(x + squareSideLength, y + squareSideLength,
                squareSideLength, squareSideLength),
            checkerPaint1);
        canvas.drawRect(
            Rect.fromLTWH(
                x + squareSideLength, y, squareSideLength, squareSideLength),
            checkerPaint2);
        canvas.drawRect(
            Rect.fromLTWH(
                x, y + squareSideLength, squareSideLength, squareSideLength),
            checkerPaint2);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
