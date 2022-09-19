import 'dart:io';

import 'package:dio/dio.dart';

/// A Single ton class for all kind of Api related to cloud functions
class ApiService {
  ApiService._();
  static ApiService get instance => ApiService._();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://us-central1-genial-wonder-316104.cloudfunctions.net',
      connectTimeout: 3600,
      contentType: 'application/json',
      headers: {},
      validateStatus: (status) => status == 200 ? true : false,
    ),
  );

  /*
  [DELETE]  
  link: https://us-central1-genial-wonder-316104.cloudfunctions.net/deleteFile 
  body: {"fileName": "demo"}
  */
  /// Query for given `FileName`  and Delete the perticular file from Storage
  Future<void> deleteFile(String fileName) async {
    final response =
        await _dio.delete('/deleteFile', data: {'fileName': fileName});
    if (response.statusCode == 200) {
      // success
    } else {
      // failed
    }
  }

  /// [DELETE] https://us-central1-genial-wonder-316104.cloudfunctions.net/deleteAllFiles
  ///
  /// Delete all the files [Doesn't depends on folder]
  Future<void> deleteAllFiles() async {
    final response = await _dio.delete('/deleteAllFiles');
    if (response.statusCode == 200) {
      // success
    } else {
      // failed
    }
  }

  /// [GET] https://us-central1-genial-wonder-316104.cloudfunctions.net/downloadFile
  /// queryParameters: {"fileName": ""}
  ///
  /// Download `fileName`
  Future<void> downloadFile(String fileName) async {
    final response = await _dio.get('/downloadFile');
    if (response.statusCode == 200) {
      // get permission
      // await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      // final tempDir = await getTemporaryDirectory();
      //  String fullPath = tempDir.path + "/image.png'";
      // File file = File(fullPath);
      // var raf = file.openSync(mode: FileMode.write);
      // raf.writeFromSync(response.data);
      // await raf.close();

      // success
    } else {
      // failed
    }
  }

  /// [GET] https://us-central1-genial-wonder-316104.cloudfunctions.net/getFile
  /// queryParamaters: {file_name: ""}
  ///
  /// Get File
  Future<void> getFile(String fileName) async {
    final response = await _dio.get('/getFile');
    if (response.statusCode == 200) {
      // success
    } else {
      // failed
    }
  }

  /// [GET] https://us-central1-genial-wonder-316104.cloudfunctions.net/getAllFiles
  ///
  /// Get all Files
  Future<void> getAllFiles() async {
    final response = await _dio.get('/getAllFiles');
    if (response.statusCode == 200) {
      // success
    } else {
      // failed
    }
  }

  /// [POST] https://us-central1-genial-wonder-316104.cloudfunctions.net/uploadFile
  /// body: {
  /// "file":
  /// "upload_to": "optional"}
  ///
  /// Upload File to Folder
  Future<void> uploadFile(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
      "upload_to": "/otpional"
    });
    final response = await _dio.post('/uploadFile', data: formData);
    if (response.statusCode == 200) {
      // success
    } else {
      // failed
    }
  }
}
