// import 'package:flutter/material.dart';
/*
Platform  Firebase App Id
web       1:617402911467:web:79d51d70f8bc0dcfa80cae
android   1:617402911467:android:bf57b228baf8da83a80cae
ios       1:617402911467:ios:38fc096c19ef929ea80cae
*/
// void main() {
//   runApp(MyWidget());
// }

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text(
//             'data Sended by SomeOne',
//             style: TextStyle(
//                 color: Colors.red, fontWeight: FontWeight.bold, fontSize: 44),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:a_chat/chatup/colors.dart';
// import 'package:a_chat/chatup/features/auth/screens/otp_screen.dart';
// import 'package:a_chat/chatup/features/landing/screens/landing_screens.dart';
// import 'package:a_chat/chatup/router.dart';
// import 'package:a_chat/firebase_options.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'dart:io';

// /*
// auth folder: get the data data from the screens,



// void checkOSVersion() {
//   if (Platform.isAndroid) {
//     print("Android version: ${Platform.operatingSystemVersion}");
//   } else if (Platform.isIOS) {
//     print("iOS version: ${Platform.operatingSystemVersion}");
//   }
// }


// */

// Future<void> main() async {
//   void checkOSVersion() {
//   if (Platform.isAndroid) {
//     print("Android version: ${Platform.operatingSystemVersion}");
//   } else if (Platform.isIOS) {
//     print("iOS version: ${Platform.operatingSystemVersion}");
//   }
// }
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: backgroundColor,
//       ),
//       // home: Responsive(
//       //     webLayout: WebScreenLayout(), mobilelayout: MoblieScreenLayout())
//       onGenerateRoute: generateRoute,
//       initialRoute: LandingScreen.routename,
//     );
//   }
// }
import 'package:a_chat/chatting/screen/chat_screen.dart';
import 'package:a_chat/chatting/screen/login_screen.dart';
import 'package:a_chat/chatting/screen/registration_screen.dart';
import 'package:a_chat/chatting/screen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        ChatScreen.id: (context) =>  ChatScreen(),
      },
    );
  }
}
