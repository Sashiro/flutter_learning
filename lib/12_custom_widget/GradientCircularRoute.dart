import 'dart:math';

import 'package:flutter/material.dart';

class GradientCircularRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: _GradientCircularProgressIndicator(
          radius: 30.0,
          strokeWidth: 10,
          colors: [
            Colors.cyan[100],
            Colors.cyan[200],
            Colors.cyan[300],
            Colors.cyan[400],
            Colors.cyan[500],
            Colors.cyan[600]
          ],
          value: 0.6,
        ),
      ),
    );
  }
}

class _GradientCircularProgressIndicator extends StatelessWidget {
  _GradientCircularProgressIndicator(
      {this.strokeWidth = 2.0,
      @required this.radius,
      @required this.colors,
      this.stops,
      this.strokeCapRound = false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.totalAngle = 2 * pi,
      this.value});

  // 粗细
  final double strokeWidth;

  // 半径
  final double radius;

  // 末端是否为圆角
  final bool strokeCapRound;

  // 当前进度[0.0, 1.0]
  final double value;

  // 背景色
  final Color backgroundColor;

  // 总弧度，2PI整圆，小于2PI是弧形
  final double totalAngle;

  // 渐变色列表
  final List<Color> colors;

  // 对应渐变色的终止点
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }

    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context).accentColor;
      _colors = [color, color];
    }

    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircularProgressPainter(
            strokeWidth: strokeWidth,
            strokeCapRound: strokeCapRound,
            backgroundColor: backgroundColor,
            value: value,
            total: totalAngle,
            radius: radius,
            colors: _colors),
      ),
    );
  }
}

// -----------------画笔-----------------
class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter(
      {this.strokeWidth: 10.0,
      this.strokeCapRound: false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.radius,
      this.total = 2 * pi,
      @required this.colors,
      this.stops,
      this.value});

  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius);
    }

    double _offset = strokeWidth / 2.0;
    double _value = value ?? .0;
    _value = _value.clamp(.0, 1.0) * total;
    double _start = .0;

    if (strokeCapRound) _start = asin(strokeWidth / (size.width - strokeWidth));

    Rect rect = Offset(_offset, _offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }

    if (_value > 0) {
      paint.shader = SweepGradient(
              startAngle: 0.0, endAngle: _value, colors: colors, stops: stops)
          .createShader(rect);

      canvas.drawArc(rect, _start, _value, false, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
