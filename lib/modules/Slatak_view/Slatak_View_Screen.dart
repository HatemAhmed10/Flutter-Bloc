import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/DataBase/slatak.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class SlatakViewScreen extends StatelessWidget {
  const SlatakViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool _isDone = false ;


    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is AppChangeBottomNavBarState){

        }
      },
      builder: (context, state)
      {
        var now = new DateTime.now();
        var formatterDay = new DateFormat('dd');
        var formatterMonth = new DateFormat('MM');
        var formatterYear = new DateFormat('yyyy');

        String Day = (int.parse(formatterDay.format(now))).toString();
        String Month = (int.parse(formatterMonth.format(now))).toString();
        String Year = (int.parse(formatterYear.format(now))).toString();


        AppCubit cubit = AppCubit.get(context);
        cubit.GetOneSlatak(
            database: DataBaseHelper.database,
            name: cubit.SlatakName.toString(),
            Day: Day,
            Month: Month,
            Year: Year );

        return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Text("${Day} /${Month} /${Year}",
                                style:TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
                              SizedBox(height: 30,),
                              Text(cubit.SlatakName.toString(),
                                style:TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
                              cubit.OneSlatak == null ? Container(
                                width: double.infinity,
                                color: Colors.black,
                              )
                                  : Container(
                                color: Colors.pink,
                                child: Column(
                                  children: [
                                    cubit.OneSlatak == 'نعم' ? Container(
                                      child: Column(
                                        children: [
                                          IconButton(
                                            icon: const CircleAvatar(
                                              radius: 45.0,
                                              backgroundColor: Colors.white,
                                              child: Icon(
                                                Icons.done,
                                                size: 30.0,
                                                color: Colors.black,
                                              ),
                                            ),
                                            onPressed: () {
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                        :Container(
                                      child: Column(
                                        children: [
                                          IconButton(
                                            icon: const CircleAvatar(
                                              radius: 45.0,
                                              backgroundColor: Colors.black,
                                              child: Icon(
                                                Icons.error,
                                                size: 30.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () {
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                cubit.OneSlatak == null ? Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(26.0),
                        child: Container(
                          color: Colors.black45,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const CircleAvatar(
                                        radius: 45.0,
                                        backgroundColor: Colors.pink,
                                        child: Icon(
                                          Icons.done,
                                          size: 30.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                        cubit.AddData(
                                            Name: cubit.SlatakName.toString(),
                                            Make: "نعم",
                                            day: Day.toString(),
                                            month:Month.toString(),
                                            year: Year.toString());
                                      },
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        cubit.AddData(
                                            Name: cubit.SlatakName.toString(),
                                            Make: "نعم",
                                            day: Day.toString(),
                                            month:Month.toString(),
                                            year: Year.toString());
                                      },
                                      child: const Text(
                                        'نعم',
                                        style:TextStyle(color: Colors.pink, fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: const CircleAvatar(
                                        radius: 45.0,
                                        backgroundColor: Colors.pink,
                                        child: Icon(
                                          Icons.error_outline,
                                          size: 30.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                        cubit.AddData(
                                            Name: cubit.SlatakName.toString(),
                                            Make: "لا",
                                            day: Day.toString(),
                                            month:Month.toString(),
                                            year: Year.toString());
                                        // _isFetching =true ;
                                        // _isDone =false ;
                                      },
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        cubit.AddData(
                                            Name: cubit.SlatakName.toString(),
                                            Make: "لا",
                                            day: Day.toString(),
                                            month:Month.toString(),
                                            year: Year.toString());
                                        // _isFetching =true ;
                                        // _isDone =false ;
                                      },
                                      child: const Text(
                                        'لا',
                                        style:TextStyle(color: Colors.pink, fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                : Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      cubit.OneSlatak == 'نعم' ? Container(
                        color: Colors.amberAccent,
                        width: double.infinity,
                        child: Column(
                          children: [
                            SbahGUI2(context),
                          ],
                        ),
                      )
                          :Container(
                            child: Column(
                             children: [
                              HadesGUI(context),
                             ],
                         ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
