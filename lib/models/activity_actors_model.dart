import 'package:management_app/core/constants/color_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ActivityActorsModel {
  IconData? icon;
  String? title;
  int? percentage;
  Color? color;
  List<Color>? colors;

  ActivityActorsModel({
    this.icon,
    this.title,
    this.percentage,
    this.color,
    this.colors,
   });

  ActivityActorsModel.fromJson(Map<String, dynamic> json) {
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

List<ActivityActorsModel> datum =
    data.map((item) => ActivityActorsModel.fromJson(item)).toList();


var data = [
  {
    "title": "Firms",
    "icon": FlutterIcons.direction_sli,
    "color": primaryColor,
    "percentage": 100,
    "colors": [
      Color(0xff3A405A),
      Color(0xff02d39a),
    ],

  },
  {
    "title": "Exporters",
    "icon": FlutterIcons.briefcase_ent,
    "color": Color(0xFFFFA113),
    "percentage": 100,
    "colors": [Color(0xfff12711), Color(0xfff5af19)],

  },
  {
    "title": "Aggregators",
    "icon": FlutterIcons.documents_ent,
    "color": Color(0xFFD9F2B4),
    "percentage": 100,
    "colors": [Color(0xff2980B9), Color(0xff6DD5FA)],

  },
  {
    "title": "Processors",
    "icon": FlutterIcons.progress_check_mco,
    "color": Color(0xFFd50000),
    "percentage": 100,
    "colors": [Color(0xff93291E), Color(0xffED213A)],

  },
  {
    "title": "Transporters",
    "icon": FlutterIcons.transfer_right_mco,
    "color": Color(0xFF32cd32),
    "percentage": 100,
    "colors": [Color(0xff93291E), Color(0xffED213A)],

  },
  {
    "title": "Farmers",
    "icon": FlutterIcons.graph_sli,
    "color": Color(0xFFFA198B),
    "percentage": 100,
    "colors": [Color(0xfff12711), Color(0xfff5af19)],

  },
  {
    "title": "Financial Institution",
    "icon": FlutterIcons.money_faw,
    "color": Color(0xFFFFB7C3),
    "percentage": 100,
    "colors": [Color(0xff2980B9), Color(0xff6DD5FA)],

  },
  {
    "title": "Media & Stations",
    "icon": FlutterIcons.airplay_mco,
    "color": Color(0xFFE36414),
    "percentage": 100,
    "colors": [Color(0xff93291E), Color(0xffED213A)],

  },
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
