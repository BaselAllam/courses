import 'package:courses/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:courses/models/courses/coursescontroller.dart';


class AddCourse extends StatefulWidget {
  @override
  _AddCourseState createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {

TextEditingController courseTitleController = TextEditingController();
TextEditingController courseDescriptionController = TextEditingController();
TextEditingController coursPriceController = TextEditingController();

GlobalKey<FormState> courseTitleKey = GlobalKey<FormState>();
GlobalKey<FormState> coursPriceKey = GlobalKey<FormState>();
GlobalKey<FormState> courseDescriptionKey = GlobalKey<FormState>();

final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4fb),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: 20.0),
        title: Text('Add Course',
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
              field(Icons.text_fields, 'course title', courseTitleController, courseTitleKey),
              field(Icons.text_fields, 'course description', courseDescriptionController, courseDescriptionKey),
              field(Icons.attach_money, 'course price', coursPriceController, coursPriceKey),
              Column(
                children: [
                  Builder(
                    builder: (BuildContext context) {
                      return ScopedModelDescendant(
                        builder: (context, child, CoursesController model){
                          return FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          color: Colors.black,
                          child: model.isCoursesLoading == true ? Center(child: Loading()) : Text(
                            'Add',
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
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            } else {
                              bool _valid = await model.addCourses(courseTitleController.text.toLowerCase(), courseDescriptionController.text, double.parse(coursPriceController.text));
                              if(_valid == true){
                                return Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('course added!'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              }else{
                                return Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text('some thing went wrong!'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              }
                            }
                          },
                        );
                        }
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
            labelText: label,
            labelStyle: TextStyle(color: Colors.black)),
        controller: controller,
      ),
    );
  }
}