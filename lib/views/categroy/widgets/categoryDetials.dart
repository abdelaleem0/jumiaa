import 'package:flutter/material.dart';

class CategoryDetials extends StatefulWidget {
  String? name;
  String? image;
  CategoryDetials(this.name,this.image);

  @override
  _CategoryDetialsState createState() => _CategoryDetialsState();
}

class _CategoryDetialsState extends State<CategoryDetials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0.0,
      ),
      body:  Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child:
                  Image.network(widget.image!,height: 80,),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                ),



              ],
            ),
            Text(widget.name!,
              style: TextStyle(
                fontSize: 10,
              ),),
            // Text("old price"+product[index].oldPrice!.toString()),
            // Text(Controller.of(context).homeModel!.data!.ad.toString()+"%"),
          ],
        ),
      ),
    );
  }
}
