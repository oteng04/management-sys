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

class MedScreen extends StatelessWidget {
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

            ],
          ),
        ),
      ),
    );
  }
}
