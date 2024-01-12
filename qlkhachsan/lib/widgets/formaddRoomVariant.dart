import 'package:flutter/material.dart';

class FromAddRoomVariant extends StatelessWidget {
  final Function addRoomVariant;

  final variantController = TextEditingController();

  FromAddRoomVariant(this.addRoomVariant);

  @override
  void openshowDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('New Room Variant'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                  controller: variantController,
                ),
                TextButton(
                  child: Text('Add Room Variant'),
                  onPressed: (){
                    addRoomVariant(
                      variantController.text,
                    );
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Add New Room Variant'),
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