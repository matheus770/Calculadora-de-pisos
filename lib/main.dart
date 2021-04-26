import 'package:floor_calculator/core/constants.dart';
import 'package:floor_calculator/core/theme_app.dart';
import 'package:floor_calculator/pages/calc_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: kAppTitle,
      theme: kAppTheme,
      home: CalculatorPage(),
    );
  }
}
