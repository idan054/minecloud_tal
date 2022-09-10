import 'package:archive/archive_io.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:minecloud_tal/firebase_options.dart';
import 'package:minecloud_tal/screens/login/login.dart';
import 'package:minecloud_tal/screens/onBoarding_page.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';
import 'dart:io' show Directory, File, Platform;
import 'package:archive/archive_io.dart' as archive;
import 'common/models/universal_models.dart';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


void main() async {
  print('START main()');
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  // await Firebase.initializeApp();

  // Directory appDocDir = await getApplicationDocumentsDirectory();
  Future<String> createZip() async {
    print('START createZip()');
    var pogoDir = Directory('C:\\Users\\Idan\\Downloads\\POGO');
    var encoder = ZipFileEncoder();
    String zipPath = pogoDir.path + "/" + 'myPogo.zip';
    encoder.create(zipPath);
    encoder.addDirectory(pogoDir);
    encoder.close();
    return zipPath;
  }
  var zipPath = await createZip();

  //~ Can't upload file via  FirebaseStorage.instance - No support for windows.
  /*  uploadFile(String zipPath) async {
    print('START uploadImage()');
    final _firebaseStorage = FirebaseStorage.instance;

      var file = File(zipPath);

        //Upload to Firebase
        var snapshot = await _firebaseStorage.ref()
            .child('files/myZip.zip')
            .putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();
        print('downloadUrl: ${downloadUrl}');

  }*/
  // uploadFile(zipPath);

  final formData = FormData.fromMap(
      {'file': await MultipartFile.fromFile(zipPath)});

  final response = await Dio(BaseOptions(
  baseUrl:
      'https://us-central1-genial-wonder-316104.cloudfunctions.net/'))
      .post('uploadFile', data: formData);



  log(response.data.toString());

  print('Done');

/*  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UniModel()),
          // Provider.value(value: StreamModel().serverClient),
          // FutureProvider<List<Activity>?>.value(
          //     value: StreamModel().getFeedActivities(), initialData: const []),
        ],
        // builder:(context, child) =>
        child: const MyApp()),
  );*/
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
      home: Platform.isIOS || Platform.isAndroid ?
      const OnBoardingPage() : const LoginScreen(),
      // home:  const SignupPage(),
      // home: const Dashboard(),
    );
  }
}

