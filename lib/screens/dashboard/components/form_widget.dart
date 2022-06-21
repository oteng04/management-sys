import 'package:management_app/core/constants/color_constants.dart';
import 'package:management_app/models/activity_actors_model.dart';
import 'package:management_app/models/daily_info_model.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FormsWidget extends StatefulWidget {
  const FormsWidget({
    Key? key,
    this.children
  }) : super(key: key);
  final children;

  @override
  _FormsWidgetState createState() => _FormsWidgetState();
}


class _FormsWidgetState extends State<FormsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: widget.children
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     TextFormField(
      //
      //     )
      //
      //   ],
      // ),
    );
  }
}
