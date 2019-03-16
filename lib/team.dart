import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Team extends StatefulWidget {
  const Team({Key key}) : super(key: key);

  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text("Team"),
      ),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/status.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/status.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
              child: Card(
                child: new FutureBuilder<List<Info>>(
                  future: infoDetailsFromDb(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        margin: EdgeInsets.only(
                            top: 15, left: 15, right: 15, bottom: 0),
                        child: Container(
                          margin: EdgeInsets.all(15.0),
                          child: new Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(child: Text("India")),
                                  Expanded(child: Text("Chirag")),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Expanded(child: Text("Australia")),
                                  Expanded(child: Text("Chirag")),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Expanded(child: Text("Middle East")),
                                  Expanded(child: Text("Chirag")),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Expanded(child: Text("Africa")),
                                  Expanded(child: Text("Chirag")),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Expanded(child: Text("North America")),
                                  Expanded(child: Text("Chirag")),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Expanded(child: Text("Email - ID")),
                                  Expanded(child: Text("Chirag")),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 0.0, right: 0.0, top: 20.0, bottom: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Phone",
                                      style: new TextStyle(fontSize: 20.0),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(child: Text("India")),
                                  Expanded(child: Text("Chirag")),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Expanded(child: Text("AU,NZ")),
                                  Expanded(child: Text("Chirag")),
                                ],
                              ),
                              Divider(),
                              Row(
                                children: <Widget>[
                                  Expanded(child: Text("Middle East")),
                                  Expanded(child: Text("Chirag")),
                                ],
                              ),
                              Divider(),
                              Row(children: <Widget>[
                                Expanded(child: Text("Africa")),
                                Expanded(child: Text("Chirag"))
                              ]),
                              Divider(),
                              Row(children: <Widget>[
                                Expanded(child: Text("North America")),
                                Expanded(child: Text("Chirag"))
                              ]),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.0,
                                      right: 0.0,
                                      top: 15.0,
                                      bottom: 5.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        "Market",
                                        style: new TextStyle(fontSize: 20.0),
                                      )
                                    ],
                                  )),
                              Text(
                                  "AO, AM, AU, BH, BW, CV, CY, TL, EG, ER, ET, FJ, GM, GH, GW, IN, IR, IQ, "
                                  "IL, JO, KE, KW, LB, LR, LY, MR, MU, NA, NZ, NG, OM, PG, QA, ST, SA, SL, SO, ZA, SD, "
                                  "SY, TEZ, TN, UG, AE, EH, YE, ZM, ZW, QA, LK, MV, BD, PK")
                            ],
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return new Text("${snapshot.error}");
                    }
                    return new Align(
                      child: CircularProgressIndicator(),
                      alignment: Alignment.center,
                    );
                  },
                ),
              )),
        ),
      ),
    );
  }
}

Future<List<Info>> infoDetailsFromDb() async {
  final response = await http.get('https://api.github.com/users');
  print(response.body);
  List responseJson = json.decode(response.body.toString());
  List<Info> userList = createInfoList(responseJson);
  return userList;
}

List<Info> createInfoList(List data) {
  List<Info> list = new List();
  for (int i = 0; i < data.length; i++) {
    String title = data[i]["login"];
    int id = data[i]["id"];
    Info user = new Info(name: title, id: id);
    list.add(user);
  }
  return list;
}

class Info {
  String name;
  int id;

  Info({this.name, this.id});
}
