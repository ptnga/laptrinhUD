import 'package:flutter/material.dart';

class FromAddRoomVariant extends StatelessWidget {
  final Function addRoomVariant;

  final variantController = TextEditingController();

  FromAddRoomVariant(this.addRoomVariant);

  bool validateInputs() {
    return variantController.text.isEmpty;
  }
  @override
  void openshowDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: AlertDialog(
              title: Text('New Room Variant'),
              contentPadding: EdgeInsets.all(16.0),
              content: Container(
                height: 130.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Name'),
                      controller: variantController,
                    ),
                    TextButton(
                      child: Text('Add Room Variant'),
                      onPressed: (){
                        if(validateInputs()) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error!'),
                                content: Text('No Data! You need to enter data.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          addRoomVariant(variantController.text);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Add New Room Variant'),
                                content: Text('Successfully!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).popUntil((route) => route.isFirst);
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}