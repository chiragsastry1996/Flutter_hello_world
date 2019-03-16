import 'package:flutter/material.dart';
import 'status.dart';
import 'chat.dart';
import 'phone.dart';
import 'team.dart';
import 'login.dart';
import 'quick_access.dart';

void main() => runApp(Menu());

class Menu extends StatelessWidget {
  Widget build(BuildContext context) {
    return SquareCard();
  }
}

class SquareCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var item_list = ["Status", "Chat", "Phone", "Team"];
    var icon_list = ["assets/speech.png", "assets/speech.png", "assets/telephone.png", "assets/group.png"];
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Stack(
            alignment: Alignment.centerRight,
            children: <Widget>[
              Center(child: Text("DBS")),
              IconButton(
                  icon: new Icon(Icons.power_settings_new),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }),
            ],
          ),
        ),
        body: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/menu.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width * 0.85,
                width: MediaQuery.of(context).size.width * 0.85,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: _getTiles(item_list, icon_list, context),
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
List<Widget> _getTiles(List<String> navList, List<String> iconList, BuildContext context) {
  final List<Widget> tiles = <Widget>[];
  for (int i = 0; i < navList.length; i++) {
    tiles.add(new GridTile(
      child: new Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          color: const Color(0xff042375),
          margin: const EdgeInsets.all(10.0),
          child: new InkResponse(
            enableFeedback: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(iconList[i],
                    height: 30.0, width: 30.0,),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(navList[i], style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            onTap: () => _onTileClicked(i, context),
          )),
    ));
  }
  return tiles;
}
