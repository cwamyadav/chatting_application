import 'package:a_chat/chatup/common/commonwidget/error.dart';
import 'package:a_chat/chatup/features/auth/screens/login_screens.dart';
import 'package:a_chat/chatup/features/auth/screens/otp_screen.dart';
import 'package:a_chat/chatup/features/auth/screens/user_information_screen.dart';
import 'package:a_chat/chatup/features/landing/screens/landing_screens.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LandingScreen.routename:
      return MaterialPageRoute(
        builder: (context) => const LandingScreen(),
      );
    case LoginScreen.routeName: // <-- ADD THIS
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
      );
    case OtpScreen.routeName: // <-- ADD THIS
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OtpScreen( 
          verificationId: verificationId,
        ),
      );

    case UserInformationScreen.routeName:
      return MaterialPageRoute(builder: (context) => UserInformationScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: ErrorScreen(error: "This page doesn't exist"),
        ),
      );
  }
}
