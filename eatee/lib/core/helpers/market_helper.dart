import 'package:eatee/core/models/market/brand.dart';
import 'package:eatee/core/models/market/product.dart';

List<Product> _dummyData = [
  Product(imageUrl: 'assets/images/coke.png', name: 'Coke', price: '\$20.00'),
  Product(imageUrl: 'assets/images/food.png', name: 'Rice', price: '\$100.00'),
  Product(imageUrl: 'assets/images/fruit.png', name: 'Fruit', price: '\$20.00'),
  Product(
      imageUrl: 'assets/images/glocery.png',
      name: 'Glocery',
      price: '\$120.00'),
  Product(
      imageUrl: 'assets/images/glocery.png',
      name: 'Glocery',
      price: '\$120.00'),
  Product(imageUrl: 'assets/images/food.png', name: 'Rice', price: '\$100.00'),
  Product(imageUrl: 'assets/images/fruit.png', name: 'Fruit', price: '\$20.00'),
  Product(
      imageUrl: 'assets/images/glocery.png',
      name: 'Glocery',
      price: '\$120.00'),
];

class MarketHelper {
  List<Brand> _dummyBrands = [
    Brand(
      name: 'Shoprite',
      imageUrl: 'assets/images/food1.png',
      products: _dummyData,
      productCount: _dummyData.length,
      categories: ['All', 'Gloceries', 'Drinks', 'Toletries', 'Others'],
    ),
    Brand(
      name: 'Martrite',
      imageUrl: 'assets/images/food1.png',
      products: _dummyData,
      productCount: _dummyData.length,
      categories: ['All', 'Gloceries', 'Drinks', 'Toletries', 'Others'],
    ),
    Brand(
      name: 'Kwara Mall',
      imageUrl: 'assets/images/food1.png',
      products: _dummyData,
      productCount: _dummyData.length,
      categories: ['All', 'Gloceries', 'Drinks', 'Toletries', 'Others'],
    ),
  ];
  List<Product> getTopCategories() {
    return _dummyData;
  }

  List<Product> getNewIn() {
    return _dummyData;
  }

  List<Brand> getTopBrands() => _dummyBrands;
}
