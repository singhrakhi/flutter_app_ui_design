import 'package:flutter/material.dart';
import 'package:flutter_app_ui_design/resources/app_colors.dart';
import 'package:flutter_app_ui_design/resources/strings.dart';
import 'package:flutter_app_ui_design/resources/text_styles.dart';
import 'package:flutter_app_ui_design/utils/constant.dart';
import 'package:flutter_app_ui_design/utils/device_size.dart';
import 'package:flutter_app_ui_design/utils/widget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                )
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [

                Text(Strings.heading,
                style: AppTextStyles.mainTextSize30,
                textAlign: TextAlign.center,),

                Container(
                  height: Constants.containerHeight,
                ),

                buttonWidget(context,Strings.sign_in,AppColors.buttonColor,AppTextStyles.buttonTextStyle),
                SizedBox(
                  height: 10,
                ),

                buttonWidget(context,Strings.sign_up,AppColors.white,AppTextStyles.blackButtonTextStyle),

              ],
            ),
          )
        ],

      ),
    );
  }
}

