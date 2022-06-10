import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? type;

  final IconData? suffix;
  final String? labelText;
  final bool? isPassword;
  final bool? isHidden;
  final IconData? prefix;
  final bool? isPrefix;

  const CustomTextFormField({
    @required this.controller,
    this.type = TextInputType.text,
    this.prefix,
    this.suffix,
    @required this.labelText,
    this.isPassword = false,
    this.isHidden = false,
    this.isPrefix = true,
  }) ;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String errorMessage(String str) {
    switch (widget.labelText) {
      case 'First Name':
        return 'First name is empty!';
      case 'Last Name':
        return 'Last name is empty!';
      case 'Email':
        return 'Email is empty!';
      case 'Password':
        return 'Password is empty!';
    }
    return 'hi';
  }
  IconData suffix = Icons.visibility_off;
  bool isShown = true;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return errorMessage(widget.labelText);
      //   }
      //   return '';
      // },
      // obscureText: widget.labelText == 'Password' ? true : false,
        obscureText: widget.isPassword! ? visible : false,
        // obscureText: widget.isPassword ? LoginController().visible : false,
        controller: widget.controller,
        keyboardType: widget.type,
        cursorColor: Colors.red,
        cursorHeight: 25,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              widget.suffix,
            ),
            onPressed: () {
              setState(() {
                visible = !visible;
                isShown = !isShown;
                isShown
                    ? suffix = Icons.visibility
                    : suffix = Icons.visibility_off;
              });
            },
          ),
          // prefixIcon: Icon(widget.prefix),
          prefixIcon: widget.prefix != null
              ? Icon(
            widget.prefix,
            color: Colors.grey[600],
          )
              : null,
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: 15, color: Colors.grey[700]),
          focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        ));
  }
}
