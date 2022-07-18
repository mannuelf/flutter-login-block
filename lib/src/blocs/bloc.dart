import 'dart:async';

import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  // StreamController creates a single subscription stream
  // StreamController.broacast creates multi sub stream
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  // Add data to a stream, give the transformed stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Clean up
  dispose() {
    _email.close();
    _password.close();
  }
}
