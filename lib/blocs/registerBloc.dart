import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:sportster/blocs/validators.dart';

class RegisterBloc extends Object with Validators {
  final _firstName = BehaviorSubject<String>();
  final _lastName = BehaviorSubject<String>();
  final _gender = BehaviorSubject<int>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _rePassword = BehaviorSubject<String>();
  final _contact = BehaviorSubject<String>();
  final _birthDate = BehaviorSubject<DateTime>();

// add data to sink
  Function(String) get changeFirstName => _firstName.sink.add;
  Function(String) get changeLastName => _lastName.sink.add;
  Function(int) get changeGender => _gender.sink.add;
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeRePassword => _rePassword.sink.add;
  Function(String) get changeContact => _contact.sink.add;
  Function(DateTime) get changeBirthDate => _birthDate.sink.add;

  // receive data from sink
  Stream<String> get firstName =>
      _firstName.stream.transform(firstLastNameValidator);
  Stream<String> get lastName =>
      _lastName.stream.transform(firstLastNameValidator);
  Stream<int> get gender => _gender.stream;
  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);
  Stream<String> get rePassword =>
      _rePassword.stream.transform(rePasswordValidator);
  Stream<String> get contact => _contact.stream.transform(contactValidator);
  Stream<DateTime> get birthDate => _birthDate.stream.transform(dateValidator);

//confirming password
  bool confirmPassword() {
    if (_password.value == _rePassword.value) {
      return true;
    } else {
      return false;
    }
  }

  Stream<bool> get registerValid => Rx.combineLatest8(
      firstName,
      lastName,
      gender,
      email,
      password,
      rePassword,
      contact,
      birthDate,
      (a, b, c, d, e, f, g, h) => true);

  dispose() {
    _firstName.close();
    _lastName.close();
    _gender.close();
    _email.close();
    _password.close();
    _rePassword.close();
    _contact.close();
    _birthDate.close();
  }
}

final registerBloc = RegisterBloc();
