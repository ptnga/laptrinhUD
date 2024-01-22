import 'package:flutter/material.dart';
import 'package:qlkhachsan/models/Client.dart';
import 'package:qlkhachsan/models/Room.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/models/user_interface.dart';
import 'roomManager.dart';
import 'package:intl/intl.dart';

class showClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RoomManagerProvider roomManagerProvider = Provider.of<RoomManagerProvider>(context, listen: true);
    List<Client> listClient = roomManagerProvider.listClient;
    return Consumer<UserInterface>(
        builder: (context, ui, child){
          return Scaffold(
            appBar: AppBar(
              title: Text('Information Client'),
              backgroundColor: ui.appBarColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/trangchu');
                },
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 5,),
                        Text('Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        SizedBox(width: 130,),
                        Text('Date Time', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        SizedBox(width: 40,),
                        Text('Room', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listClient.length,
                    itemBuilder: (BuildContext context, int index) {
                      Client c = listClient[index];
                      return buildCard(context, c);
                    },
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  Widget buildCard(BuildContext context, Client c) {
    RoomManagerProvider roomManagerProvider = Provider.of<RoomManagerProvider>(context, listen: true);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(' ${c.name} ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(' CCCD: ${c.identityNumber} ', style: TextStyle(fontSize: 16)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(' ${DateFormat('yyyy-MM-dd HH:mm').format(c.arriveTime)} ', style: TextStyle(fontSize: 16)),
                Text(' ${DateFormat('yyyy-MM-dd HH:mm').format(c.leaveTime)} ', style: TextStyle(fontSize: 16)),
              ],
            ),
            Text(' ${c.room.numberRoom} ', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
