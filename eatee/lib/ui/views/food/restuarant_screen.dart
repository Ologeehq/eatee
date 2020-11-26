import 'package:eatee/core/providers/restaurant_provider.dart';
import 'package:eatee/ui/core/cart_card.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/views/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/food_card.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<RestaurantProvider>(
        builder: (context, provider, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
                actions: [
                  IconButton(
                      icon: Icon(Icons.filter_alt_rounded), onPressed: () {}),
                  CartNotificationCard(
                    cartItemsCount: 0,
                  )
                ],
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Item 7',
                      style: kBodyText1,
                    ),
                    Text(
                      '2000 product',
                      style: kBodyText4.copyWith(
                        color: Colors.black45,
                        fontSize: 12,
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black12, width: 1.2),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'All',
                            style: kBodyText4,
                          ),
                          Text(
                            'Food',
                            style: kBodyText4,
                          ),
                          Text(
                            'Drinks',
                            style: kBodyText4,
                          ),
                          Text(
                            'Fries',
                            style: kBodyText4,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: ListView(
                          children: [
                            TopFoodColumn(
                              category: 'Food',
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                             TopFoodColumn(
                              category: 'Drinks',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}

class TopFoodColumn extends StatelessWidget {
  final String category;
  const TopFoodColumn({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(category ?? '', style: kBodyText4),
            Text('Show All', style: kBodyText4.copyWith(color: kPrimaryColor)),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 20.0,
            children: [
              FoodCard(),
              FoodCard(),
              FoodCard(),
              FoodCard(),
            ],
          ),
        )
      ],
    );
  }
}
