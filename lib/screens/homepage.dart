import 'package:courses/widgets/item.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List image = [
  'assets/pic1.png', 'assets/pic2.png', 'assets/pic3.png',
  'assets/pic4.png', 'assets/pic5.png', 'assets/pic6.png',
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4fb),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5),
                child: Text(
                  'Hi Bassel',
                  style: TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold)
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5),
                child: Text(
                  'What would you like to learn\nToday... Search Below',
                  style: TextStyle(color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic)
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(10.0),
              color: Colors.white,
              child: ListTile(
                title: Text(
                  'Ex: Flutter Course',
                  style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.normal)
                ),
                trailing: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xff5369ff),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Icon(Icons.search, color: Colors.white, size: 20.0)
                ),
              ),
            ),
            scrollHeader('Studying'),
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              child: scrollItem(true),
            ),
            scrollHeader('New Courses'),
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              child: scrollItem(false),
            ),
          ],
        ),
      ),
    );
  }
  scrollHeader(String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.normal)
      ),
    );
  }
  scrollItem(bool studying) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: image.length,
      itemBuilder: (context, index){
        return Item(image[index], studying);
      },
    );
  }  
}