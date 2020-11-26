import 'package:eatee/core/providers/restaurant_provider.dart';
import 'package:eatee/ui/core/increase_decrease.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/views/base_view.dart';
import 'package:eatee/ui/views/food/widgets/cart_card.dart';
import 'package:eatee/ui/views/food/widgets/custom_widgets.dart';
import 'package:eatee/ui/views/food/widgets/food_cart_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BaseView<RestaurantProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: kHeadingText2,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            bottom: 12.0,
          ),
          child: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) =>
                          cartCard(height),
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      itemCount: 5)),
              cartBottomWidget(context),
            ],
          ),
        ),
      ),
    );
  }
}
