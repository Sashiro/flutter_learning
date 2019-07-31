import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  int _selectedPageIndex = 1;
  TabController _tabController;
  List tabs = ["News", "History", "Pictures"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化Tab Controller
    _tabController = TabController(length: tabs.length, vsync: this);

    /* 可以监听Tab页切换
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 1:
          break;
        case 2:
          break;
      }
    });
     */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppBar title
        title: Text("AppBar title"),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
//        leading: ,
        /*
       * 自定义leading则可以自定义左侧menu
       * // 打开抽屉菜单
       * Scaffold.of(context).openDrawer(); 
       */
        // 右侧的菜单list
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      // 左侧抽屉菜单
      drawer: _MyDrawer(),
      // 底部导航栏
      bottomNavigationBar: _getNavigationBarStyle2(),
      // 右下悬浮按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onFloatingTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 通过TabBarView可以实现滑动效果，跟TabBar持有同一个controller
      body: TabBarView(
        controller: _tabController,
        children: tabs
            .map((e) => Container(
                  alignment: Alignment.center,
                  child: Text(
                    e,
                    textScaleFactor: 5,
                  ),
                ))
            .toList(),
      ),
    );
  }

  void _onItemTapped(int index) {}

  void _onFloatingTapped() {}

  Widget _getNavigationBarStyle1() => BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text("business")),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text("school")),
        ],
        currentIndex: _selectedPageIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      );

  Widget _getNavigationBarStyle2() => BottomAppBar(
        color: Colors.white,
        // 打洞款
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home)),
            // 中间的位置空着
            SizedBox(),
            IconButton(
              icon: Icon(Icons.business),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      );
}

class _MyDrawer extends StatelessWidget {
  _MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "pictures/asset_icon.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "ClipOval",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add account"),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Manage account"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
