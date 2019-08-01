import 'package:english_words/english_words.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ListViewRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListViewRouteState();
}

class _ListViewRouteState extends State<ListViewRoute> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 40.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("固定title"),
            ),
            Expanded(
              child: _createInfiniteList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  // 上拉加载
  // 若不足100条继续加载，若超过100条则显示没有更多了
  Widget _createInfiniteList() {
    return ListView.separated(
        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            if (_words.length - 1 < 100) {
              _retrieveData();
              return Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }
          return ListTile(
            title: Text(_words[index]),
          );
        },
        separatorBuilder: (context, index) => Divider(
              height: .0,
            ),
        itemCount: _words.length);
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {});
    });
  }

  // 带分割线
  Widget _createBySeparated() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index"),
          );
        },
        separatorBuilder: (context, index) {
          return index % 2 == 0
              ? Divider(
                  color: Colors.blue,
                )
              : Divider(
                  color: Colors.green,
                );
        },
        itemCount: 20);
  }

  Widget _createByBuilder() {
    return ListView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: 40,
        itemExtent: 40.0,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "$index",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
          );
        });
  }

  // 默认构造函数，只适合item少的情况
  Widget _createListView() {
    return ListView(
      // 要不要反向
      reverse: true,
      // If the [primary] argument is true, the [controller] must be null.
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      /*
         * NeverScrollableScrollPhysics: 禁用滚动
         * BouncingScrollPhysics: 回弹（iOS风格）
         * ClampingScrollPhysics：波纹（Android默认风格）
         * FixedExtentScrollPhysics：类似轮子形，仅适用于FixedExtendScrollControllers关联列表
         *
         */
      // 是否根据子Widget总长度设置ListView长度（有嵌套冲突时必须为true），默认false
      shrinkWrap: false,
      // 指定滚动方向上item的边长（纵向是高度，横向是宽度）
      itemExtent: null,
      // 自动对屏幕外item保活
      addAutomaticKeepAlives: true,
      // 是否禁止item重绘
      addRepaintBoundaries: true,
      addSemanticIndexes: true,
      cacheExtent: 1.0,
      children: <Widget>[],
      semanticChildCount: 20,
      dragStartBehavior: DragStartBehavior.down,
    );
  }
}

/*
如果需要自定义列表项生成模型，可以通过ListView.custom来自定义，它需要实现一个SliverChildDelegate用来给ListView生成列表项widget
https://github.com/flutterchina/flutter-in-action/blob/master/docs/chapter6/listview.md
 */