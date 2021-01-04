import 'package:courses/screens/bottomnavbar/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool secure = true;
  bool confimrSecure = true;

  DateTime pickedDate = DateTime.now();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  GlobalKey<FormState> confirmPasswordKey = GlobalKey<FormState>();

  final _formKey = GlobalKey<FormState>();

  String gender = 'Select Gender';

  bool terms = false;


  Position position;

  bool isMapLoading = true;

  @override
  void initState() {
    getCurrentPosition();
    super.initState();
  }


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
              field(Icons.email, 'email', emailController, emailKey, null, false),
              field(Icons.lock, 'password', passwordController, passwordKey, passwordButton(
                () {
                  setState(() {
                    secure = !secure;
                  });
                }
              ),
              secure
              ),
              field(Icons.lock, 'confirm password', confirmPasswordController, confirmPasswordKey, passwordButton(
                () {
                  setState(() {
                    confimrSecure = !confimrSecure;
                  });
                }
              ),
              confimrSecure
              ),
              Container(
                height: 100.0,
                margin: EdgeInsets.all(10.0),
                child: isMapLoading == true ? 
                Center(child: CircularProgressIndicator()) :
                 GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 12
                  ),
                  mapType: MapType.normal,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                ),
              ),
              data('Birth Date', '${pickedDate.toString().substring(0, 10)}', Icon(Icons.date_range, color: Colors.black, size: 20.0),
              () async {
                  var _pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1890),
                    lastDate: DateTime.now(),
                  );
                  if(_pickedDate == null){
                    setState(() {
                      pickedDate = DateTime.now();
                    });
                  }else{
                  setState(() {
                    pickedDate = _pickedDate;
                  });
                  }
                }
              ),
              data(
                'Gender',
                gender,
                PopupMenuButton(
                  icon: Icon(Icons.arrow_drop_down, color: Colors.black, size: 20.0),
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      PopupMenuItem(
                        child: Text('Male'),
                        value: 'Male'
                      ),
                      PopupMenuItem(
                        child: Text('Female'),
                        value: 'Female'
                      ),
                    ];
                  },
                  onSelected: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                null
              ),
              data('Terms & Conditions', 'Read Our Terms & Conditions',
              Checkbox(
                activeColor: Colors.green,
                checkColor: Colors.white,
                value: terms,
                onChanged: (value) {
                  if(terms == false){
                    return Scaffold.of(context).showSnackBar(
                      snack('please read our terms & conditions')
                    );
                  }else{
                    setState(() {
                      terms = value;
                    });
                  }
                },
              ),
              () {
                setState(() {
                  terms = true;
                });
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.white,
                  builder: (BuildContext context){
                    return ListTile(
                      title: Text('Our Terms & Conditions',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        'your data isnot safe, try to uninstall this app,\n we hack your camera and take all pictures and sell it to hackers',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    );
                  }
                );
              }
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
                          'Sign up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return Scaffold.of(context).showSnackBar(
                              snack('somefields required')
                            );
                          }else if(passwordController.text != confirmPasswordController.text){
                            return Scaffold.of(context).showSnackBar(
                              snack('password dont matched')
                            );
                          }else {
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
            ],
          ),
        ),
      ),
    );
  }
  data(String title, String subtitle, Widget trailing, Function onTap) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(title,
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold
            ),
          ),
        subtitle: Text(subtitle,
          style: TextStyle(color: subtitle == 'Female' ? Colors.red : subtitle == 'Male' ? Colors.green : Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold
            ),
          ),
        trailing: trailing,
        onTap: onTap
      ),
    );
  }
  passwordButton(Function onTap) {
    return IconButton(
      icon: Icon(Icons.remove_red_eye),
      color: Colors.black,
      iconSize: 20.0,
      onPressed: onTap
    );
  }
  snack(String contetn) {
    return SnackBar(
      backgroundColor: Colors.red,
      content: Text(contetn),
      duration: Duration(seconds: 5),
    );
  }
  field(IconData icon, String label, TextEditingController controller, Key key, Widget suffixButton, bool secureValue) {
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
            suffixIcon: suffixButton,
            labelText: label,
            labelStyle: TextStyle(color: Colors.black)),
        obscureText: secureValue,
        controller: controller,
      ),
    );
  }
  getCurrentLocation() async {

    setState(() {
      isMapLoading = true;
    });

    var _position = await Geolocator.getCurrentPosition();
    setState(() {
      position = _position;
      isMapLoading = false;
    });
  }
}