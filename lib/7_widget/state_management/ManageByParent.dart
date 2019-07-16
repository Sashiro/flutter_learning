import 'package:flutter/material.dart';

/*
 * 实际上就是通过回调
 * 将希望改变的状态的值回传给父widget
 * 再让父widget调用setState出发build
 */

// -------------- parent --------------------

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ParentState();
}

class _ParentState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

// -------------- TapboxB --------------------

class TapboxB extends StatelessWidget {
  final bool active;

  // typedef ValueChanged<T> = void Function(T value);
  final ValueChanged<bool> onChanged;

  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
