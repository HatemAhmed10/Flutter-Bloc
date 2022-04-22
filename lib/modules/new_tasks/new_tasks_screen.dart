import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:slatak/shared/DataBase/slatak.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../SignIn/SignIN.dart';

class NewTasksScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubit = AppCubit.get(context);
        var now = new DateTime.now();
        var formatter = new DateFormat('yyyy-MM-dd');
        String formattedDate2 = DateFormat('kk:mm:ss').format(now);
        String formattedDate = formatter.format(now);
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text("NewTasksScreen"),
                SizedBox(height: 50,),
                TextButton(
                    onPressed: (){
                      navigateTo(
                        context,
                        SignIN(),
                      );
                    },
                    child: Text('SignIN')),
                Text(formattedDate.toString()),
                Text(formattedDate2.toString()),
                SizedBox(height: 100,),
                TextButton(
                  onPressed: (){
                    cubit.AddData(
                        Name: "الظهر",
                        Make: "نعم",
                        day: "2",
                        month: "4",
                        year: "2022");
                  },
                    child: Text("Add")),
                SizedBox(height: 100,),
                TextButton(
                    onPressed: (){
                      cubit.GetAllMakeFromDataBase(DataBaseHelper.database);
                      },
                    child: Text("Get")),
                Text(cubit.AllMake.toString()),
                // TextButton(
                //     onPressed: (){
                //       cubit.GetOneSlatak(
                //           database: DataBaseHelper.database,
                //           name: "العصر",
                //           Day: "4",
                //           Month: "4",
                //           Year: "2022");
                //     },
                //     child: Text("Get22")),
                // Text(cubit.OneSlatak.toString()),
              ],
            ),

          ),
        );

        // return tasksBuilder(
        //   tasks: tasks,
        // );
        //

      },
    );
  }
}