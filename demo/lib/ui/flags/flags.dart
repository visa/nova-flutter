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
// Visa Nova Flutter Demo Flag page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';

class Flags extends StatefulWidget {
  const Flags({
    Key? key,
  }) : super(key: key);

  @override
  State<Flags> createState() => _FlagsState();
}

class _FlagsState extends State<Flags> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    setPageTitle('Flags', context);
    return PopScope(
      onPopInvoked: (didPop) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Flag"),
        drawer: const MyDrawer(pageTitle: "Flag"),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // !Informational flags
                    SemanticHeader(
                        title: "Informational flags",
                        style: defaultVTheme.textStyles.headline2.copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? VColors.defaultTextDark
                                    : VColors.defaultText)),
                    smallHeight(),
                    const SemanticHeader(title: "Default informational flag"),
                    smallHeight(),
                    const VFlagInfoDefault(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagInfoDefault,
                      componentName: 'Flag',
                      exampleName: 'Default_Flag',
                      copyLabel: "Show informational flag default",
                    ),
                    smallHeight(),
                    const SemanticHeader(
                        title: "Informational flag with title"),
                    smallHeight(),
                    const VFlagInfoWithTitle(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagInfoWithTitle,
                      componentName: 'Flag',
                      exampleName: 'Informational_Flag_With_Title',
                      copyLabel: "Show informational flag with title",
                    ),
                    smallHeight(),
                    const SemanticHeader(
                        title: "Informational flag with button"),
                    smallHeight(),
                    const VFlagInfoWithButton(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagInfoWithButton,
                      componentName: 'Flag',
                      exampleName: 'Informational_Flag_With_Button',
                      copyLabel: "Show informational flag with button",
                    ),
                    smallHeight(),
                    const SemanticHeader(
                        title: "Informational flag without close link"),
                    smallHeight(),
                    const VFlagInfoPersistent(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagInfoPersistent,
                      componentName: 'Flag',
                      exampleName: 'Informational_Persistent_Flag',
                      copyLabel: "Show informational flag without close link",
                    ),
                    const Divider(),
                    // !Success flags
                    SemanticHeader(
                        title: "Success flags",
                        style: defaultVTheme.textStyles.headline2.copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? VColors.defaultTextDark
                                    : VColors.defaultText)),
                    smallHeight(),
                    const SemanticHeader(title: "Default success flag"),
                    smallHeight(),
                    const VFlagSuccessDefault(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagSuccessDefault,
                      componentName: 'Flag',
                      exampleName: 'Success_Flag',
                      copyLabel: "Show success flag default",
                    ),
                    smallHeight(),
                    const SemanticHeader(title: "Success flag with title"),
                    smallHeight(),
                    const VFlagSuccessWithTitle(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagSuccessWithTitle,
                      componentName: 'Flag',
                      exampleName: 'Success_Flag_With_Title',
                      copyLabel: "Show success flag with title",
                    ),
                    smallHeight(),
                    const SemanticHeader(title: "Success flag with button"),
                    smallHeight(),
                    const VFlagSuccessWithButton(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagSuccessWithButton,
                      componentName: 'Flag',
                      exampleName: 'Success_Flag_With_Button',
                      copyLabel: "Show success flag with button",
                    ),
                    smallHeight(),
                    const SemanticHeader(
                        title: "Success flag without close link"),
                    smallHeight(),
                    const VFlagSuccessPersistent(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagSuccessPersistent,
                      componentName: 'Flag',
                      exampleName: 'Success_Persistent_Flag',
                      copyLabel: "Show success flag without close link",
                    ),
                    const Divider(),
                    // !Warning flags
                    SemanticHeader(
                        title: "Warning flags",
                        style: defaultVTheme.textStyles.headline2.copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? VColors.defaultTextDark
                                    : VColors.defaultText)),
                    smallHeight(),
                    const SemanticHeader(title: "Default warning flag"),
                    smallHeight(),
                    const VFlagWarningDefault(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagWarningDefault,
                      componentName: 'Flag',
                      exampleName: 'Warning_Flag',
                      copyLabel: "Show warning flag default",
                    ),
                    smallHeight(),
                    const SemanticHeader(title: "Warning flag with title"),
                    smallHeight(),
                    const VFlagWarningWithTitle(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagWarningWithTitle,
                      componentName: 'Flag',
                      exampleName: 'Warning_Flag_With_Title',
                      copyLabel: "Show warning flag with title",
                    ),
                    smallHeight(),
                    const SemanticHeader(title: "Warning flag with button"),
                    smallHeight(),
                    const VFlagWarningWithButton(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagWarningWithButton,
                      componentName: 'Flag',
                      exampleName: 'Warning_Flag_With_Button',
                      copyLabel: "Show warning flag with button",
                    ),
                    smallHeight(),
                    const SemanticHeader(
                        title: "Warning flag without close link"),
                    smallHeight(),
                    const VFlagWarningPersistent(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagWarningPersistent,
                      componentName: 'Flag',
                      exampleName: 'Warning_Persistent_Flag',
                      copyLabel: "Show warning flag without close link",
                    ),
                    const Divider(),
                    // !Error flags
                    SemanticHeader(
                        title: "Error flags",
                        style: defaultVTheme.textStyles.headline2.copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? VColors.defaultTextDark
                                    : VColors.defaultText)),
                    smallHeight(),
                    const SemanticHeader(title: "Default error flag"),
                    smallHeight(),
                    const VFlagErrorDefault(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagErrorDefault,
                      componentName: 'Flag',
                      exampleName: 'Error_Flag',
                      copyLabel: "Show error flag default",
                    ),
                    smallHeight(),
                    const SemanticHeader(title: "Error flag with title"),
                    smallHeight(),
                    const VFlagErrorWithTitle(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagErrorWithTitle,
                      componentName: 'Flag',
                      exampleName: 'Error_Flag_With_Title',
                      copyLabel: "Show error flag with title",
                    ),
                    smallHeight(),
                    const SemanticHeader(title: "Error flag with button"),
                    smallHeight(),
                    const VFlagErrorWithButton(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagErrorWithButton,
                      componentName: 'Flag',
                      exampleName: 'Error_Flag_With_Button',
                      copyLabel: "Show error flag with button",
                    ),
                    smallHeight(),
                    const SemanticHeader(
                        title: "Error flag without close link"),
                    smallHeight(),
                    const VFlagErrorPersistent(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagErrorPersistent,
                      componentName: 'Flag',
                      exampleName: 'Error_Persistent_Flag',
                      copyLabel: "Show error flag without close link",
                    ),
                    const Divider(),
                    // !Custom flag
                    SemanticHeader(
                        title: "Custom flag",
                        style: defaultVTheme.textStyles.headline2.copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? VColors.defaultTextDark
                                    : VColors.defaultText)),
                    smallHeight(),
                    const SemanticHeader(title: "Custom flag"),
                    smallHeight(),
                    const VFlagSuccessWithCustomized(),
                    smallHeight(),
                    const ShowCodeAccordion(
                      codeSegment: CodeSegments.VFlagSuccessWithCustomized,
                      componentName: 'Flag',
                      exampleName: 'Success_Flag_With_Custom_styles',
                      copyLabel: "Success flag with customized styles",
                    ),
                    const Divider(),
                  ]),
            ),
          ],
        )),
      ),
    );
  }
}

