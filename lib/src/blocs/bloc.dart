import 'dart:async';

import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  // StreamController creates a single subscription stream
  // StreamController.broadcast creates multi sub stream
  // Now we will use BehaviorSubject Subject
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Add data to a stream, give the transformed stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;
    print('Email is $validateEmail');
    print('Password is $validatePassword');
  }

  // Clean up
  dispose() {
    _email.close();
    _password.close();
  }
}
