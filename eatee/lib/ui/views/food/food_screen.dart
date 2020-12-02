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
  final Key key;
  FoodScreen({this.key}) : super(key: key);
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
        provider.controller = PageController(
            initialPage: provider.currentIndex, viewportFraction: 0.9);
        provider.timer = Timer.periodic(Duration(seconds: 2), (t) {
          provider.increaseIndex(provider.foodSliderImages.length);
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
                        imageSliderCard(provider.foodSliderImages[0]),
                        imageSliderCard(provider.foodSliderImages[1]),
                        imageSliderCard(provider.foodSliderImages[2]),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: provider.foodSliderImages
                        .map(
                          (e) => Indicator(
                            active: (provider.currentIndex <
                                            provider.foodSliderImages.length
                                        ? provider.currentIndex
                                        : provider.currentIndex - 1) ==
                                    provider.foodSliderImages.indexOf(e)
                                ? true
                                : false,
                          ),
                        )
                        .toList(),
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

  Container imageSliderCard(String imageUrl) {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl ?? 'assets/images/food1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
