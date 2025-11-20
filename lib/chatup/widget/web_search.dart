import 'package:a_chat/chatup/colors.dart';
import 'package:flutter/material.dart';

class WebSearch extends StatelessWidget {
  const WebSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.06,
      width: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          border: Border(
              bottom: const BorderSide(
        color: dividerColor,
      ))),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'search from here',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: searchBarColor,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Icon(
              Icons.search,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