// BEGIN VFlagSuccessPersistent
class VFlagSuccessPersistent extends StatelessWidget {
  const VFlagSuccessPersistent({
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
        ScaffoldMessenger.of(context).showSnackBar(const VSnackBar(
          snackBarState: SnackBarState.success,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.success,
          ),
        ));
      },
      child: const Text("Show success flag without close link"),
    );
  }
}
// END

// BEGIN VFlagErrorPersistent
class VFlagErrorPersistent extends StatelessWidget {
  const VFlagErrorPersistent({
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
        ScaffoldMessenger.of(context).showSnackBar(const VSnackBar(
          snackBarState: SnackBarState.error,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.error,
          ),
        ));
      },
      child: const Text("Show error flag without close link"),
    );
  }
}
// END

// BEGIN VFlagWarningPersistent
class VFlagWarningPersistent extends StatelessWidget {
  const VFlagWarningPersistent({
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
        ScaffoldMessenger.of(context).showSnackBar(const VSnackBar(
          snackBarState: SnackBarState.warning,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.warning,
          ),
        ));
      },
      child: const Text("Show warning flag without close link"),
    );
  }
}
// END

// BEGIN VFlagInfoPersistent
class VFlagInfoPersistent extends StatelessWidget {
  const VFlagInfoPersistent({
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
        ScaffoldMessenger.of(context).showSnackBar(const VSnackBar(
          snackBarState: SnackBarState.informational,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.informational,
          ),
        ));
      },
      child: const Text("Show informational flag without close link"),
    );
  }
}
// END

// BEGIN VFlagSuccessWithButton
class VFlagSuccessWithButton extends StatelessWidget {
  const VFlagSuccessWithButton({
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
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.success,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.success,
            hasClose: true,
            onClosePressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            hasAction: true,
            action: "Primary action",
            onActionPressed: () {},
          ),
        ));
      },
      child: const Text("Show success flag with button"),
    );
  }
}
// END

// BEGIN VFlagErrorWithButton
class VFlagErrorWithButton extends StatelessWidget {
  const VFlagErrorWithButton({
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
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.error,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.error,
            hasClose: true,
            onClosePressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            hasAction: true,
            action: "Primary action",
            onActionPressed: () {},
          ),
        ));
      },
      child: const Text("Show error flag with button"),
    );
  }
}
// END

