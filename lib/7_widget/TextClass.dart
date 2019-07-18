import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextClass {
  Text getText() => Text(
        "", // data
        key: Key("key"),
        // 最大行数
        maxLines: 2,
        overflow: TextOverflow.clip,
        /*TextOverflow 文本溢出时的处理
      clip：直接截掉
      fade：渐变透明
      ellipsis：文本末尾省略号
      visible：在容器外部渲染溢出文本
    */
        // 文本语义标签
        semanticsLabel: "",
        // 是否自动换行
        softWrap: false,
        // 支柱样式，用于计算支柱高度
        strutStyle: _getStrutStyle(),
        // 文本样式
        style: _getTextStyle(),

        textAlign: TextAlign.center,
        /*TextAlign 文本对齐方式，以Text宽度为准，因此只有一行时往往看不出效果
      center：居中
      left：左对齐
      right：右对齐
      justify：两端对齐
      start：开头对齐（受TextDirection影响）
      end：结尾对齐（受TextDirection影响）
    */
        // 对应语言，用于针对不同语言进行不同渲染
        locale: _getLocale(),
        // 文字方向
        textDirection: TextDirection.ltr,
        // 文字大小缩放因子，默认MediaQueryData.textScaleFactor获得，或者1.0
        textScaleFactor: 1.0,
      );

  Text getRichText() => Text.rich(_getTextSpan()); // 另一个构造函数，可使用TextSpan

  TextStyle _getTextStyle() => TextStyle(
      // 是否继承父widget属性
      inherit: true,
      // 不与backgroundColor共存
      background: Paint()..color = Colors.yellow,
      // 不与color共存
      foreground: Paint(),
      // 背景色
      backgroundColor: Colors.teal,
      // 字体颜色
      color: Colors.lightGreen,
      // 字体大小，单位：逻辑像素
      fontSize: 13.0,
      // 字体加粗
      fontWeight: FontWeight.normal,
      // 是否斜体
      fontStyle: FontStyle.italic,
      // 字符间距
      letterSpacing: 1.0,
      // 字或单词间距
      wordSpacing: 1.0,
      textBaseline: TextBaseline.alphabetic,
      /* 文本基线
      alphabetic：字母基线
      ideographic：底部对齐
       */
      // 行高 = height * fontSize
      height: 20.0,
      locale: _getLocale(),
      shadows: [
        Shadow(color: Color(0xFFFF0000), offset: Offset(3, 3), blurRadius: 3)
      ],
      // 文字装饰，无/下划线/上划线/删除线
      decoration: TextDecoration.lineThrough,
      // 装饰颜色
      decorationColor: Colors.lightGreen,
      // 装饰风格，实线/双线/虚线/点线/波浪线
      decorationStyle: TextDecorationStyle.dashed,
      // 指定字符集
      fontFamily: "");

  // https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry
  Locale _getLocale() => Locale(
      "Japanese", // language code
      "ja"); // [optional] country code

  // https://api.flutter.dev/flutter/painting/StrutStyle-class.html
  StrutStyle _getStrutStyle() => StrutStyle(
      // 默认是14
      fontSize: 20.0,
      //
      height: 20.0,
      // 默认是null
      leading: 20.0,
      //
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.italic,
      // 是否强制所有线以支柱高度布局，默认false
      forceStrutHeight: true,
      // 计算时使用的字体，将成为度量标准
      fontFamily: "");

  // https://api.flutter.dev/flutter/painting/TextSpan-class.html
  TextSpan _getTextSpan() => TextSpan(
      style: _getTextStyle(),
      text: "",
      // 允许包含其他TextSpan
      children: [TextSpan()],
      // 事件处理
      recognizer: TapGestureRecognizer());
}
