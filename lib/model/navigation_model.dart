import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({
    this.title,
    this.icon,
  });
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "About", icon: Icons.people_alt_rounded),
  NavigationModel(title: "Feedback", icon: Icons.feedback_rounded),
  NavigationModel(title: "Signout", icon: Icons.exit_to_app_rounded),
];
