import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:suda_courses/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suda Courses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(
        seconds: 14,
        navigateAfterSeconds: new LoginPage(),
        title: new Text(
          'Sudan Course',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: 'Cairo'),
        ),
        image: new Image.asset('assets/imgs/logo.svg'),
        gradientBackground: new LinearGradient(
            colors: [Color(0xffff3a5a), Color(0xfffe494d)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () {},
        loaderColor: Colors.blue,
      ),
    );
  }
}
