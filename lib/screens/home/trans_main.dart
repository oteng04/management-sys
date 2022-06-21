import 'package:management_app/models/user.dart';
import 'package:management_app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:management_app/screens/home/components/side_menu_trans.dart';

import '../activity_actors/profile.dart';
import '../activity_actors/transporters.dart';
import 'components/side_menu_profile.dart';


class TransMainScreen extends StatelessWidget {
  // ProjActivity({required this.userMain});
  // final UserMain userMain;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenuTrans(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenuTrans(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: TransScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
