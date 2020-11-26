import 'package:eatee/core/providers/restaurant_provider.dart';
import 'package:eatee/ui/core/cart_card.dart';
import 'package:eatee/ui/core/custom_image.dart';
import 'package:eatee/ui/core/increase_decrease.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/views/base_view.dart';
import 'package:eatee/ui/views/food/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class FoodDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<RestaurantProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            CartNotificationCard(
              cartItemsCount: 23,
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item 7',
                    style: kBodyText1,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  customImageCard(context),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: increaseDecreaseItemWidget(),
                  ),
                  titlePriceCard(context),
                  SizedBox(height: 8.0),
                  timeRatingCard(),
                  SizedBox(height: 20),
                  descriptionCard(),
                  SizedBox(height: 20),
                  customButtom(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }





}
