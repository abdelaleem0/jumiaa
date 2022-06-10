import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0,bottom: 25.0),
      child: Container(
      child: PinCodeTextField(
        keyboardType: TextInputType.number ,
        pinTheme: PinTheme(
          inactiveColor: Colors.white12,
          activeColor: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: Colors.white,
        length: 4,
        onChanged: (value) {},
        appContext: context,
        obscureText: false,
        cursorColor: Colors.white,
        boxShadows: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
            spreadRadius: 3,
          )
        ],
      ),

      ),
    );
  }
}
