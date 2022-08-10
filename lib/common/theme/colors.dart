import 'package:flutter/material.dart';
import 'constants.dart';

const kEmptyColor = Color(0x00000000); // 100% Empty

const darkBg = Color(0xff0F283E);
const extraDarkBg = Color(0xff0D1E29);
const darkBackgroundGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [extraDarkBg, darkBg]);

// Used in main buttons, such as selected tabs, login and sync.
var positiveBlueButtonGradient = gradientBase([
  const Color(0xff3389DB), const Color(0xff1E76DE)],);

// Used in background of popups and navbar too.
var darkPopupGradient = gradientBase([
  const Color(0xff172F43).withOpacity(0.98),
  const Color(0xff172F43)],);

/// Icons & Text Colors
const kPositiveWhite = Colors.white; // - positive
var kImportantWhite80 = Colors.white.withOpacity(0.8); // 0.8 - Important
var kDetailedWhite60 = Colors.white.withOpacity(0.6); // 0.6 - detailed
var kVerySpecificWhite40 = Colors.white.withOpacity(0.4); // 0.4 verySpecific

/// Snackbar Colors
const kSnackbarGrey = Color(0xFF1E76DE); // Grid
const kButtonGrey = Color(0xFF1E76DE); // button
const kLoadingGrey = Color(0xFF1E76DE); // loading O

/// Specific Colors
// Selected radio button, checkboxes...
const kPositiveBlueGui = Color(0xFF1E76DE);
// Appears behind the state of progress bars.
const kProgressBar = Color(0xFF1E4661);
// When tap, or actual assets (worlds, packs...) or borders.
const kTapBorderAssets = Color(0x4D6690B8); // 30% But 10% is original
var kTapBorderAssetsFull = const Color(0xFF1F3A51);
// Secondary buttons, such as unselected tabs, delete...
const kSecondaryButton = Color(0x666690B8); // 50% But 20% is original
// Fields (login)
const kFieldsDark = Color(0xFF0E2130);

const kDialogBg = Color(0xFF3E5F7E);



