import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LRButton extends StatelessWidget {
  final buttonText;
  final Function onClick;

  const LRButton({this.buttonText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.0,
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.green),
        onPressed: onClick,
        child: Text(
          '$buttonText',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
