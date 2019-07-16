import 'package:flutter/material.dart';

class LifecycleWidget extends StatefulWidget {
  const LifecycleWidget({
    Key key,
    this.initValue: 0,
  }) : super(key: key);

  final int initValue;

  @override
  _LifecycleState createState() => _LifecycleState();
}

class _LifecycleState extends State<LifecycleWidget> {
  int _counter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = widget.initValue;
    print("lifecycle: initState");
  }

  @override
  Widget build(BuildContext context) {
    print("lifecycle: build");
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          onPressed: () => setState(
                () => ++_counter,
              ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(LifecycleWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("lifecycle: didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("lifecycle: deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("lifecycle: dispose");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("lifecycle: reassemble");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("lifecycle: didChangeDependencies");
  }
}
