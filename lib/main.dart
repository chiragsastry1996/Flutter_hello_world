import 'package:flutter/material.dart';
import 'status.dart';
import 'chat.dart';
import 'phone.dart';
import 'team.dart';
import 'login.dart';

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
    var item_list = ["Status", "Chat", "Phone", "Team"];
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("DBS"),
        ),
        body: Center(
          child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.width * 0.85,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Card(
                shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: _getTiles(item_list, context),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

// Function to be called on click
void _onTileClicked(int index, BuildContext context) {
  debugPrint("You tapped on item $index");
  switch (index) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Status()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatBot()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Phone()),
      );
      break;
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Team()),
      );
      break;
  }
}

// Get grid tiles
List<Widget> _getTiles(List<String> navList, BuildContext context) {
  final List<Widget> tiles = <Widget>[];
  for (int i = 0; i < navList.length; i++) {
    tiles.add(new GridTile(
      child: new Card(
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),
          color: const Color(0xff2980b9),
          margin: const EdgeInsets.all(10.0),
          child: new InkResponse(
            enableFeedback: true,
            child: Center(
              child: new Text(navList[i]),
            ),
            onTap: () => _onTileClicked(i, context),
          )),
    ));
  }
  return tiles;
}
