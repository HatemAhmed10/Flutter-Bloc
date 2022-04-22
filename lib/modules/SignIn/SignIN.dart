import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/home_layout.dart';
import '../../shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SignIN extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
    child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
      listener: (context, state) {
        if (state is ShopLoginInitialState)
        {
          print("sa");
        }
      },
    builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("SignIN"),
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 300,),
                TextButton(
                    onPressed: (){
                      navigateAndFinish(
                        context,
                        HomeLayout(),
                      );
                    },
                    child: Text("News")),
              ],
            ),

          ),
        );
      },
     ),
    );
  }
}
