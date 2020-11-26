import 'package:flutter/material.dart';
import 'package:flutter_app_ui_design/screens/home.dart';
import 'package:flutter_app_ui_design/screens/splash.dart';
import 'package:flutter_app_ui_design/utils/custom_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch:CustomColors.createMaterialColor(Color(0xFF292D37)),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
