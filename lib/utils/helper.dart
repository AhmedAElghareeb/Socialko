import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

pushAndRemoveUntil(Widget page) {
  return Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (context) => page,
    ),
    (route) => false,
  );
}

push(Widget page) {
  return Navigator.of(navigatorKey.currentContext!).push(
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

pushBack([dynamic data]) {
  return Navigator.of(navigatorKey.currentContext!).pop(data);
}
