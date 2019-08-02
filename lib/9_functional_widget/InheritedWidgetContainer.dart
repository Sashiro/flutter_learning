import 'package:flutter/material.dart';
import 'package:flutter_learning/9_functional_widget/InheritedContext.dart';
import 'package:flutter_learning/9_functional_widget/InheritedDataModel.dart';
import 'package:flutter_learning/9_functional_widget/InheritedWidgets.dart';

class InheritedWidgetContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InheritedWidgetContainerState();
}

class _InheritedWidgetContainerState extends State<InheritedWidgetContainer> {
  InheritedDataModel inheritedDataModel;

  _initData() {
    inheritedDataModel = InheritedDataModel(0);
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  _incrementCount() {
    setState(() {
      inheritedDataModel = InheritedDataModel(inheritedDataModel.count + 1);
    });
  }

  _reduceCount() {
    setState(() {
      inheritedDataModel = InheritedDataModel(inheritedDataModel.count - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedContext(
      inheritedDataModel: inheritedDataModel,
      increment: _incrementCount,
      reduce: _reduceCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('InheritedWidget'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Text(
                '我们常使用的\nTheme.of(context).textTheme\nMediaQuery.of(context).size等\n就是通过InheritedWidget实现的',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            PlusWidget(),
            TextWidget(),
            MinusWidget(),
          ],
        ),
      ),
    );
  }
}
