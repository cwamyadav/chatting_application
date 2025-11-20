import 'package:a_chat/chatup/colors.dart';
import 'package:a_chat/info.dart';
import 'package:flutter/material.dart';


class WebChatAppbar extends StatelessWidget {
  const WebChatAppbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
        color: webAppBarColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw-BBPGc9Q0tKwIjl6Il5Rl8xVG-59vO5Wdg&s'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Text(info[0]['name'].toString()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.phone,
                    color: Colors.grey,
                  )),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ), 
        ],
      ),
    );
  }
}
