import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/widgets/book.dart';
import '/models/user_interface.dart';
import '/widgets/home_page.dart';
import '/widgets/settings.dart';
import '/widgets/roomManager.dart';
import '/widgets/book.dart';
import 'widgets/showClient.dart';
import '/widgets/showRoomDetailList.dart';
import 'widgets/showService.dart';
import 'widgets/statistic.dart';
import '/widgets/about.dart';

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
          "/book": (context) => Book(),
          "/thongtin": (context) => showRoomDetai(),
          "/khachhang": (context) => showClient(),
          "/dichvu": (context) => Service(),
          "/thongke": (context) => StatisticsPage(),
          "/about": (context) => About()
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