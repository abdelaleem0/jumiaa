import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/HomeLayout/cubit.dart';
import 'package:jumiaa/views/HomeLayout/states.dart';
import 'package:jumiaa/views/HomeLayout/units/drower.dart';
import 'package:jumiaa/views/HomeLayout/units/nav_bar.dart';
import 'package:jumiaa/views/homeSearch/cubits/controller.dart';
import 'package:jumiaa/views/homeSearch/states/states.dart';
import 'package:jumiaa/views/notifcations/view.dart';
import 'package:jumiaa/views/prodductDetails/prouctDetails.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocBuilder<HomeLayoutCubit, HomeLayoutStates>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeSearch(),
                      )),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              )
            ],
            backgroundColor: Colors.lightBlueAccent,
            elevation: 0,
          ),

          bottomNavigationBar: NavBar(),
          body: HomeLayoutCubit.of(context).getCurrentView,
          drawer: HomeLayoutDrower(),

        ),
      ),
    );
  }
}

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: SearchController.of(context).Searchcontroller,
            cursorColor: Colors.cyan,
            cursorHeight: 25,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38)),
                prefixIcon:IconButton(onPressed: ()async{

                  await SearchController.of(context).function();

                }, icon:Icon(Icons.search))),
          ),
          BlocBuilder(
            bloc: SearchController.of(context),
  builder: (context, state) {

              if(state is SearchLoading)
                return Text('Loading');

    return
      SearchController.of(context).SearchModel== null ? Text('no result'):Expanded(
        child: ListView.builder(

              itemCount:SearchController.of(context).SearchModel!.data!.data!.length ,
              itemBuilder: (context, index) =>

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetalis(
                          name:SearchController.of(context).SearchModel!.data!.data![index].image! ,
                            Price:SearchController.of(context).SearchModel!.data!.data![index].price! ,
                            id:SearchController.of(context).SearchModel!.data!.data![index].id! ,
                            image: SearchController.of(context).SearchModel!.data!.data![index].name!,
                            des: SearchController.of(context).SearchModel!.data!.data![index].description!
                            ,



                        )));
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child:
                                Image.network(SearchController.of(context).SearchModel!.data!.data![index].image!,height: 80,),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                              ),



                            ],
                          ),
                          Text(SearchController.of(context).SearchModel!.data!.data![index].name!.toString(),
                            style: TextStyle(
                              fontSize: 10,
                            ),),
                          Text("price: "+SearchController.of(context).SearchModel!.data!.data![index].price!.toString()+"  EG",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),),
                          // Text("old price"+product[index].oldPrice!.toString()),
                          // Text(Controller.of(context).homeModel!.data!.ad.toString()+"%"),
                        ],
                      ),
                    ),
                  ),
            ),
      );
  },
),

        ],
      ),
    );
  }
}
