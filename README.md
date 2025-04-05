<!--
 * © 2025 Visa.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the specific language governing permissions and
 * limitations under the License.
 *
 -->

# Visa Product Design System - Nova Flutter

- [About](#about)
- [Security](#security)
- [Install](#install)
- [Usage](#usage)
- [Why Nova Flutter?](#why-nova-flutter)
- [Testing](#testing)
- [Maintainers](#maintainers)
- [Thanks](#thanks)
- [Contributing](#contributing)
- [License](#license)

## <a name="about"></a>Nova Flutter

> Accessible Visa Product Design System components built for Flutter

Nova Flutter is a comprehensive library of accessible components designed to align with the Visa Product Design System. It provides developers with a set of reusable UI elements that can be easily integrated into Flutter applications. With Nova Flutter, developers can quickly build visually consistent and user-friendly interfaces that adhere to accessibility best practices.

### Key Features

- **Wide range of components**: Includes buttons, content cards, navigation drawer, and more.
- **Customizable**: Built on Flutter Material and ThemeExtension, allowing for extensive theming and customization.
- **Accessibility**: Adheres to accessibility best practices to ensure inclusive user experiences.
- **Flexible state management**: Supports bring-your-own state, enabling custom services and classes.

Whether you are building a small project or a large-scale application, Nova Flutter offers a robust foundation for creating visually appealing and accessible user interfaces.

## <a name="security"></a>Security

Our package follows security best practices and ensures the safety of user data. It relies on a minimal number of dependencies, minimizing potential vulnerabilities.

## <a name="install"></a>Install

Nova Flutter and Nova Icons Flutter supports Dart 2.19 and up with null safety, and our current Flutter SDK version is 3.27.2. It is available through the [pub.dev](https://pub.dev/).

**Dart:**

```sh
flutter pub add visa_nova_flutter
flutter pub add visa_nova_icons_flutter
```

To add the dependency maually to your project, import it in pubspec.yaml under _dependencies_ like this:

```yaml
dependencies:
  visa_nova_flutter: ^8.1.0
  visa_nova_icons_flutter: ^4.0.0
```

### Dependencies

View our pubspec.yaml for the most up-to-date dependencies, including peer dependencies and dev dependencies.

## <a name="usage"></a>Usage

### Import VPDS Component Library to Your Project

Import the library into your Dart code.

```Dart
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
```

### Add icons (optional)

We’ve created a dedicated widget, VIcon, to seamlessly integrate the SVG icon library with the components library. To best use Nova icons, import the library along side our visa_nova_flutter library.

```Dart
import 'package:visa_nova_icons_flutter/visa_nova_icons_flutter.dart';
import 'package:visa_nova_flutter/visa_nova_flutter.dart';
import 'package:flutter/material.dart';

class MyGenericIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: VIcon(
        svgIcon: VIconsGeneric.profileLow,
      ),
    );
  }
}

class MyVisaIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: VIcon(
        iconColor: VColors.positiveGraphics,
        svgIcon: VIcons.successTiny,
      ),
    );
  }
}
```

### Use the components

After adding Nova icons, you’re ready to use Flutter components by copying and pasting the example code into your application. Check out [Button](https://productdesignsystem.visa.com/version/development-public/components/button?code_library=flutter&version=8.1.0) to give it a try.

## <a name="why-nova-flutter"></a>Why Nova Flutter?

### Light Weight

We've reduced our library to basic markup components and functional hooks for a lighter, simpler, and more flexible experience.

### Building Blocks

No more waiting on feature requests. We provide the building blocks for you to easily create and customize your own components.

### Built For Developers

Nova Flutter is sleek and unobtrusive. Our beautifully designed components allow any developer to create stunning apps with ease.

## <a name="testing"></a>Testing

### Our Approach

We conduct rigorous testing using Flutter's built-in testing framework to ensure our components are accessible and meet our high standards. Our testing strategy includes unit tests, and widget tests(golden tests). Unit tests verify the correctness of individual functions, methods, or classes under various conditions. Golden tests ensure that the UI looks and interacts as expected and compare widgets with reference images to guarantee visual consistency, similar to snapshot testing in React/React Native.

While we strive to achieve 100% test coverage for all components, we recognize that it is an ongoing process. Our pipeline safeguards against merging any code that fails our tests, ensuring that we capture as many issues as possible before they reach end users. We are continually working to enhance our testing suite and improve our coverage. By combining these testing strategies, we aim to deliver robust and reliable components that meet our high standards of quality and accessibility.

## <a name="maintainers"></a>Maintainers

This project is maintained by the Visa Product Design System engineering team. If you need to get in touch please reach out to us via any of our options on our support page.

## <a name="thanks"></a>Thanks

Thanks to all those who have contributed and to the Visa Product Design team for all of the hours and thought that have gone into making the design system as easy to use as possible.

## <a name="contributing"></a>Contributing

SEE CONTRIBUTING.md

## <a name="license"></a>License

SEE LICENSE IN LICENSE
