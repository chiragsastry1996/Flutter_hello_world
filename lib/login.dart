import 'package:flutter/material.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
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
      body: Center(
        child: Container(
            alignment: Alignment.center,
            child: Container(
                constraints: BoxConstraints(
//                    maxHeight: MediaQuery.of(context).size.width * 0.85,
                  maxWidth: MediaQuery.of(context).size.width * 0.8,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
//                    minHeight: MediaQuery.of(context).size.width * 0.85
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 15, right: 15.0, top: 25, bottom: 35),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 25,bottom: 0,left: 0,right: 0),
                            child: Text("YOUR E-MAIL"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0,bottom: 10,left: 0,right: 0),
                            child: TextField(
                              autofocus: true,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25,bottom: 0,left: 0,right: 0),
                            child: Text("PASSWORD"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0,bottom: 10,left: 0,right: 0),
                            child: TextField(
                              obscureText: true,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40,bottom: 20,left: 0,right: 0),
                            child: Text("FORGOT YOUR PASSWORD?"),
                          )
                        ],
                      )),
                ))),
      ),
    ));
  }
}
