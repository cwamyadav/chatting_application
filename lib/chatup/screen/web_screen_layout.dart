import 'package:a_chat/chatup/colors.dart';
import 'package:a_chat/chatup/widget/chat_list.dart';
import 'package:a_chat/chatup/widget/contact_list.dart';
import 'package:a_chat/chatup/widget/web_chat_appbar.dart';
import 'package:a_chat/chatup/widget/web_profile.dart';
import 'package:a_chat/chatup/widget/web_search.dart';
import 'package:flutter/material.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Column(
              children: [
                // web profile bar
                WebProfile(),
                // search bar
                WebSearch(),
                Expanded(child: ContactList()),
              ],
            ),
          ),
          // chat section
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                // Chat app bar
                WebChatAppbar(),
                // chat List
                Expanded(child: ChatList()),
                // input field
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      color: dividerColor,
                    )),
                    color: chatBarMessage,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.grey,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.attach_file_outlined,
                            color: Colors.grey,
                          )),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 15),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: searchBarColor,
                              filled: true,
                              hintText: 'Type a message',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              contentPadding: EdgeInsets.only(left: 20),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.mic,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
