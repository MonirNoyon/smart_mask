import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool _ispressed = true;

  @override
  Widget build(BuildContext context) {
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
