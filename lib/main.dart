import 'package:flutter/material.dart';
import 'package:smartledmask/home.dart';
import 'package:smartledmask/onlinemask.dart';

void main(){
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

