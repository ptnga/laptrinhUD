import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/models/RoomVariant.dart';
import 'package:qlkhachsan/models/RoomType.dart';
import 'roomManager.dart';

class FromAddRoom extends StatelessWidget {
  final Function addRoom;
  final List<RoomType> listRoomType;
  final List<RoomVariant> listRoomVariant;

  final roomnumberController = TextEditingController();
  final floornumberController = TextEditingController();
  final ValueNotifier<RoomType?> selectedRoomType = ValueNotifier<RoomType?>(null);
  final ValueNotifier<RoomVariant?> selectedRoomVariant = ValueNotifier<RoomVariant?>(null);
  int? numberTypeController = 0;
  int? numberVariantController = 0;

  FromAddRoom(this.addRoom, this.listRoomType, this.listRoomVariant);

  // RoomType? selectedRoomType;
  // RoomVariant? selectedRoomVariant;
  RoomType? firstRoomType;
  RoomVariant? firstRoomVariant;

  void openShowdialog(BuildContext context) {
    firstRoomType = listRoomType.first;
    firstRoomVariant = listRoomVariant.first;
    showDialog(
      context: context,
      builder: (BuildContext context){
      RoomManagerProvider roomManagerProvider = Provider.of<RoomManagerProvider>(context, listen: true);
      return AlertDialog(
        title: Text('Add Room'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Room Number'),
              controller: roomnumberController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Floor Number'),
              controller: floornumberController,
              keyboardType: TextInputType.number,
            ),
            // DropdownButton<RoomType>(
            //   value: selectedRoomType.value ?? firstRoomType,
            //   items: listRoomType.map((RoomType value) {
            //     return DropdownMenuItem<RoomType>(
            //       value: value,
            //       child: Text(value.name),
            //     );
            //   }).toList(),
            //   onChanged: (RoomType? value) {
            //     int selectedIndex = listRoomType.indexOf(value!);
            //     numberTypeController = selectedIndex;
            //     selectedRoomType.value = listRoomType[selectedIndex];
            //   },
            // ),
            ValueListenableBuilder<RoomType?>(
              valueListenable: selectedRoomType,
              builder: (context, value, child) {
                return DropdownButton<RoomType>(
                  value: value ?? firstRoomType,
                  items: listRoomType.map((RoomType value) {
                    return DropdownMenuItem<RoomType>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                  onChanged: (RoomType? value) {
                    int selectedIndex = listRoomType.indexOf(value!);
                    numberTypeController = selectedIndex;
                    selectedRoomType.value = listRoomType[selectedIndex];
                  },
                );
              },
            ),
            ValueListenableBuilder<RoomVariant?>(
              valueListenable: selectedRoomVariant,
              builder: (context, value, child) {
                return DropdownButton<RoomVariant>(
                  value: value ?? firstRoomVariant,
                  items: listRoomVariant.map((RoomVariant value) {
                    return DropdownMenuItem<RoomVariant>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                  onChanged: (RoomVariant? value) {
                    int selectedIndex = listRoomVariant.indexOf(value!);
                    numberVariantController = selectedIndex;
                    selectedRoomVariant.value = listRoomVariant[selectedIndex];
                  },
                );
              },
            ),
            TextButton(
              child: Text('Add Room'),
              onPressed: () {
                addRoom(
                  int.parse(roomnumberController.text),
                  int.parse(floornumberController.text),
                  numberTypeController,
                  numberVariantController,
                );
                Navigator.of(context).popUntil((route) => route.isFirst);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Add New Room'),
                      content: Text('Successfully!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      openShowdialog(context);
    });
    return Container();
  }
}