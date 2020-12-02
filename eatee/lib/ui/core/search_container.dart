import 'package:eatee/ui/core/cart_card.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: width * .95,
      margin: EdgeInsets.only(top: 10, bottom: 8.0),
      child: Material(
        color: kGreyColor,
        elevation: 0.5,
        borderRadius: BorderRadius.circular(5.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.search),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Search',
                  style: kBodyText2.copyWith(color: Colors.black45),
                ),
              ),
              Expanded(child: SizedBox()),
              CartNotificationCard(
                cartItemsCount: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
