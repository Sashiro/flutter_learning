import 'package:flutter/material.dart';

class ImageAndIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ImageAndIcon home"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              textColor: Colors.deepOrangeAccent,
              child: Text("Load from asset"),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Column(
                            children: <Widget>[
                              Image(
                                color: Colors.white,
                                image: AssetImage("pictures/asset_icon.png"),
                                width: 300,
                              ),
                              Image.asset(
                                "pictures/asset_icon.png",
                                width: 200,
                              )
                            ],
                          ))),
            ),
            RaisedButton(
              textColor: Colors.deepOrangeAccent,
              child: Text("Load from remote"),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Column(
                            children: <Widget>[
                              Image(
                                image: NetworkImage(
                                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                                width: 200.0,
                                fit: BoxFit.cover,
                                colorBlendMode: BlendMode.colorDodge,
                                color: Colors.amber,
                              ),
                              Image.network(
                                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                                width: 400.0,
                              )
                            ],
                          ))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.accessible,
                  color: Colors.deepPurple,
                ),
                Icon(
                  Icons.account_balance,
                  color: Colors.pinkAccent,
                ),
                Text(
                  "\uE90D",
                  style: TextStyle(
                      fontFamily: "MaterialIcons",
                      fontSize: 24.0,
                      color: Colors.tealAccent),
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      MyIcons.car,
                      color: Colors.lightBlue,
                    ),
                    Icon(
                      MyIcons.flag,
                      color: Colors.teal,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// https://www.dafont.com/peaxdrawnicons.font
class MyIcons {
  static const IconData car =
      const IconData(0082, fontFamily: 'myIcon', matchTextDirection: true);

  static const IconData flag =
      const IconData(0163, fontFamily: 'myIcon', matchTextDirection: true);
}
