import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/signup/states/states.dart';
class SignUpController extends Cubit<SignUpStates> {
  SignUpController of (context) =>BlocProvider.of(context);

  SignUpController() : super(SignUpIntial());
  Future <String> signUp(String email, String password ,String name ,String phone)async{
    emit(SignUpLoading());
    final response= await Dio().post('https://student.valuxapps.com/api/register',
    data: {'email':email,'password':password,'phone':phone,'name':name,},
        options: Options(validateStatus: (status) {
          return status! < 500;
        }));
    final data =response.data as Map;
    if (data.containsValue(true)) {
      return 'ok';
    }else {
      emit(SignUpIntial());
      return 'error';
    }


  }
}