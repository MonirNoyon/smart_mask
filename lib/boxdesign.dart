import 'package:flutter/material.dart';

class TextboxClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      autofocus: true,
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 20,
      ),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red,width: 3.0)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyanAccent,width: 3)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
      ),
    );
  }
}
