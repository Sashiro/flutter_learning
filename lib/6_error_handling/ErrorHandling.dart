import 'dart:async';

class ErrorHandling {
  /*
   * 执行 do something的过程中拦截所有的print行为
   */
  void baseZone() {
    runZoned(
        () => {
              // do something
            },
        zoneSpecification: ZoneSpecification(
            print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      parent.print(zone, "Intercept: $line");
    }));
  }

  void onErrorZone() {
    runZoned(
        () => {
              // do something
            }, onError: (Object obj, StackTrace stack) {
      // do something
    });
  }

//  void collectLog(String line){
//    ... //收集日志
//  }
//  void reportErrorAndLog(FlutterErrorDetails details){
//    ... //上报错误和日志逻辑
//  }
//
//  FlutterErrorDetails makeDetails(Object obj, StackTrace stack){
//    ...// 构建错误信息
//  }
//
//  void main() {
//    FlutterError.onError = (FlutterErrorDetails details) {
//      reportErrorAndLog(details);
//    };
//    runZoned(
//          () => runApp(MyApp()),
//      zoneSpecification: ZoneSpecification(
//        print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
//          collectLog(line); // 收集日志
//        },
//      ),
//      onError: (Object obj, StackTrace stack) {
//        var details = makeDetails(obj, stack);
//        reportErrorAndLog(details);
//      },
//    );
//  }
}