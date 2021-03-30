import 'package:antara/helpers.dart';
import 'package:antara/themes.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SettingsData {
  final List<String> _themeList = ["Default", "Light", "Dark"];
  final List<String> _weekStartList = [
    "Mo",
    "Tu",
    "We",
    "Th",
    "Fr",
    "Sa",
    "Su"
  ];
  Themes theme = Themes.Default;
  StartingDayOfWeek weekStart = StartingDayOfWeek.monday;
  TimeOfDay dailyNotTime = TimeOfDay(hour: 20, minute: 0);
  bool showDailyNot = true;

  SettingsData();

  SettingsData.fromJson(Map<String, dynamic> json)
      : theme = Themes.values[json['theme']],
        weekStart = StartingDayOfWeek.values[json['weekStart']],
        showDailyNot =
            (json['showDailyNot'] != null) ? json['showDailyNot'] : true,
        dailyNotTime = (json['notTime'] != null)
            ? parseTimeOfDay(json['notTime'])
            : TimeOfDay(hour: 20, minute: 0);

  ThemeData get getDark {
    if (theme != Themes.Light) {
      return darkTheme;
    } else {
      return lightTheme;
    }
  }

  ThemeData get getLight {
    if (theme != Themes.Dark) {
      return lightTheme;
    } else {
      return darkTheme;
    }
  }

  String get getTheme {
    return _themeList[theme.index];
  }

  List<String> get getThemeList {
    return _themeList;
  }

  String get getWeekStart {
    return _weekStartList[weekStart.index];
  }

  StartingDayOfWeek get getWeekStartEnum {
    return weekStart;
  }

  List<String> get getWeekStartList {
    return _weekStartList;
  }

  TimeOfDay get getDailyNot {
    return dailyNotTime;
  }

  bool get getShowDailyNot {
    return showDailyNot;
  }

  set setDailyNot(TimeOfDay notTime) {
    dailyNotTime = notTime;
  }

  set setTheme(String value) {
    theme = Themes.values[_themeList.indexOf(value)];
  }

  set setWeekStart(String value) {
    weekStart = StartingDayOfWeek.values[_weekStartList.indexOf(value)];
  }

  set setShowDailyNot(bool value) {
    showDailyNot = value;
  }

  Map<String, dynamic> toJson() => {
        '"theme"': theme.index,
        '"weekStart"': weekStart.index,
        '"notTime"': '"' +
            dailyNotTime.hour.toString() +
            ":" +
            dailyNotTime.minute.toString() +
            '"',
        '"showDailyNot"': showDailyNot
      };
}

enum Themes { Default, Light, Dark }
