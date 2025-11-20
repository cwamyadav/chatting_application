import 'package:a_chat/chatup/features/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository, ref: ref);
});

class AuthController {
  final AuthRepository authRepository;
  final Ref  ref;
  AuthController({
    required this.authRepository,
    required this.ref,
  });

  void signInWithPhone(BuildContext context, String phoneNumber) {
    authRepository.signInWithPhone(context, phoneNumber);
  }

  void verifyOtp(BuildContext context, String verificationId, String userOtp) {
    authRepository.verifyOtp(
        context: context, verificationId: verificationId, userOtp: userOtp);
  }

  void saveUserDataToFirebase(
      BuildContext context, String name, File? profilePic) {
    authRepository.saveUserDataToFirebase(
      name: name,
      profilepic: profilePic,
      ref: ref,
      context: context,
    );
  }
}
