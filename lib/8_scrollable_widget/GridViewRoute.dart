import 'package:flutter/material.dart';

// GirdView大部分属性和ListView一致
class GridViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // 横轴4个子widget
            crossAxisCount: 4,
            // 宽高比
            childAspectRatio: 2.0),
        itemBuilder: (context, index) => Container(
          child: GridTile(
            header: Text("grid header"),
            child: Icon(index % 2 == 0 ? Icons.ac_unit : Icons.whatshot),
          ),
          color: index % 3 == 0 ? Colors.grey : Colors.black26,
        ),
        itemCount: 90,
      ),
    );
  }
}
