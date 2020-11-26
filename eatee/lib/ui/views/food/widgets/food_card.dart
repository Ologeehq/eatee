import 'package:auto_route/auto_route.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/routers/route.gr.dart';
import 'package:eatee/ui/views/food/widgets/rating.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ExtendedNavigator.of(context).push(Routes.foodDetailScreen);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .43,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/food.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                'Mixed with beef',
                style: kBodyText4.copyWith(fontSize: 12.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 2, bottom: 8),
              child: Text(
                '₦450.00',
                style: kBodyText4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 5, bottom: 12.0),
              child: ratingRow(5),
            ),
          ],
        ),
      ),
    );
  }
}
