import 'package:flutter/material.dart';



class Item extends StatefulWidget {

final String image;
final bool studying;

Item(this.image, this.studying);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(10.0),
      width: 250.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.fill
              ),
            ),
            height: 150.0
          ),
          Text(
            'Computer Science',
            style: TextStyle(color: Colors.indigo[600], fontSize: 18.0, fontWeight: FontWeight.bold, height: 2.0)
          ),
          Text(
            'Network & Programming\nLanguages',
            style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold, height: 1.0)
          ),
          checker()
        ],
      ),
    );
  }
  checker() {
    if(widget.studying == true){
      return Padding(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '4 of 9 Lessons',
              style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.normal)
            ),
            Container(
              height: 10.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                      ),
                    width: 25
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                      ),
                    width: 25
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }else{
      return Align(
        alignment: Alignment.bottomRight,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
            color: Colors.teal
          ),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Enroll',
              style: TextStyle(color: Colors.white, fontSize: 17.0)
            ),
          ),
        ),
      );
    }
  }
}