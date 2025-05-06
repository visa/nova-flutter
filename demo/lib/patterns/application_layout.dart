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
import 'package:demo/main.dart';
import 'package:flutter/material.dart';

class ApplicationLayoutPage extends StatefulWidget {
  const ApplicationLayoutPage({super.key});

  @override
  State<ApplicationLayoutPage> createState() => _ApplicationLayoutPageState();
}

class _ApplicationLayoutPageState extends State<ApplicationLayoutPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Application Layout', context);

    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Application Layout"),
        drawer: const MyDrawer(pageTitle: "Application Layout"),
        body: Container(),
      ),
    );
  }
}
