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
                            FromAddRoomVariant openrv = FromAddRoomVariant(roomManagerProvider.addRoomVariant);
                            openrv.openshowDialog(context);
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
}
