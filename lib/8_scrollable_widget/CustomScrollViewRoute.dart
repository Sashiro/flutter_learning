import 'package:flutter/material.dart';

class CustomScrollViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        // 碎片
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver AppBar"),
              background: Image.asset(
                "pictures/sliver.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // 主轴的子Widget间距
                mainAxisSpacing: 10.0,
                // 横轴的子Widget间距
                crossAxisSpacing: 20.0,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                        alignment: Alignment.center,
                        color: Colors.cyan[100 * (index % 9)],
                        child: Text("grid item $index"),
                      ),
                  childCount: 20),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              ),
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