// BEGIN VFlagWarningWithButton
class VFlagWarningWithButton extends StatelessWidget {
  const VFlagWarningWithButton({
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
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.warning,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.warning,
            hasClose: true,
            onClosePressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            hasAction: true,
            action: "Primary action",
            onActionPressed: () {},
          ),
        ));
      },
      child: const Text("Show warning flag with button"),
    );
  }
}
// END

// BEGIN VFlagInfoWithButton
class VFlagInfoWithButton extends StatelessWidget {
  const VFlagInfoWithButton({
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
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.informational,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.informational,
            hasClose: true,
            onClosePressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            hasAction: true,
            action: "Primary action",
            onActionPressed: () {},
          ),
        ));
      },
      child: const Text("Show informational flag with button"),
    );
  }
}
// END

// BEGIN VFlagSuccessWithTitle
class VFlagSuccessWithTitle extends StatelessWidget {
  const VFlagSuccessWithTitle({
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
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.success,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            hasTitle: true,
            title: "Success title",
            hasLink: true,
            link: "Close",
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.success,
            onLinkPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
      },
      child: const Text("Show success flag with title"),
    );
  }
}
// END

// BEGIN VFlagErrorWithTitle
class VFlagErrorWithTitle extends StatelessWidget {
  const VFlagErrorWithTitle({
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
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.error,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            hasTitle: true,
            title: "Error title",
            hasLink: true,
            link: "Close",
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.error,
            onLinkPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
      },
      child: const Text("Show error flag with title"),
    );
  }
}
// END

// BEGIN VFlagWarningWithTitle
class VFlagWarningWithTitle extends StatelessWidget {
  const VFlagWarningWithTitle({
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
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.warning,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            title: "Warning title",
            hasTitle: true,
            hasLink: true,
            link: "Close",
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.warning,
            onLinkPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
      },
      child: const Text("Show warning flag with title"),
    );
  }
}
// END

// BEGIN VFlagInfoWithTitle
class VFlagInfoWithTitle extends StatelessWidget {
  const VFlagInfoWithTitle({
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
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.informational,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            title: "Informational title",
            hasTitle: true,
            hasLink: true,
            link: "Close",
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.informational,
            onLinkPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
      },
      child: const Text("Show informational flag with title"),
    );
  }
}
// END

// BEGIN VFlagSuccessDefault
class VFlagSuccessDefault extends StatelessWidget {
  const VFlagSuccessDefault({
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
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.success,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            hasLink: true,
            link: "Close",
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.success,
            onLinkPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
      },
      child: const Text("Show default success flag"),
    );
  }
}
// END

// BEGIN VFlagErrorDefault
class VFlagErrorDefault extends StatelessWidget {
  const VFlagErrorDefault({
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
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.error,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            hasLink: true,
            link: "Close",
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.error,
            onLinkPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
      },
      child: const Text("Show default error flag"),
    );
  }
}
// END

// BEGIN VFlagWarningDefault
class VFlagWarningDefault extends StatelessWidget {
  const VFlagWarningDefault({
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
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.warning,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            hasLink: true,
            link: "Close",
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.warning,
            onLinkPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
      },
      child: const Text("Show default warning flag"),
    );
  }
}
// END

// BEGIN VFlagInfoDefault
class VFlagInfoDefault extends StatelessWidget {
  const VFlagInfoDefault({
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
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.informational,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            hasLink: true,
            link: "Close",
            description:
                "This is required text that describes the flag in more detail.",
            flagState: FlagState.informational,
            onLinkPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
      },
      child: const Text("Show default informational flag"),
    );
  }
}
// END

// BEGIN VFlagSuccessWithCustomized
class VFlagSuccessWithCustomized extends StatelessWidget {
  const VFlagSuccessWithCustomized({
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
        ScaffoldMessenger.of(context).showSnackBar(VSnackBar(
          snackBarState: SnackBarState.success,
          behavior: SnackBarBehavior.floating,
          content: VFlag(
            style: VFlagStyle(
              titleTextColor: VColors.positiveText,
              descriptionTextColor: VColors.defaultAccent,
              closeIconColor: VColors.defaultActive,
              closeIconPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              titleTextStyle: defaultVTheme.textStyles.bodyText1,
              descriptionTextStyle: defaultVTheme.textStyles.bodyText2,
            ),
            hasClose: true,
            onClosePressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            hasTitle: true,
            title: "Custom title",
            description:
                "This is required text that describes the banner in more detail.",
            flagState: FlagState.success,
          ),
        ));
      },
      child: const Text("Show custom flag"),
    );
  }
}
// END
