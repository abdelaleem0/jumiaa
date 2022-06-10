import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jumiaa/views/categroy/cubits/controller.dart';
import 'package:jumiaa/views/categroy/widgets/categoryDetials.dart';
import 'package:jumiaa/views/home/cubits/controller.dart';

class HomeItemView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // final homeItemView = CategoryController.of(context);


          return Container(
            height: MediaQuery
                .of(context)
                .size
                .height / 4,
            child: ListView.builder(
               itemCount: CategoryController().categoryModel.toString().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15.0, left: 15, top: 10),
                    child: BlocBuilder(
                      bloc:CategoryController.of(context) ,
                      builder: (context, state) {
                        final catogry = CategoryController.of(context).categoryModel!.data!.data;
    return Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryDetials(
                                catogry![index].name!,catogry[index].image!
                            )));


                                },
                          child: CircleAvatar(backgroundImage: NetworkImage(
                              catogry![index].image!), radius: 70,),
                        ),
                        // Image.asset("assets/images/images4.jpg",height: 130,),
                        Text(catogry[index].name!),


                      ],
                    );
  },
),
                  ),
            ),

      );
  }
}
// class HomeItemView2 extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return
//
//
//
//
//
//
//   }
// }


