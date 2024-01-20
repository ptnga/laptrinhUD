import 'RoomType.dart';
import 'RoomVariant.dart';
class Room {
  final int numberRoom;
  final int numberfloor;
  final bool statusBook;
  final RoomType type;
  final RoomVariant variant;


  Room({
    required this.numberRoom,
    required this.numberfloor,
    required this.statusBook,
    required this.type,
    required this.variant,

  });
}