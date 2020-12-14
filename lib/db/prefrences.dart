import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class MyPref{
  getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool('isLogin');
    return boolValue;
  }
}