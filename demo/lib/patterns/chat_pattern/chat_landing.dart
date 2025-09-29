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
// BEGIN ChatLandingPage
import 'package:demo/main.dart';
import 'package:demo/patterns/chat_pattern/chats.dart';
import 'package:demo/utilities.dart';
import 'package:flutter/material.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';

class ChatLandingPage extends StatefulWidget {
  const ChatLandingPage({super.key});

  @override
  State<ChatLandingPage> createState() => _ChatLandingPageState();
}

class _ChatLandingPageState extends State<ChatLandingPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _chatKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    setPageTitle('Chats', context);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
      child: Scaffold(
        key: _key,
        drawer: const MyDrawer(pageTitle: "Chats"),
        appBar: CustomAppBar(
          globalKey: _key,
          title: "Chat",
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SemanticHeader(
                  title: "Chat demo",
                  style: defaultVTheme.textStyles.headline2.copyWith(
                    fontWeight: VFontWeight.semiBold,
                  ),
                ),
                largeHeight(),
                SizedBox(
                  width: double.infinity,
                  child: VButton(
                    child: Text(
                      "Open chat demo",
                      style: defaultVTheme.textStyles.buttonMedium.copyWith(
                        color: VColors.defaultOnActive,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatFrame(
                            scaffoldKey: _chatKey,
                          ),
                        ),
                      );
                    },
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

// END
