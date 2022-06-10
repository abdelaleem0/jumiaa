import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/HomeLayout/view.dart';
import 'package:jumiaa/views/login/widgets/signButton.dart';
import 'package:jumiaa/views/signup/cubits/signUpController.dart';
import 'package:jumiaa/views/signup/states/states.dart';
import 'package:jumiaa/views/signup/widgets/textNameFiled.dart';
import 'package:jumiaa/widgets/textname.dart';

class SignUpBlock extends StatefulWidget {

  @override
  _SignUpBlockState createState() => _SignUpBlockState();
}

class _SignUpBlockState extends State<SignUpBlock> {
  final formKey2 = GlobalKey<FormState>();
  TextEditingController _Emailcontroller = TextEditingController();
  TextEditingController _Passcontroller = TextEditingController();
  SignUpController _signUpController = SignUpController();
  bool isPasswordShow = false;
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextName("Name", TextAlign.left, Colors.black, 16),
              TextNameField("name", TextInputType.name,_nameController),
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
              TextName("phone", TextAlign.left, Colors.black, 16),
              TextNameField("phone", TextInputType.number,_phoneController),
            ],
          ),
        ),
        BlocBuilder(
          bloc: SignUpController().of(context),
          builder: (context, state) =>state is SignUpLoading
              ? CircularProgressIndicator()

              : InkWell(
            onTap: () async {
              if (!formKey2.currentState!.validate()) return;

              final message = await _signUpController.signUp(
                  _Emailcontroller.text, _Passcontroller.text,_nameController.text,_phoneController.text);
              if (message != 'ok') {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              } else {
                // print(emailController.text * 9);
                // print(passwordController.text * 29);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeLayout(),
                    ));
              }
            },
            child:            SignButton("SIGN IN",Colors.pinkAccent),
          ),
        ),

      ],
    );
  }
}
