import 'dart:io';

import 'package:courses/screens/addCourse.dart';
import 'package:courses/widgets/tabsitem.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

PickedFile pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4fb),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: 200.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 5.0),
                    image: DecorationImage(
                      image: pickedImage == null ? AssetImage('assets/pic5.png') : AssetImage(pickedImage.path),
                      fit: BoxFit.fill
                    ),
                  ),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(Icons.add_a_photo),
                    color: Colors.black,
                    iconSize: 30.0,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(),
                        backgroundColor: Colors.white,
                        builder: (BuildContext context){
                          return Column(
                            children: [
                              ListTile(
                                title: Text('Camera',
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                                  ),
                                ),
                                trailing: Icon(Icons.camera, color: Colors.black, size: 20.0),
                                onTap: () {
                                  pickImage(ImageSource.camera);
                                }
                              ),
                              ListTile(
                                title: Text('Gallery',
                                  style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                                  ),
                                ),
                                trailing: Icon(Icons.album, color: Colors.black, size: 20.0),
                                onTap: () {
                                  pickImage(ImageSource.gallery);
                                }
                              ),
                            ],
                          );
                        }
                      );
                    },
                  )
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Essam',
                    style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '13330 XP',
                    style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold)
                  ),
                ),
                Column(
                  children: [
                    TabsItem(['BADGES', 'SCORES', 'FRIENDS'])
                  ],
                ),
              ],
            ),
            FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.black,
                  child: Text(
                    'Add Course',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    return Navigator.push(context, MaterialPageRoute(builder: (_) {return AddCourse();}));
                  }
                ),
            Column(
              children: [
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.black,
                  child: Text(
                    'logout',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    SharedPreferences _register = await SharedPreferences.getInstance();
                    _register.clear();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  pickImage(ImageSource source) async {
    var _pickedImage = await ImagePicker().getImage(source: source);
    setState(() {
      pickedImage = _pickedImage;
    });
  }
}