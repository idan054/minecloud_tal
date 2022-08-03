import 'package:flutter/material.dart';
import 'package:minecloud_tal/screens/onBoarding_page.dart';
import 'package:minecloud_tal/screens/login_page.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;
import 'common/models/universal_models.dart';
import 'dashboard.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Platform.isWindows || kIsWeb
          ? const MainPage()
          : const OnBoardingPage(),
      // home: const OnBoardingPage(),
      // home: const Dashboard(),
    );
  }
}
