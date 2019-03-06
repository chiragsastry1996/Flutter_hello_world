import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {

    return MaterialApp(
      home: SquareCard(),
    );
  }
}

class SquareCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
            appBar: AppBar(
              title: Text("Card Example"),
            ),
            body: Center(
              child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width*0.85,
                      width: MediaQuery.of(context).size.width*0.85,
                      child: Card(
                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
//                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Card(
                                  child: Card(
                                    child: Text("Button 1"),
                                  ),
                                ),
                                Card(
                                  child: Card(
                                    child: Text("Button 2"),
                                  ),
                                )
                              ],
                            ),
                            Column(
//                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Card(
                                  child: Card(
                                    child: Text("Button 3"),
                                  ),
                                ),
                                Card(
                                  child: Card(
                                    child: Text("Button 4"),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
              ),
            )
      ),
    );
  }
}
