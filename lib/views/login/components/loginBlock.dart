import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/HomeLayout/view.dart';
import 'package:jumiaa/views/forgetpass/view.dart';
import 'package:jumiaa/views/login/cubits/LoginController.dart';
import 'package:jumiaa/views/login/states/states.dart';
import 'package:jumiaa/views/login/widgets/forgetTextButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jumiaa/views/login/widgets/signButton.dart';
import 'package:jumiaa/widgets/textname.dart';


class LoginBlock extends StatefulWidget {

  @override
  _LoginBlockState createState() => _LoginBlockState();
}

class _LoginBlockState extends State<LoginBlock> {
  final formKey = GlobalKey<FormState>();

  TextEditingController _Emailcontroller = TextEditingController();
  TextEditingController _Passcontroller = TextEditingController();
  LoginController _loginController = LoginController();
  bool isPasswordShow = false;

  @override
  Widget build(BuildContext context) {
    final login = LoginController.of(context);

    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextName("Email", TextAlign.left, Colors.black, 16),
              TextFormField(
                controller: _Emailcontroller,
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
                  hintText: ("enter your email"),
                ),
              ),
              TextName("Password", TextAlign.left, Colors.black, 16),
              TextFormField(
                controller: _Passcontroller,
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
                        ? Icon(Icons.visibility_sharp, size: 20,)
                        : Icon(Icons.visibility_off, size: 20,),
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
            ],
          ),
        ),
        ForgetButton("LoginView.textname1".tr(), TextAlign.right,
            Colors.purple, ForgetView()),

        BlocBuilder(
          bloc: login,

          builder: (context, state) =>
          state is LoginLoading
              ? CircularProgressIndicator()
              : InkWell(
            onTap: () async {
              if (!formKey.currentState!.validate()) return;

              final message = await _loginController.login(
                  _Emailcontroller.text, _Passcontroller.text);
              if (message != 'ok') {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeLayout(),

                    ));
              }
            },
            child: SignButton("SIGN IN", Colors.pinkAccent),
          ),
        ),

      ],
    );
  }
}
