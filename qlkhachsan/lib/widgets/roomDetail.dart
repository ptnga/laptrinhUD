import 'package:flutter/material.dart';
import 'package:qlkhachsan/models/Room.dart';

class RoomDetailPage extends StatelessWidget {
  final Room room;

  RoomDetailPage(this.room);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Detail'),
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
}
