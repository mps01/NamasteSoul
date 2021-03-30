import 'package:antara/provider.dart';
import 'package:antara/screen/homepage.dart';
import 'package:antara/screen/music.dart';
import 'package:antara/screen/preview.dart';
import 'package:antara/screen/yoga.dart';
import 'package:antara/widget_habit/calendar_column.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'helpers.dart';

class Habo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Bloc()),
        ],
        child: Consumer<Bloc>(builder: (context, counter, _) {
          final bloc = Provider.of<Bloc>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Provider.of<Bloc>(context).getSettings.getLight,
            darkTheme: Provider.of<Bloc>(context).getSettings.getDark,
            home: HomeScreen(),
          );
        }));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
          child: Scaffold(
              key: Provider.of<Bloc>(context).getScafoldKey,
              appBar: AppBar(
                  title: Text(
                    "Habit Tracker",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  backgroundColor: Colors.transparent,
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.settings),
                      color: Colors.grey[400],
                      tooltip: 'Settings',
                      onPressed: () {
                        Provider.of<Bloc>(context, listen: false)
                            .hideSnackBar();
                        navigateToSettingsPage(context);
                      },
                    ),
                  ]),
              body: CalendarColumn(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Provider.of<Bloc>(context, listen: false).hideSnackBar();
                  navigateToCreatePage(context);
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
              bottomNavigationBar: ConvexAppBar(
                items: [
                  TabItem(icon: Icons.home_rounded, title: 'Home'),
                  TabItem(icon: Icons.my_library_music, title: 'Peace'),
                  TabItem(icon: Icons.camera, title: 'Detecter'),
                  TabItem(icon: Icons.today_rounded, title: 'Todo'),
                  TabItem(icon: Icons.fitness_center_rounded, title: 'Yoga'),
                ],
                backgroundColor: Color(0xFF21BFBD),
                style: TabStyle.react,
                initialActiveIndex: 3,
                onTap: (int i) {
                  if (i == 0) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                  if (i == 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicApp(),
                      ),
                    );
                  }
                  if (i == 2) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Tensorflow(),
                      ),
                    );
                  }
                  if (i == 4) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Yoga(),
                      ),
                    );
                  }
                },
              ))),
    );
  }
}
