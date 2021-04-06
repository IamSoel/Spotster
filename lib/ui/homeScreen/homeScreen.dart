import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xBB79AF88),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.10,
        decoration: BoxDecoration(color: Color(0xBB79AF88), boxShadow: [
          BoxShadow(
              color: Color(0xBB79AF88),
              offset: Offset(2.0, 0.0),
              blurRadius: 2.0,
              spreadRadius: 2.0),
        ]),
        child: Row(
          children: [
            Expanded(child: Icon(FontAwesomeIcons.home)),
            Expanded(
                child: Icon(
              Icons.chat_bubble,
            )),
            Expanded(child: Icon(FontAwesomeIcons.search)),
            Expanded(
                child: Icon(
              Icons.settings,
              color: Colors.green,
            ))
          ],
        ),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/yoga.png'),
            radius: 25,
          )
        ],
      ),
    );
  }
}
