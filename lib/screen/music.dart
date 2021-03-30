import 'package:antara/habo.dart';
import 'package:antara/model/radio.dart';
import 'package:antara/screen/homepage.dart';
import 'package:antara/screen/preview.dart';
import 'package:antara/screen/yoga.dart';
import 'package:antara/serene.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class MusicApp extends StatefulWidget {
  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  List<MyRadio> radios;
  MyRadio _selectedRadio;
  bool _isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  //we will need some variables
  void initState() {
    super.initState();
    fetchRadios();
    _audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == AudioPlayerState.PLAYING) {
        _isPlaying = true;
      } else {
        _isPlaying = false;
      }
      setState(() {});
    });
  }

  fetchRadios() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    radios = MyRadioList.fromJson(radioJson).radios;
    //  _selectedRadio = radios[0];
    //_selectedColor = Color(int.tryParse(_selectedRadio.color));

    setState(() {});
  }

  _playMusic(String url) {
    _audioPlayer.play(url);
    _selectedRadio = radios.firstWhere((element) => element.url == url);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          //let's start by creating the main UI of the app
          backgroundColor: Color(0xFF21BFBD),
          body: Container(
            child: Stack(
              children: [
                VxAnimatedBox()
                    .size(context.screenWidth, context.screenHeight)
                    .make(),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    title: "Relax Radios".text.xl4.bold.white.make(),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    centerTitle: true,
                  ).h(100).p16(),
                ),
                VxSwiper.builder(
                    itemCount: radios.length,
                    aspectRatio: 1.0,
                    enlargeCenterPage: true,
                    itemBuilder: (context, index) {
                      final rad = radios[index];
                      return VxBox(
                              child: ZStack([
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: VxBox(
                            child:
                                rad.category.text.uppercase.white.make().px16(),
                          )
                              .height(40)
                              .black
                              .alignCenter
                              .withRounded(value: 10.0)
                              .make(),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: VStack(
                            [
                              rad.name.text.xl3.white.bold.make(),
                              5.heightBox,
                              rad.tagline.text.sm.white.semiBold.make(),
                            ],
                            crossAlignment: CrossAxisAlignment.center,
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: [
                              Icon(
                                CupertinoIcons.play_circle,
                                color: Colors.white54,
                                size: 40,
                              ),
                              10.heightBox,
                              "Double tap to play".text.gray300.make(),
                            ].vStack())
                      ]))
                          .clip(Clip.antiAlias)
                          .bgImage(
                            DecorationImage(
                                image: NetworkImage(rad.image),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.3),
                                    BlendMode.darken)),
                          )
                          .border(color: Colors.black, width: 5.0)
                          .withRounded(value: 60.0)
                          .make()
                          .p16()
                          .centered()
                          .onInkDoubleTap(() {
                        _playMusic(rad.url);
                      });
                    }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: [
                    if (_isPlaying)
                      "Playing Now - ${_selectedRadio.name} FM"
                          .text
                          .white
                          .makeCentered(),
                    Icon(
                      _isPlaying
                          ? CupertinoIcons.stop_circle
                          : CupertinoIcons.play_circle,
                      color: Colors.white,
                      size: 50.0,
                    ).onInkTap(() {
                      if (_isPlaying) {
                        _audioPlayer.stop();
                      } else {
                        _playMusic(_selectedRadio.url);
                      }
                    })
                  ].vStack(),
                ).pOnly(bottom: context.percentHeight * 13),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FloatingActionButton.extended(
                        elevation: 2.0,
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.redAccent,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Serene(),
                            ),
                          );
                        },
                        label: Text(
                          "Customise",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ].vStack(),
                ).pOnly(bottom: context.percentHeight * 4)
              ],
              fit: StackFit.expand,
            ),
          ),
          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(icon: Icons.home_rounded, title: 'Home'),
              TabItem(icon: Icons.my_library_music, title: 'Peace'),
              TabItem(icon: Icons.camera, title: 'Detecter'),
              TabItem(icon: Icons.today_rounded, title: 'Todo'),
              TabItem(icon: Icons.fitness_center_rounded, title: 'Profile'),
            ],
            backgroundColor: Color(0xFF21BFBD),
            style: TabStyle.react,
            initialActiveIndex: 1,
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
              if (i == 4) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Yoga(),
                  ),
                );
              }
            },
          )),
    );
  }
}
