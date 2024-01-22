import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlkhachsan/models/user_interface.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui, child){
          return Scaffold(
            appBar: AppBar(
              title: Text('About Hotel Management App'),
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
                  _buildSectionTitle('About Hotel Management App', 26),
                  SizedBox(height: 15),
                  _buildTextContent(
                    '    Hotel Management App is designed to streamline hotel operations and enhance the guest experience.',
                    20,
                  ),
                  SizedBox(height: 16),
                  _buildSectionTitle('Key Features:', 24),
                  SizedBox(height: 8),
                  _buildFeatureListItem('Room Booking', 'Efficiently manage room reservations.', Icons.hotel),
                  _buildFeatureListItem('Customer Management', 'Keep track of guest information and preferences.', Icons.person),
                  _buildFeatureListItem('Service Requests', 'Handle service requests and orders.', Icons.room_service),
                  SizedBox(height: 16),
                  _buildSectionTitle('Interesting Features:', 24),
                  SizedBox(height: 8),
                  _buildRichText('- Ability ', 'to log in with fingerprint', ' for personal information security.'),
                  SizedBox(height: 8),
                  _buildRichText('- Dark mode ', 'to protect your eyes', ' in low-light environments.'),
                ],
              ),
            ),
          );
        }
    );
  }

  Widget _buildSectionTitle(String title, double fontSize) {
    return Text(
      title,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTextContent(String content, double fontSize) {
    return Text(
      content,
      style: TextStyle(fontSize: fontSize),
    );
  }

  Widget _buildFeatureListItem(String featureName, String description, IconData icon) {
    return ListTile(
      leading: Icon(icon, size: 34, color: Colors.lightGreen),
      title: Text(
        featureName,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        description,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildRichText(String prefix, String boldText, String suffix) {
    return RichText(
      text: TextSpan(
        text: prefix,
        style: TextStyle(fontSize: 20, color: Colors.black),
        children: [
          TextSpan(
            text: boldText,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen, fontSize: 20),
          ),
          TextSpan(
            text: suffix,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
