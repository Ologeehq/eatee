import 'package:eatee/core/providers/home_provider.dart';

import 'package:eatee/ui/views/base_view.dart';
import 'package:eatee/ui/views/home/widget/bottonNavBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _controller;
  PageStorageBucket _pageStorageBucket = new PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeProvider>(
      onProviderReady: (provider) {
        _controller = PageController(initialPage: provider.currentIndex);
      },
      onProviderDisposed: (provider) {
        _controller.dispose();
      },
      builder: (context, provider, child) => SafeArea(
        child: Scaffold(
          body: PageStorage(
            bucket: _pageStorageBucket,
            child: PageView(
              controller: _controller,
              onPageChanged: provider.updateIndex,
              children: provider.body,
            ),
          ),
          bottomNavigationBar: buildBottomNavigationBar(provider, _controller),
        ),
      ),
    );
  }
}
