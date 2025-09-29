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
// Visa Nova Demo Progress Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage>
    with TickerProviderStateMixin {
  late AnimationController controller1,
      controller2,
      controller3,
      controller4,
      controller5;
  bool switchValue = false;
  double? indeterminateValue1;
  double? indeterminateValue2;
  double? indeterminateValue3;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    //! Linear status controller
    controller1 = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    )..addListener(() {
        setState(() {});
      });
    controller1.animateTo(5.0);
    super.initState();

    controller2 = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    )..addListener(() {
        setState(() {});
      });
    controller2.animateTo(5.0);
    super.initState();

    controller3 = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    )..addListener(() {
        setState(() {});
      });
    controller3.animateTo(5.0);
    super.initState();

    controller4 = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    )..addListener(() {
        setState(() {});
      });
    controller4.animateTo(5.0);
    super.initState();

    controller5 = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    )..addListener(() {
        setState(() {});
      });
    controller5.animateTo(5.0);
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setPageTitle(
      "Progress",
      context,
    );
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Progress"),
        drawer: const MyDrawer(pageTitle: "Progress"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //! Determinate
                MergeSemantics(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Pause animation',
                          style: defaultVTheme.textStyles.uiLabelActive,
                        ),
                      ),
                      Switch(
                        value: switchValue,
                        onChanged: (bool value) {
                          setState(
                            () {
                              switchValue = value;
                              if (switchValue) {
                                controller1.stop();
                                controller2.stop();
                                controller3.stop();
                                controller4.stop();
                                controller5.stop();
                                indeterminateValue1 = 0.0;
                                indeterminateValue2 = 0.0;
                                indeterminateValue3 = 0.0;
                              } else {
                                controller1
                                  ..forward(from: controller1.value)
                                  ..animateTo(5.0);
                                controller2
                                  ..forward(from: controller2.value)
                                  ..animateTo(5.0);
                                controller3
                                  ..forward(from: controller3.value)
                                  ..animateTo(5.0);
                                controller4
                                  ..forward(from: controller4.value)
                                  ..animateTo(5.0);
                                controller5
                                  ..forward(from: controller5.value)
                                  ..animateTo(5.0);
                                indeterminateValue1 = null;
                                indeterminateValue2 = null;
                                indeterminateValue3 = null;
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                MergeSemantics(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: VButton(
                            style: VButtonStyle(
                                overlayColorPressed:
                                    VColors.defaultSurfaceHighlight,
                                backgroundColorActive: VColors.defaultSurface1,
                                foregroundColorActive: VColors.defaultActive,
                                borderSideActive: const BorderSide(
                                  color: VColors.defaultActive,
                                )),
                            child: const Text("Reset"),
                            onPressed: () {
                              controller1
                                ..forward(from: controller1.value)
                                ..reset()
                                ..animateTo(5.0);
                              controller2
                                ..forward(from: controller2.value)
                                ..reset()
                                ..animateTo(5.0);
                              controller3
                                ..forward(from: controller3.value)
                                ..reset()
                                ..animateTo(5.0);
                              controller4
                                ..forward(from: controller4.value)
                                ..reset()
                                ..animateTo(5.0);
                              controller5
                                ..forward(from: controller5.value)
                                ..reset()
                                ..animateTo(5.0);
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),

                //! Linear progress indicators
                SemanticHeader(
                    title: "Linear progress indicators",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? VColors.defaultTextDark
                            : VColors.defaultText)),
                smallHeight(),

                // Linear: indeterminate
                const SemanticHeader(
                    title: "Indeterminate linear progress indicator"),
                const SizedBox(height: 30),
                vProgressLinearIndeterminate(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vProgressLinearIndeterminate,
                  componentName: 'Progress',
                  exampleName: 'Linear_Indeterminate_Progress',
                  copyLabel: "Linear: indeterminate",
                ),

                // Linear: status
                const SemanticHeader(
                    title: "Determinate linear progress indicator"),
                const SizedBox(height: 30),
                vProgressLinearDefault(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vProgressLinearDefault,
                  componentName: 'Progress',
                  exampleName: 'Linear_Progress',
                  copyLabel: "Linear: status",
                ),

                // Linear: error
                const SemanticHeader(
                    title: "Error determinate linear progress indicator"),
                const SizedBox(height: 30),
                vProgressLinearError(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vProgressLinearError,
                  componentName: 'Progress',
                  exampleName: 'Linear_Error_Progress',
                  copyLabel: "Linear: error",
                ),

                //! Circular progress indicators
                SemanticHeader(
                    title: "Circular progress indicators",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? VColors.defaultTextDark
                            : VColors.defaultText)),
                smallHeight(),

                // Circular small Indeterminate
                const SemanticHeader(
                  title: "Small indeterminate circular progress indicator",
                ),
                const SizedBox(
                  height: 30,
                ),
                vProgressCircularSmallIndeterminate(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vProgressCircularSmallIndeterminate,
                  componentName: 'Progress',
                  exampleName: 'Small_Circular_Indeterminate_Progress',
                  copyLabel: "Circular small: indeterminate",
                ),

                // Circular big Indeterminate
                const SemanticHeader(
                  title: "Large indeterminate circular progress indicator",
                ),
                const SizedBox(
                  height: 30,
                ),
                vProgressCircularBigIndeterminate(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vProgressCircularBigIndeterminate,
                  componentName: 'Progress',
                  exampleName: 'Big_Circular_Indeterminate_Progress',
                  copyLabel: "Circular big: indeterminate",
                ),

                // Circular small
                const SemanticHeader(
                  title: "Small determinate circular progress indicator",
                ),
                const SizedBox(
                  height: 30,
                ),
                vProgressCircularSmall(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vProgressCircularSmall,
                  componentName: 'Progress',
                  exampleName: 'Small_Circular_Progress',
                  copyLabel: "Circular small: determinate",
                ),

                // Circular big
                const SemanticHeader(
                  title: "Large determinate circular progress indicator",
                ),
                const SizedBox(
                  height: 30,
                ),
                vProgressCircularBig(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vProgressCircularBig,
                  componentName: 'Progress',
                  exampleName: 'Big_Circular_Progress',
                  copyLabel: "Circular big: determinate",
                ),

                // Circular Error
                const SemanticHeader(
                  title: "Error determinate circular progress indicator",
                ),
                const SizedBox(
                  height: 30,
                ),
                MergeSemantics(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VIcon(
                        svgIcon: VIcons.errorTiny,
                        iconColor: VColors.negativeGraphics,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "This is required text that describes\n the error in more detail",
                        style: defaultVTheme.textStyles.uiLabel.copyWith(
                          color: VColors.negativeText,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                //! Circular gauge indicators
                SemanticHeader(
                    title: "Circular progress gauges",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? VColors.defaultTextDark
                            : VColors.defaultText)),
                smallHeight(),

                // Circular gauge small
                const SemanticHeader(
                  title: "Small determinate circular progress gauge",
                ),
                const SizedBox(
                  height: 30,
                ),
                vProgressGaugeSmall(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vProgressGaugeSmall,
                  componentName: 'Progress',
                  exampleName: 'Small_Gauge_Progress',
                  copyLabel: "Circular gauge small",
                ),

                // Circular gauge big
                const SemanticHeader(
                  title: "Large determinate circular progress gauge",
                ),
                const SizedBox(
                  height: 30,
                ),
                vProgressGaugeBig(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vProgressGaugeBig,
                  componentName: 'Progress',
                  exampleName: 'Big_Gauge_Progress',
                  copyLabel: "Circular gauge big",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// BEGIN vProgressGaugeSmall
  Column vProgressGaugeSmall() {
    return Column(
      children: [
        VProgressGaugeSmall(
          value: controller5.value,
        ),
        const SizedBox(
          height: 7.5,
        ),
        MergeSemantics(
          child: Column(
            children: [
              Text(
                "Filename.jpg",
                style: defaultVTheme.textStyles.uiLabelActive,
              ),
              const SizedBox(
                height: 7.5,
              ),
              Semantics(
                label:
                    "Uploaded ${controller5.value * 100} megabytes out of 100 megabytes",
                child: ExcludeSemantics(
                  child: Text(
                    (controller5.value * 100).round().toString() + "MB / 100MB",
                    style: defaultVTheme.textStyles.bodyText3,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
// END

// BEGIN vProgressGaugeBig
  Column vProgressGaugeBig() {
    return Column(
      children: [
        VProgressGaugeBig(
          value: controller4.value,
        ),
        const SizedBox(
          height: 7.5,
        ),
        MergeSemantics(
          child: Column(
            children: [
              Text(
                "Filename.jpg",
                style: defaultVTheme.textStyles.bodyText2
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 7.5,
              ),
              Semantics(
                label:
                    "Uploaded ${controller4.value * 100} megabytes out of 100 megabytes",
                child: ExcludeSemantics(
                  child: Text(
                    (controller4.value * 100).round().toString() + "MB / 100MB",
                    style: defaultVTheme.textStyles.bodyText3,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
// END

// BEGIN vProgressCircularSmallIndeterminate
  vProgressCircularSmallIndeterminate() {
    return Column(
      children: [
        VProgressCircular(
          value: indeterminateValue3,
          style: const VProgressStyle(
            circularSize: 56,
          ),
        ),
      ],
    );
  }
// END

// BEGIN vProgressCircularSmall
  Column vProgressCircularSmall() {
    return Column(
      children: [
        VProgressCircular(
          style: const VProgressStyle(
            circularSize: 56,
          ),
          value: controller3.value,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
// END

// BEGIN vProgressCircularBigIndeterminate
  vProgressCircularBigIndeterminate() {
    return Column(
      children: [
        VProgressCircular(
          value: indeterminateValue2,
        ),
      ],
    );
  }
// END

// BEGIN vProgressCircularBig
  Column vProgressCircularBig() {
    return Column(
      children: [
        VProgressCircular(
          value: controller2.value,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
// END

// BEGIN vProgressLinearError
  vProgressLinearError() {
    return MergeSemantics(
      child: Column(
        children: [
          const VProgressLinear(
            value: 0,
          ),
          const SizedBox(height: 10),
          MergeSemantics(
            child: Row(
              children: [
                const VIcon(
                  svgIcon: VIcons.errorTiny,
                  iconColor: VColors.negativeGraphics,
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    "This is required text that describes the error in more detail.",
                    style: defaultVTheme.textStyles.uiLabel.copyWith(
                      color: VColors.negativeText,
                    ),
                  ),
                ),
                ExcludeSemantics(
                  child: Text(
                    "0%",
                    style: defaultVTheme.textStyles.uiLabel.copyWith(
                      color: VColors.negativeText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
// END

// BEGIN vProgressLinearIndeterminate
  Column vProgressLinearIndeterminate() {
    return Column(
      children: [
        VProgressLinear(
          value: indeterminateValue1,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Text(
                switchValue ? "" : "Loading……",
                style: defaultVTheme.textStyles.uiLabel,
              ),
            ),
          ],
        ),
      ],
    );
  }
// END

// BEGIN vProgressLinearDefault
  vProgressLinearDefault() {
    return MergeSemantics(
      child: Column(
        children: [
          VProgressLinear(value: controller1.value),
          const SizedBox(height: 10),
          MergeSemantics(
            child: Row(
              children: [
                controller1.value == 1.0
                    ? const Row(
                        children: [
                          VIcon(
                            svgIcon: VIcons.successTiny,
                            iconColor: VColors.positiveGraphics,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                Expanded(
                  child: Text(
                    controller1.value == 1.0
                        ? "File is now uploaded"
                        : "Filename.jpg",
                    style: defaultVTheme.textStyles.uiLabel,
                  ),
                ),
                ExcludeSemantics(
                  child: Text(
                    (controller1.value * 100).round().toString() + "%",
                    style: defaultVTheme.textStyles.uiLabel,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// END
