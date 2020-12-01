
import 'package:flutter/material.dart';
import 'package:flutter_app_ui_design/resources/app_colors.dart';
import 'package:flutter_app_ui_design/resources/text_styles.dart';
import 'package:flutter_app_ui_design/screens/login.dart';

import 'constant.dart';
import 'device_size.dart';

Widget buttonWidget(BuildContext context, String name, Color color, TextStyle textStyle, var route){
   return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: Constants.buttonPadding),
      child: SizedBox(
        width: DeviceSize.width(context),
        height: 55,
        child: FlatButton(
          onPressed: (){
            navigationPage(context, route);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(Constants.borderRadius)),
          ),
          color: color.withOpacity(0.4),
          child: Text(
           name,
            style:textStyle,
          ),
        ),
      ),
    );

}

void navigationPage(BuildContext context, var login ) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => login,
      ));
}

void navigationPushReplacePage(BuildContext context, var login ) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => login,
      ));
}
