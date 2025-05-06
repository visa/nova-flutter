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

import 'codeviewer/code_displayer.dart';

class Component {
  Component({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.configurations,
    required this.slug,
    required this.email,
  });

  // Title shown on component list (home page)
  String title;

  // Subtitle shown on component list (home page)
  String subtitle;

  // Path/route name
  String slug;

  // Icon shown on component list (home page)
  IconData icon;

  // Creator of component
  String email;

  // Examples
  List<ComponentConfiguration> configurations;
}

class ComponentConfiguration {
  const ComponentConfiguration({
    required this.title,
    required this.description,
    required this.buildRoute,
    this.code,
  });

  final String title;
  final String description;
  final WidgetBuilder buildRoute;
  final CodeDisplayer? code;
}
