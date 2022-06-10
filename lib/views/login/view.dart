import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/HomeLayout/view.dart';
import 'package:jumiaa/views/forgetpass/view.dart';
import 'package:jumiaa/views/home/view.dart';
import 'package:jumiaa/views/login/components/loginBlock.dart';
import 'package:jumiaa/views/login/components/header.dart';
import 'package:jumiaa/views/login/cubits/LoginController.dart';
import 'package:jumiaa/views/login/states/states.dart';
import 'package:jumiaa/views/login/widgets/signButton.dart';
import 'package:jumiaa/views/signup/view.dart';
import 'package:jumiaa/views/login/widgets/forgetTextButton.dart';
import 'package:jumiaa/widgets/textButtonColor.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jumiaa/widgets/textname.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  // final formKey = GlobalKey<FormState>();
  // TextEditingController _Emailcontroller = TextEditingController();
  // TextEditingController _Passcontroller = TextEditingController();
  // LoginController _loginController = LoginController();
  bool isPasswordShow = false;


  @override
  Widget build(BuildContext context) {
    // final login = LoginController.of(context);

    return BlocProvider(
      create: (context) => LoginController(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            LoginHeader(),
            LoginBlock(),
            TextButtonName("Dont have an Accont? ", "Sign up",
                Colors.purpleAccent, SignUpView()),
          ],
        ),
      ),
    );
  }
}
// TextButtonName("","forget Password ?",Colors.purpleAccent,ForgetView(),MainAxisAlignment.end),
