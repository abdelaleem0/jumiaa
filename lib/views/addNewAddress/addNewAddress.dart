import 'package:flutter/material.dart';
import 'package:jumiaa/views/address/cubits/cubits.dart';
import 'package:jumiaa/views/address/widgets/fileds.dart';

class AddNewAddress extends StatefulWidget {

  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Fields(),
          ElevatedButton(
            style: ButtonStyle(
            ),




            onPressed: (){
              // AddressCubit.of(context).addAddress();

              AddressCubit.of(context).addAddress();

            }, child: Text("Save your address",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black
            ),),
          )



        ],
      ),
    );
  }
}
