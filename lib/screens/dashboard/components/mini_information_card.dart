import 'package:management_app/core/constants/color_constants.dart';
import 'package:management_app/models/daily_info_model.dart';

import 'package:management_app/responsive.dart';
import 'package:management_app/screens/activity_actors/activity_actors.dart';
import 'package:management_app/screens/dashboard/components/mini_information_widget.dart';
import 'package:management_app/screens/forms/input_form.dart';
import 'package:flutter/material.dart';
import 'package:management_app/screens/home/Proj_activity.dart';
import 'package:management_app/screens/home/Proj_data.dart';
import 'package:management_app/screens/home/activity_database.dart';
import 'package:management_app/screens/home/indicators.dart';

class MiniInformation extends StatelessWidget {
  const MiniInformation({
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
          mobile: InformationCard(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.2 : 1,
          ),
          tablet: InformationCard(),
          desktop: InformationCard(
            childAspectRatio: _size.width < 1400 ? 1.2 : 1.4,
          ),
        ),
      ],
    );
  }
}

class InformationCard extends StatelessWidget {
  const InformationCard({
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
      itemCount: dailyDatas.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          MiniInformationWidget(dailyData: dailyDatas[index],onClick: (){
            if(index == 0){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProjActivityScreen()),
              );
            }else if(index == 1){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivityDBMainScreen()),
              );
            }
            else if(index == 2){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProjDataMainScreen()),
              );
            }
            else if(index == 3){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IndicatorMainScreen()),
              );
            }
          },),
    );
  }
}
