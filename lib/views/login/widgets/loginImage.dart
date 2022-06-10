import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 210,
      width: 900,
     child: Image.asset(

            "assets/images/shopping-girl-600w-294895643.jpg",),


    );
  }
}

class SignImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 170,
      width: 600,
      child:
     Image.asset(
            "assets/images/good-shop-logo-design-templategeek-600w-1039514440.jpg"),


    );
  }
}

class ForgetPasswordImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 210,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(

        "assets/images/download.jpg",),


    );
  }
}
