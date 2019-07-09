import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New route")),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("This is a new route"),
            FlatButton(
              child: Text("transite to named new route"),
              textColor: Colors.amber,
              onPressed: () => Navigator.pushNamed(context, "named_new_page",
                  arguments: "from NewRoute"),
            )
          ],
        ),
      ),
    );
  }
}
