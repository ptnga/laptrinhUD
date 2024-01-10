import 'RoomType.dart';
import 'RoomVariant.dart';
class Room {
  final int soPhong;
  final int Tang;
  final bool status;
  final RoomType type;
  final RoomVariant variant;

  Room({
    required this.soPhong,
    required this.Tang,
    required this.status,
    required this.type,
    required this.variant,
  });
}