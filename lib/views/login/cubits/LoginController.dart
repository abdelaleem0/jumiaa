
 import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/login/states/states.dart';

class LoginController extends Cubit<LoginStates> {
  LoginController() : super(LoginIntial());
  static LoginController of (context) =>BlocProvider.of(context);
  Future<String> login(String email , String password)async{
    emit(LoginLoading());
    final response =await Dio().post('https://student.valuxapps.com/api/login',
     data: {'email':email ,'password':password,},
         options: Options(validateStatus: (status) {
           return status! < 500;
         })
     );
    print('='*8);
    final data =response.data as Map;
     // print('omaar, $data');
    if (data.containsValue(true)) {
      print(data);
      return 'ok';
    } else
      emit(LoginIntial());
    print(data);

    return '>>>>error>>>>';



  }
 }