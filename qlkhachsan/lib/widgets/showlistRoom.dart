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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: listRoom.length,
        itemBuilder: (BuildContext context, int index) {
          Room r = listRoom[index];
          return buildRoomCard(context, r);
        },
      ),
      floatingActionButton: FloatingActionButton(
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
    );
  }

  Widget buildRoomCard(BuildContext context, Room r) {
    Color cardColor = r.statusBook ? Colors.grey.shade300 : Colors.white;
    return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomDetailPage(r),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                  color: cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        Icon(Icons.hotel, size: 32, color: Colors.blue,),
                        Text(
                          '${r.numberRoom}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            )
    );
  }
}
