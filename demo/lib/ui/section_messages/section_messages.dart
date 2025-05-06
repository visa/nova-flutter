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
// Visa Nova Flutter Demo SectionMessage Page
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
// Demo app imports
import 'package:demo/codeviewer/code_segments.dart';
import 'package:demo/main.dart';
import 'package:demo/ui/show_code_accordion.dart';
import 'package:demo/utilities.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

class SectionMessage extends StatefulWidget {
  SectionMessage({
    Key? key,
    this.infoMessageDefaultOn = false,
    this.warningMessageDefaultOn = false,
    this.errorMessageDefaultOn = false,
    this.successMessageDefaultOn = false,
    this.infoMessageWithTitleOn = false,
    this.warningMessageWithTitleOn = false,
    this.errorMessageWithTitleOn = false,
    this.successMessageWithTitleOn = false,
    this.infoMessageWithButtonOn = false,
    this.warningMessageWithButtonOn = false,
    this.errorMessageWithButtonOn = false,
    this.successMessageWithButtonOn = false,
    this.infoMessagePersistentOn = false,
    this.warningMessagePersistentOn = false,
    this.errorMessagePersistentOn = false,
    this.successMessagePersistentOn = false,
    this.subtleMessageDefaultOn = false,
    this.subtleMessageWithButtonOn = false,
    this.customSubtleMessageDefaultOn = false,
    this.customSubtleMessageWithButtonOn = false,
    this.subtleMessageWithTitleOn = false,
    this.subtleMessageWithTitleButtonOn = false,
    this.subtleMessageWithLinkOn = false,
    this.subtleMessagePersistentOn = false,
    this.subtleMessageWithLinkAndButtonOn = false,
  }) : super(key: key);

  @override
  State<SectionMessage> createState() => vSectionMessageSubtleDefault();
  bool infoMessageDefaultOn,
      warningMessageDefaultOn,
      errorMessageDefaultOn,
      successMessageDefaultOn,
      infoMessageWithTitleOn,
      warningMessageWithTitleOn,
      errorMessageWithTitleOn,
      successMessageWithTitleOn,
      infoMessageWithButtonOn,
      warningMessageWithButtonOn,
      errorMessageWithButtonOn,
      successMessageWithButtonOn,
      infoMessagePersistentOn,
      warningMessagePersistentOn,
      errorMessagePersistentOn,
      successMessagePersistentOn,
      subtleMessageDefaultOn,
      subtleMessageWithButtonOn,
      subtleMessageWithTitleOn,
      subtleMessageWithTitleButtonOn,
      subtleMessageWithLinkOn,
      subtleMessagePersistentOn,
      subtleMessageWithLinkAndButtonOn,
      customSubtleMessageDefaultOn,
      customSubtleMessageWithButtonOn;
}

