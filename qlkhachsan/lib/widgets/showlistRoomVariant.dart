import 'package:flutter/material.dart';
import 'package:qlkhachsan/models/RoomVariant.dart';
import 'roomManager.dart';
import 'package:provider/provider.dart';
import 'formaddRoomVariant.dart';

class ShowListRoomVariant extends StatelessWidget {
  final List<RoomVariant> listRoomVariant;

  ShowListRoomVariant(this.listRoomVariant);

  @override
  Widget build(BuildContext context) {
    RoomManagerProvider roomManagerProvider = Provider.of<RoomManagerProvider>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: listRoomVariant.length,
            itemBuilder: (BuildContext context, int index) {
              RoomVariant r = listRoomVariant[index];
              return buildRoomCard(context, r);
            },
          ),
          Positioned(
            bottom: 16.0,
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
                            FromAddRoomVariant openrt = FromAddRoomVariant(roomManagerProvider.addRoomVariant);
                            openrt.openshowDialog(context);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.add),
                              SizedBox(width: 10),
                              Text('Add New Room Variant'),
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
  Widget buildRoomCard(BuildContext context, RoomVariant r) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            RoomManagerProvider roomManagerProvider = Provider.of<RoomManagerProvider>(context, listen: true);
            return AlertDialog(
              title: Text("Confirm Deletion!"),
              content: Text("Are you sure you want to delete the Room Variant? ${r.name}?"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    roomManagerProvider.deleteRoomVariant(r);
                    Navigator.pop(context);
                    // Navigator.pop(context);
                  },
                  child: Text("Delete"),
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [
                  Icon(Icons.layers, size: 30, color: Colors.blue.shade200),
                  Text(
                    ' ${r.name}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
