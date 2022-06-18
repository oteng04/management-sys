import 'package:management_app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:management_app/screens/home/Proj_data.dart';
import 'package:management_app/screens/home/activity_database.dart';

import '../../../models/user.dart';
import '../Proj_activity.dart';
import '../home_screen.dart';
import '../indicators.dart';
import '../profile_main.dart';

class SideMenuIndicator extends StatelessWidget {
  const SideMenuIndicator({
    Key? key,
  // required this.userMain
  }) : super(key: key);
  // final UserMain userMain;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: defaultPadding * 3,
                ),
                // Image.asset(
                //   "assets/logo/logo_icon.png",
                //   scale: 5,
                // ),
                SizedBox(
                  height: defaultPadding,
                ),
                Text("Management System")
              ],
            )),
            DrawerListTile(
              title: "Dashboard",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              color: Colors.white54,
            ),
            DrawerListTile(
              title: "Project Actors",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProjActivityScreen()),
                );
              },
              color: Colors.white54,
            ),

            DrawerListTile(
              title: "Activity Database",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivityDBMainScreen()),
                );
              },
              color: Colors.white54,
            ),
            DrawerListTile(
              title: "Open Program Data",
              svgSrc: "assets/icons/menu_store.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProjDataMainScreen()),
                );
              },
              color: Colors.white54,
            ),
            DrawerListTile(
              title: "Indicators",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IndicatorMainScreen()),
                );
              },
              color: greenColor,
            ),
            // DrawerListTile(
            //   title: "Dummy",
            //   svgSrc: "assets/icons/menu_store.svg",
            //   press: () {},
            // ),
            // DrawerListTile(
            //   title: "Dummy",
            //   svgSrc: "assets/icons/menu_notification.svg",
            //   press: () {},
            // ),
            DrawerListTile(
              title: "Profile",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileMainScreen()),
                );
              },
              color: Colors.white54,
            ),
            // DrawerListTile(
            //   title: "Dummy",
            //   svgSrc: "assets/icons/menu_setting.svg",
            //   press: () {},
            // ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.color,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: color,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: color),
      ),
    );
  }
}
