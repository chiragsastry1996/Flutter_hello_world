import 'package:flutter/material.dart';

void main() => runApp(Team());

class Team extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Team"),
          leading: new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context, true);
                  }),
        ),
        body: Text("Team"),
      ),
    );
  }
}
