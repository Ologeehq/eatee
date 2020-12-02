import 'package:auto_route/auto_route.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/routers/route.gr.dart';
import 'package:flutter/material.dart';

class CartNotificationCard extends StatelessWidget {
  final int cartItemsCount;
  const CartNotificationCard({
    Key key,
    this.cartItemsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.shopping_cart_rounded),
          onPressed: () =>
              ExtendedNavigator.of(context).push(Routes.foodCartScreen),
        ),
        if (cartItemsCount != null && cartItemsCount != 0)
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: kPrimaryColor,
              child: Text(
                cartItemsCount.toString() ?? '',
                style: kBodyText3.copyWith(color: Colors.white, fontSize: 8),
              ),
            ),
          ),
      ],
    );
  }
}
