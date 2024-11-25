import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'splash_viewmodel.dart';

class SplashView extends StackedView<SplashViewModel> {
  const SplashView({Key? key}) : super(key: key);
  @override
  onViewModelReady(SplashViewModel viewModel) async {
    // await Future.delayed(Duration(seconds: 3));
    // viewModel.navigateToStartup();
  }

  @override
  Widget builder(
    BuildContext context,
    SplashViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SQUIP",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/splash.jpg'),
              radius: 100,
            ),
          ],
        ),
      ),
    );
  }

  @override
  SplashViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashViewModel();
}
