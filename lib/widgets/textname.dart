import 'package:flutter/material.dart';

class TextName extends StatelessWidget {
  late final String textname;
  late  var textalign;
  late final double fontsize;
  late final Color _color;

  TextName(this.textname,this.textalign,this._color,this.fontsize);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:26,left:15 ),
      child: Text(textname,
        textAlign:textalign ,
        style: TextStyle(
          fontSize: fontsize,
          color: _color,

        ),),
    );






  }
}
