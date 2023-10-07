import 'package:flutter/material.dart';
import 'package:squip/ui/widgets/input_field.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/container_button.dart';
import 'login_viewmodel.dart';

// ignore: must_be_immutable
class LoginView extends StackedView<LoginViewModel> {
  bool isUser;
  bool isHospital;
  // bool obscureText = true;

  LoginView({Key? key, this.isUser = false, this.isHospital = false})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    viewModel.isUser = isUser;
    viewModel.isHospital = isHospital;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.background,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            // reverse: true,
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset(
                    'assets/login.png',
                    fit: BoxFit.cover, // Adjust the fit as per your needs
                  ),
                ),
                Text(
                  "Lets help the humanity",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        inputField(
                            controller: viewModel.emailController,
                            hintText: "Email"),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        inputField(
                            controller: viewModel.passwordController,
                            hintText: "Password",
                            obscureText: viewModel.obscureText,
                            suffixIconVisible: true,
                            onPressed: () => viewModel.togglePassword()),
                        const SizedBox(
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
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ))
                  ],
                )
              ])),
        )),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
