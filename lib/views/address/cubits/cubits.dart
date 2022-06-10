import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/address/models/models.dart';
import 'package:jumiaa/views/address/states/states.dart';

class AddressCubit extends Cubit<AddressState> {


  AddressCubit() : super(AddressInitial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController notesController = TextEditingController();


  static AddressCubit of(context) => BlocProvider.of(context);
  GetAddressModel? addressModel;

  Dio _dio = Dio();
  Future<void> getAddress() async {
    print("............zzzzzzzzzzzzzzzzzzzzzzzz...................");

    emit(AddressLoading());
    final response =
    await _dio.get("https://student.valuxapps.com/api/addresses" ,
        options: Options(
            headers: {'Authorization' : 'kJPenGkRI4EyT62hOo7K9v52ImpPcGiLHO7VyW7RvMTJZBZAIeOQjqjRMS3UEtmOvZbLgL'}
        )
    );
    print(response.data);
    addressModel = GetAddressModel.fromJson(response.data);
    // print(favouriteModel);
    print(addressModel!.data!.toJson());
    emit(AddressInitial());





  }
  Future<void> addAddress() async {
    print("............ffffffffffffffffffffffffffffffffff.......................");

    emit(AddressLoading());
    final response =
    await _dio.post("https://student.valuxapps.com/api/addresses",
        data: {
          'name': nameController.text,
          'city': cityController.text,
          'region': regionController.text,
          'notes': notesController.text,
          'details': detailsController.text,
          'latitude': 0,
          'longitude': 0,
        },
        options: Options(
            headers: {'Authorization' : 'kJPenGkRI4EyT62hOo7K9v52ImpPcGiLHO7VyW7RvMTJZBZAIeOQjqjRMS3UEtmOvZbLgL'}
        )

    );
    print(response.data);
     getAddress();
    // favouriteModel = FavouriteModel.fromJson(response.data);
    // print(favouriteModel);

    emit(AddressInitial());





  }
  Future<void> update(int id) async {
    print("............xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.......................");

    emit(AddressLoading());
    final response =
    await _dio.put("https://student.valuxapps.com/api/addresses/$id",
        data: {
          'name': nameController.text,
          'city': cityController.text,
          'region': regionController.text,
          'notes': notesController.text,
          'details': detailsController.text,
          'latitude': 0,
          'longitude': 0,
        },
        options: Options(
            headers: {'Authorization' : 'kJPenGkRI4EyT62hOo7K9v52ImpPcGiLHO7VyW7RvMTJZBZAIeOQjqjRMS3UEtmOvZbLgL'}
        )

    );
    print(response.data);
     getAddress();
    // favouriteModel = FavouriteModel.fromJson(response.data);
    // print(favouriteModel);

    emit(AddressInitial());





  }
}