class vSectionMessageSubtleDefault extends State<SectionMessage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    setPageTitle('Section Message', context);
    return PopScope(
      onPopInvoked: (didPop) {
        widget.infoMessageDefaultOn = false;
        widget.warningMessageDefaultOn = false;
        widget.errorMessageDefaultOn = false;
        widget.successMessageDefaultOn = false;
        widget.infoMessageWithTitleOn = false;
        widget.warningMessageWithTitleOn = false;
        widget.errorMessageWithTitleOn = false;
        widget.successMessageWithTitleOn = false;
        widget.infoMessageWithButtonOn = false;
        widget.warningMessageWithButtonOn = false;
        widget.errorMessageWithButtonOn = false;
        widget.successMessageWithButtonOn = false;
        widget.infoMessagePersistentOn = false;
        widget.warningMessagePersistentOn = false;
        widget.errorMessagePersistentOn = false;
        widget.successMessagePersistentOn = false;
        widget.subtleMessageDefaultOn = false;
        widget.subtleMessageWithButtonOn = false;
        widget.customSubtleMessageDefaultOn = false;
        widget.customSubtleMessageWithButtonOn = false;
        widget.subtleMessageWithTitleOn = false;
        widget.subtleMessageWithTitleButtonOn = false;
        widget.subtleMessageWithLinkOn = false;
        widget.subtleMessagePersistentOn = false;
        widget.subtleMessageWithLinkAndButtonOn = false;
      },
      child: Scaffold(
        key: _key,
        appBar: CustomAppBar(globalKey: _key, title: "Section Message"),
        drawer: const MyDrawer(pageTitle: "Section Message"),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // !Informational section messages
                SemanticHeader(
                    title: "Informational section messages",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? VColors.defaultTextDark
                            : VColors.defaultText)),
                smallHeight(),
                const SemanticHeader(
                    title: "Default informational section message"),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: vSectionMessageInfoDefault(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageInfoDefault,
                  componentName: 'Section_Message',
                  exampleName: 'Informational_Section_Message',
                  copyLabel: "Default section message",
                ),
                const SemanticHeader(
                    title: "Information section message with title"),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: vSectionMessageInfoWithTitle(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageInfoWithTitle,
                  componentName: 'Section_Message',
                  exampleName: 'Informational_Section_Message_With_Title',
                  copyLabel: "Section message with title",
                ),
                const SemanticHeader(
                    title: "Informational section message with button"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: vSectionMessageInfoWithButton(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageInfoWithButton,
                  componentName: 'Section_Message',
                  exampleName: 'Informational_Section_Message_With_Button',
                  copyLabel: "Section message with button: informational",
                ),
                const SemanticHeader(
                    title: "Informational section message without close link"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: vSectionMessageInfoPersistent(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageInfoPersistent,
                  componentName: 'Section_Message',
                  exampleName: 'Informational_Persistent_Section_Message',
                  copyLabel:
                      "Section message without close link: informational",
                ),
                const Divider(),
                // !Success section messages
                SemanticHeader(
                    title: "Success section messages",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? VColors.defaultTextDark
                            : VColors.defaultText)),
                smallHeight(),
                const SemanticHeader(title: "Default success section message"),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: vSectionMessageSuccessDefault(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageSuccessDefault,
                  componentName: 'Section_Message',
                  exampleName: 'Success_Section_Message',
                  copyLabel: "Default section message: success",
                ),
                const SemanticHeader(
                    title: "Success section message with title"),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: vSectionMessageSuccessWithTitle()),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageSuccessWithTitle,
                  componentName: 'Section_Message',
                  exampleName: 'Success_Section_Message_With_Title',
                  copyLabel: "Section message with title: success",
                ),
                const SemanticHeader(
                    title: "Success section message with button"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: vSectionMessageSuccessWithButton(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageSuccessWithButton,
                  componentName: 'Section_Message',
                  exampleName: 'Success_Section_Message_With_Button',
                  copyLabel: "Section message with button: success",
                ),
                const SemanticHeader(
                    title: "Success section message without close link"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: vSectionMessageSuccessPersistent(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageSuccessPersistent,
                  componentName: 'Section_Message',
                  exampleName: 'Success_Persistent_Section_Message',
                  copyLabel: "Section message without close link: success",
                ),
                const Divider(),
                // !Warning section messages
                SemanticHeader(
                    title: "Warning section messages",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? VColors.defaultTextDark
                            : VColors.defaultText)),
                smallHeight(),
                const SemanticHeader(title: "Default warning section message"),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: vSectionMessageWarningDefault(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageWarningDefault,
                  componentName: 'Section_Message',
                  exampleName: 'Warning_Section_Message',
                  copyLabel: "Default section message: warning",
                ),
                const SemanticHeader(
                    title: "Warning section message with title"),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: vSectionMessageWarningWithTitle(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageWarningWithTitle,
                  componentName: 'Section_Message',
                  exampleName: 'Warning_Section_Message_With_Title',
                  copyLabel: "Section message with title: warning",
                ),
                const SemanticHeader(
                    title: "Warning section message with button"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: vSectionMessageWarningWithButton(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageWarningWithButton,
                  componentName: 'Section_Message',
                  exampleName: 'Warning_Section_Message_With_Button',
                  copyLabel: "Section message with button: warning",
                ),
                const SemanticHeader(
                    title: "Warning section message without close link"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: vSectionMessageWarningPersistent(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageWarningPersistent,
                  componentName: 'Section_Message',
                  exampleName: 'Warning_Persistent_Section_Message',
                  copyLabel: "Section message without close link: warning",
                ),
                const Divider(),
                // !Error section messages
                SemanticHeader(
                    title: "Error section messages",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? VColors.defaultTextDark
                            : VColors.defaultText)),
                smallHeight(),
                const SemanticHeader(title: "Default error section message"),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: vSectionMessageErrorDefault(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageErrorDefault,
                  componentName: 'Section_Message',
                  exampleName: 'Error_Section_Message',
                  copyLabel: "Default section message: error",
                ),
                const SemanticHeader(title: "Error section message with title"),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: vSectionMessageErrorWithTitle(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageErrorWithTitle,
                  componentName: 'Section_Message',
                  exampleName: 'Error_Section_Message_With_Title',
                  copyLabel: "Section message with title: error",
                ),
                const SemanticHeader(
                    title: "Error section message with button"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: vSectionMessageErrorWithButton(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageErrorWithButton,
                  componentName: 'Section_Message',
                  exampleName: 'Error_Section_Message_With_Button',
                  copyLabel: "Section message with button: error",
                ),
                const SemanticHeader(
                    title: "Error section message without close link"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: vSectionMessageErrorPersistent(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageErrorPersistent,
                  componentName: 'Section_Message',
                  exampleName: 'Error_Persistent_Section_Message',
                  copyLabel: "Section message without close link: error",
                ),
                const Divider(),
                // !Subtle section messages
                SemanticHeader(
                    title: "Subtle section messages",
                    style: defaultVTheme.textStyles.headline2.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? VColors.defaultTextDark
                            : VColors.defaultText)),
                smallHeight(),
                const SemanticHeader(title: "Default subtle section message"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: vSectionMessageSubtleDefaults(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageSubtleDefaults,
                  componentName: 'Subtle_Message',
                  exampleName: 'Subtle_Section_Message',
                  copyLabel: "Subtle section message default",
                ),
                const SemanticHeader(
                    title: "Subtle section message with title"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: vSectionMessageSubtleWithTitle(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageSubtleWithTitle,
                  componentName: 'Subtle_Message',
                  exampleName: 'Subtle_Section_Message_With_Title',
                  copyLabel: "Subtle section message with title",
                ),
                const SemanticHeader(
                    title: "Subtle section message with button"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: vSectionMessageSubtleWithButton(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageSubtleWithButton,
                  componentName: 'Subtle_Message',
                  exampleName: 'Subtle_Section_Message_With_Button',
                  copyLabel: "Subtle section message with button",
                ),
                const SemanticHeader(
                    title: "Subtle section message without close link"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: vSectionMessageSubtlePersistent(),
                ),
                smallHeight(),
                const ShowCodeAccordion(
                  codeSegment: CodeSegments.vSectionMessageSubtlePersistent,
                  componentName: 'Subtle_Message',
                  exampleName: 'Subtle_Section_Message_Persistent',
                  copyLabel: "Subtle section message without close link",
                ),
                const Divider(),
              ]),
        )),
      ),
    );
  }

