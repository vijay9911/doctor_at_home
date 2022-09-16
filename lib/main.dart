import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:base_project_flutter/constants/constants.dart';
import 'package:base_project_flutter/constants/imageConstant.dart';
import 'package:base_project_flutter/views/logiPage/loginPage.dart';
import 'package:base_project_flutter/views/onBoardingpage/onBoardingPage.dart';
import 'package:base_project_flutter/views/otpPage/otpPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          color: tPrimaryColor,
          title: 'Healerr Doctor At Home',
          debugShowCheckedModeBanner: false,
          //suseInheritedMediaQuery: true,
          theme: ThemeData(
            textTheme: GoogleFonts.muliTextTheme(
              Theme.of(context).textTheme,
            ),
            //  GoogleFonts.latoTextTheme(
            //   // Theme.of(context).textTheme,
            // ),
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: AnimatedSplashScreen(
              duration: 1000,
              splash: Image.asset(Images.LOGO,scale: 3.7,),
              splashIconSize: 300,
              nextScreen: LoginPage(),
              splashTransition: SplashTransition.scaleTransition,
              backgroundColor: Colors.white),
        );
      },
    );
  }
}
