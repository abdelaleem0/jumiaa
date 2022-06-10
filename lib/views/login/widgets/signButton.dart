import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  late final String name;
  late final Color c;

  SignButton( this.name,this.c,);

  @override
  Widget build(BuildContext context) {
    return

      Padding(
        padding: const EdgeInsets.only(bottom:30,top: 40.0,right: 15,left: 20),
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(color: Colors.black38,
                  blurRadius: 2)
            ] ,
            color: c,
          ),
          width: 400,
          height: 55,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text(name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),




            ],
          ),

        ),

      );
  }
}
