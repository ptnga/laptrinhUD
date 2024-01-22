import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/models/user_interface.dart';

class Service extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui, child){
          return Scaffold(
            appBar: AppBar(
              title: Text('Services'),
              backgroundColor: ui.appBarColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/trangchu');
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Services',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  ServiceCard(
                    serviceName: 'Room Service',
                    description: 'Order food and beverages to your room.',
                    icon: Icons.room_service,
                  ),
                  ServiceCard(
                    serviceName: 'Spa & Wellness',
                    description: 'Relax and rejuvenate at our spa.',
                    icon: Icons.spa,
                  ),
                  ServiceCard(
                    serviceName: 'Concierge',
                    description: 'Get assistance with travel, dining, and more.',
                    icon: Icons.map,
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String serviceName;
  final String description;
  final IconData icon;

  const ServiceCard({
    Key? key,
    required this.serviceName,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  icon,
                  size: 48,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                serviceName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
    );
  }
}