// BEGIN vSectionMessageSuccessPersistent
  Column vSectionMessageSuccessPersistent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      smallHeight(),
      VButton(
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
          child: Text(widget.successMessagePersistentOn
              ? "Hide success section message without close link"
              : "Show success section message without close link"),
          onPressed: () {
            setState(
              () {
                widget.successMessagePersistentOn =
                    !widget.successMessagePersistentOn;
              },
            );
          }),
      smallHeight(),
      VSectionMessage(
        sectionMessageState: SectionMessageState.success,
        description:
            "This is required text that describes the section message in more detail.",
        visible: widget.successMessagePersistentOn,
      ),
    ]);
  }
// END

// BEGIN vSectionMessageErrorPersistent
  Column vSectionMessageErrorPersistent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      VButton(
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
          child: Text(widget.errorMessagePersistentOn
              ? "Hide error section message without close link"
              : "Show error section message without close link"),
          onPressed: () {
            setState(() {
              widget.errorMessagePersistentOn =
                  !widget.errorMessagePersistentOn;
            });
          }),
      smallHeight(),
      VSectionMessage(
        sectionMessageState: SectionMessageState.error,
        description:
            "This is required text that describes the section message in more detail.",
        visible: widget.errorMessagePersistentOn,
      ),
    ]);
  }
