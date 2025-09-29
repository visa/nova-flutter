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
// BEGIN ChatPage

// =============================================================================
// CHAT DEMO APPLICATION
// =============================================================================
/// This file contains the complete chat demo implementation featuring:
/// - Real-time chat interface with typing indicators and message delays
/// - Message status handling (sent, failed, retry functionality)
/// - Long-press interactions with contextual menus
/// - Responsive keyboard handling for different orientations
/// - Error banner management with automatic dismissal
/// - Smooth scrolling and message animations
/// - Welcome screen and chat initiation flow
/// - Side drawer navigation with chat history
/// - Message retry functionality for failed messages

// =============================================================================
// IMPORTS
// =============================================================================
import 'dart:async'; // Timer and async operations
import 'dart:convert'; // JSON parsing for chat data
import 'dart:math'; // Random number generation for delays
import 'package:flutter/material.dart'; // Flutter UI framework
import 'package:flutter/services.dart'; // Asset loading and system services
import 'package:visa_nova_flutter/visa_nova_flutter.dart'; // Visa Nova UI components
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart'; // Visa Nova icons
import 'package:intl/intl.dart'; // Date formatting utilities

// =============================================================================
// CHAT ADD BUTTON WIDGET
// =============================================================================
/// A circular attachment button that opens a bottom sheet with file/media options.
///
/// Features:
/// - Circular design with "+" icon
/// - Modal bottom sheet with list of attachment options
/// - Accepts dynamic list of panel items and their corresponding icons
/// - Positioned in the chat input area for easy access
///
/// Used for: Adding files, photos, documents, etc. to the chat
class ChatAddButton extends StatelessWidget {
  const ChatAddButton({
    super.key,
    required this.panelItems, // List of attachment option labels
    required this.panelIconItems, // List of corresponding icon names
  });

