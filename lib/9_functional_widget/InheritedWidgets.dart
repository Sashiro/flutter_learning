import 'package:flutter/material.dart';
import 'package:flutter_learning/9_functional_widget/InheritedContext.dart';

class PlusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inheritedContext = InheritedContext.of(context);
//    final inheritedDataModel = inheritedContext.inheritedDataModel;

    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: RaisedButton(
        textColor: Colors.black,
        child: Text('+'),
        onPressed: inheritedContext.increment,
      ),
    );
  }
}

class MinusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inheritedContext = InheritedContext.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: RaisedButton(
        textColor: Colors.black,
        child: Text('-'),
        onPressed: inheritedContext.reduce,
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inheritedContext = InheritedContext.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
      child: Text(
        'current count: ${inheritedContext.inheritedDataModel.count}',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
