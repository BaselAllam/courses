import 'package:flutter/material.dart';



responsiveHomeScrollItem(MediaQueryData data) {

  double _deivceHeight = data.size.height;

  if(_deivceHeight <= 550){
    return data.size.height/2;
  }
}