  final List<String> panelItems; // Text labels for each attachment option
  final List<String> panelIconItems; // Icon names for each attachment option

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Semantics(
        label: "Add attachment",
        button: true,
        child: InkWell(
          onTap: () {
            // =============================================================
            // SHOW ATTACHMENT OPTIONS BOTTOM SHEET
            // =============================================================
            showModalBottomSheet(
              useSafeArea: true,
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: false,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: VPanel(
                    isFullScreen: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        panelItems.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: VListItem(
                            child: Row(
                              children: [
                                // Icon for the attachment option
                                VIcon(
                                  svgIcon: panelIconItems[index],
                                  iconColor: VColors.defaultActiveSubtle,
                                  iconHeight: 24,
                                  iconWidth: 24,
                                ),
                                const SizedBox(width: 10),
                                // Label for the attachment option
                                Text(
                                  panelItems[index],
                                  style: defaultVTheme.textStyles.uiLabelLarge,
                                ),
                              ],
                            ),
                            onTap: () =>
                                Navigator.pop(context), // Close bottom sheet
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: SizedBox(
            height: 48,
            width: 48,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ExcludeSemantics(
                child: VIcon(
                  svgIcon: VIcons.addLow,
                  iconColor: VColors.defaultActiveSubtle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// CHAT DRAWER WIDGET
// =============================================================================
/// Side navigation drawer for chat navigation and management.
///
/// Features:
/// - Application title and branding
/// - Search input for finding chats
/// - Pinned chats section with pin icons
/// - Date-organized chat history (e.g., "2 DAYS AGO")
/// - "Start new chat" button that resets the entire chat state
/// - Responsive layout with proper spacing and dividers
///
/// Layout Structure:
/// 1. Header with title and search
/// 2. Pinned chats section
/// 3. Scrollable recent chats organized by date
/// 4. Bottom action button for new chat
class ChatDrawer extends StatelessWidget {
  const ChatDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: VColors.defaultSurface1,
        child: Padding(
          padding: const EdgeInsets.only(top: 53, bottom: 32),
          child: Column(
            children: [
              // =============================================================
              // DRAWER HEADER SECTION
              // =============================================================
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header row with title and close button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Application title
                            Expanded(
                              child: Text(
                                "Application name",
                                textAlign: TextAlign.left,
                                style:
                                    defaultVTheme.textStyles.subtitle1.copyWith(
                                  color: VColors.defaultAccent,
                                ),
                              ),
                            ),
                            // Close button for accessibility
                            Semantics(
                              label: "Close navigation menu",
                              button: true,
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                splashColor: VColors.defaultSurfaceLowlight,
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  padding: const EdgeInsets.all(12),
                                  child: ExcludeSemantics(
                                    child: VIcon(
                                      iconColor: VColors.defaultActiveSubtle,
                                      svgIcon: VIcons.closeTiny,
                                      iconHeight: 24,
                                      iconWidth: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        // Search input field
                        VInput(
                          inputAction: TextInputAction.search,
                          expand: true,
                          flexHeight: true,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          hintText: "Search",
                          prefix: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: VIcon(
                              svgIcon: VIcons.searchLow,
                              iconHeight: 24,
                              iconWidth: 24,
                              iconColor: VColors.defaultAccent,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const VDivider(dividerType: VDividerType.decorative),
                ],
              ),

              // =============================================================
              // SCROLLABLE CHAT LIST SECTION
              // =============================================================
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus(); // Dismiss keyboard
                  },
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    shrinkWrap: true,
                    children: [
                      // Pinned chats section header
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text("PINNED CHATS",
                            textAlign: TextAlign.left,
                            style: defaultVTheme.textStyles.overline),
                      ),
                      const SizedBox(height: 11),

                      // Pinned chat item with pin icon
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: VListItem(
                          child: Row(
                            children: [
                              const VIcon(
                                svgIcon: VIcons.pinFillTiny,
                                iconColor: VColors.defaultAccent,
                                iconHeight: 20,
                                iconWidth: 20,
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  "Label 1",
                                  textAlign: TextAlign.left,
                                  style: defaultVTheme.textStyles.uiLabelLarge
                                      .copyWith(
                                    color: VColors.defaultTextSubtle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: () =>
                              {}, // TODO: Implement pinned chat navigation
                        ),
                      ),
                      const SizedBox(height: 11),

                      // Recent chats section header with date
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Text("2 DAYS AGO",
                            textAlign: TextAlign.left,
                            style: defaultVTheme.textStyles.overline),
                      ),
                      const SizedBox(height: 11),

                      // Recent chat items
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: VListItem(
                          child: Text(
                            "Label 2",
                            textAlign: TextAlign.left,
                            style:
                                defaultVTheme.textStyles.uiLabelLarge.copyWith(
                              color: VColors.defaultTextSubtle,
                            ),
                          ),
                          onTap: () =>
                              {}, // TODO: Implement recent chat navigation
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: VListItem(
                          child: Text(
                            "Label 3",
                            textAlign: TextAlign.left,
                            style:
                                defaultVTheme.textStyles.uiLabelLarge.copyWith(
                              color: VColors.defaultTextSubtle,
                            ),
                          ),
                          onTap: () =>
                              {}, // TODO: Implement recent chat navigation
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // =============================================================
              // DRAWER FOOTER SECTION
              // =============================================================
              const VDivider(dividerType: VDividerType.decorative),
              const SizedBox(height: 11),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: VButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const VIcon(
                          svgIcon: VIcons.addTiny,
                          iconColor: VColors.defaultAccent,
                          iconHeight: 20,
                          iconWidth: 20,
                        ),
                        const SizedBox(width: 8),
                        // Button text
                        Text(
                          "Start new chat",
                          style: defaultVTheme.textStyles.buttonMedium.copyWith(
                            color: VColors.defaultActive,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      // =================================================
                      // NEW CHAT BUTTON ACTION
                      // =================================================
                      // Close drawer and reset entire chat state to welcome screen
                      Navigator.of(context).pop();
                      final chatFrameState =
                          context.findAncestorStateOfType<_ChatFrameState>();
                      if (chatFrameState != null) {
                        chatFrameState
                            ._resetChatState(); // Clears all messages, error banners, etc.
                      }
                    },
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
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

// =============================================================================
// CHAT DROPDOWN WIDGET
// =============================================================================
/// App bar dropdown menu providing chat-level actions.
///
/// Features:
/// - Exit chat demo option (returns to main demo menu)
/// - Can be extended with additional chat management options
/// - Positioned in the app bar trailing section
/// - Uses standard VDropdown component for consistency
///
/// Usage: Accessed via the three-dot menu in the chat app bar
class ChatDropDown extends StatelessWidget {
  ChatDropDown({
    Key? key,
    required this.scaffoldKey2, // Reference to scaffold for state management
  }) : super(key: key);

  // Menu item labels for dropdown options
  final List<String> iconPopUpMenuItems = [
    "Exit chat demo",
    "Label 1", // TODO: Implement additional features
    "Label 2", // TODO: Implement additional features
    "Label 3", // TODO: Implement additional features
  ];

  // Corresponding icons for each menu item
  final List<dynamic> iconItems = [
    VIcons.fileDownloadTiny, // Exit (rotated 270 degrees)
    VIcons.pinOutlineTiny, // Pin/unpin functionality
    VIcons.addAltTiny, // Add to favorites
    VIcons.deleteTiny // Delete chat (red colored)
  ];

  final GlobalKey<ScaffoldState> scaffoldKey2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Semantics(
            label: "Chat options menu",
            button: true,
            child: VDropdownIcon(
              // =============================================================
              // DROPDOWN MENU ITEMS BUILDER
              // =============================================================
              itemBuilder: (BuildContext context) {
                return List<PopupMenuEntry<String>>.generate(
                    iconPopUpMenuItems.length, (index) {
                  return PopupMenuItem<String>(
                    value: iconPopUpMenuItems[index],
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon with special rotation for exit option
                        RotatedBox(
                          quarterTurns: index == 0
                              ? 3
                              : 0, // Rotate exit icon 270 degrees
                          child: VIcon(
                            svgIcon: iconItems[index],
                            iconColor: index + 1 == iconItems.length
                                ? VColors
                                    .negativeGraphics // Red for delete option
                                : VColors.defaultActiveSubtle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Menu item text
                        Text(
                          iconPopUpMenuItems[index],
                          style: TextStyle(
                            color: index + 1 == iconItems.length
                                ? VColors
                                    .negativeText // Red text for delete option
                                : VColors.alternateSurface3Dark,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList();
              },
              // =============================================================
              // DROPDOWN SELECTION HANDLER
              // =============================================================
              onSelected: (_) {
                // Handle menu item selection
                if (_ == "Exit chat demo") {
                  Navigator.pop(context); // Return to main demo menu
                }
                // TODO: Implement other menu actions (pin, favorite, delete)
              },
              // =============================================================
              // DROPDOWN BUTTON ICON
              // =============================================================
              icons: const ExcludeSemantics(
                child: VIcon(
                  svgIcon: VIcons.optionHorizontalLow, // Three horizontal dots
                  iconHeight: 24,
                  iconWidth: 24,
                  iconColor: VColors.defaultActive,
                ),
              ),
              // =============================================================
              // DROPDOWN STYLING
              // =============================================================
              style: VDropdownIconStyle(
                buttonDefaultColor: VColors.alternateAccent,
                tappedButtonColor: VColors.defaultSurfaceHighlight,
                defaultBorderColor: Colors.transparent,
                defaultIconSize: 48.0, // Ensure 48x48 touch target for VGAR
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// CHAT APP BAR WIDGET
// =============================================================================
/// Top navigation app bar for the chat interface.
///
/// Features:
/// - Hamburger menu button (opens side drawer)
/// - Chat name/title display
/// - Dropdown menu with chat management options
/// - Accessibility support with semantic labels
/// - Standard app bar height and styling
///
/// Layout: [Menu Button] [Chat Name] [Dropdown Menu]
class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const ChatAppBar({
    super.key,
    required this.widget, // Reference to parent ChatFrame widget
  });

  final ChatFrame widget;

  @override
  Widget build(BuildContext context) {
    return VAppBar(
      title: const Text("Chat name"), // TODO: Make dynamic based on actual chat

      // =============================================================
      // HAMBURGER MENU BUTTON (Left side)
      // =============================================================
      leading: Semantics(
        label: "Menu", // Accessibility label
        button: true,
        child: InkWell(
          customBorder: const CircleBorder(),
          splashColor: VColors.defaultSurfaceLowlight,
          child: Container(
            width: 48,
            height: 48,
            padding: const EdgeInsets.all(12),
            child: const ExcludeSemantics(
              child: VIcon(
                iconColor: VColors.defaultActive,
                svgIcon: VIcons.menuLow,
                iconHeight: 24,
                iconWidth: 24,
              ),
            ),
          ),
          onTap: () {
            // =================================================
            // OPEN NAVIGATION DRAWER
            // =================================================
            widget.scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),

      // =============================================================
      // APP BAR ACTIONS (Right side)
      // =============================================================
      actionList: [
        ChatDropDown(
          scaffoldKey2: widget
              .scaffoldKey, // Pass scaffold reference for state management
        ),
      ],
    );
  }
}

// =============================================================================
// USER CHAT INPUT FIELD WIDGET
// =============================================================================
// USER CHAT INPUT FIELD WIDGET
// =============================================================================
/// Bottom input area for typing and sending messages.
///
/// Features:
/// - Add button (for attachments) on the left
/// - Expandable text input field in the center
/// - Send button on the right (color changes based on input state)
/// - Responsive layout for portrait/landscape orientations
/// - Smart keyboard focus management
/// - Orientation-aware tap outside handling to prevent keyboard conflicts
/// - Automatic padding adjustment for different screen orientations
///
/// Behavior:
/// - Portrait: Simple and responsive keyboard handling
/// - Landscape: Complex handling to prevent input method conflicts
/// - Send button becomes active when there's text to send
class UserChatField extends StatefulWidget {
  const UserChatField({
    super.key,
    this.onTap, // Callback when send button is pressed
  });

  final void Function()? onTap; // Function to trigger chat initiation

  @override
  State<UserChatField> createState() => _UserChatFieldState();
}

class _UserChatFieldState extends State<UserChatField> {
  // Controllers for text input and focus management
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  // Mock data for attachment options panel
  final List<String> panelItems = [
    "Label 1", // TODO: Replace with actual attachment types
    "Label 2",
    "Label 3",
    "Label 4",
  ];

  // Icons corresponding to attachment options
  final List<String> panelIconItems = [
    VIcons.attachmentTiny, // File attachment
    VIcons.addLow, // Photo (placeholder - icon not in current set)
    VIcons.cameraTiny, // Camera
    VIcons.microphoneTiny, // Voice recording
  ];

  @override
  void dispose() {
    // Clean up controllers to prevent memory leaks
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // =============================================================
    // RESPONSIVE LAYOUT DETECTION
    // =============================================================
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      color: VColors.defaultSurface1,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: isLandscape ? 10 : 20, // Reduce padding in landscape mode
          top: 10,
        ),
        child: Row(
          children: [
            // =================================================
            // ADD ATTACHMENT BUTTON (Left)
            // =================================================
            ChatAddButton(
              panelItems: panelItems,
              panelIconItems: panelIconItems,
            ),

            // =================================================
            // TEXT INPUT FIELD (Center - Expandable)
            // =================================================
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // ==============================================
                  // ENSURE PROPER FOCUS MANAGEMENT
                  // ==============================================
                  if (!_focusNode.hasFocus) {
                    _focusNode.requestFocus();
                  }
                },
                child: VInput(
                  myLocalController: _controller,
                  inputAction: TextInputAction.newline,
                  hintText: "Start typing…",
                  hintTextStyle: defaultVTheme.textStyles.bodyText2.copyWith(
                    color: VColors.defaultTextSubtle,
                  ),
                  expand: true, // Allow input to expand
                  flexHeight: true, // Allow flexible height
                  onTapOutside: (event) {
                    // ===========================================
                    // ORIENTATION-AWARE KEYBOARD HANDLING
                    // ===========================================
                    final isLandscape = MediaQuery.of(context).orientation ==
                        Orientation.landscape;

                    if (isLandscape) {
                      // Complex handling for landscape mode to prevent input method conflicts
                      final RenderBox? renderBox =
                          context.findRenderObject() as RenderBox?;
                      if (renderBox != null) {
                        final Offset localPosition =
                            renderBox.globalToLocal(event.position);
                        final bool isOutsideInput = localPosition.dy < 0 ||
                            localPosition.dy > renderBox.size.height;

                        if (isOutsideInput && !_focusNode.hasFocus) {
                          // Add delay to prevent conflicts with keyboard language switching
                          Future.delayed(const Duration(milliseconds: 150), () {
                            if (mounted && !_focusNode.hasFocus) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            }
                          });
                        }
                      }
                    } else {
                      // Simple and responsive handling for portrait mode
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                ),
              ),
            ),

            // =================================================
            // SEND BUTTON (Right)
            // =================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Semantics(
                label: "Send message",
                button: true,
                child: InkWell(
                  onTap: widget.onTap, // Trigger chat initiation callback
                  child: SizedBox(
                    height: 48,
                    width: 48,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ExcludeSemantics(
                        child: VIcon(
                          svgIcon: VIcons.sendLow,
                          // ===========================================
                          // DYNAMIC SEND BUTTON COLOR
                          // ===========================================
                          iconColor: (_controller.text.trim().isEmpty ||
                                  (context
                                          .findAncestorStateOfType<
                                              _ChatFrameState>()
                                          ?.hideWelcomeScreen ??
                                      false))
                              ? VColors.defaultActiveSubtle // Disabled state
                              : VColors.defaultActive, // Active state
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// MAIN CHAT FRAME WIDGET
// =============================================================================
/// Core chat interface containing the entire chat experience.
///
/// This is the main stateful widget that manages:
/// - Chat session data and message display
/// - Welcome screen toggle and chat initiation
/// - Error banner management and automatic dismissal
/// - Message timing, delays, and animations
/// - Keyboard handling for different orientations
/// - Long-press interactions and context menus
/// - Message status handling (sent, failed, retry)
/// - Scroll control and auto-scrolling to latest messages
///
/// State Management:
/// - Loads chat data from JSON assets
/// - Manages displayed messages with realistic timing
/// - Handles typing indicators and loading states
/// - Tracks focused messages for interactions
/// - Maintains error states and recovery
class ChatFrame extends StatefulWidget {
  const ChatFrame({
    super.key,
    required this.scaffoldKey, // Scaffold key for drawer access
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<ChatFrame> createState() => _ChatFrameState();
}

class _ChatFrameState extends State<ChatFrame> with WidgetsBindingObserver {
  // =============================================================
  // CORE CHAT DATA STATE
  // =============================================================
  List<dynamic> chatSession = []; // Full chat data from JSON
  List<Map<String, dynamic>> displayedMessages =
      []; // Currently visible messages

  // =============================================================
  // UI STATE FLAGS
  // =============================================================
  bool hideWelcomeScreen = false; // Controls welcome screen visibility
  bool isDataLoaded = false; // Whether JSON chat data is loaded
  bool showPressDownMenu = false; // Legacy - can be removed
  bool showLoadingIndicator = true; // Shows loading at end of chat
  bool showSpinner = false; // Shows spinner after loading
  bool showErrorBanner = false; // Controls error banner visibility

  // =============================================================
  // CONTROLLERS AND TIMERS
  // =============================================================
  final scrollController = ScrollController(); // Controls chat list scrolling
  Timer? _messageTimer; // Controls message display timing
  Timer? _typingIndicatorTimer; // Controls typing indicator timing
  Timer? _spinnerTimer; // Controls spinner timing

  // =============================================================
  // KEYBOARD HANDLING STATE
  // =============================================================
  bool _isKeyboardVisible = false; // Tracks keyboard visibility
  Timer? _keyboardDebounceTimer; // Debounces keyboard toggle events

  // =============================================================
  // MESSAGE INTERACTION STATE
  // =============================================================
  Map<String, dynamic>? _focusedMessage; // Currently highlighted message

  // =============================================================
  // DYNAMIC MENU SYSTEM
  // =============================================================
  /// Generates context menu options based on message state.
  /// Failed messages get "Retry" option, all messages get "Copy".
  List<String> _getMenuOptions(Map<String, dynamic> message) {
    List<String> options = [];
    if (message['status'] == 'failed') {
      options.add("Resend message"); // Only for failed messages
    }
    options.add("Copy text"); // Available for all messages
    return options;
  }

  /// Generates corresponding icons for context menu options.
  List<String> _getMenuIcons(Map<String, dynamic> message) {
    List<String> icons = [];
    if (message['status'] == 'failed') {
      icons.add(VIcons.reloadTiny); // Retry icon for failed messages
    }
    icons.add(VIcons.copyTiny); // Copy icon for all messages
    return icons;
  }

  // =============================================================
  // WIDGET LIFECYCLE METHODS
  // =============================================================
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Listen to system events
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _handleKeyboardChange(); // React to keyboard visibility changes
  }

  // =============================================================
  // KEYBOARD HANDLING LOGIC
  // =============================================================
  /// Handles keyboard visibility changes with orientation-specific debouncing.
  /// - Portrait: Quick response (100ms debounce)
  /// - Landscape: Slower response (250ms debounce) to prevent rapid toggling
  void _handleKeyboardChange() {
    final mediaQuery = MediaQuery.of(context);
    final bottomInset = mediaQuery.viewInsets.bottom;
    final newKeyboardVisible = bottomInset > 0;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    // Use orientation-specific debounce delays
    final debounceDelay = isLandscape
        ? const Duration(
            milliseconds: 250) // Longer delay for landscape stability
        : const Duration(
            milliseconds: 100); // Shorter delay for portrait responsiveness

    _keyboardDebounceTimer?.cancel();
    _keyboardDebounceTimer = Timer(debounceDelay, () {
      if (mounted) {
        setState(() {
          _isKeyboardVisible = newKeyboardVisible;
        });

        // Auto-scroll when keyboard appears with orientation-specific timing
        if (_isKeyboardVisible && displayedMessages.isNotEmpty) {
          final scrollDelay = isLandscape
              ? const Duration(milliseconds: 500) // Longer delay for landscape
              : const Duration(milliseconds: 200); // Shorter delay for portrait

          Future.delayed(scrollDelay, () {
            if (mounted) {
              _scrollToBottom();
            }
          });
        }
      }
    });
  }

  // =============================================================
  // CHAT STATE MANAGEMENT
  // =============================================================
  /// Resets all chat state to initial welcome screen state.
  /// Called when starting a new chat from the drawer.
  ///
  /// Clears:
  /// - All messages and chat data
  /// - Error banners and focus states
  /// - Loading and interaction states
  /// - Returns to welcome screen
  void _resetChatState() {
    setState(() {
      chatSession.clear(); // Clear loaded chat data
      displayedMessages.clear(); // Clear visible messages
      hideWelcomeScreen = false; // Show welcome screen
      isDataLoaded = false; // Reset data loading flag
      showPressDownMenu = false; // Reset menu state
      showLoadingIndicator = true; // Reset loading state
      showSpinner = false; // Reset spinner state
      showErrorBanner = false; // Clear error banner
      _focusedMessage = null; // Clear focused message
    });
  }

  // =============================================================
  // CHAT DATA LOADING
  // =============================================================
  /// Loads chat session data from JSON asset file.
  /// Only loads once to prevent duplicate loading.
  Future<void> loadChatData() async {
    if (isDataLoaded) return; // Prevent duplicate loading

    // Load chat data from JSON asset
    final String response =
        await rootBundle.loadString('assets/chat/chat1.json');
    final data = json.decode(response);

    setState(() {
      chatSession = List<Map<String, dynamic>>.from(data['chatSession']);
      isDataLoaded = true;
    });

    // Start displaying messages if welcome screen is already hidden
    if (hideWelcomeScreen) {
      displayMessagesWithDelay();
    }
  }

  // =============================================================
  // MESSAGE DISPLAY WITH REALISTIC TIMING
  // =============================================================
  /// Displays chat messages with realistic delays and animations.
  ///
  /// Features:
  /// - Random delays (1-3 seconds) between messages
  /// - Loading indicators and typing animations
  /// - Error message handling with extended delays
  /// - Automatic error banner triggering
  /// - Sequential message processing
  Future<void> displayMessagesWithDelay() async {
    for (int i = 0; i < chatSession.length; i++) {
      final message = chatSession[i];
      final delayBeforeShow = Duration(seconds: Random().nextInt(3) + 1);
      final completer = Completer<void>();

      _messageTimer = Timer(delayBeforeShow, () async {
        // =======================================================
        // HANDLE LOADER MESSAGES
        // =======================================================
        if (message['showLoader'] == true) {
          // Show initial loading spinner
          setState(() {
            displayedMessages.add({
              'showLoader': true,
              'username': message['username'],
            });
          });
          _scrollToBottom();

          await Future.delayed(const Duration(seconds: 3));

          // =======================================================
          // TRANSITION TO TYPING INDICATOR
          // =======================================================
          if (i + 1 < chatSession.length &&
              chatSession[i + 1]['isTyping'] == true) {
            setState(() {
              displayedMessages.removeLast(); // Remove loader
              displayedMessages.add({
                'isTyping': true,
                'username': message['username'],
              });
            });
            _scrollToBottom();
          }

          await Future.delayed(const Duration(seconds: 3));

          // =======================================================
          // SHOW ACTUAL MESSAGE
          // =======================================================
          if (i + 2 < chatSession.length) {
            final actualMessage = chatSession[i + 2];
            setState(() {
              displayedMessages.removeLast(); // Remove typing indicator
              displayedMessages.add(actualMessage);

              // Trigger error banner for failed messages
              if (actualMessage['status'] == 'failed' && !showErrorBanner) {
                showErrorBanner = true;
              }
            });
            _scrollToBottom();
          }

          i += 2; // Skip the loader and typing entries
        }
        // =======================================================
        // HANDLE REGULAR MESSAGES
        // =======================================================
        else if (!message['isTyping']) {
          setState(() {
            displayedMessages.add(message);

            // Trigger error banner for failed messages
            if (message['status'] == 'failed' && !showErrorBanner) {
              showErrorBanner = true;
            }
          });
          _scrollToBottom();

          // =======================================================
          // SPECIAL TIMING FOR DEMO MESSAGES
          // =======================================================
          final messageText = message['message'] ?? '';

          // Extended delay after preview message for user comprehension
          if (messageText.contains("Of course, I'll now show a preview")) {
            await Future.delayed(const Duration(seconds: 2));
          }

          // Extended delay after failed messages for error processing
          if (message['status'] == 'failed') {
            await Future.delayed(const Duration(seconds: 3));
          }
        }

        completer.complete();
      });

      await completer.future;
    }

    // =============================================================
    // START END-OF-CHAT SEQUENCE
    // =============================================================
    if (chatSession.length == displayedMessages.length) {
      checkAndStartTimer(); // Start loading indicator sequence
    }
  }

  // =============================================================
  // SCROLLING UTILITIES
  // =============================================================
  /// Scrolls chat list to bottom with orientation-aware timing.
  /// - Portrait: Quick scroll (100ms delay)
  /// - Landscape: Stable scroll (400ms delay)
  void _scrollToBottom() {
    if (scrollController.hasClients) {
      final isLandscape =
          MediaQuery.of(context).orientation == Orientation.landscape;

      // Use orientation-specific delays for smooth scrolling
      final delay = isLandscape
          ? const Duration(
              milliseconds: 400) // Longer delay for landscape stability
          : const Duration(
              milliseconds: 100); // Shorter delay for portrait responsiveness

      Future.delayed(delay, () {
        if (mounted && scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  // =============================================================
  // END-OF-CHAT SEQUENCE
  // =============================================================
  /// Starts the end-of-chat loading sequence.
  /// Shows loading indicator for 5 seconds, then spinner for 5 seconds.
  void checkAndStartTimer() {
    _typingIndicatorTimer = Timer(const Duration(seconds: 5), () {
      setState(() {
        showLoadingIndicator = false;
        showSpinner = true;
      });

      _spinnerTimer = Timer(const Duration(seconds: 5), () {
        setState(() {
          showSpinner = false; // Hide spinner after demo sequence
        });
      });
    });
  }

  // =============================================================
  // UTILITY METHODS
  // =============================================================
  /// Formats datetime string to display format (e.g., "2:45pm").
  String formatDateTime(String dateTimeStr) {
    DateTime dateTime = DateTime.parse(dateTimeStr);
    return DateFormat('hh:mma').format(dateTime);
  }

  // =============================================================
  // CLEANUP AND DISPOSAL
  // =============================================================
  @override
  void dispose() {
    WidgetsBinding.instance
        .removeObserver(this); // Stop listening to system events
    _cancelTimer(); // Cancel all running timers
    _keyboardDebounceTimer?.cancel(); // Cancel keyboard debounce timer
    super.dispose();
  }

  /// Cancels all message-related timers to prevent memory leaks.
  void _cancelTimer() {
    if (_messageTimer != null) {
      _messageTimer!.cancel();
      _messageTimer = null;
    }
    if (_typingIndicatorTimer != null) {
      _typingIndicatorTimer!.cancel();
      _typingIndicatorTimer = null;
    }
    if (_spinnerTimer != null) {
      _spinnerTimer!.cancel();
      _spinnerTimer = null;
    }
  }

  // =============================================================
  // MAIN BUILD METHOD - CHAT INTERFACE
  // =============================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      resizeToAvoidBottomInset:
          true, // Always enable for proper keyboard handling
      drawer: const ChatDrawer(), // Side navigation drawer
      appBar: ChatAppBar(widget: widget), // Top app bar with menu and actions
      backgroundColor: VColors.defaultSurface1,
      body: SafeArea(
        child: Column(
          children: [
            // =======================================================
            // ERROR BANNER (Top)
            // =======================================================
            VBanner(
              bannerState: BannerState.error,
              description:
                  "Unable to establish a connection. Wait a few minutes and try again.",
              hasLink: true,
              link: "Close",
              onLinkPressed: () {
                setState(() {
                  showErrorBanner = false; // Manually dismiss error banner
                });
              },
              visible: showErrorBanner, // Show/hide based on error state
            ),

            // =======================================================
            // MAIN CONTENT AREA (Center - Expandable)
            // =======================================================
            Expanded(
              child: !hideWelcomeScreen
                  ? WelcomeChatScreen() // Show welcome screen initially
                  : GestureDetector(
                      onTap: () {
                        // ===========================================
                        // ORIENTATION-AWARE FOCUS HANDLING
                        // ===========================================
                        final isLandscape =
                            MediaQuery.of(context).orientation ==
                                Orientation.landscape;
                        final currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus &&
                            currentFocus.focusedChild != null) {
                          if (isLandscape) {
                            // Delayed unfocus in landscape to prevent input method conflicts
                            Timer(const Duration(milliseconds: 150), () {
                              if (mounted) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                            });
                          } else {
                            // Immediate unfocus in portrait for better responsiveness
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        }

                        // Dismiss any open menus
                        if (showPressDownMenu) {
                          setState(() {
                            showPressDownMenu = false;
                          });
                        }
                      },

                      // ===========================================
                      // CHAT MESSAGES LIST
                      // ===========================================
                      child: ListView.separated(
                        padding: const EdgeInsets.only(top: 8.0),
                        shrinkWrap: true,
                        reverse: false,
                        controller: scrollController,
                        itemCount: displayedMessages.length,
                        separatorBuilder: (context, index) {
                          var current = displayedMessages[index];
                          var next = displayedMessages[index + 1];

                          // If same user as the next message make it no gap
                          if (current['username'] == next['username']) {
                            return const SizedBox.shrink();
                          }

                          // Different user, use normal gap
                          return const SizedBox(height: 30);
                        },
                        itemBuilder: (context, index) {
                          var message = displayedMessages[index];
                          // For 2 or more message only show header of the first one
                          bool _shouldShowHeader(int index) {
                            if (index == 0) {
                              return true; // always show for first message
                            }
                            var current = displayedMessages[index];
                            var previous = displayedMessages[index - 1];
                            return current['username'] != previous['username'];
                          }

                          // Show progress
                          if (message['showLoader'] == true) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: SizedBox(
                                  height: 48,
                                  width: 48,
                                  child: VProgressCircular(),
                                ),
                              ),
                            );
                          }
                          // Typing indicator
                          if (message['isTyping'] == true) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const VIconAsset(
                                    svgIcon: "assets/icons/chat_ai.svg",
                                    iconHeight: 38,
                                    iconWidth: 38,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "${message['username']} is typing...",
                                    style: defaultVTheme.textStyles.uiLabelSmall
                                        .copyWith(
                                      // fontStyle: FontStyle.italic,
                                      color: VColors.defaultTextSubtle,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          // Extract variables
                          String username = message['username'] ?? "";
                          String msgText = message['message'] ?? "";
                          String timeText = message['isTyping'] == true
                              ? "typing..."
                              : (message['time'] != null
                                  ? formatDateTime(message['time'])
                                      .toLowerCase()
                                  : "");
                          bool showHeader = _shouldShowHeader(index);

                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    (message["username"] == "User 1" ||
                                            !showHeader)
                                        ? const SizedBox(width: 38)
                                        : const Padding(
                                            padding: EdgeInsets.only(top: 21),
                                            child: VIconAsset(
                                              svgIcon:
                                                  "assets/icons/chat_ai.svg",
                                              iconHeight: 38,
                                              iconWidth: 38,
                                            ),
                                          ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: ChatBubble(
                                        message: message,
                                        showPressDownMenu: showPressDownMenu,
                                        chatSession: chatSession,
                                        time: showHeader ? timeText : "",
                                        username: showHeader ? username : "",
                                        messageText: msgText,
                                        isFocused: _focusedMessage == message,
                                        bubbleAlignment:
                                            message["username"] != "User 1"
                                                ? CrossAxisAlignment.start
                                                : CrossAxisAlignment.end,
                                        usernameAlignment:
                                            message["username"] != "User 1"
                                                ? MainAxisAlignment.start
                                                : MainAxisAlignment.end,
                                        bubbleColor: message["username"] !=
                                                "User 1"
                                            ? VColors.defaultSurfaceHighlight
                                            : VColors.defaultSurface3,
                                        bubbleBorderRadius:
                                            BorderRadius.circular(10),
                                        usernamePositionCrossAxisAlignment:
                                            message["username"] != "User 1"
                                                ? CrossAxisAlignment.start
                                                : CrossAxisAlignment.end,
                                        bubbleBorder: Border.all(
                                          color: _focusedMessage == message
                                              ? VColors.defaultActive
                                              : (message["username"] !=
                                                          "User 1" &&
                                                      showPressDownMenu &&
                                                      index + 1 ==
                                                          chatSession.length
                                                  ? VColors.defaultActive
                                                  : VColors.defaultSurface3),
                                          width: 1,
                                        ),
                                        onLongPress: () {
                                          setState(() {
                                            _focusedMessage = message;
                                          });

                                          // Scroll to bring the focused message into better view
                                          if (scrollController.hasClients) {
                                            // Calculate approximate position based on message index
                                            // Each message is roughly 80-120px depending on content
                                            final approximatePosition =
                                                index * 100.0;
                                            final maxScroll = scrollController
                                                .position.maxScrollExtent;
                                            final targetPosition =
                                                (approximatePosition <
                                                        maxScroll)
                                                    ? approximatePosition
                                                    : maxScroll *
                                                        0.8; // Don't scroll past reasonable bounds

                                            scrollController.animateTo(
                                              targetPosition,
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.easeInOut,
                                            );
                                          }

                                          showModalBottomSheet(
                                            useSafeArea: true,
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (BuildContext
                                                bottomSheetContext) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SingleChildScrollView(
                                                    child: VPanel(
                                                      isFullScreen: false,
                                                      child: ListView(
                                                        shrinkWrap: true,
                                                        children: List.generate(
                                                          _getMenuOptions(
                                                                  message)
                                                              .length,
                                                          (i) {
                                                            final menuOptions =
                                                                _getMenuOptions(
                                                                    message);
                                                            final menuIcons =
                                                                _getMenuIcons(
                                                                    message);

                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          8.0),
                                                              child: VListItem(
                                                                child: Row(
                                                                  children: [
                                                                    VIcon(
                                                                      svgIcon:
                                                                          menuIcons[
                                                                              i],
                                                                      iconColor:
                                                                          VColors
                                                                              .defaultActiveSubtle,
                                                                      iconHeight:
                                                                          24,
                                                                      iconWidth:
                                                                          24,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            10),
                                                                    Text(
                                                                      menuOptions[
                                                                          i],
                                                                      style: defaultVTheme
                                                                          .textStyles
                                                                          .uiLabelLarge,
                                                                    ),
                                                                  ],
                                                                ),
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      bottomSheetContext);

                                                                  if (menuOptions[
                                                                          i] ==
                                                                      "Copy text") {
                                                                    Clipboard
                                                                        .setData(
                                                                      ClipboardData(
                                                                          text:
                                                                              message['message']),
                                                                    ).then((_) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        const SnackBar(
                                                                          content:
                                                                              Text("Text copied to clipboard"),
                                                                        ),
                                                                      );
                                                                    });
                                                                  } else if (menuOptions[
                                                                          i] ==
                                                                      "Resend message") {
                                                                    // Handle resend
                                                                    setState(
                                                                        () {
                                                                      // Find the message in displayedMessages and update its status
                                                                      final messageIndex =
                                                                          displayedMessages
                                                                              .indexOf(message);
                                                                      if (messageIndex !=
                                                                          -1) {
                                                                        displayedMessages[messageIndex]['status'] =
                                                                            'sent';
                                                                      }
                                                                      // Close the error banner
                                                                      showErrorBanner =
                                                                          false;
                                                                    });

                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      const SnackBar(
                                                                        content:
                                                                            Text("Message sent successfully"),
                                                                      ),
                                                                    );
                                                                  }

                                                                  // Clear focus after action
                                                                  setState(() {
                                                                    _focusedMessage =
                                                                        null;
                                                                  });
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ).then((_) {
                                            // Clear focus when modal is dismissed
                                            setState(() {
                                              _focusedMessage = null;
                                            });
                                          });
                                        },
                                      ),
                                    ),
                                    Visibility(
                                      visible:
                                          false, // Removed flag functionality for now
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: VIcon(
                                          svgIcon: VIcons.flagFilledTiny,
                                          iconHeight: 24,
                                          iconWidth: 24,
                                          iconColor: VColors.defaultTextSubtle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Error text display
                                if (message['status'] == 'failed') ...[
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment: username == "User 1"
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      const VIcon(
                                        svgIcon: VIcons.errorTiny,
                                        iconColor: VColors.negativeGraphics,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "Message failed to send. Try again.",
                                        style: defaultVTheme
                                            .textStyles.uiLabelSmall
                                            .copyWith(
                                          color: VColors.negativeText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                // Removed FlaggedContentCard for now
                                // If this is the last message and no loader or typing indicator
                                if (index == displayedMessages.length - 1 &&
                                    displayedMessages.length ==
                                        chatSession
                                            .where((m) =>
                                                m['showLoader'] != true &&
                                                m['isTyping'] != true)
                                            .length) ...[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 30, 8, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Chat has ended",
                                          style: defaultVTheme
                                              .textStyles.uiLabelSmall
                                              .copyWith(
                                            color: VColors.defaultTextSubtle,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          // Optionally use last message time instead of hardcoded
                                          formatDateTime(displayedMessages
                                                  .last['time'])
                                              .toLowerCase(),
                                          style: defaultVTheme
                                              .textStyles.uiLabelSmall
                                              .copyWith(
                                            color: VColors.defaultTextSubtle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ),

            // =======================================================
            // BOTTOM INPUT AREA (Fixed at bottom)
            // =======================================================
            UserChatField(
              onTap: () {
                // ===========================================
                // CHAT INITIATION CALLBACK
                // ===========================================
                setState(() {
                  hideWelcomeScreen = true; // Hide welcome screen
                });
                loadChatData(); // Load and start displaying messages
              },
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// CHAT BUBBLE WIDGET
// =============================================================================
/// Individual chat message bubble component.
///
/// Features:
/// - Adaptive styling based on sender (user vs AI)
/// - Long-press interaction support
/// - Focus state highlighting
/// - Responsive width constraints
/// - Border styling based on focus state
/// - Custom alignment for different message types
///
/// Props:
/// - message: The message data object
/// - bubbleAlignment: Left/right alignment for the bubble
/// - bubbleColor: Background color of the bubble
/// - isFocused: Whether this message is currently focused/highlighted
/// - onLongPress: Callback for long-press interactions
class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message, // Message data object
    required this.showPressDownMenu, // Legacy menu state
    required this.chatSession, // Full chat session for context
    required this.bubbleBorder, // Border styling for the bubble
    required this.bubbleColor, // Background color
    required this.bubbleBorderRadius, // Corner rounding
    required this.usernamePositionCrossAxisAlignment, // Username alignment
    required this.messageText, // The actual message text
    required this.username, // Sender's name
    required this.usernameAlignment, // Username positioning
    required this.time, // Formatted timestamp
    required this.bubbleAlignment, // Overall bubble alignment
    required this.onLongPress, // Long-press callback
    this.isFocused = false, // Focus state for highlighting
  });

  // =============================================================
  // BUBBLE PROPERTIES
  // =============================================================
  final Map<String, dynamic> message; // Core message data
  final bool showPressDownMenu; // Legacy - can be removed
  final List chatSession; // Full chat context
  final BoxBorder? bubbleBorder; // Visual border styling
  final Color bubbleColor; // Background color
  final BorderRadiusGeometry bubbleBorderRadius; // Corner radius

  // =============================================================
  // LAYOUT PROPERTIES
  // =============================================================
  final CrossAxisAlignment
      usernamePositionCrossAxisAlignment; // Username layout
  final CrossAxisAlignment bubbleAlignment; // Bubble layout

  // =============================================================
  // CONTENT PROPERTIES
  // =============================================================
  final String messageText; // The message content
  final String username; // Sender's display name
  final MainAxisAlignment usernameAlignment; // Username positioning
  final String time; // Formatted timestamp

  // =============================================================
  // INTERACTION PROPERTIES
  // =============================================================
  final void Function()? onLongPress; // Long-press handler
  final bool isFocused; // Current focus state

  @override
  Widget build(BuildContext context) {
    // =============================================================
    // DETERMINE CONSECUTIVE MESSAGE STATE
    // =============================================================
    // Hide username/time for consecutive messages from same sender
    final int index = chatSession.indexOf(message);
    final bool isFirstOfConsecutive =
        index == 0 || chatSession[index - 1]['username'] != message['username'];

    return Column(
      crossAxisAlignment: bubbleAlignment,
      children: [
        // =======================================================
        // MESSAGE HEADER (Username and time)
        // =======================================================
        if (isFirstOfConsecutive)
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: usernameAlignment,
            children: [
              Text(
                username,
                style: defaultVTheme.textStyles.uiLabelSmall.copyWith(
                  color: VColors.defaultTextSubtle,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                time,
                style: defaultVTheme.textStyles.uiLabelSmall.copyWith(
                  color: VColors.defaultTextSubtle,
                ),
              ),
            ],
          ),
        // =======================================================
        // MESSAGE BUBBLE (Expandable content)
        // =======================================================
        const SizedBox(height: 5),
        GestureDetector(
          onLongPress: onLongPress, // Trigger long-press menu
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width -
                      150, // Responsive width
                ),
                decoration: BoxDecoration(
                  border: bubbleBorder,
                  color: isFocused
                      ? VColors.defaultSurfaceLowlight // Highlighted state
                      : bubbleColor, // Normal state
                  borderRadius: bubbleBorderRadius,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 18,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: usernamePositionCrossAxisAlignment,
                    children: [
                      Flexible(
                        child: Text(
                          messageText,
                          style: defaultVTheme.textStyles.bodyText2.copyWith(
                            color: VColors.defaultText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// FLAGGED CONTENT CARD WIDGET (Legacy/Unused)
// =============================================================================
/// Legacy component for handling flagged content feedback.
/// Currently not used in the chat interface but kept for potential future use.
///
/// Features:
/// - Multiple flag reasons (Inaccurate, Irrelevant, etc.)
/// - Multi-select functionality
/// - Feedback collection interface
///
/// Note: Flag functionality was removed from the main chat interface
/// as requested, but this component remains for potential future use.
class FlaggedContentCard extends StatefulWidget {
  const FlaggedContentCard({
    super.key,
  });

  @override
  State<FlaggedContentCard> createState() => _FlaggedContentCardState();
}

class _FlaggedContentCardState extends State<FlaggedContentCard> {
  // Flag reason options for user feedback
  List<Map<String, dynamic>> dataList = [
    {"title": "Inaccurate"},
    {"title": "Irrelevant"},
    {"title": "Lack of details"},
    {"title": "Should not return \"I don't know\""},
    {"title": "Other"}
  ];

  List selectedOptions = []; // Track selected flag reasons
  bool showFlaggedResponse = false; // Toggle between flag form and response

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: VContentCard(
        padding: const EdgeInsets.all(25),
        child: showFlaggedResponse
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Flagged response",
                        style: defaultVTheme.textStyles.subtitle1.copyWith(
                          color: VColors.defaultTextSubtle,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: VColors.positiveSurface,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              const VIcon(
                                svgIcon: VIcons.successTiny,
                                iconColor: VColors.positiveText,
                              ),
                              const SizedBox(
                                width: 2.5,
                              ),
                              Text(
                                "Submitted",
                                style: defaultVTheme.textStyles.uiLabelSmall,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "What made this response unsatisfactory?",
                      style: defaultVTheme.textStyles.uiLabel.copyWith(
                        color: VColors.defaultTextSubtle,
                      ),
                    ),
                  ),
                  ...selectedOptions.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Row(
                        children: [
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                              color: VColors.defaultText,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            e["title"],
                            style: defaultVTheme.textStyles.uiLabel.copyWith(
                              color: VColors.defaultText,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              )
            : Column(
                children: [
                  Text(
                    "What made this response unsatisfactory? Select all that apply.",
                    style: defaultVTheme.textStyles.uiLabel.copyWith(
                      color: VColors.defaultTextSubtle,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: dataList.length,
                    itemBuilder: (context, index) => VCheckboxTile(
                      titleStyle:
                          defaultVTheme.textStyles.uiLabelLarge.copyWith(
                        color: VColors.defaultText,
                      ),
                      isChecked: selectedOptions.contains(dataList[index]),
                      onChanged: (value) {
                        setState(() {
                          value!
                              ? selectedOptions.add(dataList[index])
                              : selectedOptions.remove(dataList[index]);
                        });
                      },
                      title: dataList[index]["title"],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        VButton(
                          child: Text(
                            "Submit",
                            style:
                                defaultVTheme.textStyles.buttonMedium.copyWith(
                              color: VColors.defaultOnActive,
                            ),
                          ),
                          onPressed: () {
                            if (selectedOptions.isNotEmpty) {
                              setState(() {
                                showFlaggedResponse = true;
                              });
                            }
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        VButton(
                          child: Text(
                            "Cancel",
                            style:
                                defaultVTheme.textStyles.buttonMedium.copyWith(
                              color: VColors.defaultActive,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              showFlaggedResponse = false;
                              selectedOptions.clear();
                            });
                          },
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

// Screen
class WelcomeChatScreen extends StatelessWidget {
  WelcomeChatScreen({super.key});

  final List<String> chipLabels = [
    "How to reset password?",
    "What is a BIN?",
    "Summarize this document",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: VColors.defaultSurface1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome",
                                style:
                                    defaultVTheme.textStyles.headline3.copyWith(
                                  color: VColors.defaultText,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Take a quick tour of our Flutter Chat features. Explore sending messages, handling errors, processing requests, and more—all within a simulated conversation. \nSend a message to get started.",
                                style: defaultVTheme.textStyles.bodyText2,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text("Prompt suggestions",
                                    textAlign: TextAlign.end,
                                    style: defaultVTheme.textStyles.uiLabelLarge
                                        .copyWith(
                                      color: VColors.defaultText,
                                    )),
                              ),
                              Wrap(
                                runSpacing: 10,
                                spacing: 10,
                                alignment: WrapAlignment.end,
                                children: [
                                  ...chipLabels.map((e) {
                                    return VChipsSelection(
                                      chipLabel: e,
                                      onSelected: (_) {},
                                    );
                                  }).toList()
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// END
