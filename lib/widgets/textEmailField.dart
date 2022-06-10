import 'package:flutter/material.dart';

class TextEmailField extends StatelessWidget {
  GlobalKey<FormState> k1 = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,right:26,left:26 ),
      child: Container(

        child:Form(
          key: k1,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "validation";

              } else {
                return null;
              }
            },
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.black26),
              hintText: ("enter your email"),
            ),
          ),
        ),
      ),
    );
  }
}
