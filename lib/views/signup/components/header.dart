import 'package:flutter/material.dart';
import 'package:jumiaa/views/login/widgets/loginImage.dart';
import 'package:jumiaa/widgets/loginText.dart';
import 'package:jumiaa/widgets/textname.dart';

class SignupHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SignImage(),
        TextLogin("SIGN UP","Sign up to continue"),
      ],
    );
  }
}
