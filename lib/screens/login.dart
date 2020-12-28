import 'package:courses/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:courses/screens/bottomnavbar/bottomnavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool secure = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4fb),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: 20.0),
        title: Text('Welcome',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              field(Icons.email, 'email', emailController, emailKey),
              field(Icons.lock, 'password', passwordController, passwordKey),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot Password?!',
                    style: TextStyle(height: 2.0),
                  ),
                ),
              ),
              Column(
                children: [
                  Builder(
                    builder: (BuildContext context) {
                      return FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        color: Colors.black,
                        child: Text(
                          'login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          if (!_formKey.currentState.validate()) {
                            return Scaffold.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('some fields required!'),
                                duration: Duration(seconds: 5),
                              ),
                            );
                          } else {
                            SharedPreferences _register = await SharedPreferences.getInstance();
                            _register.setString('email', emailController.text);
                            return Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) {
                              return BottomNavBar();
                            }));
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Text(
                        'Don\'t have an account ?!  ',
                        style: TextStyle(height: 2.0, fontWeight: FontWeight.bold, fontSize: 20.0, ),
                      ),
                    InkWell(
                      onTap: () {
                        return Navigator.push(context, MaterialPageRoute(builder: (_) {return SignUp();}));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(height: 2.0, fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  field(IconData icon, String label, TextEditingController controller, Key key) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextFormField(
        key: key,
        validator: (value) {
          if (value.isEmpty) {
            return 'this field required';
          }
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.grey, width: 0.5)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.grey, width: 0.5)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.black, width: 0.5)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.red, width: 0.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.green, width: 0.5)),
            prefixIcon: Icon(icon, color: Colors.green),
            suffixIcon: label == 'password'
                ? IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    color: Colors.black,
                    iconSize: 20.0,
                    onPressed: () {
                      setState(() {
                        secure = !secure;
                      });
                    },
                  )
                : null,
            labelText: label,
            labelStyle: TextStyle(color: Colors.black)),
        obscureText: label == 'password' ? secure : false,
        controller: controller,
      ),
    );
  }
}
