import 'package:flutter/material.dart';

class FromAddRoomVariant extends StatelessWidget {
  final Function addRoomVariant;

  final variantController = TextEditingController();

  FromAddRoomVariant(this.addRoomVariant);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Room Variant'),
              controller: variantController,
            ),
            TextButton(
              child: Text('Add Room Variant'),
              onPressed: (){
                addRoomVariant(
                  variantController.text,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}