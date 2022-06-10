import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/prodductDetails/states/states.dart';

class CounterController extends Cubit<CounterStates>{
  CounterController() : super(CounterInit());

  static CounterController of(context) => BlocProvider.of(context);

  int counter = 0;


  void add(){
    counter++;
    emit(CounterRebuild());
  }
  void subtract(){
    if(counter>=1) {
      counter--;
    }else{

    }
    emit(CounterRebuild());
  }

}