import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyClassrom extends StatefulWidget {
  const MyClassrom({Key? key}) : super(key: key);

  @override
  State<MyClassrom> createState() => _MyClassromState();
}

class _MyClassromState extends State<MyClassrom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
        title: Text("Subscribed Courses"),
        ),
        body:
        Center(
          child: Column(
          children:[
            Container(
            child: Text("Subscribed Live Courses"),
            ),
        ])
        )
    );
  }
}
