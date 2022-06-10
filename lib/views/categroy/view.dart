import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/categroy/component/categoryBlock.dart';
import 'package:jumiaa/views/categroy/cubits/controller.dart';
import 'package:jumiaa/views/categroy/states/states.dart';
import 'package:jumiaa/views/categroy/widgets/categoryDetials.dart';

class homeViewCategory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: CategoryController().categoryModel.toString().length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) =>
            Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                BlocBuilder(
                bloc: CategoryController.of(context),
                builder: (context, state) {
                  if (state is CategoryLoading)
                    return Column(
                        children:[ Row(
                          children: [
                            Container(
                              height:110,
                                width: 110,
                                child: CircularProgressIndicator()),
                            Text("Looding"),
                            Spacer(),
                            Icon(Icons.arrow_back_ios_new),
                          ],
                        ),
                        ]
                    );
                  final categories=CategoryController.of(context).categoryModel!.data!.data!;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                        color: Colors.white70,
                      ),

                      child: Column(
                          children:[ InkWell(

                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryDetials(
                                    categories[index].name!,categories[index].image!
                                )));


                              },

                            child: Row(
                              children: [
                                Image.network(categories[index].image!, height: 100,),
                                Text(categories[index].name!),
                                Spacer(),
                                Icon(Icons.arrow_back_ios_new),
                              ],
                            ),
                          ),
                          ]
                      ),
                    ),
                  );

                },
              ),

                ],
              ),
            ),
      ),
    );
  }
}