// END

// BEGIN vSectionMessageWarningPersistent
  Column vSectionMessageWarningPersistent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      VButton(
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
          child: Text(widget.warningMessagePersistentOn
              ? "Hide warning section message without close link"
              : "Show warning section message without close link"),
          onPressed: () {
            setState(() {
              widget.warningMessagePersistentOn =
                  !widget.warningMessagePersistentOn;
            });
          }),
      smallHeight(),
      VSectionMessage(
        sectionMessageState: SectionMessageState.warning,
        description:
            "This is required text that describes the section message in more detail.",
        visible: widget.warningMessagePersistentOn,
      ),
    ]);
  }
// END

// BEGIN vSectionMessageInfoPersistent
  Column vSectionMessageInfoPersistent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      VButton(
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
          child: Text(widget.infoMessagePersistentOn
              ? "Hide informational section message without close link"
              : "Show informational section message without close link"),
          onPressed: () {
            setState(() {
              widget.infoMessagePersistentOn = !widget.infoMessagePersistentOn;
            });
          }),
      smallHeight(),
      VSectionMessage(
        sectionMessageState: SectionMessageState.informational,
        description:
            "This is required text that describes the section message in more detail.",
        visible: widget.infoMessagePersistentOn,
      ),
    ]);
  }
// END

// BEGIN vSectionMessageSuccessWithButton
  Column vSectionMessageSuccessWithButton() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      VButton(
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
          child: Text(widget.successMessageWithButtonOn
              ? "Hide success section message with button"
              : "Show success section message with button"),
          onPressed: () {
            setState(
              () {
                widget.successMessageWithButtonOn =
                    !widget.successMessageWithButtonOn;
              },
            );
          }),
      smallHeight(),
      VSectionMessage(
        hasClose: true,
        hasAction: true,
        onClosePressed: () {
          setState(() {
            widget.successMessageWithButtonOn =
                !widget.successMessageWithButtonOn;
          });
        },
        sectionMessageState: SectionMessageState.success,
        description:
            "This is required text that describes the section message in more detail.",
        action: "Primary action",
        onActionPressed: () {},
        visible: widget.successMessageWithButtonOn,
      ),
    ]);
  }
// END

// BEGIN vSectionMessageErrorWithButton
  Column vSectionMessageErrorWithButton() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      VButton(
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
          child: Text(widget.errorMessageWithButtonOn
              ? "Hide error section message with button"
              : "Show error section message with button"),
          onPressed: () {
            setState(() {
              widget.errorMessageWithButtonOn =
                  !widget.errorMessageWithButtonOn;
            });
          }),
      smallHeight(),
      VSectionMessage(
        hasAction: true,
        hasClose: true,
        sectionMessageState: SectionMessageState.error,
        title: "Error title",
        description:
            "This is required text that describes the section message in more detail.",
        action: "Primary action",
        onActionPressed: () {},
        visible: widget.errorMessageWithButtonOn,
        onClosePressed: () {
          setState(() {
            widget.errorMessageWithButtonOn = !widget.errorMessageWithButtonOn;
          });
        },
      ),
    ]);
  }
// END

// BEGIN vSectionMessageWarningWithButton
  Column vSectionMessageWarningWithButton() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      VButton(
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
          child: Text(widget.warningMessageWithButtonOn
              ? "Hide warning section message with button"
              : "Show warning section message with button"),
          onPressed: () {
            setState(() {
              widget.warningMessageWithButtonOn =
                  !widget.warningMessageWithButtonOn;
            });
          }),
      smallHeight(),
      VSectionMessage(
        hasAction: true,
        hasClose: true,
        sectionMessageState: SectionMessageState.warning,
        title: "Warning title",
        description:
            "This is required text that describes the section message in more detail.",
        action: "Primary action",
        onActionPressed: () {},
        visible: widget.warningMessageWithButtonOn,
        onClosePressed: () {
          setState(() {
            widget.warningMessageWithButtonOn =
                !widget.warningMessageWithButtonOn;
          });
        },
      ),
    ]);
  }
