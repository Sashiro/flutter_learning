import 'package:flutter/material.dart';
import 'package:flutter_learning/8_scrollable_widget/GridViewRoute.dart';
import 'package:flutter_learning/8_scrollable_widget/ListViewRoute.dart';

class ScrollableHomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        leading: IconButton(
          icon: Icon(Icons.all_inclusive),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("ListView"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListViewRoute()));
              },
              color: Colors.limeAccent,
            ),
            FlatButton(
              color: Colors.tealAccent,
              child: Text("GridView"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GridViewRoute()));
              },
            ),
            FlatButton(
              color: Colors.cyan,
              child: Text("CustomScrollView"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
