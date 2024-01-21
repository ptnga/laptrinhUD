import 'package:flutter/material.dart';
import 'package:qlkhachsan/models/Room.dart';
import 'package:qlkhachsan/widgets/roomManager.dart';
import 'package:qlkhachsan/models/RoomType.dart';
import 'package:qlkhachsan/models/RoomVariant.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Book extends StatefulWidget {
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cccdController = TextEditingController();
  TextEditingController _arriveController = TextEditingController();
  TextEditingController _leaveController = TextEditingController();
  DateTime? _arriveDate;
  DateTime? _leaveDate;
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
  int? defaultRoomValue; // Biến tạm thời để lưu giữ giá trị mặc định

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        pickedDate = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute);
      }
    }

    if (pickedDate != null && pickedDate != controller.text) {
      setState(() {
        controller.text = DateFormat("yyyy-MM-dd HH:mm").format(pickedDate!);
      });
    }
  }

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
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  controller: _nameController,
                ),
                SizedBox(height: 16),
                Text(
                  'Số CCCD:',
                  style: TextStyle(fontSize: 20),
                ),
                TextField(
                  controller: _cccdController,
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () => _selectDate(context, _arriveController),
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _arriveController,
                      decoration: InputDecoration(
                        labelText: 'Ngày Đến:',
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () => _selectDate(context, _leaveController),
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _leaveController,
                      decoration: InputDecoration(
                        labelText: 'Ngày Đi:',
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
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
                          style: TextStyle(),
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

                    if (Rum == null || !roomItems.any((item) => item.value == Rum)) {
                      defaultRoomValue = roomItems.isNotEmpty ? roomItems.first.value : null;
                      Rum = defaultRoomValue;
                    }

                    return DropdownButton<int>(
                      value: Rum,
                      items: roomItems,
                      onChanged: (int? newValue) {
                        setState(() {
                          Rum = newValue;
                          defaultRoomValue = newValue;
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
                            _cccdController.text.isEmpty ) {
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
                        Navigator.of(context).popAndPushNamed('/trangchu');
                      },
                      child: Text('Đặt phòng'),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
