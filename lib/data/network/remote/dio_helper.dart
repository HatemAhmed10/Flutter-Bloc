import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

import '../../../domain/postmodel.dart';
import 'logging.dart';
import 'package:file_picker/file_picker.dart';





class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://comics20.herokuapp.com',
      // connectTimeout: 5000,
      // receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());


  Future<PostModel?> getPosts() async {
    PostModel? wordModel;
    try {
      Response userData = await _dio.get('/admin/get_posts');
      wordModel = PostModel.fromJson(userData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return wordModel;
  }




  Future<Post?> addPost (@required Post userInfo,@required PlatformFile? file) async {
    Post? retrievedUser;
    FormData data = FormData.fromMap({
      // "surahnumber":userInfo.surahnumber,
      // "wordnumber":userInfo.wordnumber,
      //"files":userInfo.sounds
      "description":userInfo.description,
      "picture": [ await MultipartFile.fromFile(
          file!.path.toString(),
          filename: basename(file.path.toString())
        //show only filename from path
      )]

    });
    try {
      Response response = await _dio.post(
        '/admin/add_post',
        data: data,
      );

      print('User created: ${response.data}');

      //retrievedUser = Post.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedUser;
  }



}











