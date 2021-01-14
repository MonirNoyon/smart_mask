import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class TestingMarquee extends StatefulWidget {
  @override
  _TestingMarqueeState createState() => _TestingMarqueeState();
}

class _TestingMarqueeState extends State<TestingMarquee> {
  bool _ispressed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: ListView(
        padding: EdgeInsets.only(top: 50.0),
        children: [
          _buildMarquee(),
          // _buildComplexMarquee(),
          _buildgui()
        ]
    ),
    );
  }

  Widget _buildMarquee() {
    return Marquee(
      text: 'Current Text are Shown in Here "',
      blankSpace: 40,
    );
  }

  Widget _buildComplexMarquee() {
    return Marquee(
      text: 'Some sample text that takes some space.',
      style: TextStyle(fontWeight: FontWeight.bold),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 20.0,
      velocity: 100.0,
      pauseAfterRound: Duration(seconds: 1),
      showFadingOnlyWhenScrolling: true,
      fadingEdgeStartFraction: 0.1,
      fadingEdgeEndFraction: 0.1,
      numberOfRounds: 3,
      startPadding: 10.0,
      accelerationDuration: Duration(seconds: 1),
      accelerationCurve: Curves.linear,
      decelerationDuration: Duration(milliseconds: 500),
      decelerationCurve: Curves.easeOut,
    );
  }

  Widget _wrapWithStuff(Widget child) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 50.0,
        color: Colors.transparent,
        child: child,
      ),
    );
  }

  Widget _buildgui() {
    return GestureDetector(
      onTap: () {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => TestingMarquee(), //MyApp in test page
//          ),
//        );
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
                      color: Colors.blue.withAlpha(190),
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
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
