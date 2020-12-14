import 'package:courses/widgets/tabsitem.dart';
import 'package:flutter/material.dart';



class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                      image: AssetImage('assets/pic5.png'),
                      fit: BoxFit.fill
                    ),
                  ),
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
          ],
        ),
      ),
    );
  }
}