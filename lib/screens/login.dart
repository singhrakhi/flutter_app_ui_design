import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ui_design/db/database_helper.dart';
import 'package:flutter_app_ui_design/model/user_model.dart';
import 'package:flutter_app_ui_design/resources/app_colors.dart';
import 'package:flutter_app_ui_design/resources/strings.dart';
import 'package:flutter_app_ui_design/resources/text_styles.dart';
import 'package:flutter_app_ui_design/screens/sign_up.dart';
import 'package:flutter_app_ui_design/utils/CircleButton.dart';
import 'package:flutter_app_ui_design/utils/device_size.dart';
import 'package:flutter_app_ui_design/utils/utility.dart';
import 'package:flutter_app_ui_design/utils/widget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
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
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover
              ),
            ),
            height: DeviceSize.height(context),
            width: DeviceSize.width(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.login,
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
                                keyboardType: TextInputType.emailAddress,
                                controller: _edtEmail,
                                validator: (val) {
                                  return Utility.validateEmail(val)
                                      ? null
                                      : Strings.email_error;
                                },
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

                            Divider(
                                color: AppColors.lightTextColor
                            ),
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
                        child: CircleButton(onTap: () => {
                          if(_formKey.currentState.validate()){
                            signIn()
                          }
                        }, iconData: Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 0.0,top: 0.0,right: 40.0,bottom: 0.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      Strings.forgot_password,
                      style: AppTextStyles.normalFont20,
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                GestureDetector(
                  onTap: (){
                    navigationPushReplacePage(context, SignUp());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0,top: 0.0,right: 0.0,bottom: 0.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        Strings.register,
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

  void signIn() async{
    // moveToLastScreen();
    UserModel userModel =new UserModel();
    userModel = await databaseHelper.getLogin(_edtEmail.text.toString(),_edtPass.text.toString());
    if(userModel!=null && userModel.email!=null){
      Utility.showAlertDialog(context,'Status', 'Login Successfully ');
      databaseHelper.addBoolToSF(true);
    } else {
      Utility.showAlertDialog(context,'Status', 'Invalid email or password. ');
    }

  }



}
