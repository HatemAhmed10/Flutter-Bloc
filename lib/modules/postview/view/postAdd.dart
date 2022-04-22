import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/resources/constants_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';


class PostAdd extends StatefulWidget {
  const PostAdd({Key? key}) : super(key: key);

  @override
  State<PostAdd> createState() => _PostAddState();
}

class _PostAddState extends State<PostAdd> {
  FilePickerResult? result;
  PlatformFile? file;
  TextEditingController _Description = TextEditingController();

  bool load =false ;
  Timer? _timer;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PostCubit()..GetWords(),
      child: BlocConsumer<PostCubit, PostStates>(
        listener: (BuildContext context, PostStates state) {},
        builder: (BuildContext context, PostStates state) {
          PostCubit cubit = PostCubit.get(context);


          return Scaffold(
            appBar: AppBar(
              title: Text(
                "PostAdd",
              ),
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                         ElevatedButton(
                          onPressed: () async {
                            pickFiles();
                          },
                          child: Text('Pick file'),
                    ),
                         if (file != null) Column(
                           children: [
                             // fileDetails(file!),
                             Image.file(
                               File(file!.path.toString()),
                             )
                           ],
                         ),
                         TextFormField(
                           controller: _Description,
                           style: TextStyle(color: Colors.amber),
                           decoration: InputDecoration(
                             icon: new Icon(Icons.person),
                             border: OutlineInputBorder(),
                             labelText: 'Enter your username',
                             labelStyle: TextStyle(color: Colors.amber),
                             hintText: 'Enter a search term',
                             hintStyle: TextStyle(color: Colors.white12),
                           ),
                         ),
                    load == true? Center(child: CircularProgressIndicator())
                     : ElevatedButton(
                           onPressed: () async {
                             load = true ;
                             cubit.AddPost(_Description.text, file);
                             goNext() {
                               if(cubit.Done == true){
                                 print('A1');
                                 Navigator.pushReplacementNamed(context, Routes.postRoute);
                               }else if(cubit.Ferror == true){
                                 showAlertDialog(context);
                                 load = false ;
                               }else{
                                 print("A2");
                                 _timer = Timer(const Duration(seconds: AppConstants.splashDelay), goNext);
                               }
                             }
                             _timer = Timer(const Duration(seconds: AppConstants.splashDelay), goNext);
                             //load = false ;
                           },
                           child: Text('Add'),
                         ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget fileDetails(PlatformFile file){
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size  = (mb>=1)?'${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('File Name: ${file.name}'),
          Text('File Size: $size'),
          Text('File Extension: ${file.extension}'),
          Text('File Path: ${file.path}'),
        ],
      ),
    );

  }

  void pickFiles() async {
//        result = await FilePicker.platform.pickFiles(type: FileType.audio);
    result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result == null) return;

    file = result!.files.first;
    setState(() {});
  }

  // // open the picked file
  // void viewFile(PlatformFile file) {
  //   OpenFile.open(file.path);
  // }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {

        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("فشل التحميل"),
      content: Text("Error"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

