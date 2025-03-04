import 'dart:async';

class MyBloc {
  int counter = 0;
  // Single Stream
  // StreamController<int>() : Single Stream : cho phep lang nghe 1 cho
  // StreamController<int>().broadcast() : Broad Cast Stream : cho phep lang nghe nhieu cho
  final StreamController<int> _counterController = StreamController<int>();

  // Transformer: Tăng giá trị lên 10 trước khi phát ra Stream
  final _counterTransformer = StreamTransformer<int, int>.fromHandlers(
    handleData: (data, sink) {
      data += 10;
      sink.add(data);
    },
  );

  // Stream với Transformer
  Stream<int> get counterStream =>
      _counterController.stream.transform(_counterTransformer);

  void increment() {
    counter += 1;
    _counterController.sink.add(counter);
  }

  void dispose() {
    _counterController.close();
  }
}
