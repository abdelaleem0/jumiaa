import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/favourite/models/model.dart';
import 'package:jumiaa/views/favourite/states/states.dart';

class FavouriteCubit extends Cubit<FavouriteState> {


  FavouriteCubit() : super(FavouriteInitial());

  static FavouriteCubit of(context) => BlocProvider.of(context);
  FavouriteModel? favouriteModel;

  Dio _dio = Dio();
  final List listofFav = [];
  // late final int x;
  Future<void> function() async {
    print("............aaaaaaaaaaaaaaaaaaaa....");

    emit(FavouriteLoading());
    final response =
    await _dio.get("https://student.valuxapps.com/api/favorites" ,
      options: Options(
        headers: {'Authorization' : 'u0WFgG7TcqZfSBjld9RCv6nTBFp3FirVZznpKbRqomORKYiUKbKvMR7fqnv8GsjW3NPiuK'}
      )
    );
print(response.data);
    favouriteModel = FavouriteModel.fromJson(response.data);
    print("xxxxxxxccccccccccccccccccccccccccccccccccccccccssssssssffffffffffffffffffff");

    emit(FavouriteInitial());





  }
  Future<void> addFav(int x) async {
    print("............ffffffffffffffffffffffffffffffffff.......................");

    emit(FavouriteLoading());
    final response =
    await _dio.post("https://student.valuxapps.com/api/favorites",
      data: {"product_id":x},
        options: Options(
            headers: {'Authorization' : 'u0WFgG7TcqZfSBjld9RCv6nTBFp3FirVZznpKbRqomORKYiUKbKvMR7fqnv8GsjW3NPiuK'}
        )

    );
    print(response.data);

    // favouriteModel = FavouriteModel.fromJson(response.data);
    // print(favouriteModel);

    emit(FavouriteInitial());





  }
}
