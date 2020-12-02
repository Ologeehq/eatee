import 'package:eatee/core/providers/home_provider.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:flutter/material.dart';


  BottomNavigationBar buildBottomNavigationBar(HomeProvider provider,PageController _controller) {
    return BottomNavigationBar(
          backgroundColor: Color(0xFFDEDEDE),
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kSecondaryColor,
          onTap: (index) {
            provider.updateIndex(index);
            _controller.animateToPage(provider.currentIndex,
                duration: Duration(milliseconds: 250), curve: Curves.easeIn);
          },
          currentIndex: provider.currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Color(0xFFDEDEDE),
              icon: new Icon(Icons.restaurant_menu),
              label: 'Food',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFFDEDEDE),
              icon: new Icon(Icons.shopping_basket),
              label: 'Market',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFFDEDEDE),
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        );
  }