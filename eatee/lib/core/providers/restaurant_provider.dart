import 'package:eatee/core/enum/payment_type.dart';
import 'package:eatee/core/providers/base_provider.dart';

class RestaurantProvider extends BaseProvider {
  PaymentType _selectedPaymentType;
  PaymentType get selectedPaymentType => _selectedPaymentType;
  set selectedPaymentType(PaymentType type) {
    _selectedPaymentType = type;
    notifyListeners();
  }
}
