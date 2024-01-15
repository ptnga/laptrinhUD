import 'package:flutter/material.dart';
import 'package:qlkhachsan/models/Room.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/models/user_interface.dart';
import 'roomManager.dart';
import 'package:qlkhachsan/models/RoomType.dart';
import 'package:qlkhachsan/models/RoomVariant.dart';

class RoomDetailPage extends StatelessWidget {
   Room room;

  RoomDetailPage(this.room);

  void _onDeletePressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        RoomManagerProvider roomManagerProvider = Provider.of<RoomManagerProvider>(context, listen: true);
        return AlertDialog(
          title: Text("Confirm Deletion!"),
          content: Text("Are you sure you want to delete the room? ${room.numberRoom}?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                roomManagerProvider.deleteRoom(room);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  void edit(BuildContext context) {

    TextEditingController roomnumberController = TextEditingController(text: room.numberRoom.toString());
    TextEditingController floornumberController = TextEditingController(text: room.numberfloor.toString());
    ValueNotifier<bool> selectedStatus = ValueNotifier<bool>(room.statusBook);
    ValueNotifier<RoomType?> selectedRoomType = ValueNotifier<RoomType?>(room.type);
    ValueNotifier<RoomVariant?> selectedRoomVariant = ValueNotifier<RoomVariant?>(room.variant);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          RoomManagerProvider roomManagerProvider = Provider.of<RoomManagerProvider>(context, listen: true);
          return AlertDialog(
            title: Text('Edit Room'),
            content: Container(
              height: 300.0,
              child: Column(
                children: [
                  TextFormField(
                    controller: roomnumberController,
                    decoration: InputDecoration(labelText: 'Number Room'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: floornumberController,
                    decoration: InputDecoration(labelText: 'Number Floor'),
                    keyboardType: TextInputType.number,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Room Type:'),
                      ValueListenableBuilder<RoomType?>(
                        valueListenable: selectedRoomType,
                        builder: (context, value, child) {
                          return DropdownButton<RoomType>(
                            value: selectedRoomType.value,
                            items: roomManagerProvider.listRoomType.map((RoomType type) {
                              return DropdownMenuItem<RoomType>(
                                value: type,
                                child: Text(type.name),
                              );
                            }).toList(),
                            onChanged: (RoomType? value) {
                              int selectedIndex = roomManagerProvider.listRoomType.indexOf(value!);
                              selectedRoomType.value = roomManagerProvider.listRoomType[selectedIndex];
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Room Variant:'),
                      ValueListenableBuilder<RoomVariant?>(
                        valueListenable: selectedRoomVariant,
                        builder: (context, value, child) {
                          return DropdownButton<RoomVariant>(
                            value: selectedRoomVariant.value,
                            items: roomManagerProvider.listRoomVariant.map((RoomVariant variant) {
                              return DropdownMenuItem<RoomVariant>(
                                value: variant,
                                child: Text(variant.name),
                              );
                            }).toList(),
                            onChanged: (RoomVariant? value) {
                              int selectedIndex = roomManagerProvider.listRoomVariant.indexOf(value!);
                              selectedRoomVariant.value = roomManagerProvider.listRoomVariant[selectedIndex];
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Status'),
                      ValueListenableBuilder<bool>(
                        valueListenable: selectedStatus,
                        builder: (context, value, child) {
                          return ToggleButtons(
                            children: [
                              Text('True'),
                              Text('False'),
                            ],
                            isSelected: [value, !value],
                            onPressed: (int index) {
                              selectedStatus.value = index == 0;
                            },
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    int newNumberRoom = int.tryParse(roomnumberController.text) ?? 0;
                    int newNumberFloor = int.tryParse(floornumberController.text) ?? 0;

                      Room newRoom = Room(
                        numberRoom: newNumberRoom,
                        numberfloor: newNumberFloor,
                        statusBook: selectedStatus.value,
                        type: selectedRoomType.value!,
                        variant: selectedRoomVariant.value!,
                      );
                      roomManagerProvider.editRoom(room, newRoom);
                      roomManagerProvider.notifyDataChanged();
                      room = newRoom;
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Done!'),
                          content: Text('Successfully!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Save')
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
            ],
          );

        }
    );
  }
  @override
  Widget build(BuildContext context) {
    RoomManagerProvider roomManagerProvider = Provider.of<RoomManagerProvider>(context, listen: true);
    return Consumer<UserInterface>(
        builder: (context, ui, child)
            {
              return Scaffold(
                  appBar: AppBar(
                    title: Text('Room Detail'),
                    backgroundColor: ui.appBarColor,
                  ),
                  body: ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text(
                                'Room Number',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('${room.numberRoom}', style: TextStyle(fontSize: 16),),
                              leading: Icon(Icons.confirmation_number),
                            ),
                            ListTile(
                              title: Text(
                                'Floor Number',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('${room.numberfloor}', style: TextStyle(fontSize: 16),),
                              leading: Icon(Icons.layers),
                            ),
                            ListTile(
                              title: Text(
                                'Room Type',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('${room.type?.name}',style: TextStyle(fontSize: 16),),
                              leading: Icon(Icons.hotel, color: Colors.blue),
                            ),
                            ListTile(
                              title: Text(
                                'Room Variant',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('${room.variant?.name}', style: TextStyle(fontSize: 16),),
                              leading: Icon(Icons.category, color: Colors.green),
                            ),
                            ListTile(
                              title: Text('Status'),
                              subtitle: Text('${room.statusBook}', style: TextStyle(fontSize: 16),),
                              leading: Icon(Icons.info, color: Colors.red,),
                            ),
                            SizedBox(height: 50.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () => _onDeletePressed(context),
                                    icon: Row(
                                      children: [
                                        Icon(Icons.delete, color: Colors.red, size: 30,),
                                        Text('Delete Room', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold) )
                                      ],
                                    )
                                ),
                                IconButton(
                                    onPressed: () => edit(context),
                                    icon: Row(
                                      children: [
                                        Icon(Icons.edit, size: 30,),
                                        Text('Edit Room', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold) )
                                      ],
                                    )
                                ),
                              ],
                            )

                            // Add more details as needed
                          ],
                        ),
                      ),
                    ],
                  )
              );
            }
    );
  }
}
