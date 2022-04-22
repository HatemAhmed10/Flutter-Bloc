
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PostCubit()..GetWords(),
      child: BlocConsumer<PostCubit, PostStates>(
        listener: (BuildContext context, PostStates state) {},
        builder: (BuildContext context, PostStates state) {
          PostCubit cubit = PostCubit.get(context);

          return Scaffold(
            body: ConditionalBuilder(
              condition: cubit.PostList!.isNotEmpty,
              builder: (context) => RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 2));
                  cubit.GetWords();
                },
                child: ListView.separated(
                    itemBuilder: (context, index) => Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppMargin.m12),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child:Text(cubit.PostList!.first[index]['description'].toString(),
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.right,) ,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppMargin.m8),
                            child: Image.network(cubit.PostList!.first[index]['imgurl']),
                          ),
                          Container(
                            height: 7,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 30.0,
                    ),
                    itemCount: cubit.PostList!.first.length),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                Navigator.pushNamed(context, Routes.postAddRoute);
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

}
