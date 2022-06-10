import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/CheckOut/checkOutView.dart';
import 'package:jumiaa/views/addNewAddress/addNewAddress.dart';
import 'package:jumiaa/views/address/addressView.dart';
import 'package:jumiaa/views/address/cubits/cubits.dart';
import 'package:jumiaa/views/address/states/states.dart';
import 'package:jumiaa/views/showAddress/ShowAddress.dart';

class ChosesAddressView extends StatefulWidget {
  int? total;
  ChosesAddressView({this.total});

  @override
  _ChosesAddressViewState createState() => _ChosesAddressViewState();
}

class _ChosesAddressViewState extends State<ChosesAddressView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  ListView.builder(
        itemCount: 6,
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

                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => ShowAddressView(
                      total: widget.total,
                      name: AddressCubit.of(context).addressModel!.data!.address![index].name!,
                      city: AddressCubit.of(context).addressModel!.data!.address![index].city!,
                      details: AddressCubit.of(context).addressModel!.data!.address![index].details!,
                      region: AddressCubit.of(context).addressModel!.data!.address![index].region!,
                    )));

                  },
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
                            Text(AddressCubit.of(context).addressModel!.data!.address![index].name!),
                            Text(AddressCubit.of(context).addressModel!.data!.address![index].city!),
                            Text(AddressCubit.of(context).addressModel!.data!.address![index].region!),
                            Text(AddressCubit.of(context).addressModel!.data!.address![index].details!),


                          ],

                        ),

                      ),

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),


      ),
      bottomNavigationBar:                       Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
          color: Colors.white70,
        ),

        child: TextButton(onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>AddNewAddress()
          ));
        }, child: Text("New address")),
      ),

    );
  }
}
