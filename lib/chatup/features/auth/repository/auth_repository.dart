import 'package:a_chat/chatup/common/repositories/common_firebase_storage_repository.dart';
import 'package:a_chat/chatup/common/utils/utils.dart';
import 'package:a_chat/chatup/features/auth/screens/otp_screen.dart';
import 'package:a_chat/chatup/features/auth/screens/user_information_screen.dart';
import 'package:a_chat/chatup/models/user_model.dart';
import 'package:a_chat/chatup/screen/moblie_screen_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'dart:io';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
      // ref allow to interact with other provider.
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({
    required this.auth,
    required this.firestore,
  });
  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      print("CALLING VERIFY PHONE FOR: $phoneNumber");
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            throw Exception(e.message);
          },
          codeSent: (String verificationId, int? resendToken) async {
            Navigator.pushNamed(
              context,
              OtpScreen.routeName,
              arguments: verificationId,
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
  }) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOtp,
      );
      await auth.signInWithCredential(phoneAuthCredential);
      Navigator.pushNamedAndRemoveUntil(
          context, UserInformationScreen.routeName, (route) => false);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void saveUserDataToFirebase({
    required String name,
    required File? profilepic,
    required Ref ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl =
          'https://images.unsplash.com/photo-1619194617062-5a61b9c6a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60';
      if (profilepic != null) {
        ref
            .read(commonFirebaseStorageRepositoryProvider)
            .storeFileToFirebase('profilePic/$uid', profilepic);
      }
      var user = UserModel(
          name: name,
          uid: uid,
          profilePic: photoUrl,
          isOnline: true,
          phoneNumber: auth.currentUser!.uid,
          groupId: []);
      await firestore.collection('users').doc(uid).set(user.toMap());
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MoblieScreenLayout(), 
          ), 
          (route)=>false,  
          );
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
