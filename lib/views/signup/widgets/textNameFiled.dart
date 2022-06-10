import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextNameField extends StatelessWidget {
  GlobalKey<FormState> k1 = GlobalKey<FormState>();
  late final String hintname;
   final TextInputType _widgets;
   final TextEditingController _nameController;

  TextNameField(this.hintname,this._widgets,this._nameController);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,right:26,left:26 ),
      child: Container(
        child:Form(
          key: k1,
          child: TextFormField(
            controller: _nameController,
            keyboardType:_widgets,
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
              hintText: ("enter your"+hintname),
            ),
          ),
        ),
      ),
    );
  }
}
