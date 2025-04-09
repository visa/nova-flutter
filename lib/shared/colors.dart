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

abstract class VColors {
  // Nova Default
  static const Color defaultActive = Color(0xFF1434CB);
  static const Color defaultActiveHover = Color(0xFF173BE8);
  static const Color defaultActivePressed = Color(0xFF0F2595);
  static const Color defaultSubtle = Color(0xFF8A847F);
  static Color defaultActiveSubtle = const Color(0xFF000000).withOpacity(0.5);
  static const Color defaultSurface1 = Color(0xFFFFFFFF);
  static const Color defaultSurface2 = Color(0xFFF5F5F5);
  static const Color defaultSurface3 = Color(0xFFF0F0F0);
  static Color defaultSurfaceHighlight =
      const Color(0xFFB3D7FF).withOpacity(0.35);
  static Color defaultSurfaceLowlight =
      const Color(0xFFB3D7FF).withOpacity(0.6);
  static const Color defaultText = Color(0xFF000000);
  static const Color defaultTextSubtle = Color(0xFF4A4A4A);
  static const Color defaultOnActive = Color(0xFFFFFFFF);
  static Color defaultBorder = const Color(0xFF000000).withOpacity(0.1);
  static Color defaultDisabled = const Color(0xFF000000).withOpacity(0.2);
  static const Color defaultAccent = Color(0xFF1434CB);
  static Color defaultOverlay = const Color(0xFF142239).withOpacity(0.4);

  // Nova Default Dark
  static const Color defaultActiveDark = Color(0xFFBDEAFF);
  static const Color defaultActiveHoverDark = Color(0xFFDBF4FF);
  static const Color defaultActivePressedDark = Color(0xFF80D7FF);
  static const Color defaultSubtleDark = Color(0xFF8A847F);
  static Color defaultActiveSubtleDark =
      const Color(0xFFFFFFFF).withOpacity(0.5);
  static const Color defaultSurface1Dark = Color(0xFF0A0A0A);
  static const Color defaultSurface2Dark = Color(0xFF1A1A1A);
  static const Color defaultSurface3Dark = Color(0xFF2E2E2E);
  static Color defaultSurfaceHighlightDark =
      const Color(0xFF000000).withOpacity(0.35);
  static Color defaultSurfaceLowlightDark =
      const Color(0xFF000000).withOpacity(0.6);
  static const Color defaultTextDark = Color(0xFFFFFFFF);
  static const Color defaultTextSubtleDark = Color(0xFFD9D9D9);
  static const Color defaultOnActiveDark = Color(0xFF2E2E2E);
  static Color defaultBorderDark = const Color(0xFFFFFFFF).withOpacity(0.1);
  static Color defaultDisabledDark = const Color(0xFFFFFFFF).withOpacity(0.2);
  static const Color defaultAccentDark = Color(0xFFFCC015);
  static Color defaultOverlayDark = const Color(0xFF000000).withOpacity(0.4);

  // Nova Alternate
  static const Color alternateActive = Color(0xFFFCC015);
  static const Color alternateActiveHover = Color(0xFFFCC936);
  static const Color alternateActivePressed = Color(0xFFD39D03);
  static const Color alternateSubtle = Color(0xFFD9D9D9);
  static Color alternateActiveSubtle = const Color(0xFFFFFFFF).withOpacity(0.5);
  static const Color alternateSurface1 = Color(0xFF1434CB);
  static const Color alternateSurface2 = Color(0xFF112CAC);
  static const Color alternateSurface3 = Color(0xFF112AA7);
  static Color alternateSurfaceHighlight =
      const Color(0xFF021E4C).withOpacity(0.35);
  static Color alternateSurfaceLowlight =
      const Color(0xFF021E4C).withOpacity(0.6);
  static const Color alternateText = Color(0xFFFFFFFF);
  static const Color alternateTextSubtle = Color(0xFFD9D9D9);
  static const Color alternateOnActive = Color(0xFF021E4C);
  static Color alternateBorder = const Color(0xFFFFFFFF).withOpacity(0.1);
  static Color alternateDisabled = const Color(0xFFFFFFFF).withOpacity(0.2);
  static const Color alternateAccent = Color(0xFFFFFFFF);
  static Color alternateOverlay = const Color(0xFF000000).withOpacity(0.4);

  // Nova Alternate Dark
  static const Color alternateActiveDark = Color(0xFFBDEAFF);
  static const Color alternateActiveHoverDark = Color(0xFFDBF4FF);
  static const Color alternateActivePressedDark = Color(0xFF80D7FF);
  static const Color alternateSubtleDark = Color(0xFFD9D9D9);
  static Color alternateActiveSubtleDark =
      const Color(0xFFFFFFFF).withOpacity(0.5);
  static const Color alternateSurface1Dark = Color(0xFF2E2E2E);
  static const Color alternateSurface2Dark = Color(0xFF1A1A1A);
  static const Color alternateSurface3Dark = Color(0xFF0A0A0A);
  static Color alternateSurfaceHighlightDark =
      const Color(0xFF000000).withOpacity(0.35);
  static Color alternateSurfaceLowlightDark =
      const Color(0xFF000000).withOpacity(0.6);
  static const Color alternateTextDark = Color(0xFFFFFFFF);
  static const Color alternateTextSubtleDark = Color(0xFFD9D9D9);
  static const Color alternateOnActiveDark = Color(0xFF0A0A0A);
  static Color alternateBorderDark = const Color(0xFFFFFFFF).withOpacity(0.1);
  static Color alternateDisabledDark = const Color(0xFFFFFFFF).withOpacity(0.2);
  static const Color alternateAccentDark = Color(0xFFFCC015);
  static Color alternateOverlayDark = const Color(0xFF000000).withOpacity(0.4);

  // Nova Positive
  static const Color positiveSurface = Color(0xFFD6F2C4);
  static const Color positiveGraphics = Color(0xFF40996B);
  static const Color positiveText = Color(0xFF2D6C4B);

  // Nova Warning
  static const Color warningSurface = Color(0xFFFFEF99);
  static const Color warningGraphics = Color(0xFFC38004);
  static const Color warningText = Color(0xFF9B6603);

  // Nova Negative
  static const Color negativeSurfaceHighLight = Color(0xFFFFEEF2);
  static const Color negativeSurfaceLowLight = Color(0xFFFBE1E6);
  static const Color negativeSurface = Color(0xFFFFD6E9);
  static const Color negativeGraphics = Color(0xFFD65151);
  static const Color negativeTextHover = Color(0xFFBC343A);
  static const Color negativeText = Color(0xFFB3202A);
  static const Color negativeTextPressed = Color(0xFF7F0004);

  // Nova Info
  static const Color infoSurface = Color(0xFFC7EDFF);
  static const Color infoGraphics = Color(0xFF0088C7);
  static const Color infoText = Color(0xFF005E8A);

  // Other
  static const Color gray = Color(0xFFCFCFCF);
  static const Color transparent = Color(0x00000000);

  // Button
  static const Color primaryActive = Color(0xFF132482);
  static const Color disabled = Color(0xFFCACACA);
  static const Color primaryPressed = Color(0xFF132482);
  static const Color offPressed = Color(0xFFD7EAFF);
}
