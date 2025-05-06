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
// Visa Nova Flutter Demo Panel Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class PanelPage extends StatelessWidget {
  const PanelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    setPageTitle('Panel', context);
    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Panel"),
        drawer: const MyDrawer(pageTitle: "Panel"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                smallHeight(),
                const SemanticHeader(
                  title: "Half-screen modal panel",
                ),
                smallHeight(),
                const VHalfScreenPanelButton(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VHalfScreenPanelButton,
                  componentName: 'Panel',
                  exampleName: 'Half_Screen_Panel',
                  copyLabel: "Open half screen panel",
                ),
                smallHeight(),
                const SemanticHeader(
                  title: "Full-screen modal panel",
                ),
                smallHeight(),
                const VFullScreenPanelButton(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VFullScreenPanelButton,
                  componentName: 'Panel',
                  exampleName: 'Full_Screen_Panel',
                  copyLabel: "Open full screen panel",
                ),
                smallHeight(),
                const SemanticHeader(
                  title: "Custom panel with dynamic height",
                ),
                smallHeight(),
                const VDynamicScreenRoundRadiusPanelButton(),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.VDynamicScreenRoundRadiusPanelButton,
                  componentName: 'Panel',
                  exampleName: 'Full_Screen_Round_Corner_Panel',
                  copyLabel: "Open dynamic screen with round corner panel",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// BEGIN VFullScreenPanelButton
class VFullScreenPanelButton extends StatelessWidget {
  const VFullScreenPanelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
      style: VButtonStyle(
        backgroundColorActive: VColors.transparent,
        backgroundColorDisabled: VColors.transparent,
        foregroundColorActive: VColors.defaultActive,
        foregroundColorDisabled: VColors.disabled,
        overlayColorFocused: VColors.defaultSurfaceLowlight,
        overlayColorPressed: VColors.defaultSurfaceLowlight,
        borderSideActive: const BorderSide(
          color: VColors.defaultActive,
          style: BorderStyle.solid,
        ),
        borderSideDisabled: BorderSide(
          color: VColors.defaultDisabled,
          style: BorderStyle.solid,
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          useSafeArea: true,
          // Set this to be true for full screen mode
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return VPanel(
              title: "Panel title",
              isFullScreen: true,
              contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 48),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: fullScreenText,
                ),
              ),
            );
          },
        );
      },
      child: const Text("Open full-screen modal panel"),
    );
  }
}
// END

// BEGIN VDynamicScreenRoundRadiusPanelButton
class VDynamicScreenRoundRadiusPanelButton extends StatelessWidget {
  const VDynamicScreenRoundRadiusPanelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
      style: VButtonStyle(
        backgroundColorActive: VColors.transparent,
        backgroundColorDisabled: VColors.transparent,
        foregroundColorActive: VColors.defaultActive,
        foregroundColorDisabled: VColors.disabled,
        overlayColorFocused: VColors.defaultSurfaceLowlight,
        overlayColorPressed: VColors.defaultSurfaceLowlight,
        borderSideActive: const BorderSide(
          color: VColors.defaultActive,
          style: BorderStyle.solid,
        ),
        borderSideDisabled: BorderSide(
          color: VColors.defaultDisabled,
          style: BorderStyle.solid,
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          useSafeArea: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return Wrap(
              children: [
                VPanel(
                  title: "Panel title",
                  isFullScreen: true,
                  showShadow: false,
                  closeIconPadding: const EdgeInsets.fromLTRB(4, 4, 16, 4),
                  style: const VPanelStyle(borderRadius: 30.0, backgroundColor: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: fullScreenText,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: const Text("Open custom panel with dynamic height"),
    );
  }
}
// END

// BEGIN VHalfScreenPanelButton
class VHalfScreenPanelButton extends StatelessWidget {
  const VHalfScreenPanelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
      style: VButtonStyle(
        backgroundColorActive: VColors.transparent,
        backgroundColorDisabled: VColors.transparent,
        foregroundColorActive: VColors.defaultActive,
        foregroundColorDisabled: VColors.disabled,
        overlayColorFocused: VColors.defaultSurfaceLowlight,
        overlayColorPressed: VColors.defaultSurfaceLowlight,
        borderSideActive: const BorderSide(
          color: VColors.defaultActive,
          style: BorderStyle.solid,
        ),
        borderSideDisabled: BorderSide(
          color: VColors.defaultDisabled,
          style: BorderStyle.solid,
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          useSafeArea: true,
          context: context,
          builder: (BuildContext context) {
            return Stack(
              children: [
                // ModalBarrier is placed in a Stack widget along with your VPanel. This causes the ModalBarrier to cover the entire screen, excluding the semantics of any widgets behind it. The dismissible: false property prevents the barrier from being dismissed (closed) when the user taps on it.
                const ModalBarrier(
                  dismissible: false,
                ),
                VPanel(
                  title: "Panel title",
                  isFullScreen: false,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: halfScreenText,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: const Text("Open half-screen modal panel"),
    );
  }
}
// END

var halfScreenText = [
  const SizedBox(
    height: 20,
  ),
  Semantics(
    header: true,
    child: Text(
      "Panel subtitle",
      style: defaultVTheme.textStyles.subtitle2.copyWith(height: 23 / 18),
    ),
  ),
  Text(
    "This is required text that can be used to describe the panel title and subtitle in more detail.",
    style: defaultVTheme.textStyles.bodyText2.copyWith(height: 24 / 16),
  ),
];

var fullScreenText = [
  const SizedBox(
    height: 20,
  ),
  Semantics(
    header: true,
    child: Text(
      "Panel subtitle",
      style: defaultVTheme.textStyles.subtitle2.copyWith(height: 23 / 18),
    ),
  ),
  Text(
    "This is required text that can be used to describe the panel title and subtitle in more detail.",
    style: defaultVTheme.textStyles.bodyText2.copyWith(height: 24 / 16),
  ),
];
