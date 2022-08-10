import 'package:flutter/material.dart';
import 'package:minecloud_tal/common/models/universal_models.dart';
import 'package:provider/provider.dart';

// STRUCTURE:
// Lib
// Lib -> dump
// Lib -> common -> models
// Lib -> common -> services
// Lib -> common -> theme
// Lib -> common -> theme -> colors.dart
// Lib -> widgets
// Lib -> screens

double maxSize = 9999;

// in use in: colors.dart
LinearGradient gradientBase(List<Color> colorList){
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: colorList,
  );
}

// Contexts shortcuts
Size kMediaQuerySize(context) => MediaQuery.of(context).size;
 double maxWidth(context) => kMediaQuerySize(context).width;
 double maxHeight(context) => kMediaQuerySize(context).height;

ThemeData kTheme(context) => Theme.of(context);
NavigatorState kNavigator(context) => Navigator.of(context);

// Smart navigation shortcuts
Future<dynamic> kPushNavigator(context, screen,{bool replace = false}) =>
    replace ?
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => screen))
        : Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => screen));

// Provider models shortcuts
UniModel kUniModel(context, {bool listen = false})
    => Provider.of<UniModel>(context, listen: listen);