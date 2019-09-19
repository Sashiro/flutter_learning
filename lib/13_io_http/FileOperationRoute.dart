import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

/* 目录类别
 *          Flutter                           iOS                       Android
 * 临时目录：getTemporaryDirectory             NSTemporaryDirectory      getCacheDir
 * 文档目录：getApplicationDocumentsDirectory  NSDocumentDirectory       AppData目录
 * 外部存储：getExternalStorageDirectory       不支持，UnsupportedError   getExternalStorageDirectory
 *
 * 简单数据则使用插件：shared_preferences
 * */

class FileOperationRoute extends StatefulWidget {
  FileOperationRoute({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FileOperationRouteState();
}

class FileOperationRouteState extends State<FileOperationRoute> {
  int _counter;

  @override
  void initState() {
    super.initState();
    // read counter from local file
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Operation'),
      ),
      body: Center(
        child: Text('点击了 $_counter 次'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/counter.txt');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String counter = await file.readAsString();
      return int.parse(counter);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // 写入本地
    await (await _getLocalFile()).writeAsString('$_counter');
  }
}
