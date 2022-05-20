import 'package:domino/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Database? database;

  Future<Database?> get db async {
    if (database == null){
      database  = await createDatabase() ;
      return database ;
    }else {
      return database ;
    }
  }
  List<Map> games = [] ;

  var firstName = TextEditingController();
  var secondName = TextEditingController();
  var thirdName = TextEditingController();
  var fourthName = TextEditingController();
  int firstScore1 = 0;
  int secondScore1 =0;
  int thirdScore1=0 ;
  int fourthScore1 =0;
List<Map> currentScore =[];
   getScore({
  int? firstScore,
    int? secondScore,
    int? thirdScore,
    int? fourthScore
})async{
     firstScore1 = 0;
     secondScore1 =0;
     thirdScore1=0 ;
     fourthScore1 =0;
    firstScore1 = firstScore!;
    secondScore1 = secondScore!;
    thirdScore1= thirdScore!;
    fourthScore1 = fourthScore!;
    emit(AppScoreState());

  }
  bool isBottomSheetShown = false;
  bool isBottomSheetShown1 = false;

  void changeBottomSheetState({
    required bool isShow,
  }) {
    isBottomSheetShown = isShow;

    emit(AppChangeBottomSheetState());
  }
  void changeBottomSheetState1({
    required bool isShow,
  }) {
    isBottomSheetShown1 = isShow;

    emit(AppChangeBottomSheetState1());
  }

   createDatabase() async{
 Database myDB=  await openDatabase(
      'domino.db',
      version: 1,
      onCreate: (database, version) async {
        await database
            .execute(
                'CREATE TABLE game(id INTEGER PRIMARY KEY,firstName TEXT,secondName TEXT,thirdName TEXT,fourthName TEXT,firstScore INTEGER,secondScore INTEGER,thirdScore INTEGER,fourthScore INTEGER,type TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('error when creating table ${error.toString()}');
        });
      },

    );
 print(" onCreate =====================================") ;
 emit(AppCreateDatabaseState());
 return myDB;
  }

  insertToDatabase({
    required String firstName,
    required String secondName,
     String? thirdName,
     String? fourthName,
     required String? type,
    int? firstScore = 0,
    int? secondScore = 0,
    int? thirdScore = 0,
    int? fourthScore = 0,
  }) async {
    await database!.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO game(firstName,secondName,thirdName,fourthName,firstScore,secondScore,thirdScore,fourthScore,type)VALUES("$firstName","$secondName","$thirdName","$fourthName","$firstScore","$secondScore","$thirdScore","$fourthScore","$type") ')
          .then((value) {
        emit(AppInsertDatabaseState());

        getDataFromDatabase();
      }).catchError((error) {
        print('error when insert new record ${error.toString()}');
      });
    });
  }



   getDataFromDatabase()async {
   // games = [];
Database? database = await db;
    emit(AppGetDatabaseLoadingState());

    List<Map> response=await database!.rawQuery("SELECT * FROM game");
emit(AppGetDatabaseSuccessState());
print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${response[0]['id']}');
   return games = response;

  }

  void updateData({
    int? firstScore = 0,
    int? secondScore = 0,
    int? thirdScore = 0,
    int? fourthScore = 0,
    required int? id}) async {
    emit(AppUpdateDatabaseLoadingState());
   await database!.rawUpdate(
      'UPDATE game SET firstScore = ?, secondScore = ?, thirdScore = ?, fourthScore = ? WHERE id = ?',
      ['$firstScore','$secondScore','$thirdScore','$fourthScore', id],
    ).then((value) {
      getDataFromDatabase();
      emit(AppUpdateDatabaseState());
    }).catchError((onError){
      print(onError.toString());
      emit(AppUpdateDatabaseErrorState(onError));
    });
  }

  void deleteData({required int? id}) async {
    database!.rawDelete(
      'DELETE FROM game WHERE id = ?',
      [id],
    ).then((value) {
      getDataFromDatabase();
      emit(AppDeleteDatabaseState());
    });
  }
}
