import 'package:courses/widgets/item.dart';
import 'package:flutter/material.dart';



class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> with TickerProviderStateMixin {

TabController tabController;

@override
void initState(){
  tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4fb),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Courses',
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)
        ),
        bottom: PreferredSize(
          preferredSize: Size(0.0, 40.0),
          child: TabBar(
            tabs: [
              Text('Studying'),
              Text('Saved'),
            ],
            controller: tabController,
            indicator: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.black, width: 1.0)
            ),
            labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
            unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
            indicatorColor: Colors.transparent,
            labelColor: Colors.transparent,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: TabBarView(
          controller: tabController,
          children: [
            Studying(),
            Saved()
          ],
        )
      ),
    );
  }
}




class Studying extends StatefulWidget {
  @override
  _StudyingState createState() => _StudyingState();
}

class _StudyingState extends State<Studying> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index){
          return Item('https://firebasestorage.googleapis.com/v0/b/courses-e83e5.appspot.com/o/images%2Fpic2.png?alt=media&token=aff63dcd-be8c-4871-970e-f2c66bc91124', true, 'title', 'description');
        },
      ),
    );
  }
}




class Saved extends StatefulWidget {
  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6
        ),
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index){
          return Item('https://firebasestorage.googleapis.com/v0/b/courses-e83e5.appspot.com/o/images%2Fpic2.png?alt=media&token=aff63dcd-be8c-4871-970e-f2c66bc91124', false, 'title', 'description');
        },
      ),
    );
  }
}