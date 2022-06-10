import 'package:flutter/material.dart';

class TextLogin extends StatelessWidget {
  late final String textnamebold;
  late final String textname;

  TextLogin(this.textnamebold,this.textname);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0,bottom: 50,right:20.0,left:5 ),
      child: Container(
        child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(textnamebold,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
                Text(textname,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black26,
                  ),)


              ],
            ),



      ),
    );
  }
}
