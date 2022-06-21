import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:management_app/core/constants/color_constants.dart';
import 'package:management_app/responsive.dart';

import 'package:management_app/screens/dashboard/components/mini_information_card.dart';

import 'package:management_app/screens/dashboard/components/recent_forums.dart';
import 'package:management_app/screens/dashboard/components/recent_users.dart';
import 'package:management_app/screens/dashboard/components/user_details_widget.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../dashboard/components/header.dart';
import '../forms/input_form.dart';
import '../forms/input_form_bak.dart';

class FirScreen extends StatelessWidget {
  // ActivityActorsScreen({required this.userMain});
  // final UserMain userMain;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(defaultPadding),
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(),
              SizedBox(height: defaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical:
                            defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return new FormMaterialBackup();
                          },
                          fullscreenDialog: true));
                    },
                    icon: Icon(Icons.add),
                    label: Text(
                      "Add New",
                    ),
                  ),
                ],
              ),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [

                        RecentUsers(),
                        SizedBox(height: defaultPadding),
                        // RecentDiscussions(),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) UserDetailsWidget(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: UserDetailsWidget(),
                    ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
