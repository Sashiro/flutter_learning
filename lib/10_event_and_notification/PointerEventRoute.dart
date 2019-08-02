import 'package:flutter/material.dart';

class PointerEventRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PointerEventState();
}

class _PointerEventState extends State<PointerEventRoute> {
  PointerEvent _pointerEvent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${_pointerEvent?.position?.toString() ?? "Touch the screen"}'),
      ),
      body:
//      Listener(
//                onPointerDown: (event) => setState(() => _pointerEvent = event),
//        onPointerMove: (event) => setState(() => _pointerEvent = event),
//        onPointerUp: (event) => setState(() => _pointerEvent = event),
//          child: ConstrainedBox(
//            constraints: BoxConstraints.tight(Size(300.0, 150.0)),
//            child: Center(child: Text("Box A")),
//          ),
//          behavior: HitTestBehavior.opaque,
//          onPointerDown: (event) => print("down A")
//      ),
          Listener(
        onPointerDown: (event) => setState(() => _pointerEvent = event),
//        onPointerMove: (event) => setState(() => _pointerEvent = event),
//        onPointerUp: (event) => setState(() => _pointerEvent = event),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
//            Expanded(
//              child: Container(
//                margin: EdgeInsets.all(20.0),
//                color: Colors.blue,
//                child: Text('HitTestBehavior.deferToChild',
//                style: TextStyle(backgroundColor: Colors.teal),),
//              ),
//            )
            ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0, 150.0)),
              child: Center(
                child: Text('HitTestBehavior.deferToChild',
                    style: TextStyle(backgroundColor: Colors.teal)),
              ),
            ),
          ],
        ),
        behavior: HitTestBehavior.opaque,
      ),
    );
  }
}
