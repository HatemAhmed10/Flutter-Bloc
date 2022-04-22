import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:slatak/shared/cubit/states.dart';

import '../../modules/Slatak_Done/Slatak_Done_Screen.dart';
import '../../modules/Slatak_view/Slatak_View_Screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';
import '../DataBase/slatak.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [

    SlatakViewScreen(),
    SlatakDoneScreen(),
    NewTasksScreen(),
  ];

  List<String> titles = [

    'Slatak View',
    'Slatak Done',
    'New Tasks',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }



  void CreateDataBase(){
    DataBaseHelper.createDatabase();
    emit(AppCreateDatabaseState());
  }


  List? AllMake;
  void GetAllMakeFromDataBase(database){
    AllMake = [];
    database.rawQuery('SELECT  * FROM Slatak').then((value) {
      value.forEach((element)
      {
        AllMake!.add(element);
      });
      emit(AppFetchMakeDatabaseState());
    });
  }

  List? FajerMake;
  void GetAllFajerFromDataBase(@required database,@required String? Name,){
    AllMake = [];
    database.rawQuery('SELECT  * FROM Slatak WHERE S_name =?',[Name]).then((value) {
      value.forEach((element)
      {
        AllMake!.add(element);
      });
      emit(AppFetchMakeDatabaseState());
    });
  }




  // ignore: non_constant_identifier_names
  String SlatakName ='';

  // ignore: non_constant_identifier_names
  void GetSlatakName(int hour){
    print(hour);
    if(hour >3 && hour <= 11){
    SlatakName = "الفجر"  ;
    }else if(hour >11 && hour <= 15){
      SlatakName ="الظهر";
    }else if(hour >15 && hour <= 17){
      SlatakName = "العصر" ;
    }else if(hour >17 && hour <= 19){
      SlatakName = "المغرب" ;
    }
    else {
      SlatakName = "العشاء" ;
    }
    emit(GetSlatakNameState());
  }


  void AddData({
    @required String? Name,
    @required String? Make,
    @required String? day,
    @required String? month,
    @required String? year}){
    DataBaseHelper.AddData(
        name: Name,
        make: Make,
        Day: day,
        Month: month,
        Year: year);
    emit(AppInsertDatabaseState());
  }

  String? OneSlatak ;
  void GetOneSlatak(
      {@required database ,
        @required String? name,
        @required String? Day,
        @required String? Month,
        @required String? Year,
      }) async {
    await database!.rawQuery('SELECT * FROM Slatak WHERE S_name =? AND S_Day =? AND S_Month =? AND S_Year =?',[name, Day, Month, Year]).then((value) {
      if(value.isEmpty){
        OneSlatak = null ;
      }else{
        OneSlatak = value[0]['S_Make'].toString();
      }
    });
    emit(GetOneSlatakState());
  }
  String? FirstDaySlatak ;
  String? FirstMonthSlatak ;
  String? FirstYearSlatak ;
  int? TotalNumberSlatak =0 ;
  void GetFirstSlatak() async {
    await DataBaseHelper.database!.rawQuery('SELECT * FROM Slatak ').then((value) {
      if(value.isEmpty){
        FirstDaySlatak = null ;
        FirstMonthSlatak = null ;
        FirstYearSlatak = null ;
      }else{
        FirstDaySlatak = value[0]['S_Day'].toString();
        FirstMonthSlatak = value[0]['S_Month'].toString();
        FirstYearSlatak = value[0]['S_Year'].toString();

        final FirstDate = DateTime(int.parse(FirstYearSlatak.toString()),
            int.parse(FirstMonthSlatak.toString()),
            int.parse(FirstDaySlatak.toString()));
        final DataNow = DateTime.now();
        final difference = DataNow.difference(FirstDate).inDays;

        TotalNumberSlatak =(difference+1)*5 ;
      }
    });
    emit(GetOneSlatakState());
  }





  List? FajerNumber;
  List? JaherNumber;
  List? AserNumber;
  List? MagrebNumber;
  List? EchaNumber;

  bool get2 =false ;
  void GetAllNumberFromDataBase() async{
    get2 =true ;

    FajerNumber = [];
    JaherNumber = [];
    AserNumber = [];
    MagrebNumber = [];
    EchaNumber = [];
    await DataBaseHelper.database!.rawQuery('SELECT  * FROM Slatak WHERE S_Make =?',["نعم"]).then((value) {
      value.forEach((element)
      {
        if(element['S_name']=='الفجر'){
          FajerNumber!.add(element);
        }else if(element['S_name']=='الظهر'){
          JaherNumber!.add(element);
        }else if(element['S_name']=='العصر'){
          AserNumber!.add(element);
        }else if(element['S_name']=='المغرب'){
          MagrebNumber!.add(element);
        }else if(element['S_name']=='العشاء'){
          EchaNumber!.add(element);
        }

      });
      emit(AppFetchAllNumberDatabaseState());
    });
  }

  int counter =0 ;

  void changecounter(){
    if(counter == 124){
      counter =0 ;
    }else{
      counter++ ;
    }

    emit(ChangeCounterState());
  }

}
