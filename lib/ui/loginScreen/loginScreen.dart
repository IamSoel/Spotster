import 'package:flutter/material.dart';
import 'package:sportster/blocs/authenticationBloc.dart';
import 'package:sportster/blocs/loginBloc.dart';
import 'package:sportster/resources/repository/repository.dart';
import 'package:sportster/resources/shared_preference/shared_pred.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _value = false;
  bool obscurePassword = true;

  AuthenticationBloc authBloc;
  final sharedPref = SharedPref();

  @override
  void initState() {
    authBloc = AuthenticationBloc(repository: Repository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: authBloc,
      listener: (BuildContext context, AuthenticationState state) {
        if (state.loginModel != null && state is LoggedInState) {
          print('I am in logged in state');
          Navigator.pushNamed(context, '/home');
          sharedPref.sharedLoginSave(state.loginModel);
        } else if (state is LoadingState) {
          print('I am in loading state');
          CircularProgressIndicator();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text(
                        'SPOTSTER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 50,
                            letterSpacing: 1.5,
                            color: Colors.green.shade600,
                            fontFamily: 'Coda Caption'),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Image(
                          image: AssetImage('images/yoga.png'),
                          height: 220,
                          width: 200,
                        ),
                      ),
                    ),
                  ],
                ),
                Form(
                  child: Column(
                    children: [
                      emailField(),
                      passwordField(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.green,
                            ),
                            child: Checkbox(
                              value: _value,
                              onChanged: (value) {
                                setState(() {
                                  _value = !_value;
                                });
                              },
                              activeColor: Colors.white,
                              checkColor: Colors.green,
                            ),
                          ),
                          Text(
                            'Keep me logged in.',
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      StreamBuilder(
                          stream: loginBloc.submitValid,
                          builder: (context, snapshot) {
                            return Container(
                              width: double.infinity,
                              height: 45.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 70.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green),
                                onPressed: snapshot.hasData
                                    ? () {
                                        loginBloc.submit();
                                        authBloc.onLogin(loginBloc.finalEmail,
                                            loginBloc.finalPassword);
                                      }
                                    : null,
                                child: Text(
                                  'Login',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Don\'t have an account?  ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        'Create one.',
                        style: TextStyle(
                            color: Color(0xFF00FF47),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: loginBloc.email,
        builder: (context, snapshot) {
          return TextFormField(
            keyboardType: TextInputType.emailAddress,
            onChanged: loginBloc.changeEmail,
            decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(color: Colors.green),
                hintText: 'abc@example.com',
                hintStyle: TextStyle(color: Colors.grey),
                errorText: snapshot.error,
                contentPadding: EdgeInsets.all(5.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  //  when the TextFormField in unfocused
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.green,
                )),
          );
        },
      ),
    );
  }

  Widget passwordField() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: loginBloc.password,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: obscurePassword,
            onChanged: loginBloc.changePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.green),
              contentPadding: EdgeInsets.all(5.0),
              errorText: snapshot.error,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.green,
              ),
              suffixIcon: IconButton(
                color: Colors.green.shade400,
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;

                    print('pressed pasword suffix icon');
                  });
                },
                icon: Icon(
                    obscurePassword ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          );
        },
      ),
    );
  }
}
