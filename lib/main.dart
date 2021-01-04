import 'package:courses/models/courses/coursescontroller.dart';
import 'package:courses/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


void main() => runApp(MyApp());




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CoursesController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreens(),
      ),
    );
  }
}

//@Admin1admin
//AIzaSyA0fHCQQobSQBTWwJ6a5XgDX_mz0ZyxWbI
// ios = AIzaSyBIe4u5s9aP_hhKMBt2nZtajbCyaaAVOC0