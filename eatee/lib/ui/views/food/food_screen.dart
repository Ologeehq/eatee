import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:eatee/core/providers/food_provider.dart';
import 'package:eatee/core/services/food_service.dart';
import 'package:eatee/ui/core/app_config.dart';
import 'package:eatee/ui/core/search_container.dart';
import 'package:eatee/ui/routers/route.gr.dart';
import 'package:eatee/ui/views/base_view.dart';
import 'package:eatee/ui/views/intro/widget/indicator.dart';
import 'package:flutter/material.dart';

import 'widgets/restaurant_card.dart';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = AppConfig.getHeight(context);
    final width = AppConfig.getWidth(context);

    return BaseView<FoodProvider>(
      onProviderDisposed: (provider) {
        provider.timer.cancel();
        provider.controller.dispose();
        print('disposed');
      },
      onProviderReady: (provider) {
        FoodService()
            .createRestaurant("Item 7", "07014235169", "Tank")
            .then((value) {
          value.fold((l) => print(l), (r) => print(r));
        });
        provider.controller = PageController(
            initialPage: provider.currentIndex, viewportFraction: 0.9);
        provider.timer = Timer.periodic(Duration(milliseconds: 1500), (t) {
          provider.increaseIndex(3);
          provider.controller.animateToPage(provider.currentIndex,
              duration: Duration(milliseconds: 250), curve: Curves.easeIn);
        });
      },
      builder: (context, provider, child) => Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Column(
          children: [
            SearchContainer(width: width),
            Container(
              //height: 140,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: height * .2,
                    width: width * .9,
                    child: PageView(
                      controller: provider.controller,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5.0),
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/food1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/food1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/food1.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Indicator(
                        active: provider.currentIndex == 0 ? true : false,
                      ),
                      Indicator(
                        active: provider.currentIndex == 1 ? true : false,
                      ),
                      Indicator(
                        active: provider.currentIndex == 2 ? true : false,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: ListView(
                  children: [
                    ...provider.restaurants
                        .map((e) => restaurantCard(height, width, e, onTap: () {
                              ExtendedNavigator.of(context)
                                  .push(Routes.restaurantScreen);
                            }))
                        .toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
