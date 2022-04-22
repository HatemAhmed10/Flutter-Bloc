import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/layout/home_layout.dart';
import 'package:product/shared/components/components.dart';
import 'package:product/shared/cubit/cubit.dart';
import 'package:product/shared/cubit/states.dart';


class AddProduct extends StatelessWidget {
  TextEditingController _type = new TextEditingController();
  TextEditingController _name = new TextEditingController();
  TextEditingController _number = new TextEditingController();
  TextEditingController _price = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppCreateDatabaseState)
          {
            print(state.toString());
          }
        },

        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black87,
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.white10,
                      title: Text("اضافه منتج ",
                        textAlign: TextAlign.right,
                        style:TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 450,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Expanded(
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white10,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: TextFormField(
                                    controller: _type,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      icon: new Icon(Icons.merge_type,color: Colors.white,),
                                      border: OutlineInputBorder(),
                                      labelText: 'Product Type',
                                      labelStyle: TextStyle(color: Colors.white),
                                      hintText: 'Enter your Type',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Expanded(
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white10,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: TextFormField(
                                    controller: _name,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      icon: new Icon(Icons.drive_file_rename_outline,color: Colors.white,),
                                      border: OutlineInputBorder(),
                                      labelText: 'Product Name',
                                      labelStyle: TextStyle(color: Colors.white),
                                      hintText: 'Enter your Product Name',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Expanded(
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white10,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _number,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      icon: new Icon(Icons.confirmation_number,color: Colors.white,),
                                      border: OutlineInputBorder(),
                                      labelText: 'Product Number',
                                      labelStyle: TextStyle(color: Colors.white),
                                      hintText: 'Enter your Number',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Expanded(
                                child: Container(

                                  alignment: AlignmentDirectional.center,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white10,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _price,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      icon: new Icon(Icons.monetization_on,color: Colors.white,),
                                      border: OutlineInputBorder(),
                                      labelText: 'Product Price',
                                      labelStyle: TextStyle(color: Colors.white),
                                      hintText: 'Enter your Price',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: FlatButton(
                                    textColor: Colors.white, // foreground
                                    onPressed: () {
                                      cubit.AddData(
                                          type: _type.text,
                                          name: _name.text,
                                          number: _number.text,
                                          salary: _price.text);
                                      _type.clear();
                                      _name.clear();
                                      _number.clear();
                                      _price.clear();
                                      showAlertDialog(context);
                                    },
                                    child: Text('اضافه ',
                                      textAlign: TextAlign.right,
                                      style:TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        navigateAndFinish(context ,HomeLayout());
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Good Add"),
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
