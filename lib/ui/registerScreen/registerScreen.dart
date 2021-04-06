import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportster/blocs/registerBloc.dart';
import 'package:sportster/ui/registerScreen/datePicker.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                            color: Colors.green.shade600,
                            fontFamily: 'Coda Caption'),
                      ),
                    ),
                  ],
                ),
              ),
              firstNameField(),
              lastNameField(),
              GenderRadio(),
              emailField(),
              passwordField(),
              rePasswordField(),
              contactField(),
              DatePicker(),
              StreamBuilder(
                  stream: registerBloc.registerValid,
                  builder: (context, snapshot) {
                    return Container(
                      width: double.infinity,
                      height: 45.0,
                      margin: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 70.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: snapshot.hasData
                            ? () => {print('Registered')}
                            : null,
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'Already have an account?  ',
                    style: TextStyle(
                      color: Colors.black,
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
                        fontWeight: FontWeight.w600
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

Widget firstNameField() {
  return Container(
    margin: EdgeInsets.all(8.0),
    child: StreamBuilder(
      stream: registerBloc.firstName,
      builder: (context, snapshot) {
        return TextFormField(
          keyboardType: TextInputType.name,
          onChanged: registerBloc.changeFirstName,
          decoration: InputDecoration(
              labelText: 'First Name',
              labelStyle: TextStyle(color: Colors.green),
              hintText: 'Ram',
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
                Icons.person,
                color: Colors.green,
              )),
        );
      },
    ),
  );
}

Widget lastNameField() {
  return Container(
    margin: EdgeInsets.all(8.0),
    child: StreamBuilder(
      stream: registerBloc.lastName,
      builder: (context, snapshot) {
        return TextFormField(
          keyboardType: TextInputType.name,
          onChanged: registerBloc.changeLastName,
          decoration: InputDecoration(
              labelText: 'Last Name',
              labelStyle: TextStyle(color: Colors.green),
              hintText: 'sharma',
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
                Icons.person_outline,
                color: Colors.green,
              )),
        );
      },
    ),
  );
}

Widget emailField() {
  return Container(
    margin: EdgeInsets.all(8.0),
    child: StreamBuilder(
      stream: registerBloc.email,
      builder: (context, snapshot) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          onChanged: registerBloc.changeEmail,
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
      stream: registerBloc.password,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          onChanged: registerBloc.changePassword,
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
              )),
        );
      },
    ),
  );
}

Widget rePasswordField() {
  return Container(
    margin: EdgeInsets.all(8.0),
    child: StreamBuilder(
      stream: registerBloc.rePassword,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          onChanged: registerBloc.changeRePassword,
          decoration: InputDecoration(
              labelText: 'Confirm password',
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
              )),
        );
      },
    ),
  );
}

Widget contactField() {
  return Container(
    margin: EdgeInsets.all(8.0),
    child: StreamBuilder(
      stream: registerBloc.contact,
      builder: (context, snapshot) {
        return TextFormField(
          keyboardType: TextInputType.phone,
          onChanged: registerBloc.changeContact,
          decoration: InputDecoration(
              labelText: 'Contact',
              labelStyle: TextStyle(color: Colors.green),
              hintText: '9845818392',
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
                Icons.phone_android,
                color: Colors.green,
              )),
        );
      },
    ),
  );
}

class GenderRadio extends StatefulWidget {
  @override
  _GenderRadioState createState() => _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  void setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 4.0, 4.0, 4.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(color: Colors.green),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Gender',
            style: TextStyle(
              color: Colors.green,
              fontSize: 20.0,
            ),
          ),
          Row(
            children: [
              Radio(
                groupValue: selectedRadio,
                value: 1,
                activeColor: Colors.green,
                onChanged: (value) {
                  setSelectedRadio(value);
                },
              ),
              Text(
                'Male',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15.0,
                ),
              ),
              Radio(
                groupValue: selectedRadio,
                value: 2,
                activeColor: Colors.green,
                onChanged: (value) {
                  setSelectedRadio(value);
                },
              ),
              Text(
                'Female',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15.0,
                ),
              ),
              Radio(
                groupValue: selectedRadio,
                value: 3,
                activeColor: Colors.green,
                onChanged: (value) {
                  setSelectedRadio(value);
                },
              ),
              Text(
                'Others',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
