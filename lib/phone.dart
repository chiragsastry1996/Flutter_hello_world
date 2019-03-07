import 'package:flutter/material.dart';

void main() => runApp(Phone());

class Phone extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Phone"),
          leading: new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context, true);
                  }),
        ),
        body: Text("Phone"),
      ),
    );
  }
}
