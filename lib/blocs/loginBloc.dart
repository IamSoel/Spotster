import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sportster/blocs/validators.dart';

class LoginBloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

//add changed data to sink
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

// add data to stream
  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);

// using rxdart
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (a, b) => true);

  void submit() {
    final finalEmail = _email.value;
    final finalPassword = _password.value;
    print('Email is $finalEmail');
    print('password is $finalPassword');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}

final loginBloc = LoginBloc();
