import 'package:auto_route/auto_route.dart';
import 'package:eatee/core/enum/form_field.dart';
import 'package:eatee/core/providers/signup_provider.dart';
import 'package:eatee/ui/core/app_config.dart';
import 'package:eatee/ui/core/footer_text.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/routers/route.gr.dart';
import 'package:eatee/ui/views/base_view.dart';
import 'package:eatee/ui/views/intro/widget/button_solid.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = AppConfig.getHeight(context);
    return BaseView<SignupProvider>(
      builder: (context, provider, child) => Scaffold(
        key: provider.scaffoldKey,
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
                  SizedBox(height: height * .035),
                  Text(
                    'Create Your Account',
                    style: kHeadingText1,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'Let\'s get to know you better...',
                    style: kBodyText3,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: height * .04),
                  TextFormField(
                    style: kHeadingText3,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: provider.validateEmptyField,
                    onSaved: (value) =>
                        provider.saveField(FormFields.fullname, value),
                    decoration: InputDecoration(
                      hintText: 'Fullname',
                      suffixIcon: Icon(Icons.person),
                      hintStyle: kBodyText4,
                      focusedBorder: outlineBorder,
                    ),
                  ),
                  SizedBox(height: height * .02),
                  TextFormField(
                    style: kHeadingText3,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: provider.validateEmail,
                    onSaved: (value) =>
                        provider.saveField(FormFields.email, value),
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: kBodyText4,
                      suffixIcon: Icon(Icons.email),
                      focusedBorder: outlineBorder,
                    ),
                  ),
                  SizedBox(height: height * .02),
                  TextFormField(
                    style: kHeadingText3,
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: provider.validateEmptyField,
                    onSaved: (value) =>
                        provider.saveField(FormFields.phone, value),
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      suffixIcon: Icon(Icons.phone),
                      hintStyle: kBodyText4,
                      focusedBorder: outlineBorder,
                    ),
                  ),
                  SizedBox(height: height * .02),
                  TextFormField(
                    style: kHeadingText3,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: provider.hidePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: provider.validatePassword,
                    onChanged: provider.updatePassword,
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
                  SizedBox(height: height * .02),
                  TextFormField(
                    style: kHeadingText3,
                    onSaved: (value) =>
                        provider.saveField(FormFields.password, value),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: provider.hidePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) => provider.validatePasswordMatched(
                        pwd1: provider.password, pwd2: val),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () => provider.toggleHidePassword(),
                        icon: Icon(provider.hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: kBodyText4,
                      focusedBorder: outlineBorder,
                    ),
                  ),
                  SizedBox(height: height * .03),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text:
                            "By clicking on 'Create Account', you agree to our ",
                        style: kBodyText4,
                        children: <TextSpan>[
                          TextSpan(
                            text: "'Terms and Conditions'",
                            style: kBodyText4.copyWith(color: kPrimaryColor),
                          ),
                          TextSpan(
                            text: " and ",
                            style: kBodyText4,
                          ),
                          TextSpan(
                            text: "'Privacy policy'",
                            style: kBodyText4.copyWith(color: kPrimaryColor),
                          ),
                        ]),
                  ),
                  SizedBox(height: height * .03),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonSolid(
                      title: 'Create Account',
                      bgColor: kPrimaryColor,
                      height: 55,
                      onPressed: () async {
                        if (provider.formKey.currentState.validate()) {
                          provider.formKey.currentState.save();
                          await provider.createAccount(context);
                        }
                      },
                    ),
                  ),
                  SizedBox(height: height * .02),
                  FooterText(
                    textLabel: 'Already have an account? ',
                    textAction: 'Sign in',
                    onTap: () => ExtendedNavigator.of(context)
                        .popAndPush(Routes.loginScreen),
                  ),
                  SizedBox(height: height * .03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
