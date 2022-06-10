import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  CustomTextField({this.controller,this.validator,this.hint});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      textAlign: TextAlign.left,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.black26),
        hintText: hint,
      ),
    );
  }
}
