import 'package:camera/camera.dart';
import 'package:clone_whatsapp/home/views/ContactView.dart';
import 'package:flutter/material.dart';
import 'package:clone_whatsapp/home/views/Calls.dart';
import 'package:clone_whatsapp/home/views/Camera.dart';
import 'package:clone_whatsapp/home/views/Chats.dart';
import 'package:clone_whatsapp/home/views/Status.dart';

class WhatsAapHome extends StatefulWidget {
  final List<CameraDescription> cameras;
  WhatsAapHome(this.cameras);

  @override
  _WhatsAapHomeState createState() => _WhatsAapHomeState();
}

class _WhatsAapHomeState extends State<WhatsAapHome>
    with SingleTickerProviderStateMixin {
  var _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, initialIndex: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp Clone"),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "Chats".toUpperCase()),
            Tab(text: "status".toUpperCase()),
            Tab(text: "calls".toUpperCase())
          ],
          controller: _tabController,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: TabBarView(
        children: <Widget>[
          CameraView(widget.cameras),
          ChatViewList(),
          StatusView(),
          CallsView()
        ],
        controller: _tabController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var route = MaterialPageRoute(builder: (context) => ContactView()) ; // this code can be in parameter without var route
          Navigator.push(context,route);
        },
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}
