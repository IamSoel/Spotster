import 'dart:async';
import 'package:sportster/blocs/registerBloc.dart';

class Validators {
  final emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.isEmpty) {
      sink.addError('Please don\'t leave this field empty');
    } else if (!email.contains('@')) {
      sink.addError('Please enter a valid email');
    } else {
      sink.add(email);
    }
  });

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length < 5) {
      sink.addError('Password length must be greater than 4');
    } else {
      sink.add(password);
    }
  });

  final rePasswordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (rePassword, sink) {
    if (!registerBloc.confirmPassword()) {
      sink.addError('Password doesn\'t match');
    } else if (rePassword.length < 5) {
      sink.addError('Password length must be greater than 4');
    } else {
      sink.add(rePassword);
    }
  });

  final firstLastNameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.isEmpty) {
      sink.addError('@Required');
    } else if (name.length < 3) {
      sink.addError('The character in this field cannot be leass than two !!');
    } else {
      sink.add(name);
    }
  });

  final contactValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (contact, sink) {
    if (contact.isEmpty) {
      sink.addError('@Required');
    } else if (contact.length != 10) {
      sink.addError('Please enter your mobile number correctly');
    } else {
      sink.add(contact);
    }
  });

  final dateValidator = StreamTransformer<DateTime, DateTime>.fromHandlers(
      handleData: (date, sink) {
    if (date.toString().isEmpty) {
      sink.addError('@Required');
    } else if (date.year - DateTime.now().year < 18) {
      sink.addError('Your age must be greater than 18 to register');
    } else {
      sink.add(date);
    }
  });
}
