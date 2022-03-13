import 'package:astm/Pages/Input.dart';
import 'package:astm/Pages/Profile.dart';
import 'package:astm/Pages/Register.dart';
import 'package:astm/Pages/login.dart';
import 'package:flutter/material.dart';
import 'package:astm/Pages/Home.dart';
import 'package:astm/Pages/Chart.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => Login(),
      "/register": (context) => Register(),//Home(),
      "/home" : (context) => Home(),
      "/chart" : (context) => Chart(),
      "/input" : (context) => Input(),
      "/profile" : (context) => Profile(),
    },
  ));
}

