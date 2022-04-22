import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';


class DataBaseHelper {
  static Database? database;

  static  void createDatabase() {
      openDatabase(
        'slatak.db',
        version: 3,
        onCreate: (database, version) {
          print('database created');
          database.execute(
              'CREATE TABLE Slatak (_id INTEGER PRIMARY KEY,'
                  ' S_name TEXT,'
                  ' S_Make TEXT,'
                  ' S_Day TEXT,'
                  ' S_Month TEXT,'
                  ' S_Year TEXT )')
              .then((value) {
            print('table created');
          }).catchError((error) {
            print('Error When Creating Table ${error.toString()}');
          });
        },
        onOpen: (database) {
          print('database opened');
        },
      ).then((value) {
        database = value ;
      });
    }


  static void AddData(
      {@required String? name,
        @required String? make,
        @required String? Day,
        @required String? Month,
        @required String? Year,
      }) {
    database!.rawQuery('SELECT * FROM Slatak WHERE S_name =? AND S_Day =? AND S_Month =? AND S_Year =?',[name, Day, Month, Year]).then((value) {
      if(value.isEmpty){
        database!.transaction((txn) async{
          txn.rawInsert(
            'INSERT INTO Slatak(S_name, S_Make, S_Day, S_Month, S_Year) VALUES("$name", "$make", "$Day", "$Month", "$Year")',
          ).then((value) {
            print('$value inserted successfully');
          }).catchError((error) {
            print('Error When Inserting New Record ${error.toString()}');
          });
          return null;
        });

      }else{
        database!.rawUpdate(
          'UPDATE Slatak SET S_Make = ?  WHERE S_name =? AND S_Day =? AND S_Month =? AND S_Year =?',
          ['$make', name, Day, Month, Year],
        ).then((value)
        {
          print('$value Update successfully');
        });
      }
    });
  }



}