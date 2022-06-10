import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/homeSearch/models/model.dart';
import 'package:jumiaa/views/homeSearch/states/states.dart';

class SearchController extends Cubit<searchStates> {
  SearchController() : super(SearchIntil());
TextEditingController Searchcontroller=TextEditingController();
  static SearchController of(context) => BlocProvider.of(context);


  Dio _dio = Dio();
  Model? SearchModel;

  Future<void> function() async {
    print("............bbbbbbbbbbbbbbbbbbbb.......................");

    emit(SearchLoading());
    final response =
    await _dio.post("https://student.valuxapps.com/api/products/search",

      data: {'text':Searchcontroller.text},


    );
    print(response);
    SearchModel = Model.fromJson(response.data);
    print(SearchModel);


    emit(SearchIntil());






  }

}
