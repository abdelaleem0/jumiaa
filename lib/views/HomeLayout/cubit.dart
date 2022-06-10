import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/HomeLayout/states.dart';
import 'package:jumiaa/views/categroy/view.dart';
import 'package:jumiaa/views/favourite/view.dart';
import 'package:jumiaa/views/home/view.dart';
import 'package:jumiaa/views/settings/view.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInit());

  static HomeLayoutCubit of(context) => BlocProvider.of(context);

  int currentIndex = 0;

  final List<List<dynamic>> screens = [
    [Icons.home, HomeViewHome(),"home"],
    [Icons.category, homeViewCategory(),"ca"],
    [Icons.favorite, homeViewFavorite(),"fa"],
    [Icons.settings, homeViewSettings(),"setting"],

  ];

  void changeIndex(int value) {
    if (currentIndex == value) return;
    currentIndex = value;
    emit(HomeLayoutInit());
  }

  Widget get getCurrentView => screens[currentIndex][1];
}
