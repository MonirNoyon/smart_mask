import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shine/flutter_shine.dart';
import 'package:smartledmask/bluetooth.dart';
import 'package:smartledmask/onlinemask.dart';


class Home extends StatelessWidget {
  bool _ispressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.cyanAccent),
          ),
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            Center(
              child: SizedBox(
                height: 100,
                width: 300,
                child: Card(
                  elevation: 10,
                  color: Colors.black,
                  child: _glowEffect(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 120.0,
                    viewportFraction: 0.4,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.decelerate,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [0,1,2].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border:
                                    Border.all(color: Colors.cyanAccent, width: 2)),
                            child: GestureDetector(
                              onTap: (){
                                if(i==1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BluetoothApp(),
                                    ),
                                  );
                                }
                                else if(i==2){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SmartOnlineLed(),
                                    ),
                                  );
                                }
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _icon[i],
                                  SizedBox(height: 10,),
                                ],
                              ),
                            ));
                      },
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ));
  }

  Widget _submitButton() {
    return FlutterShine(
      builder: (BuildContext context, ShineShadow shineShadow) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              "JJARMSTRONG",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold,
                  shadows: shineShadow.boxShadows),
            ),
          ],
        );
      },
    );
  }

  Widget _glowEffect() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.pink, width: 3),
            boxShadow: [
              _ispressed
                  ? BoxShadow(
                      color: Colors.blue.withAlpha(100),
                      blurRadius: 45,
                      spreadRadius: 15,
                      offset: Offset(0, 0))
                  : BoxShadow()
            ],
            gradient: LinearGradient(
              colors: [Color(0x00000000), Color(0xFFE57373).withAlpha(15)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: _submitButton(),
        ),
      ),
    );
  }

  List _icon = [
    Icon(
      Icons.home,
      size: 40,
      color: Colors.cyanAccent,
    ),
    Icon(
      Icons.bluetooth_audio,
      size: 40,
      color: Colors.cyanAccent,
    ),
    Icon(
      Icons.online_prediction_outlined,
      size: 40,
      color: Colors.cyanAccent,
    ),
  ];
}
