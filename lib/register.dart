import 'package:flutter/material.dart';
import 'main.dart';
import 'register.dart';
void main() => runApp(Register());

class Register extends StatelessWidget {
  Widget build(BuildContext context) {
    var screen_height = MediaQuery.of(context).size.height;
    var screen_width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text("DBS"),
          leading: new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context, true);
                  }),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                      left: screen_width * 0.08, top: screen_height * 0.1),
              child: Text(
                "REGISTER",
                textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 45),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                      margin: EdgeInsets.symmetric(horizontal: screen_width * 0.08),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            child: Container(
                                    margin: EdgeInsets.only(
                                            left: 35, right: 35, top: 15, bottom: 25),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                                  top: 25, bottom: 0, left: 0, right: 0),
                                          child: Text("USER ID"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                                  top: 0, bottom: 10, left: 0, right: 0),
                                          child: TextField(
                                            autofocus: true,
                                            keyboardType: TextInputType.text,
                                          ),
                                        ),
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
                                                  top: 25, bottom: 0, left: 0, right: 0),
                                          child: Text("CONFIRM PASSWORD"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                                  top: 0, bottom: 10, left: 0, right: 0),
                                          child: TextField(
                                            obscureText: true,
                                          ),
                                        ),
                                      ],
                                    )),
                          ),
                          RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => MyApp())
                                    );
                                  },
                                  child: Text("GO -->")
                          )
                        ],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
