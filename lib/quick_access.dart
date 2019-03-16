import 'package:flutter/material.dart';
import 'menu.dart';
import 'login.dart';
void main() => runApp(QuickAccess());

class QuickAccess extends StatelessWidget {
  Widget build(BuildContext context) {
    var screen_height = MediaQuery.of(context).size.height;
    var screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: Text("DBS")
        ),
        body: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/login.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: screen_width * 0.08),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 45),
                    child: Text(
                      "QUICK ACCESS",
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
                                  child: Text("Enter Quick Access Code"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 0, bottom: 10, left: 0, right: 0),
                                  child: TextField(
                                    autofocus: false,
                                    keyboardType: TextInputType.phone,
                                    obscureText: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, left: 0, right: 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Login())
                                      );
                                    },
                                    child: Text("FORGOT PASSWORD? CLICK HERE")),
                                )
                              ],
                            )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Menu())
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
              ),
            )),
        ),
    );
  }
}
