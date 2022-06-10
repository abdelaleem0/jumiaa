import 'package:flutter/material.dart';
import 'package:jumiaa/views/CheckOut/checkOutView.dart';

class ShowAddressView extends StatefulWidget {
  String? name;
  String? city;
  String? region;
  String? details;
  int? total;
   ShowAddressView({this.name,this.city,this.region,this.details,this.total});

  @override
  _ShowAddressViewState createState() => _ShowAddressViewState();
}

class _ShowAddressViewState extends State<ShowAddressView> {
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
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.lightBlueAccent, blurRadius: 5)],
            color: Colors.white70,
          ),


          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("name: " + widget.name!.toString() ,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),

              Text("City: " + widget.city!.toString() ,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20

                ),),
              Text("Region: " + widget.region!.toString() ,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20

                ),),
              Text("Details: " + widget.details!.toString() ,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20

                ),),
              Divider(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                  color: Colors.white70,
                ),

                child: TextButton(onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => CheckOutView(
                    total: widget.total,
                    name:widget.name ,
                    city: widget.city,
                    region: widget.region,
                    details: widget.details,
                  )));
                }, child: Text("Choese this address")),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
