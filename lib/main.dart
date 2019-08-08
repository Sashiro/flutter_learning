import 'package:flutter/material.dart';
import 'package:flutter_learning/10_event_and_notification/EventAndNotificationHomeRoute.dart';
import 'package:flutter_learning/11_animation/AnimationHomeRoute.dart';
import 'package:flutter_learning/12_custom_widget/CustomHomeRoute.dart';
import 'package:flutter_learning/3_route_management/NamedNewRoute.dart';
import 'package:flutter_learning/3_route_management/NewRoute.dart';
import 'package:flutter_learning/4_package_dependencies/RandomWordRoute.dart';
import 'package:flutter_learning/7_widget/Echo.dart';
import 'package:flutter_learning/8_scrollable_widget/ScrollableHomeRoute.dart';
import 'package:flutter_learning/9_functional_widget/InheritedWidgetContainer.dart';
import 'package:flutter_learning/9_functional_widget/ThemeRoute.dart';

import '5_assets/AssetsRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "named_new_page": (context) => NamedNewRoute(),
        "random_word_page": (context) => RandomWordRoute(),
        "scrollable_home_page": (context) => ScrollableHomeRoute(),
        "event_notification_home_page": (context) =>
            EventAndNotificationHomeRoute(),
        "animation_home_page": (context) => AnimationHomeRoute(),
        "custom_home_page": (context) => CustomHomeRoute(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
              FlatButton(
                child: Text("open new route"),
                textColor: Colors.blue,
                onPressed: () => Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new NewRoute())),
              ),
              FlatButton(
                child: Text("open random word page"),
                textColor: Colors.deepOrange,
                onPressed: () =>
                    Navigator.pushNamed(context, "random_word_page"),
              ),
              FlatButton(
                child: Text("open assets route"),
                textColor: Colors.deepPurple,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AssetsRoute())),
              ),
              FlatButton(
                child: Text("get Echo"),
                textColor: Colors.deepOrangeAccent,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Echo.getEcho(context))),
              ),
              FlatButton(
                  child: Text("scrollable home page"),
                  textColor: Colors.tealAccent,
                  onPressed: () =>
                      Navigator.pushNamed(context, "scrollable_home_page")),
              FlatButton(
                child: Text("IneritedWidget"),
                textColor: Colors.lightBlue[500],
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InheritedWidgetContainer())),
              ),
              FlatButton(
                child: Text('Change Theme Page'),
                textColor: Colors.blue[200],
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThemeRoute())),
              ),
              FlatButton(
                child: Text('event and notfication page'),
                textColor: Colors.blue[300],
                onPressed: () => Navigator.pushNamed(
                    context, 'event_notification_home_page'),
              ),
              FlatButton(
                child: Text("Animation home page"),
                textColor: Colors.pinkAccent,
                onPressed: () =>
                    Navigator.pushNamed(context, 'animation_home_page'),
              ),
              FlatButton(
                child: Text("Custom home page"),
                textColor: Colors.blue[400],
                onPressed: () =>
                    Navigator.pushNamed(context, 'custom_home_page'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
