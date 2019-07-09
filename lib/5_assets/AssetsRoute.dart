import 'package:flutter/material.dart';

class AssetsRoute extends StatefulWidget {
  @override
  _AssetsRouteState createState() {
    return _AssetsRouteState();
  }
}

class _AssetsRouteState extends State {
  double _textOpacity = 0.0;
  double _imageOpacity = 0.0;
  String text = "";

  void _showImage() {
    setState(() {
      if (_imageOpacity != 1.0) _imageOpacity = 1.0;
      if (_textOpacity != 0.0) _textOpacity = 0.0;
    });
  }

  void _showText() {
    setState(() {
      if (_imageOpacity != 0.0) _imageOpacity = 0.0;
      if (_textOpacity != 1.0) _textOpacity = 1.0;
    });
  }

  void _loadText() async {
    try {
      final String textFromJson = await DefaultAssetBundle.of(context)
          .loadString("assets/asset_json.json");
      setState(() {
        text = textFromJson;
      });
    } catch (e) {
      print(e);
      setState(() {
        text = "can not load assets/asset_json.json";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadText();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: FlatButton(
                    child: Text("show text"),
                    color: Colors.amber,
                    onPressed: _showText,
                  ),
                  margin: EdgeInsets.all(30.0),
                ),
                FlatButton(
                  child: Text("show image"),
                  onPressed: _showImage,
                )
              ],
            ),
            Stack(
              children: <Widget>[
                Opacity(
                  child: Text('$text'),
                  opacity: _textOpacity,
                ),
                Opacity(
                  child: Image.asset("pictures/asset_icon.png"),
                  opacity: _imageOpacity,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
