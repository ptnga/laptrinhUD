import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/models/showRoomDetail.dart';
import 'package:qlkhachsan/models/user_interface.dart';
import 'showRoomDetailPage.dart';

class showRoomDetai extends StatelessWidget {
  final List<showRoomDetail> showRoomDetailList = [
    showRoomDetail(name: 'Single Standard', image: Image.asset('images/img1.jpg'), price: 15.0, detail: 'This is a Single STANDARD hotel room that is designed to provide guests with a comfortable and functional stay. The room features a single bed with clean, white bedding and a cushioned headboard. Adjacent to the bed is a wooden desk equipped with a tea set and an electric kettle for guests’ convenience. Above the desk, a flat-screen TV is mounted on the wall, providing entertainment options. The room is adorned with a framed artwork that adds an aesthetic touch to the otherwise minimalist decor. An air conditioning unit ensures the room remains at a comfortable temperature. The room is painted in white, giving it a clean and bright appearance. The room is equipped with a private bathroom.'),
    showRoomDetail(name: 'Single Vip', image: Image.asset('images/img2.jpg'), price: 30.0, detail: 'The Single VIP hotel room is a well-lit and cozy space that is designed to provide guests with a luxurious and comfortable stay. The room features a neatly made bed with white linens and a dark headboard. Above the bed, there’s a piece of artwork mounted on the wall and two reading lights affixed on either side of it. A wooden desk with a lamp and a vase of fresh flowers is placed by the window, which is covered with green curtains. The floor is carpeted with a patterned green carpet that complements the curtains. The walls are painted in light colors, giving the room a spacious and airy feel 1'),
    showRoomDetail(name: 'Double Standard', image: Image.asset('images/img3.jpg'), price: 25.0, detail: 'The Double STANDARD hotel room is a well-lit and cozy space that is designed to provide guests with a comfortable and functional stay. The room features a large, comfortable bed with white linens and a dark blue runner across the foot of the bed. The walls are painted in a soft peach color, providing a warm and inviting atmosphere. There’s a wooden desk on the left side of the image, indicating a workspace within the room. Above the bed, an air conditioning unit is installed ensuring climate control for comfort. The floor is covered with a textured grey carpet that complements the overall color scheme of the room. Large curtains cover a window on one side of the room, offering privacy and light control '),
    showRoomDetail(name: 'Double Vip', image: Image.asset('images/img4.jpg'), price: 50.0, detail: 'The Double VIP hotel room is a well-lit and spacious space that is designed to provide guests with a luxurious and comfortable stay. The room features a large double bed with a dark brown frame and headboard adorned with white bedding, a decorative throw, and multiple pillows. The room features three large windows draped with dark patterned curtains that match the bed’s throw. Two plush armchairs and a small round table with a flower vase are situated near the windows, offering a comfortable seating area. The walls are painted in a soft cream color, complementing the wooden flooring and creating an inviting atmosphereWall-mounted bedside lamps provide additional lighting, enhancing the room’s warm ambiance'),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui, child){
          return Scaffold(
              appBar: AppBar(
                title: Text('Room description'),
                backgroundColor: ui.appBarColor,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => showRoomDatailPage(showRoomDetailList[0]),
                            ),
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(Icons.bedroom_child_outlined, size: 40, color: Colors.teal.shade200),
                                SizedBox(width: 20.0,),
                                Text('Single Standard', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),)
                              ],
                            ),
                          ) ,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => showRoomDatailPage(showRoomDetailList[1]),
                            ),
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(Icons.bedroom_child, size: 40, color: Colors.teal.shade200),
                                SizedBox(width: 20.0,),
                                Text('Single VIP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),)
                              ],
                            ),
                          ) ,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => showRoomDatailPage(showRoomDetailList[2]),
                            ),
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(Icons.bedroom_parent_outlined, size: 40, color: Colors.teal.shade200),
                                SizedBox(width: 20.0,),
                                Text('Double Standard', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),)
                              ],
                            ),
                          ) ,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => showRoomDatailPage(showRoomDetailList[3]),
                            ),
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(Icons.bedroom_parent, size: 40, color: Colors.teal.shade200),
                                SizedBox(width: 20.0,),
                                Text('Double VIP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),)
                              ],
                            ),
                          ) ,
                        ),
                      )
                    ],
                  )
                ],
              )
          );
        }
    );
  }
}



