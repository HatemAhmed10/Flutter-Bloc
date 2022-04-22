import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/shared/cubit/cubit.dart';
import 'package:product/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if(state is AppCreateDatabaseState)
          {
            print(state.toString());
            print("dada");
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
              fixedColor: Colors.pink,
              unselectedItemColor: Colors.white,
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: "Home",
                ),
                // BottomNavigationBarItem(
                //   icon: CircleAvatar(
                //     radius: 17.0,
                //     backgroundColor: Colors.red,
                //     child:Text(cubit.OrderList.length.toString(),
                //      style:TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),),
                //     ),
                //   label: "",
                // ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 44,
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_basket,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: CircleAvatar(
                            radius: 10.0,
                            backgroundColor: Colors.pink,
                            child:Text(cubit.OrderList.length.toString(),
                              style:TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  label:"Order    ",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
