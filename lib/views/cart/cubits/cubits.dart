import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/cart/models/models.dart';
import 'package:jumiaa/views/cart/states/states.dart';

class CartCubit extends Cubit<CartState> {


  CartCubit() : super(CartInitial());

  static CartCubit of(context) => BlocProvider.of(context);
  CartModel? cartModel;

  Dio _dio = Dio();
  Future<void> function() async {
    print("............aaaaaaaaaaaaaaaaaaaa....");

    emit(CartLoading());
    final response =
    await _dio.get("https://student.valuxapps.com/api/carts" ,
        options: Options(
            headers: {'Authorization' : 'MOtiuPNROrGTbcj8CJagDRADZmJDQxdpG5gN4LmdKoc0rWknvtAV0cejEtzOwOq6lADaAW'}
        )
    );
    print(response.data);
    cartModel = CartModel.fromJson(response.data);
    // print(favouriteModel);
print(cartModel!.data!.toJson());
    emit(CartInitial());





  }
  Future<void> addCart(int x) async {
    print("............ffffffffffffffffffffffffffffffffff.......................");

    emit(CartLoading());
    final response =
    await _dio.post("https://student.valuxapps.com/api/carts",
        data: {"product_id":x},
        options: Options(
            headers: {'Authorization' : 'MOtiuPNROrGTbcj8CJagDRADZmJDQxdpG5gN4LmdKoc0rWknvtAV0cejEtzOwOq6lADaAW'}
        )

    );
    print(response.data);
function();
    // favouriteModel = FavouriteModel.fromJson(response.data);
    // print(favouriteModel);

    emit(CartInitial());





  }
}
