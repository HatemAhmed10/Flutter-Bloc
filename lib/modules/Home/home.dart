import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/modules/AddProduct/AddProduct.dart';
import 'package:product/modules/Information/Information.dart';
import 'package:product/shared/components/components.dart';
import 'package:product/shared/cubit/cubit.dart';
import 'package:product/shared/cubit/states.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
      },
      builder: (context, state)
      {
        AppCubit cubit = AppCubit.get(context);
        //cubit.GetPtypeData(cubit.database);

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text(
              "المدير ",
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style:TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: CircleAvatar(
                  radius: 45.0,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.perm_device_information,
                    size: 30.0,
                    color: Colors.pink,
                  ),
                ),
                onPressed: () {
                  //cubit.GetAllOrder(cubit.database);
                  navigateTo(
                    context,
                    Information(),
                  );
                },
              ),
            ],
          ),
          body: ConditionalBuilder(
            condition: cubit.TypeProduct.isNotEmpty,
            builder: (context) => Container(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    color: Colors.black87,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  cubit.GetOneData(
                                      database: cubit.database,
                                      type: cubit.TypeProduct[index]["P_type"].toString());
                                },
                                child: Text(
                                  cubit.TypeProduct[index]["P_type"].toString(),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style:TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              )
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 10.0,
                          ),
                          itemCount: cubit.TypeProduct.length),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      color: Colors.black87,
                      child: ListView.separated(
                          itemBuilder:  (context, index) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Container(
                                //color: Colors.pink,
                                width: double.infinity,
                                child: TextButton(
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          if (states.contains(MaterialState.focused))
                                            return Colors.red;
                                          if (states.contains(MaterialState.hovered))
                                            return Colors.green;
                                          if (states.contains(MaterialState.pressed))
                                            return Colors.pink;
                                          return Colors.transparent; // Defer to the widget's default.
                                        }),
                                  ),
                                  onPressed: () {
                                    cubit.AddArray(index);
                                    print(cubit.OrderList.toString());
                                    //cubit.OrderList[index]=[cubit.AllTypeData[index]['P_type'].toString(),cubit.AllTypeData[index]['P_name'].toString(),cubit.AllTypeData[index]['P_number'].toString(),cubit.AllTypeData[index]['P_salary'].toString()];
                                    },
                                  child:Text(cubit.AllTypeData[index]['P_name'].toString(),
                                     style:TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),),
                                ),
                              ),
                              // child: CheckboxListTile(
                              //   value: cubit.isChecked[index],
                              //   onChanged: (value){
                              //     cubit.ChangeValue(value,index);
                              //      if(value == true){
                              //        //print(cubit.AllTypeData[index]['P_name'].toString());
                              //        cubit.OrderList[index]=[cubit.AllTypeData[index]['P_type'].toString(),cubit.AllTypeData[index]['P_name'].toString(),cubit.AllTypeData[index]['P_number'].toString(),cubit.AllTypeData[index]['P_salary'].toString()];
                              //      }else{
                              //        cubit.OrderList.remove(index);
                              //      }
                              //     },
                              //   title: Text(cubit.AllTypeData[index]['P_name'].toString(),
                              //     style:TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                              //   activeColor: Colors.pink,
                              //   subtitle: Text(cubit.AllTypeData[index]['P_number'].toString(),
                              //     style:TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),),
                              //   secondary: new Icon(Icons.login,color: Colors.white,),),
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 10.0,
                          ),
                          itemCount: cubit.AllTypeData.length
                      ),
                    ),
                  ),
                ],
              ),
            ),
            fallback: (context) => Center(
                child: CircularProgressIndicator()),
          ),
          floatingActionButton: FloatingActionButton(
            foregroundColor: Colors.white,
            backgroundColor: Colors.pink,
            child: Icon(Icons.add),
            onPressed: (){
              //cubit.OrderList[1]="a1";
              //print(cubit.OrderList.toString());
              //cubit.constValue();
              //print(cubit.isChecked);
              //cubit.ChangeValue(true,1);
              //print(cubit.isChecked);
              //print(cubit.Fvalue[1].toString());
              cubit.GGGGGt(cubit.database);
              // navigateTo(
              //   context,
              //   AddProduct(),
              // );
            },
          ),
        );
      },
    );
  }
}