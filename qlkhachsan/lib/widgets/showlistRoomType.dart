import 'package:flutter/material.dart';
import 'package:qlkhachsan/models/RoomType.dart';
import 'roomManager.dart';
import 'package:provider/provider.dart';
import 'formaddRoomType.dart';


class ShowListRoomType extends StatelessWidget {
  final List<RoomType> listRoomType;

  ShowListRoomType(this.listRoomType);

  @override
  Widget build(BuildContext context) {
    RoomManagerProvider roomManagerProvider = Provider.of<RoomManagerProvider>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
          itemCount: listRoomType.length,
            itemBuilder: (BuildContext context, int index) {
              RoomType r = listRoomType[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${r.name}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                            FromAddRoomType openrt = FromAddRoomType(roomManagerProvider.addRoomType);
                            openrt.openshowDialog(context);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.add),
                              SizedBox(width: 10),
                              Text('Add New Room Type'),
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
