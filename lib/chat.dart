import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(ChatBot());

class ChatBot extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
        "/": (_) => new WebviewScaffold(
          initialChild: Container(
            child: const Center(
              child: Text('Waiting.....'),
            ),
          ),
          url: "https://partonline.azurewebsites.net/chat.html",
          appBar: AppBar(
            title: Text('Parts Online Chatbot'),
            leading: new IconButton(
                    icon: new Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context, true);
                    }),
          ),
        ),
      },
    );
  }
}
