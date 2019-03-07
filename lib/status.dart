import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Status extends StatefulWidget {
  const Status({Key key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
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
      body: Container(
          margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
          child: Card(
            child: new FutureBuilder<List<Ticket>>(
              future: ticketDetailsFromSnow(),
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
                                        Text(
                                          snapshot.data[index].name,
                                          style: new TextStyle(
                                            fontSize: 16.0,
//                              color: Colors.yellow,
                                          ),
                                        ),
                                        Text(
                                          "In Progress",
                                          style: new TextStyle(
                                            fontSize: 16.0,
//                              color: Colors.yellow,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text("Category/Sub-Category: "),
                                      Text(snapshot.data[index].id.toString())
                                    ],
                                  ),
                                  Text("Short Descprition: PlaceHolder")
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

Future<List<Ticket>> ticketDetailsFromSnow() async {
  final response = await http.get('https://api.github.com/users');
  print(response.body);
  List responseJson = json.decode(response.body.toString());
  List<Ticket> userList = createTicketList(responseJson);
  return userList;
}

List<Ticket> createTicketList(List data) {
  List<Ticket> list = new List();
  for (int i = 0; i < data.length; i++) {
    String title = data[i]["login"];
    int id = data[i]["id"];
    Ticket user = new Ticket(name: title, id: id);
    list.add(user);
  }
  return list;
}

class Ticket {
  String name;
  int id;

  Ticket({this.name, this.id});
}
