import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/CheckOut/checkOutView.dart';
import 'package:jumiaa/views/cart/cubits/cubits.dart';
import 'package:jumiaa/views/cart/states/states.dart';
import 'package:jumiaa/views/choeseAdress/chosesAaddressView.dart';
import 'package:jumiaa/views/prodductDetails/cubits/cubits.dart';

class CartView extends StatefulWidget {

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Center(child: Text("Carts",
          style: TextStyle(
            color: Colors.black
          ),)),
        ),
        elevation: 0.0,
        backgroundColor:  Color(0xffe9ecee),

      ),
      body: BlocBuilder(
          bloc: CartCubit.of(context),
          builder: (context, state) =>state is CartLoading ?Text("looding")
              : CartCubit.of(context).cartModel == null ? Text('Empty') : RefreshIndicator(
            onRefresh: CartCubit.of(context).function,
                child: ListView.builder(

                itemCount: CartCubit.of(context).cartModel!.data!.cartItems!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Padding(

                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 5)],
                          color: Colors.white70,
                        ),
                        child: Carts(
                          image: CartCubit.of(context).cartModel!.data!.cartItems![index].product!.image!,
                          name: CartCubit.of(context).cartModel!.data!.cartItems![index].product!.name!,
                          price: CartCubit.of(context).cartModel!.data!.cartItems![index].product!.price,
                          id : CartCubit.of(context).cartModel!.data!.cartItems![index].product!.id,


                        ),
                      ),
                    ],
                  ),
                ),


          ),
              )

      ),
      bottomNavigationBar:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
          color: Colors.white70,
        ),

        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder(
                bloc: CounterController.of(context),
                builder: (context, state) {
                  return Text("Total ="+(CartCubit.of(context).cartModel!.data!.total!*CounterController
                      .of(context)
                      .counter).toString(),style: TextStyle(
                      fontSize: 20
                  ),);
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                ),




                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChosesAddressView(
                    total: CartCubit.of(context).cartModel!.data!.total!,
                      )));

              }, child: Text("Check out",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black
              ),),
              )
            ],
          ),
        ),






      ) ,
    );

  }
}
class Carts extends StatefulWidget {
  const Carts({Key? key, this.image, this.name, this.price, this.id}) : super(key: key);
  final String? image;
  final String? name;
  final int? price;
  final int? id;


  @override
  _CartsState createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  @override

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    widget.image!,
                    height: 130,),
                  Expanded(
                    child: Column(
                      children: [
                        Text(widget.name!,),
                        Text(widget.price!.toString()),

                      ],
                    ),
                  ),
                ],
              ),

                 BlocBuilder(
            bloc: CounterController.of(context),
            builder: (context, state) {

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: () {
                        CounterController.of(context)
                          ..add();
                      }, icon: Icon(Icons.add)),
                      Text(CounterController
                          .of(context)
                          .counter
                          .toString()),
                      IconButton(onPressed: () {
                        CounterController.of(context)
                          ..subtract();
                      }, icon: Icon(Icons.remove)),
                      IconButton(onPressed: () {
                        CartCubit.of(context).addCart(widget.id!);

                          CartCubit.of(context).cartModel!.data!.cartItems!.removeWhere((element) => element.product!.id! == widget.id);
                          CartCubit.of(context).emit(CartInitial());

                        // CartCubit.of(context).cartModel!.data!.cartItems!.removeWhere((element) => element.product!.id! == widget.id);

                      }, icon: Icon(Icons.delete)),

                    ],

                  ),
                  Text("Total :"+
                      (CounterController
                      .of(context)
                      .counter * widget.price!).toString()),

                ],
              );
            },
          ),
            ],
          ),
        )

    );
  }
}
