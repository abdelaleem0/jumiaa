import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/edit_profile/cubits/cubits.dart';
import 'package:jumiaa/views/edit_profile/states/states.dart';
import 'package:jumiaa/views/signup/view.dart';
import 'package:jumiaa/views/signup/widgets/textNameFiled.dart';
import 'package:jumiaa/widgets/textEmailField.dart';
import 'package:jumiaa/widgets/textname.dart';

class homeViewSettings extends StatelessWidget {
  final TextEditingController _phoneController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        child:
            Column(
              children: [
                CircleAvatar(backgroundImage: AssetImage("assets/images/profile.jpg"),radius: 85,),
                SizedBox(height: 15,),

                TextName("abdealeem",TextAlign.center,Colors.black,25),
                SizedBox(height: 25,),
                // TextEmailField(),
                TextNameField(" your name",TextInputType.text,EditProfileController.of(context).nameController),
                TextNameField(" your phone",TextInputType.number,EditProfileController.of(context).phoneController ),
                TextNameField(" your email",TextInputType.text,EditProfileController.of(context).emailController),

                Padding(
                  padding: const EdgeInsets.only(top:50.0),

                  child: 
                  BlocBuilder(
                    bloc: EditProfileController.of(context),
  builder: (context, state) {
    return InkWell(
                    onTap: (){
                      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                      EditProfileController.of(context).update();
                      print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");

                    },
                      child: TextName("Edit profile",TextAlign.center,Colors.red,20));
  },
),
    
                ),
                
              ],
            )
      ) ,
);
  }
}
