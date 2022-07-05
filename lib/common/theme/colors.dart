import 'package:flutter/material.dart';
import 'constants.dart';

const kEmptyColor = Color(0x00000000); // 100% Empty

/// Main Colors
// Used in any screen, just for background.
var darkBackgroundGradient = gradientBase([
  const Color(0xff0D1E29), const Color(0xff0F283E)],);

// Used in main buttons, such as selected tabs, login and sync.
var positiveBlueButtonGradient = gradientBase([
  const Color(0xff3389DB), const Color(0xff1E76DE)],);

// Used in background of popups and navbar too.
var darkPopupGradient = gradientBase([
  const Color(0xff172F43).withOpacity(0.98),
  const Color(0xff172F43)],);

/// Icons & Text Colors
var kPositiveWhite = Colors.white; // - positive
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
var kTapBorderAssets = const Color(0xFF6690B8)
    .withOpacity(0.30); // 10% opacity
// Secondary buttons, such as unselected tabs, delete...
var kSecondaryButton = const Color(0xFF6690B8)
    .withOpacity(0.50); // 20% opacity
// Fields (login)
const kFieldsDark = Color(0xFF0E2130);




