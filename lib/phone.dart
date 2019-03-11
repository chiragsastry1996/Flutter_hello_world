import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Phone extends StatefulWidget {
  const Phone({Key key}) : super(key: key);

  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
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
              body: Container(
                      margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
                      child: Card(
                        child: new FutureBuilder<List<Details>>(
                          future: teamDetailsFromDb(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return new ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return new Card(
                                                margin: EdgeInsets.all(15.0),
                                                child: Container(
                                                  margin: EdgeInsets.all(10.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.only(bottom: 10.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                          children: <Widget>[
                                                            Container(
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Image.asset('assets/boy.png'),
                                                                  Text("   Chirag DK")
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  Image.asset('assets/gmail.png',
                                                                    height: 30.0, width: 30.0, fit: BoxFit.contain),
                                                                  Text("   "),
                                                                  Image.asset('assets/call.png',
                                                                    height: 30.0, width: 30.0,)
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ));
                                      });
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
            ));
  }
}

Future<List<Details>> teamDetailsFromDb() async {
  final response = await http.get('https://api.github.com/users');
  print(response.body);
  List responseJson = json.decode(response.body.toString());
  List<Details> userList = createTeamList(responseJson);
  return userList;
}

List<Details> createTeamList(List data) {
  List<Details> list = new List();
  for (int i = 0; i < data.length; i++) {
    String title = data[i]["login"];
    int id = data[i]["id"];
    Details user = new Details(name: title, id: id);
    list.add(user);
  }
  return list;
}

class Details {
  String name;
  int id;

  Details({this.name, this.id});
}