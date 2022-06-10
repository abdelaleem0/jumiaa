import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jumiaa/views/categroy/cubits/controller.dart';
import 'package:jumiaa/views/home/components/homeGridView.dart';
import 'package:jumiaa/views/home/models/model.dart';
import 'package:jumiaa/views/home/states/states.dart';
import 'package:jumiaa/views/home/widgets/homeItem/view.dart';
import 'package:jumiaa/views/login/cubits/LoginController.dart';
import 'package:jumiaa/widgets/textname.dart';

import 'cubits/controller.dart';

class HomeViewHome extends StatefulWidget {

  @override
  _HomeViewHomeState createState() => _HomeViewHomeState();
}

class _HomeViewHomeState extends State<HomeViewHome> {


  @override
  late final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  Widget build(BuildContext context) {
    final homeCstegory=   CategoryController.of(context);
    // final home = Controller.of(context);
    return Scaffold(
      body: BlocBuilder(
        bloc: Controller.of(context),
        builder: (context, state) {
          if (state is ApiLoading)
            return Center(
              child: Container(
                height: MediaQuery.of(context).size.height/7,
                width: MediaQuery.of(context).size.width/5,
                  child: CircularProgressIndicator()),
            );
          final banners = Controller.of(context).homeModel!.data!.banners!;
          return RefreshIndicator(
            onRefresh:Controller.of(context).function ,
            child: ListView(
              children: [
                Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlayCurve: Curves.easeInOutBack,

                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),

                      items:[

                                Image.network(
                                    banners[0].image!, width: 1000),
                                Image.network(
                                    banners[1].image!, width: 1000),
                              Image.network(
                                  banners[2].image!, width: 1000),
                              Image.network(
                                  banners[3].image!, width: 1000),

                            ]
                          )
                      ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextName("Offers", TextAlign.left, Colors.black, 26),
                ),
                HomeItemView(),
                HomeGridView(),

              ],
            ),
          );
        },
      ),
    );
  }
}

//Container(
//                 height: 400,
//
//                 child: new StaggeredGridView.countBuilder(
//                   scrollDirection: Axis.vertical,
//                   physics: const BouncingScrollPhysics(
//                       parent: AlwaysScrollableScrollPhysics()),
//
//
//                   shrinkWrap: true,
//                   crossAxisCount: 4,
//                   itemCount: 40,
//                   itemBuilder: (BuildContext context, int index) =>
//                   new
//
//                   staggeredTileBuilder: (int index) =>
//                   new StaggeredTile.count(2, index.isEven ? 2 : 2),
//                   mainAxisSpacing: 0.0,
//                   crossAxisSpacing: 6.0,
//
//                 ),
//
//
//               ),