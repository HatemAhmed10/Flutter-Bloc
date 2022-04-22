import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/layout/home_layout.dart';
import 'package:product/shared/components/components.dart';
import 'package:product/shared/cubit/cubit.dart';
import 'package:product/shared/cubit/states.dart';


class Information extends StatelessWidget {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
        },

        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          //cubit.GetAllOrder(cubit.database);
          return Scaffold(
            appBar: AppBar(
              title: Text("Information"),
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextButton(
                        onPressed: (){
                          cubit.GetAllOrder(cubit.database);
                        },
                        child: Text("Add")),
                    SizedBox(width: 50,),
                    Column(
                      children: [
                        Text(cubit.Forder.toString()),
                        // Text(cubit.Forder[0]["O_name"].toString()),
                        // Text(cubit.Forder[0]["O_cost"].toString()),
                        // Text(cubit.Forder[0]["O_name"].toString()),


                      ],
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
}
