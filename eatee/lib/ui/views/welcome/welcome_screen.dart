import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/routers/route.gr.dart';
import 'package:eatee/ui/views/intro/widget/button_solid.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg.jpeg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                color: Color.fromRGBO(255, 255, 255, 0.71),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: width * .16,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/images/shopping_logo.png'),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Text(
                          'Welcome to Eatee',
                          style: kHeadingText2,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Text(
                          'Shop and order your favourite food from your trusted food vendor on the go.',
                          style: kBodyText2,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: height * .1,
                        ),
                        Container(
                          width: width * .80,
                          child: ButtonSolid(
                            title: 'Create Account',
                            textColor: Colors.white,
                            bgColor: kSecondaryColor,
                            onPressed: () {
                              ExtendedNavigator.of(context)
                                  .push(Routes.signupScreen);
                            },
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Container(
                          width: width * .8,
                          child: ButtonSolid(
                            title: 'Login Now',
                            bgColor: kPrimaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              ExtendedNavigator.of(context)
                                  .push(Routes.loginScreen);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
