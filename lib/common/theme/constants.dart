import 'package:flutter/material.dart';

// STRUCTURE:
// Lib
// Lib -> dump
// Lib -> common -> models
// Lib -> common -> services
// Lib -> common -> theme
// Lib -> common -> theme -> colors.dart
// Lib -> widgets
// Lib -> screens

// in use in: colors.dart
LinearGradient gradientBase(List<Color> colorList){
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    // stops: [0.05, 0.35, 0.50, 0.60, 0.80],
    colors: colorList,
  );
}