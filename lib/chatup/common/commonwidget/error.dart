import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({required this.error, super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
