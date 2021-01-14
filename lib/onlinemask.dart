import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'boxdesign.dart';

class SmartOnlineLed extends StatefulWidget {
  @override
  _SmartOnlineLedState createState() => _SmartOnlineLedState();
}

class _SmartOnlineLedState extends State<SmartOnlineLed> {
  bool _ispressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.cyanAccent,
          ),
          centerTitle: true,
          title: Text(
            "Online Text",
            style: TextStyle(
              color: Colors.cyanAccent,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            SizedBox(height: 25,),
            Align(
              alignment: Alignment.topCenter,
              child: _currentText(),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextboxClass(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: _submitButton(),
              ),
            ),
            SizedBox(height: 10,)
          ],
        ));
  }

  Widget _currentText() {
    return ColorizeAnimatedTextKit(
      onTap: () {
        print("Tap Event");
      },
      text: [
        "Current Text Are",
        "shown in Here.",
      ],
      textStyle: TextStyle(fontSize: 30.0, fontFamily: "Horizon"),
      totalRepeatCount: 18,
      speed: Duration(milliseconds: 400),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      textAlign: TextAlign.start,
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _ispressed = !_ispressed;
        });
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            boxShadow: [
              _ispressed
                  ? BoxShadow(
                      color: Colors.blue.withAlpha(110),
                      blurRadius: 45,
                      spreadRadius: 15,
                      offset: Offset(0, 0))
                  : BoxShadow()
            ],
            gradient: LinearGradient(
              colors: [Color(0xFFFFF1000), Color(0xFF2508FF)],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            "Submit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
