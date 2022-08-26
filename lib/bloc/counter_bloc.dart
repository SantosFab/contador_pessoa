import 'dart:async';
import 'dart:ui';
import 'package:bloc_pattern/bloc_pattern.dart';

class CounterBloc implements BlocBase {
  final StreamController<int> _stream = StreamController<int>();
  Stream<int> get strem => _stream.stream;

  addStream(int event) {
    if (!_stream.isClosed) {
      _stream.add(event);
    }
  }

  @override
  void addListener(VoidCallback listener) {}

  @override
  void dispose() {
    _stream.close();
  }

  @override
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {}

  @override
  void removeListener(VoidCallback listener) {}
}
