import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image(
              image: AssetImage('images/basketball.png'),
              height: 100.0,
              width: 120.0,
            ),
            Column(
              children: [
                TextFormField(),
                TextFormField(),
                TextFormField(),
              ],
            ),
          ],
        ),
        TextFormField(),
        TextFormField(),
        ElevatedButton(
          onPressed: () {},
          child: Text('REGISTER'),
        )
      ],
    );
  }
}
