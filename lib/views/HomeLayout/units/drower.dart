
import 'package:flutter/material.dart';
import 'package:jumiaa/views/contacts/contactsView.dart';
import 'package:jumiaa/views/home/view.dart';
import 'package:jumiaa/views/notifcations/view.dart';
import 'package:jumiaa/views/profile/profileView.dart';
import 'package:jumiaa/views/settings/view.dart';

class HomeLayoutDrower extends StatefulWidget {
  @override
  _HomeLayoutDrowerState createState() => _HomeLayoutDrowerState();
}

class _HomeLayoutDrowerState extends State<HomeLayoutDrower> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 12,
        child: Container(
          child: Column(
            children: [
              Container(
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileView()));
                        },
                        child: Icon(
                          Icons.account_circle,
                          size: 46,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(children: [
                          Text(
                            "Hi Gest",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 2,
                            height: 6,
                          ),
                          Text(
                            "Egypt",
                            style: TextStyle(color: Colors.black38),
                          )
                        ]),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>homeViewSettings()));
                        },
                        child: Icon(
                          Icons.settings_rounded,
                          size: 27,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  height: 460,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeViewHome()));
                        },

                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              size: 32,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 11.0),
                                child: Text(
                                  "Home",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.local_offer,
                            size: 32,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 11.0),
                              child: Text(
                                "Your Orders",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.local_offer,
                            size: 32,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 11.0),
                              child: Text(
                                "Offers",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.notification_important_sharp,
                            size: 32,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 11.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NotificationsView()));
                              },
                              child: Text("Notifications",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.money,
                            size: 32,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 11.0),
                              child: Text(
                                "Talabat Pay",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.mobile_friendly,
                            size: 32,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 11.0),
                              child: Text(
                                "Vouchers",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.headset,
                            size: 32,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 11.0),
                              child: Text(
                                "Get Help",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactsView()));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.help,
                              size: 32,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 11.0),
                              child: Text(
                                "About us",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
