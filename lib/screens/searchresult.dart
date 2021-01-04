import 'package:courses/widgets/item.dart';
import 'package:courses/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:courses/models/courses/coursescontroller.dart';


class SearchResult extends StatefulWidget {

final CoursesController model;

SearchResult(this.model);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

@override
void initState() {
  widget.model.getCourses();
  super.initState();
}

@override
void dispose() {
  widget.model.allCourses.clear();
  super.dispose();
}
  
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
      body: ScopedModelDescendant(
        builder: (context, child, CoursesController model){
          if(model.isCoursesLoading == true){
            return Center(child: Loading());
          }else if(model.allCourses.length < 1){
            return Center(child: Text('no courses found'));
          }else{
            return Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: model.allCourses.length,
                itemBuilder: (context, index){
                  return Item(
                    model.allCourses[index].courseImage,
                    true,
                    model.allCourses[index].courseTitle,
                    model.allCourses[index].courseDescription
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}