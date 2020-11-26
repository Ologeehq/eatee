import 'package:eatee/core/models/food/restaurant_model.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'rating.dart';

Widget restaurantCard(double height, double width, Restaurant restaurant,{Function onTap}) {
  return RawMaterialButton(
    onPressed: onTap,
      child: Container(
      height: height * .16,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: kGreyColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 0.5),
            color: Colors.grey,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: double.infinity,
            width: width * .35,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                  image: NetworkImage(restaurant.imageUrl), fit: BoxFit.cover),
            ),
            margin: EdgeInsets.all(5.0),
          ),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 2.0, top: 5.0, right: 8.0, bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    restaurant.name ?? '',
                    style: kBodyText3,
                  ),
                  Text(
                    restaurant.phone ?? '',
                    style: kBodyText4.copyWith(
                      color: Colors.black38,
                      fontSize: 12,
                    ),
                  ),
                  ratingRow(restaurant.rating ?? 5.0),
                  Text(
                    restaurant.openingTime ?? '',
                    style: kBodyText4.copyWith(
                      color: Colors.black38,
                      fontSize: 12,
                    ),
                  ),
                  locationWidget(
                      '${restaurant.location.length > 25 ? restaurant.location.substring(0, 25) + '...' : restaurant.location}')
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
