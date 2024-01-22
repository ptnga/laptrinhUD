import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      child: ListView(
        children: [
          new UserAccountsDrawerHeader(
            accountName: Text('Nguyen Huu Hoan'),
            accountEmail: Text('nguyenhuuhoan22032003@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, color: Colors.white,)
              ),
            ),
            decoration:  new BoxDecoration(
              color: Colors.blue,
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/trangchu'),
            child: ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home, color: Colors.indigo),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/phong'),
            child: ListTile(
              title: Text('Room'),
              leading: Icon(Icons.room, color: Colors.red),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/khachhang'),
            child: ListTile(
              title: Text('Client'),
              leading: Icon(Icons.people, color: Colors.orange),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/dichvu'),
            child: ListTile(
              title: Text('Service'),
              leading: Icon(Icons.cleaning_services),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/book'),
            child: ListTile(
              title: Text('Pay Order'),
              leading: Icon(Icons.calendar_today, color: Colors.purple,),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/thongtin'),
            child: ListTile(
              title: Text('Information'),
              leading: Icon(Icons.insert_drive_file, color: Colors.brown),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/thongke'),
            child: ListTile(
              title: Text('Statistics'),
              leading: Icon(Icons.bar_chart, color: Colors.orange),
            ),
          ),

          Divider(),

          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/caidat'),
            child: ListTile(
              title: Text('Setting'),
              leading: Icon(Icons.settings, color: Colors.blue,),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/about'),
            child: ListTile(
              title: Text('About'),
              leading: Icon(Icons.help, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}