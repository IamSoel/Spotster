import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                'SPORTSTER',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50,
                    letterSpacing: 1.5,
                    color: Colors.white70,
                    fontFamily: 'Coda Caption'),
              ),
            ),
            Image(
              image: AssetImage('images/yoga.png'),
              height: 214,
              width: 199,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'email',
                border: InputBorder.none,
                fillColor: Colors.white70,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'password',
                border: InputBorder.none,
                fillColor: Colors.white70,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('LOGIN'),
            )
          ],
        ),
      ),
    ),
  ));
}
