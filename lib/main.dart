import 'package:flutter/material.dart';
import 'package:flutter_firestore_chat/page/home_page.dart';

import 'app_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.background,
        primaryColor: AppColor.primary,
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 20,
            color: AppColor.white,
          ),
          subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColor.textColor,
          ),
          subtitle2: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: AppColor.lightBlue,
          ),
          bodyText1: TextStyle(
            fontSize: 14,
            color: AppColor.textColor,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: AppColor.textColorLight,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
