import 'package:flutter/material.dart';

class FromAddRoomType extends StatelessWidget {
  final Function(String) addRoomType;

  final typeController = TextEditingController();

  FromAddRoomType(this.addRoomType);

  void openshowDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('New Room Type'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                  controller: typeController,
                ),
                TextButton(
                  child: Text('Add Room Type'),
                  onPressed: (){
                    addRoomType(
                      typeController.text,
                    );
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Add New Room Type'),
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
      openshowDialog(context);
    });
    return Container();
  }


  }
