import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/cart/cartView.dart';
import 'package:jumiaa/views/cart/cubits/cubits.dart';
import 'package:jumiaa/views/prodductDetails/cubits/cubits.dart';

class ProductDetalis extends StatefulWidget {
  String? name;
  String? des;
  String? image;
  double? Price;
  int? id;
  ProductDetalis( {this.name, this.Price, this.image,this.id,this.des});

  @override
  _ProductDetalisState createState() => _ProductDetalisState();
}

class _ProductDetalisState extends State<ProductDetalis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.lightBlueAccent, blurRadius: 5)],
            color: Colors.white70,
          ),


          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child:
                          Image.network(widget.name!, height: 150,),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                        ),


                      ],
                    ),
                    Text(widget.image!,
                      style: TextStyle(
                        fontSize: 30,
                      ),),
                    Text("price: " + widget.Price!.toString() + "  EG",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),

                    Text("descraption: " + widget.des!.toString() ,
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                    Divider(),


                    // Text("old price"+product[index].oldPrice!.toString()),
                    // Text(Controller.of(context).homeModel!.data!.ad.toString()+"%"),
                  ],

                ),

              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                  color: Colors.white70,
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder(
                      bloc: CartCubit.of(context),
                      builder: (context, state) {
                        return TextButton(onPressed: () {
                          print(widget.id);
                          CartCubit.of(context).addCart(widget.id!);

                        }, child: Text("add to cart"));
                      },
                    ),
                    IconButton(onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => CartView()));
                    }, icon: Icon(Icons.add_shopping_cart)),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
    ;
  }
}
