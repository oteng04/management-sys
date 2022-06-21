import 'package:management_app/models/user.dart';
import 'package:management_app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:management_app/screens/activity_actors/activity_actors.dart';
import 'package:management_app/screens/home/components/side_menu_proj.dart';

import '../activity_actors/processors.dart';
import '../activity_actors/profile.dart';
import 'components/side_menu_pro.dart';
import 'components/side_menu_profile.dart';


class ProMainScreen extends StatelessWidget {
  // ProjActivity({required this.userMain});
  // final UserMain userMain;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenuPro(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenuPro(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: ProScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
