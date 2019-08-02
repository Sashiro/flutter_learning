import 'package:flutter/material.dart';
import 'package:flutter_learning/9_functional_widget/InheritedDataModel.dart';

class InheritedContext extends InheritedWidget {
  // model数据
  final InheritedDataModel inheritedDataModel;

  // +号方法
  final Function() increment;

  // -号方法
  final Function() reduce;

  const InheritedContext({
    Key key,
    @required this.inheritedDataModel,
    @required this.increment,
    @required this.reduce,
    @required Widget child,
  }) : super(key: key, child: child);

  static InheritedContext of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedContext); // Type targetType

  // model数据不相同时重建widget
  @override
  bool updateShouldNotify(InheritedContext oldWidget) =>
      inheritedDataModel != oldWidget.inheritedDataModel;
}
