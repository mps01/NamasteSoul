import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:antara/yoga/inference.dart';
import 'package:antara/yoga/yoga_card.dart';

class Poses extends StatelessWidget {
  final List<CameraDescription> cameras;
  final String title;
  final String model;
  final List<String> asanas;
  final Color color;

  const Poses({this.cameras, this.title, this.model, this.asanas, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Tap on the pose and check if you are doing it correct or not",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Center(
            child: Container(
              height: 500,
              child: Swiper(
                itemCount: asanas.length,
                loop: false,
                viewportFraction: 0.8,
                scale: 0.82,
                outer: true,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.all(32.0),
                ),
                onTap: (index) => _onSelect(context, asanas[index]),
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Container(
                      height: 360,
                      child: YogaCard(
                        asana: asanas[index],
                        color: color,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSelect(BuildContext context, String customModelName) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InferencePage(
          cameras: cameras,
          title: customModelName,
          model: "assets/models/posenet_mv1_075_float_from_checkpoints.tflite",
          customModel: customModelName,
        ),
      ),
    );
  }
}
