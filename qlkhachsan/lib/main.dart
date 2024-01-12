import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/user_interface.dart';
import '/widgets/home_page.dart';
import '/widgets/settings.dart';
import '/widgets/roomManager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RoomManagerProvider()),
        ChangeNotifierProvider(create: (context) => UserInterface()),
      ],
      child: MaterialApp(
        initialRoute: "/trangchu",
        routes: {
          "/trangchu": (context) => MyHomePage(),
          "/caidat": (context) => MySetting(),
          "/phong": (context) => MyRoomPage(),
        },
        //home: MyHomePage(), // Set MyHomePage as the home screen
      ),
    );
  }
}

class MyRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Room"),
      ),
      body: RoomManager(),
    );
  }
}
