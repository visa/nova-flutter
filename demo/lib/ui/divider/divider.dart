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
// Visa Nova Flutter Demo Divider Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class DividerPage extends StatelessWidget {
  const DividerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    setPageTitle('Divider', context);
    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Divider"),
        drawer: const MyDrawer(pageTitle: "Divider"),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    header: true,
                    child: Text(
                      "Default divider",
                      style: defaultVTheme.textStyles.bodyText1,
                    ),
                  ),
                  const VDividerDefault(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VDivider,
                    componentName: 'Divider',
                    exampleName: 'Default_Divider',
                    copyLabel: "Standard divider",
                  ),
                  smallHeight(),
                  Semantics(
                    header: true,
                    child: Text(
                      "Section divider",
                      style: defaultVTheme.textStyles.bodyText1,
                    ),
                  ),
                  const VDividerSection(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VDividerSection,
                    componentName: 'Divider',
                    exampleName: 'Section_Divider',
                    copyLabel: "Section divider",
                  ),
                  smallHeight(),
                  Semantics(
                    header: true,
                    child: Text(
                      "Decorative divider",
                      style: defaultVTheme.textStyles.bodyText1,
                    ),
                  ),
                  const VDividerDecorative(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.VDividerDecorative,
                    componentName: 'Divider',
                    exampleName: 'Decorative_Divider',
                    copyLabel: "Decorative divider",
                  ),
                  smallHeight(),
                  SemanticHeader(
                    title: "Custom divider",
                    style: defaultVTheme.textStyles.bodyText1,
                  ),
                  smallHeight(),
                  const CustomDivider(),
                  smallHeight(),
                  const ShowCodeAccordion(
                    codeSegment: CodeSegments.CustomDivider,
                    componentName: 'Divider',
                    exampleName: 'Custom_Divider',
                    copyLabel: "Custom Divider",
                  ),
                  smallHeight(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN VDividerDecorative
class VDividerDecorative extends StatelessWidget {
  const VDividerDecorative({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VDivider(
      dividerType: VDividerType.decorative,
    );
  }
}
// END

// BEGIN VDividerSection
class VDividerSection extends StatelessWidget {
  const VDividerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VDivider(
      dividerType: VDividerType.section,
    );
  }
}
// END

// BEGIN VDivider
class VDividerDefault extends StatelessWidget {
  const VDividerDefault({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VDivider();
  }
}
// END

// BEGIN CustomDivider
class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const VDivider(
      style: VDividerStyle(
        thickness: 5,
        dividerColor: Colors.orangeAccent,
      ),
    );
  }
}
// END