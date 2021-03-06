import 'package:management_app/core/constants/color_constants.dart';
import 'package:management_app/models/activity_actors_model.dart';
import 'package:management_app/models/daily_info_model.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ActivityActorsWidget extends StatefulWidget {
  const ActivityActorsWidget({
    Key? key,
    required this.dailyData,
    required this.onClick
  }) : super(key: key);
  final ActivityActorsModel dailyData;
  final onClick;

  @override
  _ActivityActorsWidgetState createState() => _ActivityActorsWidgetState();
}

int _value = 1;

class _ActivityActorsWidgetState extends State<ActivityActorsWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      splashColor: greenColor,
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(defaultPadding * 0.75),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: widget.dailyData.color!.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Icon(
                    widget.dailyData.icon,
                    color: widget.dailyData.color,
                    size: 24,
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(right: 12.0),
                //   child: DropdownButton(
                //     icon: Icon(Icons.more_vert, size: 18),
                //     underline: SizedBox(),
                //     style: Theme.of(context).textTheme.button,
                //     value: _value,
                //     items: [
                //       DropdownMenuItem(
                //         child: Text("Daily"),
                //         value: 1,
                //       ),
                //       DropdownMenuItem(
                //         child: Text("Weekly"),
                //         value: 2,
                //       ),
                //       DropdownMenuItem(
                //         child: Text("Monthly"),
                //         value: 3,
                //       ),
                //     ],
                //     onChanged: (int? value) {
                //       setState(() {
                //         _value = value!;
                //       });
                //     },
                //   ),
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.dailyData.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 8,
                ),
                // Container(
                //   child: LineChartWidget(
                //     colors: widget.dailyData.colors,
                //     spotsData: widget.dailyData.spots,
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            ProgressLine(
              color: widget.dailyData.color!,
              percentage: widget.dailyData.percentage!,
            ),

          ],
        ),
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({
    Key? key,
    required this.colors,
    required this.spotsData,
  }) : super(key: key);
  final List<Color>? colors;
  final List<FlSpot>? spotsData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 30,
          child: LineChart(
            LineChartData(
                lineBarsData: [
                  LineChartBarData(
                      spots: spotsData,
                      belowBarData: BarAreaData(show: false),
                      aboveBarData: BarAreaData(show: false),
                      isCurved: true,
                      dotData: FlDotData(show: false),
                      colors: colors,
                      barWidth: 3),
                ],
                lineTouchData: LineTouchData(enabled: false),
                titlesData: FlTitlesData(show: false),
                axisTitleData: FlAxisTitleData(show: false),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false)),
          ),
        ),
      ],
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color color;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
