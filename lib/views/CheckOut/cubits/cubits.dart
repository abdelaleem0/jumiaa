import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/CheckOut/models/models.dart';
import 'package:jumiaa/views/CheckOut/states/states.dart';

class CheckOutController extends Cubit<CheckOutStates> {
  CheckOutController() : super(CheckOutInit());

  static CheckOutController of(context)=> BlocProvider.of(context);

  Address? address;

  void selectAddress(Address value){
    address = value;
    emit(CheckOutInit());
  }

}