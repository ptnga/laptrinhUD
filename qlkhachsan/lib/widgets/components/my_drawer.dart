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
                  backgroundColor: Colors.red,
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
              title: Text('Trang chính'),
              leading: Icon(Icons.home, color: Colors.indigo),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/'),
            child: ListTile(
              title: Text('Phòng'),
              leading: Icon(Icons.room, color: Colors.red),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/'),
            child: ListTile(
              title: Text('Dịch vụ'),
              leading: Icon(Icons.cleaning_services),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/'),
            child: ListTile(
              title: Text('Đặt trả'),
              leading: Icon(Icons.calendar_today, color: Colors.purple,),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/'),
            child: ListTile(
              title: Text('Thống kê'),
              leading: Icon(Icons.bar_chart, color: Colors.orange),
            ),
          ),

          Divider(),

          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/caidat'),
            child: ListTile(
              title: Text('Cài đặt'),
              leading: Icon(Icons.settings, color: Colors.blue,),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).popAndPushNamed('/'),
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