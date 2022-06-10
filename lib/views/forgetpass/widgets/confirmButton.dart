import 'dart:async';

import 'package:flutter/material.dart';

class ConfirmButton extends StatefulWidget {


  @override
  _ConfirmButtonState createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  late Timer _timer;

  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child:
      Column(
        children: [
          Row(
            children: [
              Text(
                "you can resend code after",
              ),
              Text(
                "$_start"+"sec",
                style: TextStyle(
                  color: Colors.indigo,
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: MaterialButton(
              color: Colors.indigo,
              onPressed: () {
                startTimer();
              },
              child: Center(
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),


    );
  }
}
