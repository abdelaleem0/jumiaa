import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/favourite/cubits/cubits.dart';
import 'package:jumiaa/views/favourite/states/states.dart';
import 'package:jumiaa/views/prodductDetails/prouctDetails.dart';

class homeViewFavorite extends StatefulWidget {

  @override
  _homeViewFavoriteState createState() => _homeViewFavoriteState();
}

class _homeViewFavoriteState extends State<homeViewFavorite> {
  @override
  Widget build(BuildContext context) {
    // final controller = FavouriteCubit.of(context);
    return Scaffold(
      body: BlocBuilder(
        bloc: FavouriteCubit.of(context),
  builder: (context, state) =>state is FavouriteLoading ?Text("looding")
    : FavouriteCubit.of(context).favouriteModel == null ? Text('Empty') : RefreshIndicator(
    onRefresh:FavouriteCubit.of(context).function ,
      child: ListView.builder(

  itemCount: FavouriteCubit.of(context).favouriteModel!.data!.data!.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetalis(
                name: FavouriteCubit.of(context).favouriteModel!.data!.data![index].product!.image!,
                id:FavouriteCubit.of(context).favouriteModel!.data!.data![index].product!.id! ,
                image:FavouriteCubit.of(context).favouriteModel!.data!.data![index].product!.name! ,
                des: FavouriteCubit.of(context).favouriteModel!.data!.data![index].product!.description,
                Price: FavouriteCubit.of(context).favouriteModel!.data!.data![index].product!.price!,
              )));
            },
            child: Clases(

               price: FavouriteCubit.of(context).favouriteModel!.data!.data![index].product!.price!.toString(),
              image: FavouriteCubit.of(context).favouriteModel!.data!.data![index].product!.image!,
              name: FavouriteCubit.of(context).favouriteModel!.data!.data![index].product!.name!,
              id: FavouriteCubit.of(context).favouriteModel!.data!.data![index].product!.id!,
              isFavourite: true,
            ),
          )
        ),
    )

),
    );
  }
}


class Clases extends StatefulWidget {
  const Clases( {this.image, this.name, this.id, this.isFavourite = false, this.price}) ;
  final String? image;
  final String? name;
  final String? price;
  final int? id;
  final bool isFavourite;

  @override
  _ClasesState createState() => _ClasesState();
}

class _ClasesState extends State<Clases> {
  bool isLike = false;

  @override
  void initState() {
    isLike = widget.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
            color: Colors.white70,
          ),

          child: Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.network(
                          widget.image!,
                          height: 130,),
                      ],
                    ),
                    Column(
                      children: [
                        Text(widget.name!,),
                        Text("Price :"+widget.price!),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 100.0, top: 10),
                          child: IconButton(
                            icon: isLike
                                ? Icon(Icons.favorite, color: Colors.red,)
                                : Icon(Icons.favorite_border),
                            onPressed: () {
                              setState(() {
                                isLike = !isLike;
                              });
                              // TODO: HTTP For Changing Favourite in API
                              FavouriteCubit.of(context).addFav(widget.id!);
                              if(!isLike){
                                FavouriteCubit.of(context).favouriteModel!.data!.data!.removeWhere((element) => element.product!.id! == widget.id);
                                FavouriteCubit.of(context).emit(FavouriteInitial());
                              }
                            },
                          ),
                        ),

                      ],
                    ),


                  ],
                ),
              )

          ),
    );
  }
}
