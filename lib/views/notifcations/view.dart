import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/notifcations/cubits/cubits.dart';
import 'package:jumiaa/views/notifcations/states/states.dart';

class NotificationsView extends StatefulWidget {
  NotificationsController za=NotificationsController();


  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xcd157f80),
        elevation: 0.0,
        title: Center(child: Text("Notifications")),
      ),
      body: ListView.builder(
        itemCount: NotificationsController().NotificationsModel.toString().length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) =>
            Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  BlocBuilder(
                    bloc: NotificationsController.of(context),
                    builder: (context, state) {
                      if (state is NotificationsLoading)
                        return Column(
                            children:[
                                Container(
                                    height:110,
                                    width: 110,
                                    child: CircularProgressIndicator()),
                                Text("Looding"),
                            ]
                        );
                      final Notifications=NotificationsController.of(context).NotificationsModel!.data!.data!;
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: Colors.white, blurRadius: 5)],
                          color: Color(0xcd9dddde),
                        ),
                        child: Column(
                            children:[


                              Text(Notifications[index].title!.toString(),
                              style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.indigo
                              ),),

                              Text(Notifications[index].message!.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.indigo
                                ),),
                                // Text(Notifications[index].id!.toString()),



                            ]
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
