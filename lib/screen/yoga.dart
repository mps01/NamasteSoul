import 'package:antara/screen/homepage.dart';
import 'package:antara/screen/preview.dart';
import 'package:antara/util/pose_data.dart';
import 'package:antara/yoga/poses.dart';
import 'package:antara/yoga/scale_route.dart';
import 'package:camera/camera.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../habo.dart';
import 'music.dart';

class Yoga extends StatelessWidget {
  final List<CameraDescription> cameras;

  const Yoga({
    this.cameras,
  });
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFF21BFBD),
            title: Text(
              'YOGA',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Welcome Text
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(
                      'Select a level: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil.defaultSize.width,
                    height: ScreenUtil.defaultSize.height / 4.2,
                    child: GestureDetector(
                      onTap: () => _onPoseSelect(
                        context,
                        'Beginner',
                        beginnerAsanas,
                        Colors.amber[600],
                      ),
                      child: Card(
                        color: Colors.amber[600],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Beginners",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Image(
                                image: NetworkImage(
                                    "https://image.flaticon.com/icons/png/512/17/17968.png"),
                                height: 90,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                  ),
                  // Beginner Button
                  SizedBox(
                    width: ScreenUtil.defaultSize.width,
                    height: ScreenUtil.defaultSize.height / 4.2,
                    child: GestureDetector(
                      onTap: () => _onPoseSelect(
                        context,
                        'Intermediate',
                        intermediateAsanas,
                        Colors.deepOrange[300],
                      ),
                      child: Card(
                        color: Colors.deepOrange[300],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Intermediate",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Image(
                                image: NetworkImage(
                                    "https://image.flaticon.com/icons/png/128/3719/3719634.png"),
                                height: 90,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil.defaultSize.width,
                    height: ScreenUtil.defaultSize.height / 4.2,
                    child: GestureDetector(
                      onTap: () => _onPoseSelect(
                        context,
                        'Advance',
                        intermediateAsanas,
                        Colors.pink[300],
                      ),
                      child: Card(
                        color: Colors.pink[300],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Advance",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Image(
                                image: NetworkImage(
                                    "https://img.icons8.com/ios/452/speedometer.png"),
                                height: 90,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                  ),
                  // Intermediate Button
                ],
              ),
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
              initialActiveIndex: 4,
              onTap: (int i) {
                if (i == 0) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                }
                if (i == 3) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Habo(),
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
                if (i == 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MusicApp(),
                    ),
                  );
                }
              })),
    );
  }

  void _onPoseSelect(
    BuildContext context,
    String title,
    List<String> asanas,
    Color color,
  ) async {
    Navigator.push(
      context,
      ScaleRoute(
        page: Poses(
          cameras: cameras,
          title: title,
          model: "assets/models/posenet_mv1_075_float_from_checkpoints.tflite",
          asanas: asanas,
          color: color,
        ),
      ),
    );
  }
}
