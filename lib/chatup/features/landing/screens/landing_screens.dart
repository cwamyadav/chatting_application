import 'package:a_chat/chatup/colors.dart';
import 'package:a_chat/chatup/features/auth/screens/login_screens.dart';
import 'package:a_chat/chatup/widget/custom_button.dart';
import 'package:flutter/material.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
class LandingScreen extends StatefulWidget {
  static const String routename =  '/landing';
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  void switchScren() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome to WhatsApp',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: size.height / 11),
            Image.asset(
              'images/bg.png',
              height: 300,
              width: 300,
              color: tabColor,
            ),
            SizedBox(height: size.height / 11),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: size.width * 0.50,
              child: CustomButton(
                text: 'Agree and Continue',
                onPressed: switchScren,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
