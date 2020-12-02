import 'package:meta/meta.dart';
class Food {
  final String name;
  final String price;
  final String description;
  final String time;
  final int rating;
  final int quantity;
  final String imageUrl;
  final String restaurant;
  final String category;

  Food({
    @required this.name,
    @required this.price,
    @required this.imageUrl,
    @required this.category,
    @required this.description,
    @required this.restaurant,
    this.quantity,
    this.rating,
    this.time,
  });
}
