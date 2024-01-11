import 'package:flutter/material.dart';
import 'package:qlkhachsan/models/Room.dart';
import 'package:qlkhachsan/models/RoomType.dart';
import 'package:qlkhachsan/models/RoomVariant.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/widgets/formaddRoom.dart';
import 'package:qlkhachsan/widgets/formaddRoomVariant.dart';
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
  @override
  Widget build(BuildContext context) {
    return Consumer<RoomManagerProvider>(
      builder: (context, roomManagerProvider, child) {
        return Stack(
          children: [
            Container(
                 child: ShowListRoom(roomManagerProvider.listRoom)
              // child: FromAddRoom(roomManagerProvider.addRoom),
            ),
            Positioned(
              bottom: 16.0,
                right: 16.0,
                child: FloatingActionButton(
                  onPressed: () {
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(300, 600, 0, 0),
                      items: [
                        PopupMenuItem(
                          child: ElevatedButton (
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return FromAddRoom(roomManagerProvider.addRoom);
                                  }
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.add),
                                SizedBox(width: 10),
                                Text('Add New Room')
                              ],

                            ),
                          )
                        ),
                        // PopupMenuItem(
                        //   child: ListTile(
                        //     title: Text('Add Room Type'),
                        //     onTap: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(builder: (context) => FromAddRoomType(roomManagerProvider.addRoomType)),
                        //       );
                        //       Navigator.pop(context);
                        //       // Gọi hàm thêm loại phòng mới hoặc mở form thêm loại phòng mới
                        //     },
                        //   ),
                        // ),
                        // PopupMenuItem(
                        //   child: ListTile(
                        //     title: Text('Add Room Variant'),
                        //     onTap: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(builder: (context) => FromAddRoomVariant(roomManagerProvider.addRoomVariant)),
                        //       );
                        //       Navigator.pop(context);
                        //     },
                        //   ),
                        // ),
                      ],
                    );
                  },
                  child: Icon(Icons.add),
                ),
            ),
          ],
        );
      },
    );
  }
}
