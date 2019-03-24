import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'utils_app.dart';

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
                              side: new BorderSide(color: color_status(snapshot.data[index].status.toString().toLowerCase()), width: 2.0),
                              borderRadius: BorderRadius.circular(8.0)),
                              margin: EdgeInsets.all(15.0),
                              child: Container(
                                margin: EdgeInsets.only(left: 15, right: 10, top: 15, bottom: 10),
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
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
//                              color: Colors.yellow,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data[index].status.toString(),
                                            style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
//                              color: Colors.yellow,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: RichText(
                                        text: new TextSpan(
                                          // Note: Styles for TextSpans must be explicitly defined.
                                          // Child text spans will inherit styles from parent
                                          style: new TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            new TextSpan(text: "Category/Sub-Category: ", style: new TextStyle(fontWeight: FontWeight.bold)),
                                            new TextSpan(text: snapshot.data[index].category.toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: RichText(
                                        text: new TextSpan(
                                          // Note: Styles for TextSpans must be explicitly defined.
                                          // Child text spans will inherit styles from parent
                                          style: new TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            new TextSpan(text: "Reported Service: ", style: new TextStyle(fontWeight: FontWeight.bold)),
                                            new TextSpan(text: snapshot.data[index].display_value.toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: RichText(
                                        text: new TextSpan(
                                          // Note: Styles for TextSpans must be explicitly defined.
                                          // Child text spans will inherit styles from parent
                                          style: new TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            new TextSpan(text: "Short Descprition: ", style: new TextStyle(fontWeight: FontWeight.bold)),
                                            new TextSpan(text: snapshot.data[index].description.toString()),
                                          ],
                                        ),
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
      ),
    );
  }

  Color color_status(status) {

    if(status == "pending") {
      return Colors.red;
    }
    else if( status == "work in progress" || status == "assigned") {
    return Colors.yellow;
    }
    else if(status == "resolved") {
      return Colors.green;
    }
    else if(status == "closed") {
      return Colors.green;
    }else return Colors.transparent;
  }

}

Future<List<Ticket>> ticketDetailsFromSnow() async {

  final response = await http.get('https://hclitsmsbox.service-now.com/api/now/table/incident?'
    'sysparm_query=caller_id%3D26497fc4db865f08b3e6454039961958&sysparm_display_value=true&'
    'sysparm_exclude_reference_link=false',
                    headers: {'authorization': utils_app().basicAuth});
  print(response.body);
  Map responseJson = json.decode(response.body.toString());
  List data = responseJson["result"];
  List<Ticket> userList = createTicketList(data);
  return userList;
}

List<Ticket> createTicketList(List data) {
  List<Ticket> list = new List();
  for (int i = 0; i < data.length; i++) {
    String id = data[i]["number"].toString();
    String state = "Not Available";
    if(data[i]["state"].toString().isNotEmpty) {
      state = data[i]["state"].toString();
    }

    String category = data[i]["category"].toString();
    String display_name = data[i]["u_reported_ci_service"]["display_value"].toString();
    String subcategory = "Not Available";
    switch(state.toLowerCase()) {
      case "pending" :
        subcategory = "Teams are working on fixing this issue. We have alerted the team on your enquiry and an agent will contact you soon with a more detailed update.";
        break;
      case "work in progress" :
        subcategory = "Teams are working on fixing this issue. We have alerted the team on your enquiry and an agent will contact you soon with a more detailed update.";
        break;
      case "assigned" :
        subcategory = "Teams are working on fixing this issue. We have alerted the team on your enquiry and an agent will contact you soon with a more detailed update.";
        break;
      case "resolved" :
        subcategory = "The reported issue is resolved. Please contact the DBS team @ __<<Mailbox +      Phone number>>_______ to reopen the ticket if issue is not fixed.";
        break;
      case "closed" :
        subcategory = "This ticket has been closed for more than 10 days. If issue persists, please register a new ticket with DBS for the same.";
        break;
    }
    Ticket user = new Ticket(incident_number: id,
      status: state ,category: category, description: subcategory, display_value: display_name);
    list.add(user);
  }
  return list;
}

class Ticket {
  String incident_number;
  String status;
  String category;
  String description;
  String display_value;
  Ticket({this.incident_number, this.status, this.category, this.description, this.display_value});
}
