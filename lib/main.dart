import 'package:management_app/core/constants/color_constants.dart';
import 'package:management_app/core/init/provider_list.dart';
import 'package:management_app/screens/home/home_screen.dart';
import 'package:management_app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


bool shouldUseFirebaseEmulator = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBWx0kWY2jnA0RWxOtWWwRbpKtWbxrjl84",
          authDomain: "management-app-ab89d.firebaseapp.com",
          projectId: "management-app-ab89d",
          storageBucket: "management-app-ab89d.appspot.com",
          messagingSenderId: "289176293124",
          appId: "1:289176293124:web:77b1065138f042d6a08a51",
          measurementId: "G-WB2VT16B9S"
      ),
    );


  }

  if (shouldUseFirebaseEmulator) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
  runApp(MyApp());
}

Widget build(BuildContext context) {
  return MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: FutureBuilder(
        builder: (context, snapshot) {
          return MyApp();
        },
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Management System ',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: bgColor, elevation: 0),
        scaffoldBackgroundColor: bgColor,
        primaryColor: greenColor,
        focusColor: greenColor,

        // highlightColor: greenColor,
        dialogBackgroundColor: secondaryColor,
        // buttonColor: greenColor,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: HomeScreen(),
    );
  }


  Widget _getLandingPage() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Container();
        } else {
          return Login(title: "Welcome to Management System");
        }
      },
    );
  }

}
