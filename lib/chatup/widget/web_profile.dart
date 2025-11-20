import 'package:a_chat/chatup/colors.dart';
import 'package:flutter/material.dart';

class WebProfile extends StatelessWidget {
  const WebProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        border: Border(
            right: BorderSide(
          color: dividerColor,
        )),
        color: webAppBarColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw-BBPGc9Q0tKwIjl6Il5Rl8xVG-59vO5Wdg&s'),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message,
                    color: Colors.grey,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
