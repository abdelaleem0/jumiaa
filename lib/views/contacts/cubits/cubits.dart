import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/categroy/models/model.dart';
import 'package:jumiaa/views/contacts/models/model.dart';
import 'package:jumiaa/views/contacts/states/states.dart';
import 'package:jumiaa/views/notifcations/models/model.dart';
import 'package:jumiaa/views/notifcations/states/states.dart';

class ContactsController extends Cubit<ContactsStates> {
  ContactsController() : super(ContactsIntial());

  static ContactsController of(context) => BlocProvider.of(context);
  ContactsModel? contactsModel;

  Dio _dio = Dio();

  Future<void> function() async {
    print("............dddddddddddddddddddddddddddddddddddddddd.......................");

    emit(ContactsLoading());
    final response =
    await _dio.get("https://student.valuxapps.com/api/contacts",

    );

    contactsModel = ContactsModel.fromJson(response.data);
    print(contactsModel);

    emit(ContactsIntial());





  }

}
