import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jumiaa/views/signup/view.dart';

class TextButtonName extends StatelessWidget {
  late final String textname0;
  late final String textname2;
  late final Color _colors;
  late final Widget _widget;
  // late  var dircation;


  TextButtonName(this.textname0,this.textname2,this._colors,this._widget);

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(textname0,



      style: TextStyle(
        fontSize: 16,

      ),
    ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>_widget));

          },
          child: Text(textname2,
            style: TextStyle(
              color: _colors,
              fontSize: 16,

            ),
          ),
        ),

      ],
    );







  }
}
