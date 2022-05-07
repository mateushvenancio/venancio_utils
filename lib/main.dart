import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:venancio_utils/screens/home_screen.dart';
import 'package:venancio_utils/screens/launch_whatsapp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Venâncio Utils',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomeScreen(
        tabs: [
          HomeScreenTab(
            icon: FontAwesomeIcons.whatsapp,
            label: 'Link',
            page: LaunchWhatsappScreen(),
            title: 'Launch WhatsApp Link',
          ),
          HomeScreenTab(
            icon: FontAwesomeIcons.whatsapp,
            label: 'Link',
            page: LaunchWhatsappScreen(),
            title: 'Launch WhatsApp Link',
          ),
        ],
      ),
    );
  }
}
