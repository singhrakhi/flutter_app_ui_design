import 'package:flutter/cupertino.dart';
import 'package:flutter_app_ui_design/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String userTable = "user_table";
  String colUserId = "id";
  String colUserName = "user_name";
  String colUserEmail = "user_email";
  String colUserPass = "user_pass";
  String colCreateDate = "user_createdDate";

  DatabaseHelper._createInstance();

  factory DatabaseHelper(){
    if(_databaseHelper==null){
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async{
    if(_database==null){
      _database = await initializeDb();
    }
    return _database;
  }

  Future<Database> initializeDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path+'user.db';

    var userDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return userDatabase;
  }

  void _createDb(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $userTable($colUserId INTEGER PRIMARY KEY AUTOINCREMENT, $colUserName TEXT,'
        ' $colUserEmail TEXT, $colUserPass TEXT, $colCreateDate TEXT)');
  }

  Future<int> signUpUser(UserModel userModel ) async{
    Database db = await this.database;
  var result;
    String email = userModel.email;
    var res = await db.rawQuery("SELECT * FROM $userTable WHERE $colUserEmail = '$email'");
    if(res.length>0){
      result =-1;
    } else{
      result = await db.insert(userTable, userModel.toMap());
    }
    return result;
  }

  Future<UserModel> getLogin(String user, String password) async {
    Database db = await this.database;
    var res = await db.rawQuery("SELECT * FROM $userTable WHERE $colUserEmail = '$user' and $colUserPass = '$password'");
    if (res.length > 0) {
      return new UserModel.fromMap(res.first);
    }
    return null;
  }


  addBoolToSF(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', value);
  }

  getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool('isLogin');
    return boolValue;
  }

}