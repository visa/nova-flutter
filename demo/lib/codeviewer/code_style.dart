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
// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class CodeStyle extends InheritedWidget {
  const CodeStyle({
    Key? key,
    required this.baseStyle,
    required this.numberStyle,
    required this.commentStyle,
    required this.keywordStyle,
    required this.stringStyle,
    required this.punctuationStyle,
    required this.classStyle,
    required this.constantStyle,
    required Widget child,
  }) : super(key: key, child: child);

  final TextStyle baseStyle;
  final TextStyle numberStyle;
  final TextStyle commentStyle;
  final TextStyle keywordStyle;
  final TextStyle stringStyle;
  final TextStyle punctuationStyle;
  final TextStyle classStyle;
  final TextStyle constantStyle;

  static CodeStyle of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CodeStyle>()!;
  }

  @override
  bool updateShouldNotify(CodeStyle oldWidget) =>
      oldWidget.baseStyle != baseStyle ||
      oldWidget.numberStyle != numberStyle ||
      oldWidget.commentStyle != commentStyle ||
      oldWidget.keywordStyle != keywordStyle ||
      oldWidget.stringStyle != stringStyle ||
      oldWidget.punctuationStyle != punctuationStyle ||
      oldWidget.classStyle != classStyle ||
      oldWidget.constantStyle != constantStyle;
}
