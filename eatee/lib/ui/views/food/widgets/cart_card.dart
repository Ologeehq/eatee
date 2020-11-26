import 'package:eatee/ui/core/increase_decrease.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:flutter/material.dart';

Container cartCard(double height) {
    return Container(
                height: height * .17,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage('assets/images/food.png'),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: Container(
                                margin: EdgeInsets.only(left: 12.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mixed with beef Mixed',
                                      overflow: TextOverflow.ellipsis,
                                      style: kBodyText3.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      'Item 7',
                                      style: kBodyText4.copyWith(
                                          color: Colors.black26),
                                    ),
                                    Text(
                                      '#1,200.00',
                                      style: kBodyText4.copyWith(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete,
                              size: 20,
                              color: Colors.black38,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Text(
                                'Remove',
                                style: kBodyText4.copyWith(
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.all(0.0),
                            )),
                            increaseDecreaseItemWidget(title: '4'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }