import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses/models/courses/coursesmodel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CoursesController extends Model{

  final String _domain = 'https://courses-e83e5-default-rtdb.firebaseio.com/';

  bool _isCoursesLoading = false;
  bool get isCoursesLoading => _isCoursesLoading;

  List<Courses> _allCourses = [];
  List<Courses> get allCourses => _allCourses;



  getCourses() async {

    _isCoursesLoading = true;
    notifyListeners();


    // Firestore.instance.collection('courses').getDocuments().then((QuerySnapshot snapshot) {
    //   snapshot.documents.forEach((i){
    //     Courses _newCourse = Courses(
    //       id: i.documentID,
    //       courseTitle: i['courseTitle'],
    //       courseDescription: i['courseDescription'],
    //       coursePrice: i['coursePrice'],
    //       courseImage: i['courseImage']
    //     );
    //     _allCourses.add(_newCourse);
    //   });
    // });

    http.Response _resposne = await http.get('$_domain.json');

    var _data = json.decode(_resposne.body);

    _data.forEach((x, i){
        Courses _newCourse = Courses(
          id: x,
          courseTitle: i['courseTitle'],
          courseDescription: i['courseDescription'],
          coursePrice: i['coursePrice'],
          courseImage: i['courseImage']
        );
        _allCourses.add(_newCourse);
      });


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

    // http.Response _response = await http.post('$_domain.json', body: json.encode(_newCourse));

    // if(_response.statusCode == 200){
    //   _isCoursesLoading = false;
    //   notifyListeners();
    //   return true;
    // }else{
    //   _isCoursesLoading = false;
    //   notifyListeners();
    //   return false;
    // }

    Firestore.instance.collection('courses').add(_newCourse);
    //Firestore.instance.collection('courses').where('courseTitle', isEqualTo: "Flutter Course");

    _isCoursesLoading = false;
    notifyListeners();

  }


  String _selectedCourseId;
  String get selectedCourseId => _selectedCourseId;

  Courses get selectedCourse{
    return _allCourses.firstWhere((Courses courses) {
      return courses.id == _selectedCourseId;
    });
  }

  getCourseId(String id) {
    return _selectedCourseId = id;
  }



  Future<bool> deleteCourse() async {

    _isCoursesLoading = true;
    notifyListeners();


    http.Response _response = await http.delete('$_domain/$_selectedCourseId.json');

    print(_response.statusCode);
    print(_response.body);

    if(_response.statusCode == 200){
      _allCourses.removeWhere((Courses courses) {
        return courses.id == _selectedCourseId;
      });
      _isCoursesLoading = false;
      notifyListeners();
      return true;
    }else{
      _isCoursesLoading = false;
      notifyListeners();
      return false;
    }

  }



}




// get courses
// add courses
// enroll courses
// unenroll courses