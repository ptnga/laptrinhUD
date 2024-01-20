import 'package:flutter/material.dart';
import 'package:qlkhachsan/models/showRoomDetail.dart';

class showRoomDatailPage extends StatelessWidget {

  showRoomDetail room;
  showRoomDatailPage(this.room);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info ${room.name}'),
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              room.image,
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(room.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: Colors.black)),
                    Text( '${room.price}\$', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.blueGrey.shade400)),
                    Text(room.detail, style: TextStyle( fontSize: 16, color: Colors.grey.shade700) )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );

  }
}