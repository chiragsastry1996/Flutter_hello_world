import 'package:flutter/material.dart';
import 'status.dart';

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
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: _getTiles(item_list),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

// Function to be called on click
void _onTileClicked(int index) {
  debugPrint("You tapped on item $index");
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => status()),
  );
}

// Get grid tiles
List<Widget> _getTiles(List<String> navList) {
  final List<Widget> tiles = <Widget>[];
  for (int i = 0; i < navList.length; i++) {
    tiles.add(new GridTile(
      child: new Card(
          color: const Color(0xff2980b9),
          margin: const EdgeInsets.all(10.0),
          child: new InkResponse(
            enableFeedback: true,
            child: Center(
              child: new Text(navList[i]),
            ),
            onTap: () => _onTileClicked(i),
          )),
    ));
  }
  return tiles;
}
