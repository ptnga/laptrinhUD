import 'package:flutter/material.dart';
import 'package:qlkhachsan/models/Room.dart';
import 'package:qlkhachsan/models/RoomType.dart';
import 'package:qlkhachsan/models/RoomVariant.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/widgets/showlistRoomType.dart';
import 'package:qlkhachsan/widgets/showlistRoomVariant.dart';
import 'formaddRoom.dart';
import 'formaddRoomVariant.dart';
import 'formaddRoomType.dart';
import 'package:qlkhachsan/widgets/showlistRoom.dart';

class RoomManagerProvider extends ChangeNotifier {
  final List<RoomType> _listRoomType = [
    RoomType(name: "Single"),
    RoomType(name: "Double"),
  ];

  List<RoomType> get listRoomType => _listRoomType;

  set listRoomType(List<RoomType> newListRoomType) {
    _listRoomType.addAll(newListRoomType);
    notifyListeners();
  }

  addRoomType(String name) {
    final newRoomType = RoomType(name: name);
    _listRoomType.add(newRoomType);
    notifyListeners();
  }

  final List<RoomVariant> _listRoomVariant = [
    RoomVariant(name: "Standard"),
    RoomVariant(name: "VIP"),
  ];

  List<RoomVariant> get listRoomVariant => _listRoomVariant;

  set listRoomVariant(List<RoomVariant> newListRoomVariant) {
    _listRoomVariant.addAll(newListRoomVariant);
    notifyListeners();
  }
  addRoomVariant(String name) {
    final newRoomVariant = RoomVariant(name: name);
    _listRoomVariant.add(newRoomVariant);
    notifyListeners();
  }

  late final List<Room> listRoom;





  // Hàm khởi tạo
  RoomManagerProvider() {
    listRoom = [
      Room(numberRoom: 101, numberfloor: 1, statusBook: true, type: listRoomType[0], variant: listRoomVariant[0]),
      Room(numberRoom: 201, numberfloor: 2, statusBook: false, type: listRoomType[1], variant: listRoomVariant[1]),
    ];
  }

  addRoom(int numberRoom, int numberfloor, int numberType, int numberVariant) {
     RoomType addType = listRoomType[numberType];
     RoomVariant addVariant = listRoomVariant[numberVariant];
    final newRoom = Room(
      numberRoom: numberRoom,
      numberfloor: numberfloor,
      statusBook: false,
      type: addType,
      variant: addVariant,
    );
    listRoom.add(newRoom);
    notifyListeners();
  }
}

class RoomManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RoomManagerProvider(),
      child: RoomManagerWidget(),
    );
  }
}

class RoomManagerWidget extends StatefulWidget {
  @override
  State<RoomManagerWidget> createState() => _RoomManagerWidgetState();
}

class _RoomManagerWidgetState extends State<RoomManagerWidget> {
  List<String> showLR = ["List Room", "List Room Type", "List Room Varriant"];
  String? selectLR;
  Widget? selectedWidget;

  @override
  Widget build(BuildContext context) {
    return Consumer<RoomManagerProvider>(
      builder: (context, roomManagerProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Room Manager'),
            backgroundColor: Colors.blue,
          ),
          body: Stack(
            children: [
              Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButton<String>(
                              value: selectLR ?? showLR[0],
                              items: showLR.map((String value) {
                                return DropdownMenuItem<String>(
                                    value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectLR = newValue;
                                  if(newValue == showLR[0]) {
                                    selectedWidget = ShowListRoom(roomManagerProvider.listRoom, roomManagerProvider._listRoomType, roomManagerProvider._listRoomVariant  );
                                  } else if(newValue == showLR[1]) {
                                    selectedWidget = ShowListRoomType(roomManagerProvider._listRoomType);
                                  } else if( newValue == showLR[2]) {
                                    selectedWidget = ShowListRoomVariant(roomManagerProvider._listRoomVariant);
                                  }
                                });
                              }
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          child: selectedWidget ?? ShowListRoom(roomManagerProvider.listRoom, roomManagerProvider._listRoomType, roomManagerProvider._listRoomVariant  ),
                        ),
                      )
                    ],
                  ),
                  // child: ShowListRoom(roomManagerProvider.listRoom)
                // child: FromAddRoom(roomManagerProvider.addRoom),
              ),

            ],
          ),
        );
        // return Stack(
        //
        // );
      },
    );
  }
}
