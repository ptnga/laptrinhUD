import 'package:flutter/material.dart';
import 'package:qlkhachsan/models/Room.dart';
import 'package:qlkhachsan/models/RoomType.dart';
import 'package:qlkhachsan/models/RoomVariant.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/models/user_interface.dart';
import 'package:qlkhachsan/widgets/showlistRoomType.dart';
import 'package:qlkhachsan/widgets/showlistRoomVariant.dart';
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
  bool _showTrueStatus = true;
  bool _showFalseStatus = true;

  bool get showTrueStatus => _showTrueStatus;
  bool get showFalseStatus => _showFalseStatus;

  set showTrueStatus(bool value) {
    _showTrueStatus = value;
    notifyListeners();
  }

  set showFalseStatus(bool value) {
    _showFalseStatus = value;
    notifyListeners();
  }

  late final List<Room> listRoom;

  // Hàm khởi tạo
  RoomManagerProvider() {

    listRoom = [
        Room(numberRoom: 101, numberfloor: 1, statusBook: true, type: listRoomType[0], variant: listRoomVariant[0]),
        Room(numberRoom: 102, numberfloor: 2, statusBook: false, type: listRoomType[1], variant: listRoomVariant[1]),
        Room(numberRoom: 103, numberfloor: 1, statusBook: true, type: listRoomType[0], variant: listRoomVariant[0]),
        Room(numberRoom: 104, numberfloor: 2, statusBook: true, type: listRoomType[1], variant: listRoomVariant[1]),
        Room(numberRoom: 201, numberfloor: 1, statusBook: true, type: listRoomType[0], variant: listRoomVariant[0]),
        Room(numberRoom: 202, numberfloor: 2, statusBook: false, type: listRoomType[1], variant: listRoomVariant[1]),
        Room(numberRoom: 203, numberfloor: 1, statusBook: false, type: listRoomType[0], variant: listRoomVariant[0]),
        Room(numberRoom: 204, numberfloor: 2, statusBook: false, type: listRoomType[1], variant: listRoomVariant[1]),
        Room(numberRoom: 301, numberfloor: 1, statusBook: true, type: listRoomType[0], variant: listRoomVariant[0]),
        Room(numberRoom: 302, numberfloor: 2, statusBook: true, type: listRoomType[1], variant: listRoomVariant[1]),
        Room(numberRoom: 303, numberfloor: 1, statusBook: true, type: listRoomType[0], variant: listRoomVariant[0]),
      Room(numberRoom: 304, numberfloor: 2, statusBook: false, type: listRoomType[1], variant: listRoomVariant[1]),
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
  deleteRoom(Room room) {
    listRoom.remove(room);
    notifyListeners();
  }
  deleteRoomType(RoomType roomType) {
    listRoomType.remove(roomType);
    notifyListeners();
  }
  deleteRoomVariant(RoomVariant roomVariant) {
    listRoomVariant.remove(roomVariant);
    notifyListeners();
  }
  editRoom(Room oldRoom, Room newRoom) {
    int index = listRoom.indexOf(oldRoom);
    if (index != -1) {
      listRoom[index] = newRoom;
      notifyListeners();
    }
    notifyListeners();
  }
  void notifyDataChanged() {
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
    final userInterface = Provider.of<UserInterface>(context);

    return Consumer<RoomManagerProvider>(
      builder: (context, roomManagerProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Room Manager'),
            backgroundColor: userInterface.appBarColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/trangchu');
              },
            ),
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
                          Padding(
                              padding: const EdgeInsets.only(left: 16.0, top: 10.0),
                              child: DropdownButton<String>(
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
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0, top: 10.0),
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
