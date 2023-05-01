import 'package:flutter/material.dart';
import 'package:squip/ui/widgets/container_button.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Continue As', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 10,
            ),
            containerButton(
                text: "User",
                context: context,
                onTap: () {
                  viewModel.isUser = true;
                  viewModel.navigateToLogin();
                }),
            const SizedBox(
              height: 10,
            ),
            containerButton(
                text: "Service Provider",
                context: context,
                onTap: () {
                  viewModel.isUser = false;
                  viewModel.navigateToLogin();
                }),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();
}
