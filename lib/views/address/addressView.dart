import 'package:flutter/material.dart';
import 'package:jumiaa/views/address/cubits/cubits.dart';
import 'package:jumiaa/views/address/widgets/fileds.dart';
import 'package:jumiaa/views/signup/widgets/textNameFiled.dart';

class AddressView extends StatefulWidget {
  @override
  _AddressViewState createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  TextEditingController city = TextEditingController();

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

              AddressCubit.of(context).update(2);

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
