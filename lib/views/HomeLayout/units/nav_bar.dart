import 'package:flutter/material.dart';
import 'package:jumiaa/views/HomeLayout/cubit.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class NavBar extends StatelessWidget {
  @override
  final  List<String> q=["home","ass","aaaa","aaa"];
  Widget build(BuildContext context) {
    final cubit = HomeLayoutCubit.of(context);
     return GNav(
       rippleColor: Colors.indigo[300]!,
       hoverColor: Colors.cyan[100]!,
       gap: 8,
       activeColor: Colors.lightBlue,
       iconSize: 30,
       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
       duration: Duration(milliseconds: 400),
       tabBackgroundColor: Colors.cyan[100]!,
       color: Colors.black,

       tabs:
         cubit.screens
               .map((e) => GButton(icon: e[0],text: e[2]))
               .toList(),

       selectedIndex:  cubit.currentIndex,
       onTabChange: cubit.changeIndex,
         );





    // CurvedNavigationBar(
    //   index: cubit.currentIndex,
    //   height: 45,
    //   backgroundColor: Colors.cyan,
    //   items: cubit.screens
    //       .map((e) => Icon(e[0], size: 25, color: Colors.grey))
    //       .toList(),
    //   onTap: cubit.changeIndex,
    // );
  }
}
