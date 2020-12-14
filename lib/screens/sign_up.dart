import 'package:flutter/material.dart';
import 'package:flutter_app_ui_design/db/database_helper.dart';
import 'package:flutter_app_ui_design/model/user_model.dart';
import 'package:flutter_app_ui_design/resources/app_colors.dart';
import 'package:flutter_app_ui_design/resources/strings.dart';
import 'package:flutter_app_ui_design/resources/text_styles.dart';
import 'package:flutter_app_ui_design/screens/login.dart';
import 'package:flutter_app_ui_design/utils/CircleButton.dart';
import 'package:flutter_app_ui_design/utils/device_size.dart';
import 'package:flutter_app_ui_design/utils/utility.dart';
import 'package:flutter_app_ui_design/utils/widget.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _edtUserName = new TextEditingController();
  TextEditingController _edtEmail = new TextEditingController();
  TextEditingController _edtPass = new TextEditingController();
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: _formKey,
      child: Stack(
        children: [
          Container(
            // color: AppColors.primaryColor.withOpacity(.98),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
            ),
            height: DeviceSize.height(context),
            width: DeviceSize.width(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.registration,
                  style: AppTextStyles.textExtraLargeTextStyle,
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        width: DeviceSize.width(context) -
                            DeviceSize.width(context) / 4,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.primaryColor.withOpacity(.8),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.circular(120.0),
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.circular(120.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.homeManagementTextColor
                                    .withOpacity(.2),
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ]),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextFormField(
                                validator: (val) {
                                  return val.isEmpty || val.length < 2
                                      ? Strings.username_error
                                      : null;
                                },
                                controller: _edtUserName,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: Strings.username,
                                  icon: new Container(
                                      width: 36.0,
                                      child: new Icon(
                                        Icons.person_rounded,
                                        color: Colors.white70,
                                      )),
                                  hintStyle: TextStyle(color: Colors.white70),
                                  border: InputBorder.none,
                                ),
                                style: AppTextStyles.normalFont18,
                              ),
                            ),
                            Divider(color: AppColors.lightTextColor),
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextFormField(
                                controller: _edtEmail,

                                validator: (val) {
                                  return Utility.validateEmail(val)
                                      ? null
                                      : Strings.email_error;
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: Strings.email,
                                  icon: new Container(
                                      width: 36.0,
                                      child: new Icon(
                                        Icons.email_outlined,
                                        color: Colors.white70,
                                      )),
                                  hintStyle: TextStyle(color: Colors.white70),
                                  border: InputBorder.none,
                                ),
                                style: AppTextStyles.normalFont18,

                              ),
                            ),
                            Divider(color: AppColors.lightTextColor),
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextFormField(
                                controller: _edtPass,
                                validator: (val) {
                                  return val.isEmpty || val.length < 6
                                      ? Strings.pass_error
                                      : null;
                                },

                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: Strings.password,
                                  icon: new Container(
                                      width: 36.0,
                                      child: new Icon(
                                        Icons.lock_open_outlined,
                                        color: Colors.white70,
                                      )),
                                  hintStyle: TextStyle(color: Colors.white70),
                                  border: InputBorder.none,
                                ),
                                style: AppTextStyles.normalFont18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: DeviceSize.width(context) / 6,
                      height: 170,
                      child: Positioned(
                        child: CircleButton(
                            onTap: () {
                              if(_formKey.currentState.validate()){
                               setState(() {
                                 signUp();
                               });
                              }
                            },
                            iconData: Icons.done_outlined),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    navigationPushReplacePage(context, Login());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, top: 0.0, right: 0.0, bottom: 0.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        Strings.login,
                        style: AppTextStyles.orangeTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  // void updateEmail(){
  //   _userModel.email = _edtEmail.text;
  // }
  //
  // void updateUserName(){
  //   _userModel.userName = _edtUserName.text;
  // }
  //
  // void updatePass(){
  //   _userModel.userPass = _edtPass.text;
  // }

  void  moveToLastScreen(){
    Navigator.pop(context,true);
  }

  void signUp() async{

    UserModel _userModel = new UserModel();
    _userModel.userName = _edtUserName.text;
    // debugPrint(_userModel.userName);
    _userModel.email= _edtEmail.text;
    _userModel.password=_edtPass.text;
    var a = await databaseHelper.getBoolValuesSF();

    debugPrint(a.toString());
    // moveToLastScreen();
    _userModel.createdDate = DateFormat.yMMMMd().format(DateTime.now());
    int result;
    result = await databaseHelper.signUpUser(_userModel);

    if( result == -1){  // success
      _showAlertDialog(context,'Status', 'This email id is already registered with us. Please try with another email. ');
    } else if (result != 0){
      _showAlertDialog(context,'Status', 'User created successfully.');

    }
    else{ // failure
      _showAlertDialog(context,'Status', 'Problem in creating user.');
    }
  }

}

void _showAlertDialog(BuildContext context,String title, String message) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(message),
  );
  showDialog(
      context: context,
      builder: (_) => alertDialog
  );
}
