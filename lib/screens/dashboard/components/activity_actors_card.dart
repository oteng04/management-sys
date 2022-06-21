import 'package:management_app/core/constants/color_constants.dart';

import 'package:management_app/responsive.dart';
import 'package:management_app/screens/activity_actors/activity_actors.dart';
import 'package:management_app/screens/forms/input_form.dart';
import 'package:flutter/material.dart';
import 'package:management_app/screens/home/Proj_activity.dart';
import 'package:management_app/screens/home/Proj_data.dart';
import 'package:management_app/screens/home/activity_database.dart';
import 'package:management_app/screens/home/agg_main.dart';
import 'package:management_app/screens/home/exp_main.dart';
import 'package:management_app/screens/home/far_main.dart';
import 'package:management_app/screens/home/fin_main.dart';
import 'package:management_app/screens/home/fir_main.dart';
import 'package:management_app/screens/home/indicators.dart';
import 'package:management_app/screens/home/trans_main.dart';

import '../../../models/activity_actors_model.dart';
import '../../home/med_main.dart';
import '../../home/pro_main.dart';
import 'activity_actors_widget.dart';

class ActivityActorsCard extends StatelessWidget {
  const ActivityActorsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            // ElevatedButton.icon(
            //   style: TextButton.styleFrom(
            //     backgroundColor: Colors.green,
            //     padding: EdgeInsets.symmetric(
            //       horizontal: defaultPadding * 1.5,
            //       vertical:
            //           defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
            //     ),
            //   ),
            //   onPressed: () {
            //     Navigator.of(context).push(new MaterialPageRoute<Null>(
            //         builder: (BuildContext context) {
            //           return new FormMaterial();
            //         },
            //         fullscreenDialog: true));
            //   },
            //   icon: Icon(Icons.add),
            //   label: Text(
            //     "Add New",
            //   ),
            // ),
          ],
        ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: ActorsCard(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.2 : 1,
          ),
          tablet: ActorsCard(),
          desktop: ActorsCard(
            childAspectRatio: _size.width < 1400 ? 1.2 : 1.4,
          ),
        ),
      ],
    );
  }
}

class ActorsCard extends StatelessWidget {
  const ActorsCard({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
   }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: datum.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          ActivityActorsWidget(dailyData: datum[index],onClick: (){
            if(index == 0){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirMainScreen()),
              );
            }else if(index == 1){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExpMainScreen()),
              );
            }
            else if(index == 2){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AggMainScreen()),
              );
            }
            else if(index == 3){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProMainScreen()),
              );
            }
            else if(index == 4){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransMainScreen()),
              );
            }
            else if(index == 5){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FarMainScreen()),
              );
            }
            else if(index == 6){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FinMainScreen()),
              );
            }
            else if(index == 7){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MedMainScreen()),
              );
            }
          },),
    );
  }
}
