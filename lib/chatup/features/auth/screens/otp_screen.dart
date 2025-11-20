import 'package:a_chat/chatup/colors.dart';
import 'package:a_chat/chatup/features/auth/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpScreen extends ConsumerWidget {
  static const String routeName = '/otp-screen';
  final String
      verificationId; // this verification sends firebase to our application.
  const OtpScreen({super.key, required this.verificationId});
  void verifyOtp(BuildContext context, String userOtp, WidgetRef ref) {
    ref
        .read(authControllerProvider)
        .verifyOtp(context, verificationId, userOtp);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifying your number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(textAlign: TextAlign.center, 'We have sent a sms with a code'),
            SizedBox(
              height: 4,
            ),
            SizedBox(
                width: size.width * 0.5,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '------ n',
                    hintStyle: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value.length == 6) {
                      print('verifying otp');
                      verifyOtp(context, value.trim(), ref);
                    }
                    print('this function was run');
                  },
                ),),
          ],
        ),
      ),
    );
  }
}
