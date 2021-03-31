import 'package:antara/commons/collapsing_navigation_drawer_widget.dart';
import 'package:antara/habo.dart';
import 'package:antara/screen/music.dart';
import 'package:antara/screen/preview.dart';
import 'package:antara/screen/yoga.dart';
import 'package:antara/widgets/image_slider.dart';
import 'package:camera/camera.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String uid;
  final String displayName;
  final String photoUrl;
  final List<CameraDescription> cameras;

  const HomePage({
    this.email,
    this.uid,
    this.displayName,
    this.photoUrl,
    this.cameras,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF21BFBD),
      drawer: CollapsingNavigationDrawer(),
      /* appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),*/
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu_rounded),
                  color: Colors.white,
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                Container(
                    width: 70.0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.toggle_off),
                            color: Colors.white,
                            iconSize: 40,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ))
              ]),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Namaste ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('Soul',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 30.0))
                      ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 185.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(75.0)),
                ),
                child: ListView(
                    primary: false,
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Today\'s Mantra',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.normal),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: 200,
                          child: Column(
                            children: <Widget>[
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: false,
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                ),
                                items: imageSliders,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Featured",
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Wrap(
                                spacing: 10,
                                runSpacing: 10.0,
                                children: <Widget>[
                                  SizedBox(
                                    width: 160.0,
                                    height: 160.0,
                                    child: GestureDetector(
                                      onTap: () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MusicApp(),
                                        ),
                                      ),
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Text(
                                                "Relax Music",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Image(
                                                image: NetworkImage(
                                                    "https://images.vexels.com/media/users/3/151183/isolated/preview/f8740a62cd25d5215b225f5fd6c881cc-portable-radio-icon-by-vexels.png"),
                                                height: 90,
                                              ),
                                            ],
                                          ),
                                        )),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160.0,
                                    height: 160.0,
                                    child: GestureDetector(
                                      onTap: () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Tensorflow(),
                                        ),
                                      ),
                                      child: Card(
                                        color: Color(0xFF21BFBD),
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Text(
                                                "Stress Check",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Image(
                                                image: NetworkImage(
                                                    "https://icon-library.com/images/mental-icon/mental-icon-2.jpg"),
                                                height: 80,
                                              ),
                                            ],
                                          ),
                                        )),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160.0,
                                    height: 160.0,
                                    child: GestureDetector(
                                      onTap: () => Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Habo(),
                                        ),
                                      ),
                                      child: Card(
                                        color: Color(0xFF21BFBD),
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Text(
                                                "Track Habit",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Image(
                                                image: NetworkImage(
                                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/GNOME_Todo_icon_2019.svg/1200px-GNOME_Todo_icon_2019.svg.png"),
                                                height: 90,
                                              ),
                                            ],
                                          ),
                                        )),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 160.0,
                                      height: 160.0,
                                      child: GestureDetector(
                                        onTap: () => Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Yoga(
                                              cameras: widget.cameras,
                                            ),
                                          ),
                                        ),
                                        child: Card(
                                          color: Colors.white,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0)),
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  "Yoga",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Image(
                                                  image: NetworkImage(
                                                      "https://cdn.iconscout.com/icon/free/png-256/yoga-292-1104073.png"),
                                                  height: 90,
                                                ),
                                              ],
                                            ),
                                          )),
                                        ),
                                      ))
                                ]),
                          ))
                    ]),
              )
            ]))
      ]),
    );
  }
}
