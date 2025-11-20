import 'package:a_chat/chatup/colors.dart';
import 'package:a_chat/chatup/widget/contact_list.dart';
import 'package:flutter/material.dart';

class MoblieScreenLayout extends StatelessWidget {
  const MoblieScreenLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appBarColor,
          title: Text(
            'Ui Clone',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                )),
          ],
          bottom: const TabBar(
            indicatorColor: tabColor,
            indicatorWeight: 4,
            labelColor: tabColor,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.search), text: 'Search'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
              
            ],
          ),
        ),
        body: ContactList(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: tabColor,
            onPressed: () {},
            child: Icon(
              Icons.comment,
              color: Colors.white,
            )),
      ),
    );
  }
}
