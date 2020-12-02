import 'package:eatee/core/models/food/food.dart';
import 'package:meta/meta.dart';

class Restaurant {
  final List<Food> foods;
  final String imageUrl;
  final String name;
  final String phone;
  final int rating;
  final String openingTime;
  final String location;

  Restaurant({
    @required this.name,
    @required this.foods,
    @required this.imageUrl,
    @required this.phone,
    this.rating,
    this.location,
    this.openingTime,
  });
}