// END

// BEGIN vSectionMessageInfoWithButton
  Column vSectionMessageInfoWithButton() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      VButton(
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
          child: Text(widget.infoMessageWithButtonOn
              ? "Hide informational section message with button"
              : "Show informational section message with button"),
          onPressed: () {
            setState(() {
              widget.infoMessageWithButtonOn = !widget.infoMessageWithButtonOn;
            });
          }),
      smallHeight(),
      VSectionMessage(
        hasAction: true,
        hasClose: true,
        sectionMessageState: SectionMessageState.informational,
        title: "Informational title",
        description:
            "This is required text that describes the section message in more detail.",
        action: "Primary action",
        onActionPressed: () {},
        visible: widget.infoMessageWithButtonOn,
        onClosePressed: () {
          setState(() {
            widget.infoMessageWithButtonOn = !widget.infoMessageWithButtonOn;
          });
        },
      ),
    ]);
  }
// END

// BEGIN vSectionMessageSuccessWithTitle
  Column vSectionMessageSuccessWithTitle() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      smallHeight(),
      VButton(
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
          child: Text(widget.successMessageWithTitleOn
              ? "Hide success section message with title"
              : "Show success section message with title"),
          onPressed: () {
            setState(
              () {
                widget.successMessageWithTitleOn =
                    !widget.successMessageWithTitleOn;
              },
            );
          }),
      smallHeight(),
      VSectionMessage(
        hasLink: true,
        link: "Close",
        hasTitle: true,
        sectionMessageState: SectionMessageState.success,
        title: "Success title",
        description:
            "This is required text that describes the section message in more detail.",
        onLinkPressed: () {
          setState(() {
            widget.successMessageWithTitleOn =
                !widget.successMessageWithTitleOn;
          });
        },
        visible: widget.successMessageWithTitleOn,
      ),
    ]);
  }
// END

// BEGIN vSectionMessageErrorWithTitle
  Column vSectionMessageErrorWithTitle() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      VButton(
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
          child: Text(widget.errorMessageWithTitleOn
              ? "Hide error section message with title"
              : "Show error section message with title"),
          onPressed: () {
            setState(() {
              widget.errorMessageWithTitleOn = !widget.errorMessageWithTitleOn;
            });
          }),
      smallHeight(),
      VSectionMessage(
        hasLink: true,
        link: "Close",
        hasTitle: true,
        sectionMessageState: SectionMessageState.error,
        title: "Error title",
        description:
            "This is required text that describes the section message in more detail.",
        onLinkPressed: () {
          setState(() {
            widget.errorMessageWithTitleOn = !widget.errorMessageWithTitleOn;
          });
        },
        visible: widget.errorMessageWithTitleOn,
      ),
    ]);
  }
// END

// BEGIN vSectionMessageWarningWithTitle
  Column vSectionMessageWarningWithTitle() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      VButton(
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
          child: Text(widget.warningMessageWithTitleOn
              ? "Hide warning section message with title"
              : "Show warning section message with title"),
          onPressed: () {
            setState(() {
              widget.warningMessageWithTitleOn =
                  !widget.warningMessageWithTitleOn;
            });
          }),
      smallHeight(),
      VSectionMessage(
        hasLink: true,
        link: "Close",
        hasTitle: true,
        sectionMessageState: SectionMessageState.warning,
        title: "Warning title",
        description:
            "This is required text that describes the section message in more detail.",
        onLinkPressed: () {
          setState(() {
            widget.warningMessageWithTitleOn =
                !widget.warningMessageWithTitleOn;
          });
        },
        visible: widget.warningMessageWithTitleOn,
      ),
    ]);
  }
// END

