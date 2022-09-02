import 'package:bloc/bloc.dart';
import 'package:contador_pessoa/bloc/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  final int num;
  CounterBloc({required this.num}) : super(num) {
    on<IncrementEvent>((event, emit) => emit(state + 1));
    on<DecrementEvent>((event, emit) => emit(state - 1));
  }
}
