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
import 'package:go_router/go_router.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/404.jpg"),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "We could not find the page you're looking for.",
                  style: defaultVTheme.textStyles.headline1
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width / 4,
                  child: VButton(
                    onPressed: () {
                      context.go('/');
                    },
                    child: const Text("GO HOME"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
