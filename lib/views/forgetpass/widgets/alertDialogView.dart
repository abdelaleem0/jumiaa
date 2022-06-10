
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jumiaa/views/forgetpass/widgets/confirmButton.dart';
import 'package:jumiaa/views/forgetpass/widgets/confirmCodeText.dart';
import 'package:jumiaa/views/forgetpass/widgets/pincodeFiled.dart';


class AlertDialogView extends StatefulWidget {
  @override
  _AlertDialogState createState() => _AlertDialogState();
}

class _AlertDialogState extends State<AlertDialogView> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(


        height: MediaQuery.of(context).size.height/3,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            ConfirmCodeText(),
            PinCodeField(),
            ConfirmButton(),
          ],
        ),
      ),
    );
  }
}
