import 'package:flutter/material.dart';
import 'package:clone_whatsapp/home/WhatsAapHome.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "clone whatsaap",
      theme: ThemeData(
        primaryColor: Color(0xff075e54),
        accentColor: Color(0xff25d366)
      ),
      debugShowCheckedModeBanner: false,
      home: WhatsAapHome(cameras),
    );
  }
}



