import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/models/RoomVariant.dart';
import 'package:qlkhachsan/models/RoomType.dart';
import 'package:qlkhachsan/widgets/room/roomManager.dart';
import '../roomManager.dart';

class FromAddRoom extends StatefulWidget{
  final Function addRoom;

  final roomnumberController = TextEditingController();
  final floornumberController = TextEditingController();
  int? numberTypeController =0;
  int? numberVariantController=0;

  FromAddRoom(this.addRoom);

  @override
  _FromAddRoom createState() => _FromAddRoom();
}
class _FromAddRoom extends State<FromAddRoom>{
  RoomType? selectedRoomType;
  RoomVariant? selectedRoomVariant;
  RoomType? firstRoomType;
  RoomVariant? firstRoomVariant;


  void openShowdialog (BuildContext context){
    RoomManagerProvider roomManagerProvider = Provider.of<RoomManagerProvider>(context, listen: false);

    List<RoomType> listRoomType = roomManagerProvider.listRoomType;
    List<RoomVariant> listRoomVariant = roomManagerProvider.listRoomVariant;

    firstRoomType = listRoomType.first;
    firstRoomVariant = listRoomVariant.first;
    showDialog(
      context: context,
      builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add Room'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Room Number'),
              controller: widget.roomnumberController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Floor Number'),
              controller: widget.floornumberController,
              keyboardType: TextInputType.number,
            ),
            DropdownButton<RoomType>(
              value: selectedRoomType ?? firstRoomType,
              items: listRoomType.map((RoomType value) {
                return DropdownMenuItem<RoomType>(
                  value: value,
                   child: Text(value.name),
                );
            }).toList(),
            onChanged: (RoomType? value) {
              for(int i = 0; i< listRoomType.length ; i++) {
                if( listRoomType[i] == value) {
                  widget.numberTypeController = i;
                }
              }
              setState(() {
                selectedRoomType = value;
              });
            },
            ),
            DropdownButton<RoomVariant>(
              value: selectedRoomVariant ?? firstRoomVariant,
              items: listRoomVariant.map((RoomVariant value) {
                return DropdownMenuItem<RoomVariant>(
                  value: value,
                    child: Text(value.name),
                );
            }).toList(),
            onChanged: (RoomVariant? value) {
              for(int i = 0; i< listRoomVariant.length ; i++) {
                if( listRoomVariant[i] == value) {
                  widget.numberVariantController = i;
                }
              }
              setState(() {
                selectedRoomVariant = value;
                // widget.numberVariantController = listRoomVariant.indexOf(value!);
              });
            },
            ),
            TextButton(
              child: Text('Add Room'),
              onPressed: () {
                widget.addRoom(
                  int.parse(widget.roomnumberController.text),
                  int.parse(widget.floornumberController.text),
                  widget.numberTypeController,
                  widget.numberVariantController,
                );
                Navigator.of(context).popUntil((route) => route.isFirst);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Add Room'),
                      content: Text('Successfully!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Đóng'),
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
    },
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
