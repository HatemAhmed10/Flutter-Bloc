import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/modules/AddProduct/AddProduct.dart';
import 'package:product/shared/components/components.dart';
import 'package:product/shared/cubit/cubit.dart';
import 'package:product/shared/cubit/states.dart';

class OrderScreen extends StatelessWidget
{
  //TextEditingController _number = new TextEditingController();
  List<TextEditingController> _controllers = [];
   String x ='' ;
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        AppCubit cubit = AppCubit.get(context);
        List data =[];
        cubit.OrderList.forEach((k,v) => data.add(v));
        cubit.GetAllOrder(cubit.database);
        return Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text("Order"),
            actions: [
              IconButton(
                icon: CircleAvatar(
                  radius: 45.0,
                  backgroundColor: Colors.pink,
                  child: Icon(
                    Icons.add,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  for(int x =0 ;x<data.length ;x++){
                    if(cubit.FNumber[x] ==null ){
                      showAlertDialog(context);
                      return ;
                    }else{
                      cubit.AddOrder(
                          NumberOrder: cubit.numberOrder.toString(),
                          name: data[x][1].toString(),
                          number: cubit.FNumber[x].toString(),
                          cost: (int.parse(cubit.FNumber[x])*int.parse(data[x][3])).toString(),
                          Finalcost: cubit.FinalCost.toString());
                    }
                  }
                  _controllers = [];
                  cubit.FNumber.clear();
                  cubit.changeNumberOrder();
                  cubit.OrderList.clear();
                  data.clear();
                  cubit.changeIndex(0);


                     // if()
                     //  //
                     //  // print(data[x][1].toString());
                     //  // print(cubit.FNumber[x].toString());
                     //  // print(data[x][3].toString());
                     //  // cubit.OrderCost.add(int.parse(cubit.FNumber[x])*int.parse(data[x][3]));
                     //  // print(cubit.OrderCost.toString());
                     //  // cubit.FinalCost =cubit.FinalCost + cubit.OrderCost[x];
                     //  // print(cubit.FinalCost.toString());


                },
              ),
            ],
          ),
          body: ConditionalBuilder(
            condition: data.length != 0,
            builder: (context) => Container(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    _controllers.add(new TextEditingController());
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(data[index][1].toString(),
                                  style:TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),),
                              ),
                              Expanded(
                                child: Text(data[index][2].toString(),
                                  style:TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),),
                              ),
                              Expanded(
                                child: Text(data[index][3].toString(),
                                  style:TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),),
                              ),
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  width: 10,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value){
                                      cubit.changeFNumber(value,index);
                                    },
                                    controller: _controllers[index],
                                    cursorColor: Colors.pink,
                                    style: TextStyle(fontSize: 20, height: 0.5 ,color: Colors.pink),
                                    decoration: InputDecoration(
                                      labelText: 'Number',
                                      labelStyle: TextStyle(color: Colors.white,fontSize: 10),
                                      hintText: 'Number',
                                      hintStyle: TextStyle(color: Colors.grey,fontSize: 10),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                      border: OutlineInputBorder(),
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
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10.0,
                  ),
                  itemCount: data.length),
            ),
            fallback: (context) => Center(child: Text("اختار منتج ",
              style:TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),),
          ),
          ),
        );

      },
    );
  }
  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        //navigateAndFinish(context ,OrderScreen());
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("ادخل العدد المطلوب "),
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