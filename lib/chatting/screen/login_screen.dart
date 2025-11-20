import 'package:a_chat/chatting/screen/chat_screen.dart';
import 'package:a_chat/chatting/utilities/roundedbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:a_chat/chatting/constant/constant.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlashChat')),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                    height: 200.0, child: Image.asset('images/logo.png')),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
              child: TextField(
                onChanged: (value) => email = value,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
              child: TextField(
                obscureText: true,
                onChanged: (value) => password = value,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RoundedButton(
                colour: Colors.blueAccent,
                title: 'Login',
                onPressed: () async {
                  setState(() => showSpinner = true);
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email.trim(), password: password);
                    if (user.user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print('Login error: $e');
                  } finally {
                    setState(() => showSpinner = false);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
