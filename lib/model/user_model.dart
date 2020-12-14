import 'package:flutter/material.dart';
import 'package:flutter_app_ui_design/enums/view_state.dart';

class UserModel with ChangeNotifier{
  int _id;
  String _userName;
  String _userEmail;
  String _userPass;
  String _createdDate;

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;  UserModel(); // String _createdDate;

  UserModel.withId(this._id, this._userName, /*this._createdDate, */this._userPass, [this._userEmail]);

  String get password => _userPass;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  set password(String value) {
    _userPass = value;

  }

  String get createdDate => _createdDate;

  set createdDate(String value) {
    _createdDate = value;
  }

  String get email => _userEmail;

  set email(String value) {
    if(value.length <= 255)
      _userEmail = value;
  }

  String get userName => _userName;

  set userName(String value) {
    if(value.length <= 255)
      _userName = value;
  }

//  convert a user into a map object

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(id !=null){
      map['id'] = _id;
    }
    map['user_name'] = _userName;
    map['user_email'] = _userEmail;
    map['user_pass'] = _userPass;
    map['user_createdDate'] = _createdDate;
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map){
    this._id = map['id'];
    this._userName = map['user_name'];
    this._userEmail = map['user_email'];
    this._userPass = map['user_pass'];
    this.createdDate = map['user_createdDate'];

  }



}