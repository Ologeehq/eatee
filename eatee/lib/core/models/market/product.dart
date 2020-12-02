import 'package:flutter/foundation.dart';

class Product {
  String imageUrl;
  String name;
  String price;
  int rating;
  String category;
  String brand;
  Product(
      {@required this.imageUrl,
      @required this.name,
      @required this.price,
      this.category,
      this.brand,
      this.rating});
}
