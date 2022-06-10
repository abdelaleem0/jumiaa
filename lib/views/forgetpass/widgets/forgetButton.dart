import 'package:flutter/material.dart';
import 'package:jumiaa/views/forgetpass/widgets/alertDialogView.dart';

class ForgetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.deepPurple, blurRadius: 6)],
        color: Colors.indigo,
      ),
      child: MaterialButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialogView(),
          );
        },
        child: Text(
          "Reset your password",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
