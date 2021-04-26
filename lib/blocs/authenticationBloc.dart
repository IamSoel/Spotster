import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportster/models/login_model.dart';
import 'package:sportster/resources/networking/user_api_provider.dart';
import 'package:sportster/resources/repository/repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Repository repository;

  AuthenticationBloc({@required this.repository})
      : assert(Repository != null),
        super(AuthenticationState());

  void onLogin(String email, String password) {
    add(LoginEvent(email: email, password: password));
  }

  void onLogOut() {
    add(LogOutEvent());
  }

  AuthenticationState get initialState => AuthenticationState.initial();

  SharedPreferences sharedPreferences;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is LoginEvent) {
      try {
        yield LoadingState();
        // give a delayed for loading
        Future.delayed(Duration(seconds: 3));
        Map<String, dynamic> jsonBody = {
          'email': event.email,
          'password': event.password,
        };
        var url =
            'userlogin/'; //+ event.email.trim() + event.password.trim();

        final data = await UserApiProvider()
            .postLoginData(repository.getLogin(url, jsonBody));
        print(data);
        yield AuthenticationState(loginModel: data);
      } catch (e) {
        print('Error : ' + e.toString());
        yield GetFailureState(error: e.toString());
      }
    } else if (event is CheckLoginEvent) {
      sharedPreferences = await SharedPreferences.getInstance();
      var data = sharedPreferences.get('email');
      if (data != null) {
        yield LoggedInState();
      } else {
        yield LoggedOutState();
      }
    } else if (event is LogOutEvent) {
      sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.clear();
      yield LoggedOutState();
    }
  }
}

//Event
class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LoginEvent({this.email, this.password});
}

class LogOutEvent extends AuthenticationEvent {}

class CheckLoginEvent extends AuthenticationEvent {}

//State

class AuthenticationState {
  final LoginModel loginModel;

  AuthenticationState({this.loginModel});

  factory AuthenticationState.initial() => AuthenticationState();
}

class GetFailureState extends AuthenticationState {
  final String error;

  GetFailureState({this.error});
}

class LoggedInState extends AuthenticationState {}

class LoggedOutState extends AuthenticationState {}

class LoadingState extends AuthenticationState {}
