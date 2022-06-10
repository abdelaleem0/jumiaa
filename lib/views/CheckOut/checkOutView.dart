import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/CheckOut/cubits/cubits.dart';
import 'package:jumiaa/views/CheckOut/states/states.dart';
import 'package:jumiaa/views/address/addressView.dart';
import 'package:jumiaa/views/address/cubits/cubits.dart';
import 'package:jumiaa/views/address/states/states.dart';
import 'package:jumiaa/views/visa/visaView.dart';

class CheckOutView extends StatefulWidget {
  final int? total;
  String? name;
  String? city;
  String? region;
  String? details;


   CheckOutView({this.total,this.name,this.city,this.region,this.details});

  @override
  _CheckOutViewState createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  int? selectedRadioTile;


  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedColorRadio(int? val) {
    setState(() {
      selectedRadioTile = val!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckOutController(),
      child: BlocBuilder<CheckOutController, CheckOutStates>(
        builder: (context, state) {
          final controller = CheckOutController.of(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.black12,
              title: Padding(
                padding: const EdgeInsets.only(left: 65.0),
                child: Text(
                  'Checkout',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            body: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 5)],
                        color: Colors.white70,
                      ),

                      child: Column(
                        children: [
                          Row(

                            children: [
                              Text('Your Address'),
                              DropdownMenuItem(child: Icon(Icons.keyboard_arrow_down)),
                              SizedBox(width: 80,),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (
                                    context) => AddressView()));
                              }, child: Text("Edit your address")),

                            ],

                          ),
                          BlocBuilder(
                            bloc: AddressCubit.of(context),
                            builder: (context, state) =>state is AddressLoading ?Text("looding")
                                : AddressCubit.of(context).addressModel == null ? Text('Empty') :
                            Column(
                              children: [
                                Text(widget.name!),
                                Text(widget.city!),
                                Text(widget.region!),
                                Text(widget.details!),


                              ],

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),









                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      InkWell(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressView()));

                        },
                        child: RadioListTile(
                          value: 1,
                          groupValue: selectedRadioTile,
                          title: Text('Visa'),
                          //  selected:true,
                          onChanged: (int? val) {
                            setSelectedColorRadio(val!);
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>VisaView()));

                          },
                          activeColor: Colors.red,
                        ),
                      ),
                      RadioListTile(
                        value: 2,
                        // selected:false ,
                        groupValue: selectedRadioTile,
                        activeColor: Colors.red,
                        title: Text('Cash'),
                        onChanged: (int? value) {
                          setSelectedColorRadio(value!);

                        },
                      )
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total: ',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          widget.total.toString(),
                          style: TextStyle(fontSize: 25, color: Colors.purple),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'EGP',
                          style: TextStyle(fontSize: 25, color: Colors.purple),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black12,

                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.grey),
                    ),
                    height: 70,
                  ),


                ],
              ),


            ),
          );
        },
      ),
    );
  }
}
