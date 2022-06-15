import 'package:animated_login/animated_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:management_app/core/constants/color_constants.dart';
import 'package:management_app/core/widgets/app_button_widget.dart';
import 'package:management_app/core/widgets/input_widget.dart';
import 'package:management_app/screens/home/home_screen.dart';
import 'package:management_app/screens/login/components/slider_widget.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';
import 'components/dialog_builders.dart';
import 'components/login_functions.dart';
typedef OAuthSignIn = void Function();
final FirebaseAuth _auth = FirebaseAuth.instance;


class Login extends StatefulWidget {
  Login({required this.title});
  final String title;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
   LanguageOption language = _languageOptions[0];

   AuthMode currentMode = AuthMode.login;
  CancelableOperation? _operation;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnimatedLogin(
      onLogin: (LoginData data) async =>
          _authOperationLogIn(LoginFunctions(context).onLogin(data)),
      onSignup: (SignUpData data) async =>
          _authOperationSignUp(LoginFunctions(context).onSignup(data)),
      onForgotPassword: _onForgotPassword,
      // logo: Image.asset('assets/images/logo.gif'),
      // backgroundImage: 'images/background_image.jpg',
      signUpMode: SignUpModes.both,
      socialLogins: null,
      loginDesktopTheme: _desktopTheme,
      loginMobileTheme: _mobileTheme,
      nameController: nameController,
      emailController: emailController,
      passwordController: passwordController,
      confirmPasswordController: confirmPasswordController,
      loginTexts: _loginTexts,
        initialMode: currentMode,
      onAuthModeChange: (AuthMode newMode) async {
        currentMode = newMode;
        await _operation?.cancel();
      },
    );
  }

  Future<String?> _authOperationLogIn(Future<String?> func) async {
    await _operation?.cancel();
    _operation = CancelableOperation.fromFuture(func);
    final String? res = await _operation?.valueOrCancellation();
    if (_operation?.isCompleted == true) {
      // DialogBuilder(context).showResultDialog(res ?? 'Successful.');
     if(res == 'success'){

       ScaffoldSnackbar.of(context).show('Logged In');
       Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => HomeScreen()),
       );
     }else{
       ScaffoldSnackbar.of(context).show(res!);
     }
    }
    return res!;
  }

   Future<String?> _authOperationSignUp(Future<String?> func) async {
     await _operation?.cancel();
     _operation = CancelableOperation.fromFuture(func);
     final String? res = await _operation?.valueOrCancellation();
     if (_operation?.isCompleted == true) {
       // DialogBuilder(context).showResultDialog(res ?? 'Successful.');
       if(res == 'success'){
         ScaffoldSnackbar.of(context).show('Account successfully created');
         currentMode = AuthMode.login;
       }else{
         ScaffoldSnackbar.of(context).show(res!);
       }

     }
     return res;
   }

  Future<String?> _onForgotPassword(String email) async {
    await _operation?.cancel();
    return await onForgotPassword(email);
  }
   Future<String?> onForgotPassword(String email) async {
     await showDialog(
       context: context,
       builder: (context) {
         return AlertDialog(
           actions: [
             TextButton(
               onPressed: () {
                 Navigator.of(context).pop();
               },
               child: const Text('Send'),
             ),
           ],

           content: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: [
               const Text('Enter your email'),
               const SizedBox(height: 20),
               TextFormField(
                 initialValue: email,
                 onChanged: (value) {
                   email = value;
                 },
               ),
             ],
           ),
         );
       },
     );

     if (email != '') {
       try {
         await _auth.sendPasswordResetEmail(email: email);
         ScaffoldSnackbar.of(context).show('Password reset email is sent');
       } catch (e) {
         ScaffoldSnackbar.of(context).show('Error resetting');
       }
     }
     return null;
   }


   static List<LanguageOption> get _languageOptions => const <LanguageOption>[

    LanguageOption(
      value: 'English',
      code: 'EN',
      iconPath: 'assets/images/en.png',
    ),
  ];

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences for *DESKTOP* view.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginViewTheme get _desktopTheme => _mobileTheme.copyWith(
    // To set the color of button text, use foreground color.
    actionButtonStyle: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
    dialogTheme: const AnimatedDialogTheme(
      languageDialogTheme: LanguageDialogTheme(
          optionMargin: EdgeInsets.symmetric(horizontal: 80)),
    ),
    loadingSocialButtonColor: greenColor,
    formFieldBackgroundColor: secondaryColor,
    formFieldShadowColor: greenColor,
     backgroundColor: secondaryColor,
    loadingButtonColor: greenColor,
    showLabelTexts: false,
    focusedBorderColor: greenColor

  );

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences for *MOBILE* view.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginViewTheme get _mobileTheme => LoginViewTheme(
    // showLabelTexts: false,
    backgroundColor:  bgColor,
    formFieldBackgroundColor: bgColor,//const Color(0xFF000000),
    formWidthRatio: 60,
    showLabelTexts: false,
    focusedBorderColor: greenColor,
    emailIcon: Icon(Icons.mail,color: greenColor),
     passwordIcon: Icon(Icons.lock,color: greenColor),
     nameIcon: Icon(Icons.person,color: greenColor),
     actionButtonStyle: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.white),
       backgroundColor: MaterialStateProperty.all(greenColor),
    ),

  );

  LoginTexts get _loginTexts => LoginTexts(
    nameHint: _username,
    login: _login,
    signUp: _signup,
  );


  String get _username =>   'Username';

  String get _login =>   'Login';

  String get _signup =>   'Sign Up';


  //
  // Future<void> _emailAndPassword() async {
  //   if (formKey.currentState?.validate() ?? false) {
  //     setIsLoading();
  //
  //     try {
  //       if (mode == AuthMode.login) {
  //         await _auth.signInWithEmailAndPassword(
  //           email: emailController.text,
  //           password: passwordController.text,
  //         );
  //       } else if (mode == AuthMode.register) {
  //         await _auth.createUserWithEmailAndPassword(
  //           email: emailController.text,
  //           password: passwordController.text,
  //         );
  //       }
  //     } on FirebaseAuthException catch (e) {
  //       setState(() {
  //         error = '${e.message}';
  //       });
  //     } catch (e) {
  //       setState(() {
  //         error = '$e';
  //       });
  //     } finally {
  //       setIsLoading();
  //     }
  //   }
  // }
  //
  //
  // Future _resetPassword() async {
  //   String? email;
  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Send'),
  //           ),
  //         ],
  //         content: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             const Text('Enter your email'),
  //             const SizedBox(height: 20),
  //             TextFormField(
  //               onChanged: (value) {
  //                 email = value;
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  //
  //   if (email != null) {
  //     try {
  //       await _auth.sendPasswordResetEmail(email: email!);
  //       ScaffoldSnackbar.of(context).show('Password reset email is sent');
  //     } catch (e) {
  //       ScaffoldSnackbar.of(context).show('Error resetting');
  //     }
  //   }
  // }


}





/// Helper class to show a snackbar using the passed context.
class ScaffoldSnackbar {
  // ignore: public_member_api_docs
  ScaffoldSnackbar(this._context);

  /// The scaffold of current context.
  factory ScaffoldSnackbar.of(BuildContext context) {
    return ScaffoldSnackbar(context);
  }

  final BuildContext _context;

  /// Helper method to show a SnackBar.
  void show(String message) {
    ScaffoldMessenger.of(_context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}





