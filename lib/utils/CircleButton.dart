import 'package:flutter/material.dart';
import 'package:flutter_app_ui_design/resources/app_colors.dart';

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({Key key, this.onTap, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: AppColors.buttonColor.withOpacity(.6),
          shape: BoxShape.circle,
        ),
        child: new Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}