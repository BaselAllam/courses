import 'package:flutter/material.dart';



responsiveProfileItem(MediaQueryData data) {

  double _deivcewidth = data.size.width;

  if(_deivcewidth <= 330){
    return 15.0;
  }
}



responsiveCoursesGridItem(MediaQueryData data) {

  double _deivceHeight = data.size.height;

  if(_deivceHeight <= 550){
    return 0.55;
  }
}