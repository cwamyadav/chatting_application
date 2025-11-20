import 'package:a_chat/chatup/colors.dart';
import 'package:a_chat/chatup/screen/mobile_chat_screen.dart';
import 'package:a_chat/info.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: info.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MobileChatScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child:
                            Image.network(info[index]['profilePic'].toString()),
                      ),
                      title: Text(
                        info[index]['name'].toString(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          info[index]['message'].toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      trailing: Text(
                        info[index]['time'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(
            color: dividerColor,
            indent: 85,
          ),
        ],
      ),
    );
  }
}
