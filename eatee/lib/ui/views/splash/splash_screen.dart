import 'package:eatee/core/enum/status.dart';
import 'package:eatee/core/enum/view_state.dart';
import 'package:eatee/core/providers/manage_user.dart';
import 'package:eatee/ui/views/base_view.dart';
import 'package:eatee/ui/views/intro/intro_screen.dart';
import 'package:eatee/ui/views/login/login_screen.dart';
import 'package:eatee/ui/widgets/circular_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BaseView<ManageUserProvider>(
        onProviderReady: (provider) async => await provider.isNewUser(),
        builder: (context, provider, child) =>
            provider.viewState == ViewState.busy
                ? Scaffold(body: LoadingIndicator())
                : provider.status == Status.Authenticated
                    ? LoginScreen()
                    : IntroScreen(),
      );
}
