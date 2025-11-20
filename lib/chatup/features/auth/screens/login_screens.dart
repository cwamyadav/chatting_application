import 'package:a_chat/chatup/colors.dart';
import 'package:a_chat/chatup/common/utils/utils.dart';
import 'package:a_chat/chatup/features/auth/controller/task_controller.dart';
import 'package:a_chat/chatup/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeName = 'LoginScreenRoute';
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  Country? country;
  @override
  void dispose() {
    super.dispose();
    phoneController
        .dispose(); // when visit that screen then already whateve enter that finished.
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        onSelect: (Country _country) {
          print('country slected: ${_country.phoneCode}');
          setState(() {
            country = _country;
          });
        });
  }

  // void sendPhoneNumber() {
  //   String phoneNumber = phoneController.text.trim();
  //   if (country != null && phoneNumber.isNotEmpty) {
  //     ref
  //         .read(authControllerProvider)
  //         .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
  //     // ref: a widget allow interact with providers
  //   } else {
  //     showSnackBar(context: context, content: 'fill out the field');
  //   }
  // }

  void sendPhoneNumber() {
    print("SEND PHONE PRESSED");

    String phoneNumber = phoneController.text.trim();
    print("COUNTRY = $country");
    print("PHONE = $phoneNumber");

    if (country != null && phoneNumber.isNotEmpty) {
      print("CALLING CONTROLLER SIGN IN");

      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    } else {
      print("MISSING FIELDS");
      showSnackBar(context: context, content: 'fill out the field');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter phone number'),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Whatsapp will need to varify your phone number'),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: pickCountry,
              child: Text(
                'Select Country',
                style: TextStyle(
                    color: Colors.lightBlueAccent, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                if (country != null) Text('+${country!.phoneCode}'),
                SizedBox(width: 10),
                SizedBox(
                  width: size.width * 0.50,
                  child: TextField(
                    controller: phoneController,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: 'phone Number',
                    ),
                  ),
                )
              ],
            ),
            Expanded(child: Container()),
            SizedBox(
              width: 100,
              child: CustomButton(text: 'next', onPressed: sendPhoneNumber),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
