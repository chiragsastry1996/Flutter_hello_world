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
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text("Status"),
      ),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/status.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            margin: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0), bottom: Radius.circular(0))
              ),
              child: new FutureBuilder<List<Ticket>>(
                future: ticketDetailsFromSnow(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new Card(
                            elevation: 7,
                            color: const Color(0xfff0f0f0),
                            shape: RoundedRectangleBorder(
                              side: new BorderSide(color: color_status(snapshot.data[index].incident_number), width: 2.0),
                              borderRadius: BorderRadius.circular(8.0)),
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
                                            snapshot.data[index].incident_number.toString(),
                                            style: new TextStyle(
                                              fontSize: 16.0,
//                              color: Colors.yellow,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data[index].incident_number.toString(),
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
                                        Text(snapshot.data[index].status.toString())
                                      ],
                                    ),
                                    Text("Short Descprition: " + snapshot.data[index].status.toString())
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
      ),
    );
  }

  Color color_status(status) {
    if(status == "mojombo") {
      return Colors.blue;
    }
    else if(status == "defunkt") {
      return Colors.red;
    }
    else return Colors.green;
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
    String title = data[i]["login"].toString();
    String id = data[i]["id"].toString();
    Ticket user = new Ticket(incident_number: title,
      status: id ,category: title, description: title);
    list.add(user);
  }
  return list;
}

class Ticket {
  String incident_number;
  String status;
  String category;
  String description;
  Ticket({this.incident_number, this.status, this.category, this.description});
}
