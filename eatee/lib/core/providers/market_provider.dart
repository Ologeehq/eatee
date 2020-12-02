import 'package:eatee/core/helpers/market_helper.dart';
import 'package:eatee/core/models/market/brand.dart';
import 'package:eatee/core/models/market/product.dart';
import 'package:eatee/core/providers/base_provider.dart';

class MarketProvider extends BaseProvider {
  List<Product> _topCategories = MarketHelper().getTopCategories();
  List<Product> get topCategories => _topCategories;
  List<Product> _newIn = MarketHelper().getNewIn();
  List<Product> get newIn => _newIn;
  List<Brand> _topBrands = MarketHelper().getTopBrands();
  List<Brand> get topBrands => _topBrands;
}
