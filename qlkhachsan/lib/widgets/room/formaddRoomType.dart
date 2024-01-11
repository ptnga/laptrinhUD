import 'package:flutter/material.dart';

class FromAddRoomType extends StatelessWidget {
  final Function(String) addRoomType;

  final typeController = TextEditingController();

  FromAddRoomType(this.addRoomType);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('New Room'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Room Type'),
                      controller: typeController,
                    ),
                    TextButton(
                      child: Text('Add Room Type'),
                      onPressed: (){
                        addRoomType(
                          typeController.text,
                        );
                      },
                    )
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Add')),
                ],
              );
            }
        ),
        builder: (context, snapshot){
          return Container();
        }
    );


  }
}