import 'package:flutter/material.dart';
import 'package:jumiaa/views/login/widgets/loginImage.dart';
import 'package:jumiaa/widgets/loginText.dart';
import 'package:jumiaa/widgets/textEmailField.dart';
import 'package:jumiaa/widgets/textPassField.dart';
import 'package:jumiaa/widgets/textname.dart';

class TextFields extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextName("Email",TextAlign.left,Colors.black,16),
        TextEmailField(),
        TextName("Password",TextAlign.left,Colors.black,16),
        TextPassField(),
      ],
    );
  }
}
