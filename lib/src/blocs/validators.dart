import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (String email, EventSink<String> sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('Error: enter a valid email.');
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (String password, EventSink<String> sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError('Password must be at last 4 characters long.');
    }
  });
}
