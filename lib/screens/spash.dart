import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TextLiquidFill(
          waveDuration: Duration(milliseconds: 800),
          text: 'M',
          waveColor: Colors.black,
          boxBackgroundColor: Colors.white,
          textStyle: GoogleFonts.turretRoad(
            fontSize: 200,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
