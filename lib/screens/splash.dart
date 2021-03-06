import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_ui_design/db/prefrences.dart';
import 'package:flutter_app_ui_design/resources/app_colors.dart';
import 'package:flutter_app_ui_design/screens/common_login.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async{

    var isLogin1 = await MyPref().getBoolValuesSF();

    if(isLogin1){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CommonLogin(),
          ));
    }

  }

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: new Duration(seconds: 2), vsync: this);
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Container(
            width: animation.value * 250,
            height: animation.value * 250,
            child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}
