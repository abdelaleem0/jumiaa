import 'package:flutter/material.dart';
import 'package:jumiaa/views/forgetpass/widgets/forgetButton.dart';
import 'package:jumiaa/views/login/widgets/loginImage.dart';
import 'package:jumiaa/widgets/textEmailField.dart';
import 'package:jumiaa/widgets/textname.dart';

class ForgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          ForgetPasswordImage(),
          TextName("Email", TextAlign.left, Colors.black,16),
          // TextEmailField(),
          ForgetButton(),
        ],
      ),
    );
  }
}
