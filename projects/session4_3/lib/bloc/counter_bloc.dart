import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class Increment extends CounterEvent {
  @override
  List<Object> get props => [];
}

class Decrement extends CounterEvent {
  @override
  List<Object> get props => [];
}

// States
class CounterState extends Equatable {
  final int counterValue;

  const CounterState(this.counterValue);

  @override
  List<Object> get props => [counterValue];
}

// BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<Increment>((event, emit) => emit(CounterState(state.counterValue + 1)));
    on<Decrement>((event, emit) => emit(CounterState(state.counterValue - 1)));
  }
}