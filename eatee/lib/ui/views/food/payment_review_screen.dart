import 'package:eatee/core/providers/restaurant_provider.dart';
import 'package:eatee/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class PaymentReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<RestaurantProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
