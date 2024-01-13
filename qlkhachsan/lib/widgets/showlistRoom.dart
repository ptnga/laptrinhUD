import 'package:flutter/material.dart';
import 'package:qlkhachsan/models/Room.dart';
import 'package:qlkhachsan/models/RoomType.dart';
import 'package:qlkhachsan/models/RoomVariant.dart';
import 'roomDetail.dart';
import 'roomManager.dart';
import 'package:provider/provider.dart';
import 'formaddRoom.dart';


class ShowListRoom extends StatelessWidget {
  final List<Room> listRoom;
  final List<RoomType> listRoomType;
  final List<RoomVariant> listRoomVariant;

  ShowListRoom(this.listRoom, this.listRoomType, this.listRoomVariant);

  @override
  Widget build(BuildContext context) {
    RoomManagerProvider roomManagerProvider = Provider.of<RoomManagerProvider>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
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
          ),
          Positioned(
            bottom: 16.0, // Giảm bottom để đưa xuống góc dưới
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(300, 745, 0, 0),
                  items: [
                    PopupMenuItem(
                      child: Material(
                        child: ElevatedButton(
                          onPressed: () {
                            FromAddRoom openar = FromAddRoom(roomManagerProvider.addRoom, roomManagerProvider.listRoomType, roomManagerProvider.listRoomVariant);
                            openar.openShowdialog(context);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.add),
                              SizedBox(width: 10),
                              Text('Add New Room'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
