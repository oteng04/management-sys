import 'package:flutter/material.dart';
import 'package:management_app/screens/dashboard/components/form_card.dart';

import '../../core/constants/color_constants.dart';

class FormMaterialBackup extends StatefulWidget {
  @override
  _FormMaterialBackupState createState() => _FormMaterialBackupState();
}

class _FormMaterialBackupState extends State<FormMaterialBackup> {
  final _formKey = GlobalKey<FormState>();
  // final _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          //padding: EdgeInsets.all(defaultPadding),
          child: Container(
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                 SizedBox(height: defaultPadding),
                FormsCard(),
                SizedBox(height: defaultPadding),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Expanded(
                //       flex: 5,
                //       child: Column(
                //         children: [
                //
                //           RecentUsers(),
                //           SizedBox(height: defaultPadding),
                //           RecentDiscussions(),
                //           if (Responsive.isMobile(context))
                //             SizedBox(height: defaultPadding),
                //           if (Responsive.isMobile(context)) UserDetailsWidget(),
                //         ],
                //       ),
                //     ),
                //     if (!Responsive.isMobile(context))
                //       SizedBox(width: defaultPadding),
                //     // On Mobile means if the screen is less than 850 we dont want to show it
                //     if (!Responsive.isMobile(context))
                //       Expanded(
                //         flex: 2,
                //         child: UserDetailsWidget(),
                //       ),
                //   ],
                // )
              ],
            ),
          ),
        )
      ),
    );
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Container(
            child: Row(
      children: [
        Icon(
          Icons.verified,
          color: bgColor,
        ),
        SizedBox(
          width: 25,
        ),
        Text('Submitting form'),
      ],
    ))));
  }
}
