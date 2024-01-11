import 'package:flutter/material.dart';
import 'package:qlkhachsan/models/Room.dart';
import 'room/roomDetail.dart';

class ShowListRoom extends StatelessWidget {
  final List<Room> listRoom;

  ShowListRoom(this.listRoom);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listRoom.length,
      itemBuilder: (BuildContext context, int index) {
        Room r = listRoom[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RoomDetailPage(r),
              ),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${r.numberRoom} ${r.numberfloor}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
