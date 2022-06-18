import 'package:management_app/models/user.dart';
import 'package:management_app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:management_app/screens/activity_actors/activity_actors.dart';
import 'package:management_app/screens/home/components/side_menu_proj.dart';


class ProjActivityScreen extends StatelessWidget {
  // ProjActivity({required this.userMain});
  // final UserMain userMain;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenuProj(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenuProj(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: ActivityActorsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}