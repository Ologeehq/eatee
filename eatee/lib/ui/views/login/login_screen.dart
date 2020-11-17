import 'package:auto_route/auto_route.dart';
import 'package:eatee/core/providers/signin_provider.dart';
import 'package:eatee/core/services/connectivity.dart';
import 'package:eatee/ui/core/app_config.dart';
import 'package:eatee/ui/core/footer_text.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/routers/route.gr.dart';
import 'package:eatee/ui/views/base_view.dart';
import 'package:eatee/ui/widgets/intro/button_solid.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = AppConfig.getHeight(context);
    return BaseView<SigninProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black87),
          elevation: 0.5,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: provider.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * .1),
                  Text(
                    'Login Your Account',
                    style: kHeadingText1,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'We\'re glad to have you back...',
                    style: kBodyText3,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: height * .04),
                  TextFormField(
                    style: kHeadingText3,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: provider.validateEmail,
                    onSaved: provider.saveEmail,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: kBodyText4,
                      suffixIcon: Icon(Icons.email),
                      focusedBorder: outlineBorder,
                    ),
                  ),
                  SizedBox(height: height * .03),
                  TextFormField(
                    style: kHeadingText3,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: provider.hidePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: provider.validateFields,
                    onSaved: provider.savePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: kBodyText4,
                      suffixIcon: IconButton(
                        icon: Icon(provider.hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () => provider.toggleHidePassword(),
                      ),
                      focusedBorder: outlineBorder,
                    ),
                  ),
                  SizedBox(height: height * .05),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonSolid(
                      title: 'Sign In',
                      bgColor: kPrimaryColor,
                      height: 55,
                      onPressed: () {
                        if (provider.formKey.currentState.validate()) {
                          provider.formKey.currentState.save();
                          ConnectivityService.isConnectedToInternet().then(
                            (value) {
                              if (value != null) {
                                if (value.isNotEmpty &&
                                    value[0].rawAddress.isNotEmpty) {
                                  print('connected');
                                } else {
                                  print('check your internet connectivity');
                                }
                              } else {
                                print('check your internet connectivity');
                              }
                            },
                          ).catchError(
                            (err) => print(err),
                          );
                        } else {
                          print('invalid form fields');
                        }
                      },
                    ),
                  ),
                  SizedBox(height: height * .02),
                  FooterText(
                    textLabel: 'Don\'t have an account? ',
                    textAction: 'Sign Up',
                    onTap: () => ExtendedNavigator.of(context)
                        .popAndPush(Routes.signupScreen),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
