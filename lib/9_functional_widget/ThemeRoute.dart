import 'package:flutter/material.dart';

class ThemeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ThemeState();
}

class _ThemeState extends State<ThemeRoute> {
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,
        iconTheme: IconThemeData(color: _themeColor),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('主题切换'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text("颜色跟随主题"),
              ],
            ),
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("颜色固定"),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _themeColor =
              _themeColor == Colors.teal ? Colors.blue : Colors.teal),
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}

/*
 * context.inheritFromWidgetOfExactType 会在widget树中从当前位置向上查找第一个类型为_InheritedTheme的Widget。
 * 所以当局部使用Theme后，其子树中Theme.of()找到的第一个_InheritedTheme便是该Theme的。
 */
