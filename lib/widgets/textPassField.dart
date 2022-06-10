import 'package:flutter/material.dart';

class TextPassField extends StatefulWidget {

  @override
  _TextEmailFieldState createState() => _TextEmailFieldState();
}

class _TextEmailFieldState extends State<TextPassField> {
  GlobalKey<FormState> k1 = GlobalKey<FormState>();

  bool isPasswordShow = false;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:15,right:26,left:26 ),
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
            obscureText: isPasswordShow,

            decoration: InputDecoration(
              suffix: IconButton(
                icon: isPasswordShow
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isPasswordShow = !isPasswordShow;
                  });
                },
              ),

              hintStyle: TextStyle(color: Colors.black26),
              hintText: ("enter your Password"),
            ),
          ),
        ),
      ),
    );
  }
}
 class VisaTextFiled extends StatefulWidget {
  final String? hintText;
  VisaTextFiled(this.hintText);

   @override
   _VisaTextFiledState createState() => _VisaTextFiledState();
 }

 class _VisaTextFiledState extends State<VisaTextFiled> {
   GlobalKey<FormState> k1 = GlobalKey<FormState>();

   bool isPasswordShow = false;


   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(bottom:15,right:26,left:26 ),
       child: Container(

         child:Form(
           key: k1,
           child: TextFormField(
             keyboardType:TextInputType.number,
             validator: (value) {
               if (value!.isEmpty) {
                 return "validation";

               } else {
                 return null;
               }
             },
             textAlign: TextAlign.left,
             obscureText: isPasswordShow,

             decoration: InputDecoration(
               suffix: IconButton(
                 icon: isPasswordShow
                     ? Icon(Icons.visibility)
                     : Icon(Icons.visibility_off),
                 onPressed: () {
                   setState(() {
                     isPasswordShow = !isPasswordShow;
                   });
                 },
               ),

               hintStyle: TextStyle(color: Colors.black26),
               hintText: (widget.hintText),
             ),
           ),
         ),
       ),
     );
   }
 }
