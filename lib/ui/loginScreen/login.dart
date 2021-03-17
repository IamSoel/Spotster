import 'package:flutter/material.dart';
import 'package:sportster/ui/lrButton.dart';
import 'package:sportster/ui/textInputField.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF79AF88),
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
                          color: Color(0xFFCAF0D5),
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
              TextInputField(
                labelText: 'Email',
                hintText: 'abc@gmail.com',
                iconData: Icons.email,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
              TextInputField(
                labelText: 'Password',
                hintText: '',
                iconData: Icons.lock,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Colors.white,
                    ),
                    child: Checkbox(
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = !_value;
                        });
                      },
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                    ),
                  ),
                  Text(
                    'Keep me logged in.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              LRButton(
                buttonText: 'Login',
                onClick: () {
                  Navigator.pushNamed(context, '/home');
                  print('Login button clicked!!');
                },
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
                      color: Colors.white,
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
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
