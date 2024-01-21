import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/models/showRoomDetail.dart';
import 'package:qlkhachsan/models/user_interface.dart';

class showRoomDatailPage extends StatelessWidget {

  showRoomDetail room;
  showRoomDatailPage(this.room);
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
      builder: (context, ui, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Info ${room.name}'),
            backgroundColor: ui.appBarColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  ),
              ),
              // Nội dung
              ListView(
                shrinkWrap: true,
                children: [
                  Hero(
                    tag: 'room_image_${room.name}',
                    child: room.image,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          room.name,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: Colors.black),
                        ),
                        Text(
                          '${room.price}\$',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.lightBlueAccent),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                              child: Text(
                                room.detail,
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                          )
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}