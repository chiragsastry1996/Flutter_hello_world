import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(ChatBot());

class ChatBot extends StatelessWidget {
  Widget build(BuildContext context) {
    return WebviewScaffold(
          initialChild: Container(
            child: const Center(
              child: Text('Waiting.....'),
            ),
          ),
          url: "https://partonline.azurewebsites.net/chat.html",
          appBar: AppBar(
            centerTitle: true,
            title: Text('DBS Chatbot'),
          ),
    );
  }
}
