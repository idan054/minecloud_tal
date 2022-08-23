import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minecloud_tal/firebase_options.dart';

import 'package:minecloud_tal/screens/login/login.dart';
import 'package:minecloud_tal/screens/onBoarding_page.dart';
import 'package:minecloud_tal/screens/reset/reset.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

import 'common/models/universal_models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UniModel()),
          // Provider.value(value: StreamModel().serverClient),
          // FutureProvider<List<Activity>?>.value(
          //     value: StreamModel().getFeedActivities(), initialData: const []),
        ],
        // builder:(context, child) =>
        child: const MyApp()),
  );
}


// Lib
// Lib -> dump
// Lib -> common -> models
// Lib -> common -> services
// Lib -> common -> theme
// Lib -> common -> theme -> colors.dart
// Lib -> widgets
// Lib -> screens

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MiniCLoud',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      // home:  Platform.isIOS || Platform.isAndroid ?
      //     const OnBoardingPage() : const LoginScreen(),
      home:  const ResetPage(),
      // home: const Dashboard(),
    );
  }
}

