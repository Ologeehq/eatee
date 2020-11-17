import 'package:auto_route/auto_route.dart';
import 'package:eatee/core/providers/intro_provider.dart';
import 'package:eatee/ui/core/app_title.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/routers/route.gr.dart';
import 'package:eatee/ui/views/base_view.dart';
import 'package:eatee/ui/widgets/intro/button_solid.dart';
import 'package:eatee/ui/widgets/intro/control_button.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BaseView<IntroProvider>(
      onProviderDisposed: (provider) {
        provider.pageController.dispose();
        provider.timer.cancel();
      },
      onProviderReady: (provider) {
        provider.pageController = PageController();
      },
      builder: (context, provider, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              Expanded(
                flex: 2,
                child: Center(
                  child: AppTitle(innerApp: false),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  child: PageView.builder(
                    itemCount: 3,
                    controller: provider.pageController,
                    onPageChanged: (int currentPage) {
                      provider.nextPage(currentPage);
                    },
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(provider
                                  .slides[provider.currentPage].imageUrl))),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * .03),
              controlButtons(provider.currentPage),
              SizedBox(height: height * .02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  provider.slides[provider.currentPage].title ?? '',
                  style: kHeadingText1.copyWith(color: kSecondaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                provider.slides[provider.currentPage].description ?? '',
                style: kBodyText3,
                textAlign: TextAlign.center,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonSolid(
                          title: 'Skip',
                          textColor: Colors.white,
                          bgColor: kSecondaryColor,
                          onPressed: () {
                            ExtendedNavigator.of(context)
                                .popAndPush(Routes.welcomeScreen);
                          },
                        ),
                      ),
                      SizedBox(
                        width: width * .07,
                      ),
                      Expanded(
                        child: provider.currentPage < provider.slides.length - 1
                            ? ButtonSolid(
                                title: 'Next',
                                bgColor: kPrimaryColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  setState(
                                    () {
                                      provider.nextButtonAction();
                                    },
                                  );
                                },
                              )
                            : ButtonSolid(
                                title: 'Get Started',
                                bgColor: kPrimaryColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  ExtendedNavigator.of(context)
                                      .popAndPush(Routes.welcomeScreen);
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
