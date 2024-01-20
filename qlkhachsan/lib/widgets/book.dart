import 'package:flutter/material.dart';
import 'package:qlkhachsan/models/Room.dart';
import '/widgets/roomManager.dart';
import '/models/RoomType.dart';
import '/models/RoomVariant.dart';
import 'package:qlkhachsan/models/Room.dart';

import 'package:provider/provider.dart';

class Book extends StatefulWidget {
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cccdController = TextEditingController();
  TextEditingController _arriveController = TextEditingController();
  TextEditingController _leaveController = TextEditingController();
  bool hasError = false;
  Room? selectedRoom;
  String? selectedRoomType;
  String? selectedRoomVariant;
  int? Rum;
  List<Room> listRoom = [];
  bool newStatus = false;
  int NumberRoom = 0;
  int NumberFloor = 0;
  ValueNotifier<RoomType?> type = ValueNotifier<RoomType?>(null);
  ValueNotifier<RoomVariant?> variant = ValueNotifier<RoomVariant?>(null);
  Room? rom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/trangchu');
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Họ Tên:',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  controller: _nameController,
                ),
                SizedBox(height: 16),
                Text(
                  'Số CCCD:',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  controller: _cccdController,
                ),
                SizedBox(height: 16),
                Text(
                  'Ngày Đến:',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  controller: _arriveController,
                ),
                SizedBox(height: 16),
                Text(
                  'Ngày Đi:',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  controller: _leaveController,
                ),
                SizedBox(height: 16),
                Text(
                  'Selected Room:',
                  style: TextStyle(fontSize: 16),
                ),
                Consumer<RoomManagerProvider>(
                  builder: (context, roomManagerProvider, _) {
                    RoomManagerProvider roomManagerProvider = Provider.of<RoomManagerProvider>(context, listen: false);
                    List<DropdownMenuItem<int>> roomItems = roomManagerProvider.listRoom
                        .where((room) => !room.statusBook)
                        .map<DropdownMenuItem<int>>((Room room) {
                      return DropdownMenuItem<int>(
                        value: room.numberRoom,
                        child: Text(
                          ('${room.numberRoom}'),
                          style: TextStyle(
                            // fontWeight: room.isBooked ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            Rum = room.numberRoom;
                            rom = room;
                            NumberFloor = room.numberfloor;
                            type.value = room.type;
                            variant.value = room.variant;
                          });
                        },
                      );
                    }).toList();

                    return DropdownButton<int>(
                      value: Rum,
                      items: roomItems,
                      onChanged: (int? newValue) {
                        setState(() {
                          Rum = newValue;
                          NumberRoom = int.parse(newValue.toString());
                        });
                      },
                    );
                  },
                ),
                Consumer<RoomManagerProvider>(
                  builder: (context, roomManagerProvider, _) {
                    RoomManagerProvider roomManagerProvider = Provider.of<RoomManagerProvider>(context, listen: false);
                    return ElevatedButton(
                      onPressed: () {
                        if (_nameController.text.isEmpty ||
                            _cccdController.text.isEmpty ||
                            selectedRoomType == null ||
                            selectedRoomVariant == null) {
                          setState(() {
                            hasError = true;
                          });
                        } else {
                          setState(() {
                            hasError = false;
                          });
                        }

                        if (hasError) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text('Nhập đầy đủ thông tin!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Đóng'),
                                  )
                                ],
                              );
                            },
                          );
                        } else {

                          newStatus = true;
                          Room newRoom = Room(
                            numberRoom: NumberRoom,
                            numberfloor: NumberFloor,
                            statusBook: newStatus,
                            type: type.value!,
                            variant: variant.value!,
                          );
                          roomManagerProvider.editRoom(rom!, newRoom);
                          roomManagerProvider.notifyDataChanged();
                          rom = newRoom;

                        }
                        Navigator.pop(context);
                      },
                      child: Text('Đặt phòng'),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}