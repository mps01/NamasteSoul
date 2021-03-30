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
      projectId: 'movie_app-ifif5q7',
      secret: 'lo6w72002eidmenqkkzjzggo5ropn615liz4bf94lw3c0bup',
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
