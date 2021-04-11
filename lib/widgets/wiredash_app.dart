import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;

  const WiredashApp(
      {Key key,
      @required this.navigatorKey,
      @required this.child,
      String languageCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'namaste-soul-p4zrkw6',
      secret: 'jf7q0jgadqbs1s1hg2rck03obg3zmvauakra21731iqeljyd',
      navigatorKey: navigatorKey,
      child: child,
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF21BFBD),

        // secondaryBackgroundColor: AppColor.vulcan,
        dividerColor: Colors.deepOrange[300],
      ),
    );
  }
}
