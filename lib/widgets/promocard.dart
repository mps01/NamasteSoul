import 'package:antara/data/home_cards_data.dart';

import 'package:antara/screen/music.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget promoCard(image, text) {
  return AspectRatio(
    aspectRatio: 2.5 / 3,
    child: InkWell(
      onTap: () {
        if (text == cardTexts[0]) {
          Get.to(() => MusicApp());
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(image)),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                0.1,
                0.9
              ], colors: [
                Colors.redAccent.withOpacity(.8),
                Color(0xFF21BFBD).withOpacity(.1)
              ])),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
