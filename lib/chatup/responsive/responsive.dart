import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobilelayout;
  final Widget webLayout;
  const Responsive(
      {required this.webLayout, required this.mobilelayout, super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth > 900) {
        return webLayout;
      }
      return mobilelayout;
    });
  }
}
