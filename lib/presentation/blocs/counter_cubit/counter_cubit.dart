import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState( counter:  5 ) );


  void increaseBy(int value ){
  emit( state.copyWirh(
    counter: state.counter + value, 
    transactionCounter: state.transactionCounter + 1,
  ));
  }

  void reset(){
    emit( state.copyWirh(
      counter: 0,
    ));
  }

  
}
