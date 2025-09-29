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
// Visa Nova Flutter Demo Typography Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
// Demo app imports
import 'package:demo/main.dart';
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

// import 'package:url_launcher/url_launcher.dart';

var sampleText = "Mist enveloped the ship three hours out from port.";

class TypographyPage extends StatelessWidget {
  const TypographyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    setPageTitle('Typography', context);
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Typography"),
        drawer: const MyDrawer(pageTitle: "Typography"),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //! Display 1
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Display 1",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextDisplay1(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextDisplay1,
                        exampleName: "display 1",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Display 2
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Display 2",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextDisplay2(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextDisplay2,
                        exampleName: "display 2",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Headline 1
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Headline 1",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextHeadline1(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextHeadline1,
                        exampleName: "headline 1",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Headline 2
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Headline 2",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextHeadline2(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextHeadline2,
                        exampleName: "headline 2",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Headline 3
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Headline 3",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextHeadline3(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextHeadline3,
                        exampleName: "headline 3",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Headline 4
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Headline 4",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextHeadline4(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextHeadline4,
                        exampleName: "headline 4",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Subtitle 1
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Subtitle 1",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextSubtitle1(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextSubtitle1,
                        exampleName: "subtitle 1",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Subtitle 2
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Subtitle 2",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextSubtitle2(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextSubtitle2,
                        exampleName: "subtitle 2",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Subtitle 3
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Subtitle 3",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextSubtitle3(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextSubtitle3,
                        exampleName: "subtitle 3",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Overline
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Overline",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextOverline(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextOverline,
                        exampleName: "overline",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Body 1
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Body 1",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextBody1(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextBody1,
                        exampleName: "bodyText 1",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Body 2
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Body 2",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextBody2(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextBody2,
                        exampleName: "bodyText 2",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Body 2 medium
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Body 2 medium",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextBody2Medium(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextBody2Medium,
                        exampleName: "bodyText 2 Medium",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Body 3
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Body 3",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextBody3(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextBody3,
                        exampleName: "bodyText 3",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Button large
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Button large",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextButtonLarge(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextButtonLarge,
                        exampleName: "button large",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Button medium
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Button medium",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextButtonMedium(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextButtonMedium,
                        exampleName: "button medium",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! Button small
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Button small",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextButtonSmall(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextButtonSmall,
                        exampleName: "button small",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! UI label large
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "UI label large",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextUILabelLarge(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextUILabelLarge,
                        exampleName: "uiLabel large",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! UI label large active
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "UI label large active",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextUILabelLargeActive(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextUILabelLargeActive,
                        exampleName: "uiLabel large active",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! UI label
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "UI label",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextUILabel(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextUILabel,
                        exampleName: "uiLabel",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! UI label active
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "UI label active",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextUILabelActive(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextUILabelActive,
                        exampleName: "uiLabel active",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! UI label small
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "UI label small",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextUILabelSmall(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextUILabelSmall,
                        exampleName: "uiLabel small",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
                //! UI label extra small
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "UI label extra small",
                    style: defaultVTheme.textStyles.headline4,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withAlpha(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ClipRect(
                        child: CustomPaint(
                          painter: CheckeredPatternDefault(),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextUILabelXSmall(),
                            ),
                          ),
                        ),
                      ),
                      const ShowCodeAccordion(
                        copyLabel: "Typography",
                        codeSegment: CodeSegments.TextUILabelXSmall,
                        exampleName: "uiLabel extra small",
                        componentName: "Typography",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN TextDisplay1
class TextDisplay1 extends StatelessWidget {
  const TextDisplay1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.display1,
    );
  }
}
// END

// BEGIN TextDisplay2
class TextDisplay2 extends StatelessWidget {
  const TextDisplay2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.display2,
    );
  }
}
// END

// BEGIN TextHeadline1
class TextHeadline1 extends StatelessWidget {
  const TextHeadline1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.headline1,
    );
  }
}
// END

// BEGIN TextHeadline2
class TextHeadline2 extends StatelessWidget {
  const TextHeadline2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.headline2,
    );
  }
}
// END

// BEGIN TextHeadline3
class TextHeadline3 extends StatelessWidget {
  const TextHeadline3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.headline3,
    );
  }
}
// END

// BEGIN TextHeadline4
class TextHeadline4 extends StatelessWidget {
  const TextHeadline4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.headline4,
    );
  }
}
// END

// BEGIN TextSubtitle1
class TextSubtitle1 extends StatelessWidget {
  const TextSubtitle1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.subtitle1,
    );
  }
}
// END

// BEGIN TextSubtitle2
class TextSubtitle2 extends StatelessWidget {
  const TextSubtitle2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.subtitle2,
    );
  }
}
// END

// BEGIN TextSubtitle3
class TextSubtitle3 extends StatelessWidget {
  const TextSubtitle3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.subtitle3,
    );
  }
}
// END

// BEGIN TextOverline
class TextOverline extends StatelessWidget {
  const TextOverline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.overline,
    );
  }
}
// END

// BEGIN TextBody1
class TextBody1 extends StatelessWidget {
  const TextBody1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.bodyText1,
    );
  }
}
// END

// BEGIN TextBody2
class TextBody2 extends StatelessWidget {
  const TextBody2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.bodyText2,
    );
  }
}
// END

// BEGIN TextBody2Medium
class TextBody2Medium extends StatelessWidget {
  const TextBody2Medium({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.bodyText2Medium,
    );
  }
}
// END

// BEGIN TextBody3
class TextBody3 extends StatelessWidget {
  const TextBody3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.bodyText3,
    );
  }
}
// END

// BEGIN TextButtonLarge
class TextButtonLarge extends StatelessWidget {
  const TextButtonLarge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.buttonLarge,
    );
  }
}
// END

// BEGIN TextButtonMedium
class TextButtonMedium extends StatelessWidget {
  const TextButtonMedium({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.buttonMedium,
    );
  }
}
// END

// BEGIN TextButtonSmall
class TextButtonSmall extends StatelessWidget {
  const TextButtonSmall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.buttonSmall,
    );
  }
}
// END

// BEGIN TextUILabelLarge
class TextUILabelLarge extends StatelessWidget {
  const TextUILabelLarge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.uiLabelLarge,
    );
  }
}
// END

// BEGIN TextUILabelLargeActive
class TextUILabelLargeActive extends StatelessWidget {
  const TextUILabelLargeActive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.uiLabelLargeActive,
    );
  }
}
// END

// BEGIN TextUILabel
class TextUILabel extends StatelessWidget {
  const TextUILabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.uiLabel,
    );
  }
}
// END

// BEGIN TextUILabelActive
class TextUILabelActive extends StatelessWidget {
  const TextUILabelActive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.uiLabelActive,
    );
  }
}
// END

// BEGIN TextUILabelSmall
class TextUILabelSmall extends StatelessWidget {
  const TextUILabelSmall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.uiLabelSmall,
    );
  }
}
// END

// BEGIN TextUILabelXSmall
class TextUILabelXSmall extends StatelessWidget {
  const TextUILabelXSmall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sampleText,
      style: defaultVTheme.textStyles.uiLabelXSmall,
    );
  }
}
// END
