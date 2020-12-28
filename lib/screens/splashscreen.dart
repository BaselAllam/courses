import 'package:courses/screens/bottomnavbar/bottomnavbar.dart';
import 'package:courses/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';



class SplashScreens extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {

String email;

checkUser() async {
  SharedPreferences _check = await SharedPreferences.getInstance();
  String _email = _check.getString('email');
  setState(() {
    email = _email;
  });
}

@override
void initState() {
  checkUser();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.white,
      loaderColor: Colors.green,
      loadingText: Text('Welcome'),
      seconds: 5,
      navigateAfterSeconds: email == null ? Login() : BottomNavBar(),
    );
  }
}