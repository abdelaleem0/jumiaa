import 'package:flutter/material.dart';
import 'package:jumiaa/widgets/customTextFormField.dart';
import 'package:jumiaa/widgets/textPassField.dart';

class VisaView extends StatefulWidget {

  @override
  _VisaViewState createState() => _VisaViewState();
}

class _VisaViewState extends State<VisaView> {
  TextEditingController visaController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Image.asset("assets/images/Visa.png"),
          VisaTextFiled(" Name"),
          VisaTextFiled("Visa number"),
          Row(
            children:[
              Container(
              width: 180,
              child: VisaTextFiled("Expiration"),
            ),
              Container(
              width: 180,
              child: VisaTextFiled("cvc"),
            ),
      ]
          ),
          SizedBox(height: 25,),
          Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
              color: Colors.white70,
            ),

            child: TextButton(onPressed: (){

            }, child: Text("Pay")),
          )
        ],
    ),
    );
  }
}
