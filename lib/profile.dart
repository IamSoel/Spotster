import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
          ),
          body: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/yoga.png'),
                radius: 50,
              ),
              Text('User Name'),
              
            ],
          ),
        ),
      ),
    );
  }
}
