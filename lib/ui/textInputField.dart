import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final labelText, hintText, iconData, obscureText, keyboardType;

  TextInputField(
      {this.labelText,
      this.hintText,
      this.iconData,
      this.obscureText,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        obscuringCharacter: '•',
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 4.0),
          labelText: '$labelText',
          labelStyle: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
          hintText: '$hintText',
          hintStyle: TextStyle(color: Colors.black26),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Padding(
              padding: EdgeInsets.all(0.0),
              child: Icon(
                iconData,
                color: Colors.green,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: const BorderSide(color: Colors.white)),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //   borderSide: const BorderSide(color: Colors.green),
          // ),
          focusColor: Colors.green,
        ),
      ),
    );
  }
}
