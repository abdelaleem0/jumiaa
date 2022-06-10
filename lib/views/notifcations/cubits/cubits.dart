import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/categroy/models/model.dart';
import 'package:jumiaa/views/notifcations/models/model.dart';
import 'package:jumiaa/views/notifcations/states/states.dart';

class NotificationsController extends Cubit<NotificationsStates> {
  NotificationsController() : super(NotificationsIntial());

  static NotificationsController of(context) => BlocProvider.of(context);
  Model? NotificationsModel;

  Dio _dio = Dio();

  Future<void> function() async {
    print("............ccccccccccccccccccccccccccccccccccccccc.......................");

    emit(NotificationsLoading());
    final response =
    await _dio.get("https://student.valuxapps.com/api/notifications",

    );

    NotificationsModel = Model.fromJson(response.data);
    print(NotificationsModel);

    emit(NotificationsIntial());





  }

}
