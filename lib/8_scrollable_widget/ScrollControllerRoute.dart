import 'package:flutter/material.dart';

class ScrollControllerRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScrollControllerState();
}

class _ScrollControllerState extends State<ScrollControllerRoute> {
  bool showToTopFlag = false;
  ScrollController _controller = ScrollController(keepScrollOffset: true);

  @override
  void initState() {
    super.initState();
    _initScrollController(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll Controller"),
        centerTitle: true,
      ),
      body: ListView.builder(
        // Tab页切换时Widget会被销毁，因此必须显式指定Key以保证滚动位置被保存
        key: PageStorageKey(1),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index"),
          );
        },
        itemCount: 50,
        controller: _controller,
      ),
      floatingActionButton: !showToTopFlag
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200),
                    // 动画曲线
                    curve: Curves.ease);
              },
            ),
    );
  }

  @override
  void dispose() {
    // 防内存泄漏
    _controller.dispose();
    super.dispose();
  }

  // jumpTo animateTo
  void _initScrollController(ScrollController controller) {
    controller.addListener(() {
//      print(controller.offset);
      if (_controller.offset < 1000 && showToTopFlag)
        setState(() {
          showToTopFlag = false;
        });
      else if (_controller.offset >= 1000 && !showToTopFlag)
        setState(() {
          showToTopFlag = true;
        });
    });
  }
}
