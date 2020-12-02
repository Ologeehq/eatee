import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/views/food/widgets/rating.dart';
import 'package:flutter/material.dart';

Row titlePriceCard(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        child: Text(
          'Jollof with Chicken',
          style: kBodyText2,
        ),
      ),
      Text(
        '#1,200.00',
        style: kBodyText3,
      ),
    ],
  );
}

RawMaterialButton customButtom(
    {Function onTap, String title, IconData icon, Color bgColor,bool showIcon=false}) {
  return RawMaterialButton(
    onPressed: onTap,
    child: Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor ?? kPrimaryColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              title ?? 'Add to Cart',
              style: kButtonTextStyle,
            ),
          ),
        if(showIcon)
          Icon(
            icon ?? Icons.shopping_cart_outlined,
            color: kButtonTextColor,
            size: 20,
          )
        ],
      ),
    ),
  );
}

Column descriptionCard() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Description',
        style: kBodyText2,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          'Lorem ipsum dolor sit almet, consectetuer adipiscing elit, Aenean commodo ligula dolor, consectetuer adipiscing elit,',
          style: kBodyText4.copyWith(color: Colors.black87, fontSize: 12),
        ),
      ),
    ],
  );
}

Row timeRatingCard() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        Icons.alarm,
        size: 15,
        color: kPrimaryColor,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 20),
        child: Text(
          '15-25mins',
          style: kBodyText4.copyWith(color: kPrimaryColor, fontSize: 12.0),
        ),
      ),
      ratingRow(4, size: 14.0, color: Colors.grey),
    ],
  );
}
