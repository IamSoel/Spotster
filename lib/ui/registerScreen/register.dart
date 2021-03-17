import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sportster/ui/lrButton.dart';
import 'package:sportster/ui/textInputField.dart';

class RegisterScreen extends StatelessWidget {
  String getCurrentDate() {
    DateTime now = DateTime.now();
    var formatter = DateFormat('yyyy/MM/dd');
    var formatedDate = formatter.format(now);
    return formatedDate;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF79AF88),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image(
                        image: AssetImage('images/basketball.png'),
                      ),
                    ),
                    Expanded(
                      flex: 8,
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
                  ],
                ),
              ),
              TextInputField(
                labelText: 'Full name',
                iconData: Icons.person,
                hintText: 'Ram Prasad',
                obscureText: false,
                keyboardType: TextInputType.name,
              ),
              TextInputField(
                labelText: 'Email',
                iconData: Icons.person,
                hintText: 'abc@gmail.com',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
              TextInputField(
                labelText: 'Password',
                iconData: Icons.lock,
                hintText: '',
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              TextInputField(
                labelText: 'Re-enter password',
                iconData: Icons.lock,
                hintText: '',
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              TextInputField(
                labelText: 'Contact',
                iconData: Icons.phone,
                hintText: '9845818391',
                obscureText: false,
                keyboardType: TextInputType.phone,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50.0,
                  margin: EdgeInsets.all(8.0),
                  child: TextFormField(
                    enabled: false,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                      hintText: getCurrentDate(),
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      labelText: 'Date of Birth',
                      labelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.green,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              LRButton(
                buttonText: 'Register',
                onClick: () {
                  print('Register button clicked');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'Already have an account?  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign in.',
                      style: TextStyle(
                        color: Color(0xFF00FF47),
                        fontSize: 15.0,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
