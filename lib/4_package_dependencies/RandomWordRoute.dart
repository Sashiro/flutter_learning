import 'package:flutter/material.dart';
import 'package:flutter_learning/4_package_dependencies/EnglishWordsUtils.dart';

class RandomWordRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RandomWordPage"),
      ),
      body: Center(
        child: Text(EnglishWordsUtils.getRandomString()),
      ),
    );
  }
}