// BEGIN vSectionMessageInfoWithTitle
  Column vSectionMessageInfoWithTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VButton(
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
            child: Text(
              widget.infoMessageWithTitleOn
                  ? "Hide informational section message with title"
                  : "Show informational section message with title",
            ),
            onPressed: () {
              setState(() {
                widget.infoMessageWithTitleOn = !widget.infoMessageWithTitleOn;
              });
            }),
        smallHeight(),
        VSectionMessage(
          hasLink: true,
          link: "Close",
          hasTitle: true,
          sectionMessageState: SectionMessageState.informational,
          title: "Informational title",
          description:
              "This is required text that describes the section message in more detail.",
          onLinkPressed: () {
            setState(() {
              widget.infoMessageWithTitleOn = !widget.infoMessageWithTitleOn;
            });
          },
          visible: widget.infoMessageWithTitleOn,
        ),
      ],
    );
  }
// END

// BEGIN vSectionMessageSuccessDefault
  Column vSectionMessageSuccessDefault() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      smallHeight(),
      VButton(
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
          child: Text(widget.successMessageDefaultOn
              ? "Hide success section message default"
              : "Show success section message default"),
          onPressed: () {
            setState(
              () {
                widget.successMessageDefaultOn =
                    !widget.successMessageDefaultOn;
              },
            );
          }),
      smallHeight(),
      VSectionMessage(
        hasLink: true,
        link: "Close",
        sectionMessageState: SectionMessageState.success,
        title: "Success title",
        description:
            "This is required text that describes the section message in more detail.",
        action: "Primary action",
        onActionPressed: () {},
        visible: widget.successMessageDefaultOn,
        onLinkPressed: () {
          setState(() {
            widget.successMessageDefaultOn = !widget.successMessageDefaultOn;
          });
        },
      ),
    ]);
  }
// END

// BEGIN vSectionMessageErrorDefault
  Column vSectionMessageErrorDefault() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      VButton(
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
          child: Text(widget.errorMessageDefaultOn
              ? "Hide error section message default"
              : "Show error section message default"),
          onPressed: () {
            setState(() {
              widget.errorMessageDefaultOn = !widget.errorMessageDefaultOn;
            });
          }),
      smallHeight(),
      VSectionMessage(
        hasLink: true,
        link: "Close",
        sectionMessageState: SectionMessageState.error,
        title: "Error title",
        description:
            "This is required text that describes the section message in more detail.",
        action: "Primary action",
        onActionPressed: () {},
        visible: widget.errorMessageDefaultOn,
        onLinkPressed: () {
          setState(() {
            widget.errorMessageDefaultOn = !widget.errorMessageDefaultOn;
          });
        },
      ),
    ]);
  }
// END

// BEGIN vSectionMessageWarningDefault
  Column vSectionMessageWarningDefault() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      VButton(
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
          child: Text(widget.warningMessageDefaultOn
              ? "Hide warning section message default"
              : "Show warning section message default"),
          onPressed: () {
            setState(() {
              widget.warningMessageDefaultOn = !widget.warningMessageDefaultOn;
            });
          }),
      smallHeight(),
      VSectionMessage(
        hasLink: true,
        link: "Close",
        sectionMessageState: SectionMessageState.warning,
        title: "Warning title",
        description:
            "This is required text that describes the section message in more detail.",
        action: "Primary action",
        onActionPressed: () {},
        visible: widget.warningMessageDefaultOn,
        onLinkPressed: () {
          setState(() {
            widget.warningMessageDefaultOn = !widget.warningMessageDefaultOn;
          });
        },
      ),
    ]);
  }
// END

