import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/models/Room.dart';
import 'package:qlkhachsan/models/user_interface.dart';

class RoomDetailPage extends StatelessWidget {
  final Room room;

  RoomDetailPage(this.room);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui, child)
            {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Room Detail'),
                  backgroundColor: ui.appBarColor,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Number: ${room.numberRoom}'),
                      Text('Floor: ${room.numberfloor}'),
                      Text('Type: ${room.type?.name}'),
                      Text('Variant: ${room.variant?.name}'),
                      Text('Status: ${room.statusBook}'),
                      // Add more details as needed
                    ],
                  ),
                ),
              );
            }
    );
  }
}
