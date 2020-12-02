import 'package:eatee/core/models/market/product.dart';

class Brand {
  final String name;
  final String imageUrl;
  final int productCount;
  final List<Product> products;
  final List<String> categories;

  Brand({
    this.name,
    this.imageUrl,
    this.categories,
    this.products,
    this.productCount,
  });
}
