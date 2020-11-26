import 'package:auto_route/auto_route.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/routers/route.gr.dart';
import 'package:eatee/ui/views/food/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

Container cartBottomWidget(BuildContext context) {
  return Container(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Total Amount',
                style: kBodyText2,
              ),
              Text(
                '#2,600.00',
                style: kBodyText3.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 5, right: 10),
          child: Text(
            'Your order will be process once your payment is confirmed. Cheers!',
            style: kBodyText4,
          ),
        ),
        SizedBox(height: 30),
        customButtom(
          title: 'Proceed To Payment',
          icon: Icons.payment,
          bgColor: kSecondaryColor,
          onTap: ()=> ExtendedNavigator.of(context).push(Routes.paymentReviewScreen),
        ),
      ],
    ),
  );
}
