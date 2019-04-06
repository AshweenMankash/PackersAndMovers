import 'dart:async';

class Validators {
  final addressValidators = StreamTransformer<String, String>.fromHandlers(
      handleData: (address, sink) {
    if (address.isEmpty) {
      sink.add("Enter Address");
    } else
      sink.add(address);
  });
}
