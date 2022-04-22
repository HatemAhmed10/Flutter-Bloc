
import 'package:comics4/domain/postmodel.dart';
import 'package:comics4/modules/postview/cubit/states.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comics4/data/network/remote/dio_helper.dart';
class PostCubit extends Cubit<PostStates> {
  PostCubit() : super(PostInitialState());

  static PostCubit get(context) => BlocProvider.of(context);

  DioClient _client = DioClient();

  //PostModel? postModel ;
  List? PostList =[] ;
  void GetWords() {
    //PostList = [] ;
    PostList!.clear();
    emit(GetPostLoadingHomeDataState());
    _client.getPosts().then((value){
      PostList!.add(value!.toJson()['post']);
      emit(GetPostSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPostErrorHomeDataState());
    });
  }


  bool Done = false ;
  bool Ferror = false ;
  // ignore: non_constant_identifier_names
  void AddPost(@required String Description,@required PlatformFile? file) {
    emit(AddWordLoadingHomeDataState());
    Post userInfo = Post(
      description: Description,
    );
    _client.addPost(userInfo,file).then((value){
      //print('dd${value!.toString().toString()}');
      Done =true ;
      emit(AddWordSuccessHomeDataState());
    }).catchError((error) {
      //print(error.toString());
      Ferror = true ;
      emit(AddWordErrorHomeDataState());
    });
  }
}
