import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/core/locator.dart';
import 'package:whatsapp/screens/calls_page.dart';
import 'package:whatsapp/screens/camera_page.dart';
import 'package:whatsapp/screens/chats_page.dart';
import 'package:whatsapp/screens/contacts_page.dart';
import 'package:whatsapp/screens/status_page.dart';
import 'package:whatsapp/viewmodels/main_model.dart';

class WhatsAppMain extends StatefulWidget {
  @override
  _WhatsAppMainState createState() => _WhatsAppMainState();
}

class _WhatsAppMainState extends State<WhatsAppMain> with SingleTickerProviderStateMixin{
 TabController _tabController;
 bool showMessage=true;

 @override
  void initState() {
    _tabController=TabController(vsync: this,length: 4,initialIndex: 1);
    _tabController.addListener(() {
      showMessage=_tabController.index !=0;
    });
    setState(() {});


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
   Firebase.initializeApp();
   var model = getIt<MainModel>();
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  floating: true,
                  title: Text("Whatsapp Clone"),
                  actions: <Widget>[
                    IconButton(icon: Icon(Icons.search), onPressed: () {} ),
                    IconButton(icon: Icon(Icons.more_vert), onPressed: () {} ),
                  ],
                )
              ];
            },
            body: Column(
              children: <Widget>[
               TabBar(
                    controller: _tabController,
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(Icons.camera),
                      ),
                      Tab(
                        text: "Chats",
                      ),
                      Tab(text: "Status",),
                      Tab(text: "Call",),
                    ],
                  ),

                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        CameraPage(),
                        ChatsPage(),
                        StatusPage(),
                        ContactsPage(),//CallsPage(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: showMessage ? FloatingActionButton(
        child: Icon(Icons.message,color: Colors.white),
        onPressed: () async {
          //await model.navigateToContacts();
          await model.navigateToContacts();
          },
      ) : null,
    );
  }
}
