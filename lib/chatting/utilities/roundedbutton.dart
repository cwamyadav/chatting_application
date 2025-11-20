import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color colour;
  final String title;
  final VoidCallback onPressed;
  const RoundedButton({
    required this.colour,
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        elevation: 0.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          minWidth: 200.0,
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}