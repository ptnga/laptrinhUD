import 'package:qlkhachsan/widgets/room/roomManager.dart';
import 'roomManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/user_interface.dart';
import '/widgets/home_page.dart';
import '/widgets/settings.dart';

// class MyRoom extends StatelessWidget {
//   const MyRoom({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => RoomManagerProvider(),
//       child: MaterialApp(
//         home: MyRoomPage(),
//       ),
//     );
//
//   }
// }

class MyRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Room"),
      ),
      body: RoomManager() ,
    );
  }
}

