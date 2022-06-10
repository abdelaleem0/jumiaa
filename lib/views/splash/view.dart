import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jumiaa/views/login/view.dart';

class Splashiew extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<Splashiew> {
  @override
  void initState() {
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Center(
          child: CircleAvatar(

            backgroundImage: AssetImage( "assets/images/splash.jpg"),
            maxRadius: 180,
          )),
    );
  }
}
