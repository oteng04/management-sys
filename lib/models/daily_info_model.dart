import 'package:management_app/core/constants/color_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DailyInfoModel {
  IconData? icon;
  String? title;
  int? percentage;
  Color? color;
  List<Color>? colors;

  DailyInfoModel({
    this.icon,
    this.title,
    this.percentage,
    this.color,
    this.colors,
   });

  DailyInfoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    color = json['color'];
    percentage = json['percentage'];
    colors = json['colors'];
   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['color'] = this.color;
    data['percentage'] = this.percentage;
    data['colors'] = this.colors;
     return data;
  }
}

List<DailyInfoModel> dailyDatas =
    dailyData.map((item) => DailyInfoModel.fromJson(item)).toList();


var dailyData = [
  {
    "title": "Project Actors",
    "icon": FlutterIcons.chart_bar_faw5,
    "color": primaryColor,
    "percentage": 100,
    "colors": [
      Color(0xff23b6e6),
      Color(0xff02d39a),
    ],

  },
  {
    "title": "Activity Database",
    "icon": FlutterIcons.documents_ent,
    "color": Color(0xFFFFA113),
    "percentage": 100,
    "colors": [Color(0xfff12711), Color(0xfff5af19)],

  },
  {
    "title": "Open Program Data",
    "icon": FlutterIcons.briefcase_ent,
    "color": Color(0xFFA4CDFF),
    "percentage": 100,
    "colors": [Color(0xff2980B9), Color(0xff6DD5FA)],

  },
  {
    "title": "Indicators",
    "icon": FlutterIcons.pie_chart_ent,
    "color": Color(0xFFd50000),
    "percentage": 100,
    "colors": [Color(0xff93291E), Color(0xffED213A)],

  },
  // {
  //   "title": "Efficiency",
  //   "volumeData": 5328,
  //   "icon": FlutterIcons.bell_faw5s,
  //   "totalStorage": "- %5",
  //   "color": Color(0xFF00F260),
  //   "percentage": 78,
  //   "colors": [Color(0xff0575E6), Color(0xff00F260)],
  //   "spots": [
  //     FlSpot(
  //       1,
  //       1.3,
  //     ),
  //     FlSpot(
  //       2,
  //       1.0,
  //     ),
  //     FlSpot(
  //       3,
  //       1.8,
  //     ),
  //     FlSpot(
  //       4,
  //       1.5,
  //     ),
  //     FlSpot(
  //       5,
  //       1.0,
  //     ),
  //     FlSpot(
  //       6,
  //       2.2,
  //     ),
  //     FlSpot(
  //       7,
  //       1.8,
  //     ),
  //     FlSpot(
  //       8,
  //       1.5,
  //     )
  //   ]
  // }
];

//final List<double> yValues = [
//  2.3,
//  1.8,
//  1.9,
//  1.5,
//  1.0,
//  2.2,
//  1.8,
//  1.5,
//];
