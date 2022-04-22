import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate2 = DateFormat('kk:mm:ss').format(now);
    String formattedDate = formatter.format(now);
    String HourformattedDate = DateFormat('kk').format(now);
    int Fhour  = int.parse(HourformattedDate) ;

    return BlocProvider(
      create: (BuildContext context) => AppCubit()..CreateDataBase()..GetSlatakName(Fhour),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if(state is AppChangeBottomNavBarState)
          {
            print(state.toString());
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            body: ConditionalBuilder(
              condition: state is! AppInitialState,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.black,
              fixedColor: Colors.pink,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: const [

                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.view_agenda,
                    color: Colors.white,
                  ),
                  label: 'View',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  label: 'Tasks',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
