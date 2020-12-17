import 'package:courses/widgets/item.dart';
import 'package:flutter/material.dart';



class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

List image = [
  'assets/pic1.png', 'assets/pic2.png', 'assets/pic3.png',
  'assets/pic4.png', 'assets/pic5.png', 'assets/pic6.png',
];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4fb),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: 20.0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            return Navigator.pop(context);
          },
        ),
        title: Text(
          'Search Result',
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)
        ),
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: image.length,
          itemBuilder: (context, index){
            return Item(image[index], true);
          },
        ),
      ),
    );
  }
}