// BEGIN vSectionMessageInfoDefault
  Column vSectionMessageInfoDefault() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VButton(
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
            child: Text(
              widget.infoMessageDefaultOn
                  ? "Hide informational section message default"
                  : "Show informational section message default",
            ),
            onPressed: () {
              setState(() {
                widget.infoMessageDefaultOn = !widget.infoMessageDefaultOn;
              });
            }),
        smallHeight(),
        VSectionMessage(
          hasLink: true,
          link: "Close",
          sectionMessageState: SectionMessageState.informational,
          description:
              "This is required text that describes the section message in more detail.",
          action: "Primary action",
          onActionPressed: () {},
          visible: widget.infoMessageDefaultOn,
          onLinkPressed: () {
            setState(() {
              widget.infoMessageDefaultOn = !widget.infoMessageDefaultOn;
            });
          },
        ),
      ],
    );
  }
  // END

  // BEGIN vSectionMessageSubtleDefaults
  Column vSectionMessageSubtleDefaults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VButton(
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
            child: Text(
              widget.subtleMessageDefaultOn
                  ? "Hide subtle section message default"
                  : "Show subtle section message default",
            ),
            onPressed: () {
              setState(() {
                widget.subtleMessageDefaultOn = !widget.subtleMessageDefaultOn;
              });
            }),
        smallHeight(),
        VSectionMessage(
          style: VSectionMessageStyle(
            borderColor: const Color(0xFF000000).withOpacity(0.1),
          ),
          hasLink: true,
          link: "Close",
          sectionMessageState: SectionMessageState.subtle,
          description:
              "This is required text that describes the section message in more detail.",
          visible: widget.subtleMessageDefaultOn,
          onLinkPressed: () {
            setState(() {
              widget.subtleMessageDefaultOn = !widget.subtleMessageDefaultOn;
            });
          },
        ),
      ],
    );
  }
// END

// BEGIN vSectionMessageSubtleWithButton
  Column vSectionMessageSubtleWithButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VButton(
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
            child: Text(
              widget.subtleMessageWithButtonOn
                  ? "Hide subtle section message with button"
                  : "Show subtle section message with button",
            ),
            onPressed: () {
              setState(() {
                widget.subtleMessageWithButtonOn =
                    !widget.subtleMessageWithButtonOn;
              });
            }),
        smallHeight(),
        VSectionMessage(
          style: VSectionMessageStyle(
            borderColor: const Color(0xFF000000).withOpacity(0.1),
          ),
          hasClose: true,
          hasAction: true,
          sectionMessageState: SectionMessageState.subtle,
          description:
              "This is required text that describes the section message in more detail.",
          action: "Primary action",
          onActionPressed: () {},
          onClosePressed: () {
            setState(() {
              widget.subtleMessageWithButtonOn =
                  !widget.subtleMessageWithButtonOn;
            });
          },
          visible: widget.subtleMessageWithButtonOn,
        ),
      ],
    );
  }
// END

// BEGIN vSectionMessageSubtlePersistent
  Column vSectionMessageSubtlePersistent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VButton(
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
            child: Text(
              widget.subtleMessagePersistentOn
                  ? "Hide subtle section message without close link"
                  : "Show subtle section message without close link",
            ),
            onPressed: () {
              setState(() {
                widget.subtleMessagePersistentOn =
                    !widget.subtleMessagePersistentOn;
              });
            }),
        smallHeight(),
        VSectionMessage(
          style: VSectionMessageStyle(
            borderColor: const Color(0xFF000000).withOpacity(0.1),
          ),
          sectionMessageState: SectionMessageState.subtle,
          description:
              "This is required text that describes the section message in more detail.",
          visible: widget.subtleMessagePersistentOn,
        ),
      ],
    );
  }
// END

// BEGIN vSectionMessageSubtleWithTitle
  Column vSectionMessageSubtleWithTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VButton(
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
            child: Text(
              widget.subtleMessageWithTitleOn
                  ? "Hide subtle section message with title"
                  : "Show subtle section message with title",
            ),
            onPressed: () {
              setState(() {
                widget.subtleMessageWithTitleOn =
                    !widget.subtleMessageWithTitleOn;
              });
            }),
        smallHeight(),
        VSectionMessage(
          style: VSectionMessageStyle(
            borderColor: const Color(0xFF000000).withOpacity(0.1),
          ),
          hasLink: true,
          link: "Close",
          hasTitle: true,
          sectionMessageState: SectionMessageState.subtle,
          title: "Subtle title",
          description:
              "This is required text that describes the section message in more detail.",
          onLinkPressed: () {
            setState(() {
              widget.subtleMessageWithTitleOn =
                  !widget.subtleMessageWithTitleOn;
            });
          },
          visible: widget.subtleMessageWithTitleOn,
        ),
      ],
    );
  }
// END
}
