import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HelloApp extends StatelessWidget {
  const HelloApp({super.key});

  Align getText() {
    final wordPair = WordPair.random();

    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.green,
        height: 300,
        width: 300,
        child: Center(
            child: Text(
          wordPair.asPascalCase,
          style: const TextStyle(
            fontSize: 40.0,
          ),
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[for (int i = 0; i < 10; i++) getText()],
    );
  }
}
