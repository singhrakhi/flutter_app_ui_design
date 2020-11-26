
import 'package:flutter/material.dart';
import 'package:flutter_app_ui_design/resources/app_colors.dart';
import 'package:flutter_app_ui_design/resources/text_styles.dart';

import 'constant.dart';
import 'device_size.dart';

Widget buttonWidget(BuildContext context, String name, Color color, TextStyle textStyle){
   return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: Constants.buttonPadding),
      child: SizedBox(
        width: DeviceSize.width(context),
        height: Constants.buttonHeight,
        child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(Constants.borderRadius)),
          ),
          color: color,
          child: Text(
           name,
            style:textStyle,
          ),
        ),
      ),
    );


}