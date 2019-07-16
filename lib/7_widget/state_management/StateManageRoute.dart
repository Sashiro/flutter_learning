import 'package:flutter/material.dart';
import 'package:flutter_learning/7_widget/state_management/ManageBoth.dart';
import 'package:flutter_learning/7_widget/state_management/ManageByParent.dart';
import 'package:flutter_learning/7_widget/state_management/ManageBySelf.dart';

class StateManageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TapboxA(),
            ParentWidget(),
            BothParentWidget(),
          ],
        ),
      ),
    );
  }
}
