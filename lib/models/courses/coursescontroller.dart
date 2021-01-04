import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses/models/courses/coursesmodel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CoursesController extends Model{


  bool _isCoursesLoading = false;
  bool get isCoursesLoading => _isCoursesLoading;

  List<Courses> _allCourses = [];
  List<Courses> get allCourses => _allCourses;



  getCourses() async {

    _isCoursesLoading = true;
    notifyListeners();


    Firestore.instance.collection('courses').getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((i){
        Courses _newCourse = Courses(
          courseTitle: i['courseTitle'],
          courseDescription: i['courseDescription'],
          coursePrice: i['coursePrice'],
          courseImage: i['courseImage']
        );
        _allCourses.add(_newCourse);
      });
    });

    // http.Response _resposne = await http.get('https://courses-e83e5-default-rtdb.firebaseio.com/.json');

    // var _data = json.decode(_resposne.body);

    // _data.forEach((i){
    //     Courses _newCourse = Courses(
    //       courseTitle: i['courseTitle'],
    //       courseDescription: i['courseDescription'],
    //       coursePrice: i['coursePrice'],
    //       courseImage: i['courseImage']
    //     );
    //     _allCourses.add(_newCourse);
    //   });


    _isCoursesLoading = false;
    notifyListeners();
  }



  Future<bool> addCourses(String courseTitle, String courseDescription, double coursePrice) async {

    _isCoursesLoading = true;
    notifyListeners();

    Map<String, dynamic> _newCourse = {
      'courseTitle' : courseTitle,
      'courseDescription' : courseDescription,
      'coursePrice' : coursePrice
    };

    http.Response _response = await http.post('https://courses-e83e5-default-rtdb.firebaseio.com/.json', body: json.encode(_newCourse));

    if(_response.statusCode == 200){
      _isCoursesLoading = false;
      notifyListeners();
      return true;
    }else{
      _isCoursesLoading = false;
      notifyListeners();
      return false;
    }

    //Firestore.instance.collection('courses').add(_newCourse);
    //Firestore.instance.collection('courses').where('courseTitle', isEqualTo: "Flutter Course");

    _isCoursesLoading = false;
    notifyListeners();

  }



}




// get courses
// add courses
// enroll courses
// unenroll courses