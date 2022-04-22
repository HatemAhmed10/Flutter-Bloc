// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product/modules/Home/home.dart';
import 'package:product/modules/Order/order.dart';
import 'package:product/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    OrderScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }
  List AllTypeData =[];

  // List<bool> isChecked ;
  // void constValue(){
  //   isChecked = List<bool>.filled(AllTypeData.length, false);
  //   emit(ConstVlaueState());
  // }
  // void ChangeValue(bool value,int index){
  //   isChecked[index] = value;
  //   emit(AppChangeVlaueState());
  // }
  Map OrderList ={};
  void AddArray(int index){
    OrderList[AllTypeData[index]['P_type'].toString()+AllTypeData[index]['P_name'].toString()]=[AllTypeData[index]['P_type'].toString(),
      AllTypeData[index]['P_name'].toString(),
      AllTypeData[index]['P_number'].toString(),
      AllTypeData[index]['P_salary'].toString()];
    emit(AddArrayState());
  }

//-----------------------------------------------------------
  // ignore: non_constant_identifier_names
  List TypeProduct =[];

  Database? database ;
  void createDatabase() {
    openDatabase(
      'manage.db',
      version: 3,
      onCreate: (database, version) {
        print('database created');
        database.execute(
            'CREATE TABLE Product (_id INTEGER PRIMARY KEY,'
                ' P_type TEXT,'
                ' P_name TEXT,'
                ' P_number TEXT ,'
                ' P_salary TEXT )')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
        database.execute(
            'CREATE TABLE Product2 (_id2 INTEGER PRIMARY KEY,'
                ' Number_Order TEXT,'
                ' O_name TEXT,'
                ' O_number TEXT ,'
                ' O_cost TEXT ,'
                ' F_cost TEXT )')
            .then((value) {
          print('table2 created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        // GetAllData(database);
        //GetOneData(database: database, type: "A");
        //GetPtypeData(database);
        print('database opened');
      },
    ).then((value) {
      database = value ;
      GetPtypeData(database);
      emit(AppCreateDatabaseState());
    });
  }

  AddData({@required String? type, @required String? name, @required String? number,@required String? salary,}) {
    database!.rawQuery('SELECT * FROM Product WHERE P_type =? AND P_name =?',[type, name]).then((value) {
      if(value.isEmpty){
        database!.transaction((txn) {
          txn.rawInsert(
            'INSERT INTO Product(P_type, P_name, P_number, P_salary) VALUES("$type", "$name", "$number", "$salary")',
          ).then((value) {
            print('$value inserted successfully');
            emit(AppInsertDatabaseState());
            //GetAllData(database);
          }).catchError((error) {
            print('Error When Inserting New Record ${error.toString()}');
          });
          return null as Future;
        });

      }else{
        database!.rawUpdate(
          'UPDATE Product SET P_number = ? , P_salary = ?  WHERE P_type =? AND P_name =?',
          ['$number','$salary', type, name],
        ).then((value)
        {
          print('$value Update successfully');
          emit(AppInsertDatabaseState());
         // GetAllData(database);
        });
      }
    });
  }

  void GGGGGt(database){
    database.rawQuery('SELECT * FROM Product').then((value) {
     print(value.toString());
    });
    emit(AppFetchOrderState());
  }

  void GetPtypeData(database) {
    TypeProduct = [];
    database.rawQuery('SELECT DISTINCT P_type FROM Product').then((value)  {
      print(value.toString());
      value.forEach((element)
      {
        TypeProduct.add(element);
      });
      if(TypeProduct.isEmpty){
        print(TypeProduct.length.toString());
      }else{
        GetOneData(database: database,type: TypeProduct[0]['P_type'].toString());
      }
      emit(AppFetchPtypeDatabaseState());
      //print(TypeProduct[0].values.toString());
    });
  }


  void GetOneData({@required database,@required String? type}){
    AllTypeData = [];
    database.rawQuery('SELECT * FROM Product WHERE P_type =?',[type]).then((value) {
      value.forEach((element)
      {
        AllTypeData.add(element);
      });
      //constValue();
      emit(AppFetchOneDatabaseState());
      //print(AllTypeData.toString());
    });
  }


  int numberOrder =1 ;
  void changeNumberOrder(){
    numberOrder++;
    emit(AppChangeNumberOrder());
  }

  AddOrder({@required String? NumberOrder,@required String? name, @required String? number,@required String? cost,@required String? Finalcost,}) async{
    await database!.transaction((txn) {
      txn.rawInsert(
        'INSERT INTO Product2(Number_Order, O_name, O_number, O_cost, F_cost) VALUES("$NumberOrder", "$name", "$number", "$cost", "$Finalcost")',
      ).then((value) {
        print('$value inserted successfully');
        emit(AppInsertOrderDatabaseState());
        //GetAllData(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
      return null as Future;
    });
  }


  List Forder =[];
  void GetAllOrder(database){
    Forder = [];
    database.rawQuery('SELECT * FROM Product2').then((value) {
      value.forEach((element)
      {
        Forder.add(element);
      });
      emit(AppFetchOrderState());
    });
  }


  Map FNumber ={};
 // String FNumber ='' ;
  void changeFNumber(String data,int index){
    FNumber[index] =data ;
    emit(ChangeFNumberState());
  }

  List OrderCost =[] ;
  double FinalCost =0 ;
}
