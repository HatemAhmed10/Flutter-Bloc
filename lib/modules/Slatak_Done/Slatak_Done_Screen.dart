import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class SlatakDoneScreen extends StatelessWidget {
  const SlatakDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        AppCubit cubit = AppCubit.get(context);
        cubit.GetFirstSlatak();
        //cubit.GetAllNumberFromDataBase();


        return Container(
          color: Colors.black,
          alignment: AlignmentDirectional.topCenter,
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                child: Text("عدد الصلاه   ${cubit.TotalNumberSlatak.toString()}",
                  style:TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              FloatingActionButton(
                backgroundColor: Colors.pink,
                  onPressed: (){
                    cubit.GetAllNumberFromDataBase();
                  },
                child: Icon(Icons.get_app),
              ),
              SizedBox(height: 30,),
              cubit.get2 == true ? Container(
                width: double.infinity,
                height: 520,
                child: Column(
                 children: [
                   Expanded(
                     child: Row(
                       children: [
                         Expanded(
                           child: Container(
                             width: 160,
                             height: 160,
                             decoration: BoxDecoration(
                               color: Colors.pink,
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 const Text("الظهر",
                                   style:TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                                 Text("% ${((cubit.JaherNumber!.length/(cubit.TotalNumberSlatak! /5))*100).toString()} ",
                                   style:TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                 Text("تم ${cubit.JaherNumber!.length.toString()} من ${((cubit.TotalNumberSlatak! /5).toInt()).toString()}",
                                   style:TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                               ],
                             ),
                           ),
                         ),
                         SizedBox(width: 10,),
                         Expanded(
                           child: Container(
                             width: 160,
                             height: 160,
                             decoration: BoxDecoration(
                               color: Colors.pink,
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 const Text("الفجر",
                                   style:TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                                 Text("% ${((cubit.FajerNumber!.length/(cubit.TotalNumberSlatak! /5))*100).toString()} ",
                                   style:TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                 Text("تم ${cubit.FajerNumber!.length.toString()} من ${((cubit.TotalNumberSlatak! /5).toInt()).toString()}",
                                   style:TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                               ],
                             ),
                           ),
                         ),

                       ],
                     ),
                   ),
                   Expanded(
                     child: Row(
                       children: [
                         Expanded(
                           child: Container(
                             width: 160,
                             height: 120,
                             decoration: BoxDecoration(
                               color: Colors.pink,
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 const Text("العصر",
                                   style:TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                                 Text("% ${((cubit.AserNumber!.length/(cubit.TotalNumberSlatak! /5))*100).toString()} ",
                                   style:TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                 Text("تم ${cubit.AserNumber!.length.toString()} من ${((cubit.TotalNumberSlatak! /5).toInt()).toString()}",
                                   style:TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   Expanded(
                     child: Row(
                       children: [
                         Expanded(
                           child: Container(
                             width: 160,
                             height: 160,
                             decoration: BoxDecoration(
                               color: Colors.pink,
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 const Text("العشاء",
                                   style:TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                                 Text("% ${((cubit.EchaNumber!.length/(cubit.TotalNumberSlatak! /5))*100).toString()} ",
                                   style:TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                 Text("تم ${cubit.EchaNumber!.length.toString()} من ${((cubit.TotalNumberSlatak! /5).toInt()).toString()}",
                                   style:TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                               ],
                             ),
                           ),
                         ),
                         SizedBox(width: 10,),
                         Expanded(
                           child: Container(
                             width: 160,
                             height: 160,
                             decoration: BoxDecoration(
                               color: Colors.pink,
                               borderRadius: BorderRadius.circular(10.0),
                             ),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 const Text("المغرب",
                                   style:TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                                 Text("% ${((cubit.MagrebNumber!.length/(cubit.TotalNumberSlatak! /5))*100).toString()} ",
                                   style:TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                                 Text("تم ${cubit.MagrebNumber!.length.toString()} من ${((cubit.TotalNumberSlatak! /5).toInt()).toString()}",
                                   style:TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             )
             : Text(""),

            ],
          ),
        );
      },
    );
  }
}