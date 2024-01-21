import 'Room.dart';

class Client {
  final String name;
  final int identityNumber;
  final DateTime arriveTime;
  final DateTime leaveTime;
  final Room room;

  Client({
    required this.name,
    required this.identityNumber,
    required this.arriveTime,
    required this.leaveTime,
    required this.room,
  });

}