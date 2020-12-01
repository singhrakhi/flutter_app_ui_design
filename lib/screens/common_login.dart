import 'package:flutter/material.dart';
import 'package:flutter_app_ui_design/resources/app_colors.dart';
import 'package:flutter_app_ui_design/resources/strings.dart';
import 'package:flutter_app_ui_design/resources/text_styles.dart';
import 'package:flutter_app_ui_design/screens/login.dart';
import 'package:flutter_app_ui_design/screens/sign_up.dart';
import 'package:flutter_app_ui_design/utils/constant.dart';
import 'package:flutter_app_ui_design/utils/widget.dart';

class CommonLogin extends StatefulWidget {
  @override
  _CommonLoginState createState() => _CommonLoginState();
}

class _CommonLoginState extends State<CommonLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.jpg'),
                    fit: BoxFit.cover
                ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [

                  Text(Strings.heading,
                  style: AppTextStyles.headingTextItalic30,
                  textAlign: TextAlign.center,),

                  Container(
                    height: Constants.containerHeight,
                  ),

                  buttonWidget(context,Strings.sign_in,AppColors.buttonColor,AppTextStyles.buttonTextStyle,Login()),
                  SizedBox(
                    height: 10,
                  ),

                  buttonWidget(context,Strings.sign_up,AppColors.white,AppTextStyles.blackButtonTextStyle, SignUp()),
                  SizedBox(
                    height: 10,
                  ),

                  Text(Strings.or,
                    style: AppTextStyles.normalFont20,
                    textAlign: TextAlign.center,),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }




}

