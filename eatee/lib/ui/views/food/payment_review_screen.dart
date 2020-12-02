import 'package:eatee/core/enum/payment_type.dart';
import 'package:eatee/core/providers/restaurant_provider.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/views/base_view.dart';
import 'package:eatee/ui/views/food/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BaseView<RestaurantProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Review your payment',
                  style: kBodyText2,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.0),
                  margin: EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      doubleRowText(
                        firstText: 'Number of item',
                        secondText: '6',
                        color: kSecondaryTextColor,
                      ),
                      doubleRowText(
                        firstText: 'Sub Total',
                        secondText: '\$2,600.00',
                        color: kSecondaryTextColor,
                      ),
                      doubleRowText(
                        bottomPadding: 0.0,
                        firstText: 'Delivery Fee',
                        secondText: '\$100.00',
                        color: kSecondaryTextColor,
                      ),
                      Divider(thickness: 1),
                      doubleRowText(
                          boldText: true,
                          firstText: 'Total',
                          secondText: '\$2,700.00'),
                    ],
                  ),
                ),
                radioPaymentTypeButton(
                  title: 'Pay with cash',
                  type: PaymentType.cash,
                  selectedPaymentType: provider.selectedPaymentType,
                  onTap: () {
                    provider.selectedPaymentType = PaymentType.cash;
                  },
                ),
                radioPaymentTypeButton(
                  title: 'Pay with wallet',
                  type: PaymentType.wallet,
                  selectedPaymentType: provider.selectedPaymentType,
                  onTap: () {
                    provider.selectedPaymentType = PaymentType.wallet;
                  },
                ),
                SizedBox(height: 20),
               customButtom(
                 title: 'Make payment'
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget radioPaymentTypeButton({
    PaymentType type,
    String title,
    PaymentType selectedPaymentType,
    Function onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            selectedPaymentType == type
                ? Icons.radio_button_checked
                : Icons.radio_button_off,
            size: 18,
            color: selectedPaymentType == type ? kPrimaryColor : Colors.black26,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title ?? 'Pay with cash', style: kBodyText4),
          ),
        ],
      ),
    );
  }

  Widget doubleRowText(
      {Color color,
      String firstText,
      String secondText,
      bottomPadding,
      bool boldText = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ?? 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            firstText ?? '',
            style: kBodyText4.copyWith(
              fontWeight: boldText ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          Text(
            secondText ?? '',
            style: kBodyText4.copyWith(
              color: color ?? kPrimaryTextColor,
              fontWeight: boldText ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
