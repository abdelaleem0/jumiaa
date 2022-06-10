import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/favourite/cubits/cubits.dart';
import 'package:jumiaa/views/favourite/view.dart';
import 'package:jumiaa/views/home/cubits/controller.dart';
import 'package:jumiaa/views/prodductDetails/prouctDetails.dart';
import 'package:jumiaa/widgets/textname.dart';

class HomeGridView extends StatefulWidget {
  @override
  _HomeGridViewState createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {

  @override
  Widget build(BuildContext context) {
    final homeGridView = Controller.of(context);

    return BlocBuilder(

      bloc: homeGridView,
      builder: (context, state) {
        final proucts = homeGridView.homeModel!.data!.products!;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 3,
              mainAxisSpacing: 5,
              // mainAxisExtent: 200,
              childAspectRatio: 1 / 2),

          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetalis(
                image:proucts[index].name! ,
                  id: proucts[index].id!,
                  Price:proucts[index].price! ,
                  name: proucts[index].image!,
                  des: proucts[index].description!,


                   )));
            },
            child: Clases(
              image: proucts[index].image,
              name: proucts[index].name,
              id: proucts[index].id,
              isFavourite: proucts[index].inFavorites!,
              price: proucts[index].price.toString(),
            ),
          ),
          itemCount: proucts.length,
        );
      },
    );
  }
}

class IconButtons extends StatefulWidget {

  @override
  _IconButtonsState createState() => _IconButtonsState();
}

class _IconButtonsState extends State<IconButtons> {
  bool isLike = false;
String x= "ahmmmmmmmmmmmmmmmmed";
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
                           InkWell(
                             onTap: (){

                             },
                             child: IconButton(
                              icon: isLike
                                  ? Icon(Icons.favorite, color: Colors.red,)
                                  : Icon(Icons.favorite_border),
                              onPressed: () {
                                setState(() {
                                  isLike = !isLike;
                                  // FavouriteCubit.of(context).Fuction(x);
                                  // print(FavouriteCubit.of(context).list);
                                });
                              },
                          ),
                           ),


    );
  }
}

