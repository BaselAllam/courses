import 'package:courses/responsive/responsiveprofile.dart';
import 'package:flutter/material.dart';




class TabsItem extends StatefulWidget {

final List<String> titles;

TabsItem(this.titles);

  @override
  _TabsItemState createState() => _TabsItemState();
}

class _TabsItemState extends State<TabsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0)
      ),
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      width: MediaQuery.of(context).size.width/1.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.titles[0],
            style: TextStyle(color: Colors.black, fontSize: responsiveProfileItem(MediaQuery.of(context)), fontWeight: FontWeight.normal)
          ),
          Text(
            widget.titles[1],
            style: TextStyle(color: Colors.black, fontSize: responsiveProfileItem(MediaQuery.of(context)), fontWeight: FontWeight.normal)
          ),
          Text(
            widget.titles[2],
            style: TextStyle(color: Colors.black, fontSize: responsiveProfileItem(MediaQuery.of(context)), fontWeight: FontWeight.normal)
          ),
        ],
      ),
    );
  }
}