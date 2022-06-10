


import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/edit_profile/states/states.dart';

class EditProfileController extends Cubit<EditProfileStates> {
  EditProfileController() : super(EditProfileInit());
  static EditProfileController of(context) => BlocProvider.of(context);
  File? file;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Dio dio=Dio();
 @override
  Future<void> update() async{
   emit(EditProfileLoading());
   print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaqqqqqqqqqqq");
   final formData = {
     "name": nameController.text,
     "phone": phoneController.text,
     "email": emailController.text,
     "password": "123456",
     // if (file != null)
       "image": "assets/images/profile.jpg"
   };

   final response =await Dio().put('https://student.valuxapps.com/api/update-profile',
       data: formData,
     options:Options(
         headers: {
           'Authorization':'u0WFgG7TcqZfSBjld9RCv6nTBFp3FirVZznpKbRqomORKYiUKbKvMR7fqnv8GsjW3NPiuK',

         }
       //
       //
     ),
   );
   print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
   emit(EditProfileInit());



 }
  @override
  Future<void> close() {
    nameController.dispose();
    phoneController.dispose();
    return super.close();
  }

}