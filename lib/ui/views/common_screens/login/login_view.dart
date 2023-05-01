import 'package:flutter/material.dart';
import 'package:squip/ui/widgets/input_field.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/container_button.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  bool isUser;

  LoginView({Key? key, this.isUser = false}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    viewModel.isUser = isUser;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Lets help the humanity$isUser",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Login",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 20,
              ),
              // Text("Enter Email",
              //     style: Theme.of(context).textTheme.titleSmall),
              // SizedBox(
              //   height: 10,
              // ),
              Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      inputField(
                          controller: viewModel.emailController,
                          hintText: "Email"),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      inputField(
                          controller: viewModel.passwordController,
                          hintText: "Password"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
              Center(
                child: containerButton(
                    busy: viewModel.isBusy,
                    text: "Login",
                    context: context,
                    onTap: () {
                      if ((viewModel.formKey.currentState!.validate())) {
                        viewModel.loginWithEmail(
                            email: viewModel.emailController.text.trim(),
                            password: viewModel.passwordController.text);
                      }
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Want to contribute?",
                      style: Theme.of(context).textTheme.titleSmall),
                  TextButton(
                      onPressed: () => viewModel.navigateToSignUp(),
                      child: Text(
                        "Register Now!",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
