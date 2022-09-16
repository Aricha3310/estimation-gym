import 'package:flutter/material.dart';

class MyConstant {
  static String appName = 'Every Gym';

  static String routeFarmer = '/Farmer';
  static String routeCraeteaccount = '/Craeteaccount';
  static String routeProfile = '/Profilet';
  static String routeBmiPage = '/BmiPage';

  static String image1 = 'images/a.png';
  static String avatar = 'images/aa.png';

  static Color primary = const Color(0xff26a69a);
  static Color dart = const Color(0xff00766c);
  static Color light = const Color(0xff64d8cb);

  TextStyle h1Style() => TextStyle(
        fontSize: 28,
        color: dart,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2Style() => TextStyle(
        fontSize: 20,
        color: dart,
        fontWeight: FontWeight.w700,
      );
  TextStyle h3Style() => TextStyle(
        fontSize: 18,
        color: dart,
        fontWeight: FontWeight.normal,
      );

  ButtonStyle myButtonSyle() => ElevatedButton.styleFrom(
        primary: MyConstant.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: MyConstant.dart,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );
}

class Mystyle {
  Widget showProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
