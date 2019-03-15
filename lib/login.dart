import 'package:flutter/material.dart';
import 'main.dart';
import 'register.dart';
void main() => runApp(Login());

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    var screen_height = MediaQuery.of(context).size.height;
    var screen_width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text("DBS")
        ),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: screen_width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 45),
                  child: Text(
                    "LOGIN",
                    textAlign: TextAlign.left,
                    style: new TextStyle(fontSize: 45),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0))),
                        child: Container(
                            margin: EdgeInsets.only(
                                left: 35, right: 35, top: 45, bottom: 45),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25, bottom: 0, left: 0, right: 0),
                                  child: Text("YOUR E-MAIL"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0, bottom: 10, left: 0, right: 0),
                                  child: TextField(
                                    autofocus: true,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25, bottom: 0, left: 0, right: 0),
                                  child: Text("PASSWORD"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0, bottom: 10, left: 0, right: 0),
                                  child: TextField(
                                    obscureText: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                          top: 40, bottom: 20, left: 0, right: 0),
                                  child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => Register())
                                            );
                                          },
                                          child: Text("NEW USER? REGISTER HERE")),
                                )
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyApp())
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text("GO -->  "),
                              )
                      ),
                    )
                  ],
                ),

              ],
            )),
      ),
    );
  }
}
