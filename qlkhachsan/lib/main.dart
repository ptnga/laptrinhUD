import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/widgets/book.dart';
import '/models/user_interface.dart';
import '/widgets/home_page.dart';
import '/widgets/settings.dart';
import '/widgets/roomManager.dart';
<<<<<<< HEAD
import '/widgets/book.dart';

=======
import 'widgets/showRoomDetailList.dart';
>>>>>>> fc74a4b0f4a1335593bf03a8f2e4c11e4d94b4c4

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
<<<<<<< HEAD
          "/book": (context) => Book(),

=======
          "/thongtin": (context) => showRoomDetai(),
>>>>>>> fc74a4b0f4a1335593bf03a8f2e4c11e4d94b4c4
        },
        //home: MyHomePage(), // Set MyHomePage as the home screen
      ),
    );
  }
}

class MyRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Provider.of<RoomManagerProvider>(context),
      child: RoomManagerWidget(),
    );
  }
}