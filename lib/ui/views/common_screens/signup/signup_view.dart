import 'package:flutter/material.dart';
import 'package:squip/corePlatform/util/AppConstants.dart';
import 'package:squip/corePlatform/util/LocalStorage.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/dropdown_input.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/container_button.dart';
import 'signup_viewmodel.dart';

// ignore: must_be_immutable
class SignupView extends StackedView<SignupViewModel> {
  // bool isUser;
  // bool isHospital;
  // SignupView({
  //   Key? key,
  //   this.isUser = false,
  //   this.isHospital = false,
  // }) : super(key: key);

  @override
  void onViewModelReady(SignupViewModel viewModel) {
    viewModel.fetchCurrentModule();
  }

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    var heightSize = MediaQuery.of(context).size.height;
    var widthSize = MediaQuery.of(context).size.width;
    // viewModel.isUser = isUser;
    // viewModel.isHospital = isHospital;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // reverse: true,
          child: Container(
            // height: MediaQuery.of(context).size.height * 1,
            // width: MediaQuery.of(context).size.width * 1,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: widthSize * 1,
                height: heightSize * 0.3,
                child: Image.asset(
                  'assets/signup.png',
                  fit: BoxFit.fitHeight, // Adjust the fit as per your needs
                ),
              ),
              Text(
                "Be the part of community",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "SignUp",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              viewModel.isBusy && viewModel.moduleFetching!
                  ? Center(child: CircularProgressIndicator())
                  : // Show loader while busy
                  Form(
                      key: viewModel.formKey,
                      child: Container(
                        // height: 100,
                        child: ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: viewModel.currentModule ==
                          // itemCount: LocalStorage.getCurrentModule() ==
                                  AppConstants.USER
                              //  isUser == true
                              ? 4
                              : viewModel.fieldsNames.keys.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 6) {
                              // return isHospital == false
                              //     ?
                              dropdownInput(
                                  hintText: "Type of Service",
                                  value: viewModel.selectedOption,
                                  items: viewModel.servicesList
                                      .map<DropdownMenuItem<String>>(
                                          (String key) {
                                    return DropdownMenuItem<String>(
                                      value: key,
                                      child: Text(
                                        key,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: viewModel.onChanged());
                              // : inputField(
                              //     controller: viewModel.address,
                              //     hintText: "Adress");
                            } else {
                              bool isPasswordKey =
                                  viewModel.fieldsNames.keys.elementAt(index) ==
                                      "Password";
                              return inputField(
                                  obscureText: isPasswordKey
                                      ? viewModel.obscureText
                                      : false,
                                  suffixIconVisible: isPasswordKey,
                                  onPressed: isPasswordKey
                                      ? viewModel.togglePassword
                                      : null,
                                  controller: viewModel.fieldsNames.values
                                      .elementAt(index),
                                  hintText: viewModel.fieldsNames.keys
                                      .elementAt(index));
                            }
                          },
                        ),
                      ),
                    ),
              Center(
                child: containerButton(
                    busy: viewModel.isBusy,
                    text: "Signup",
                    context: context,
                    onTap: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        print(
                            "email${viewModel.fieldsNames.values.elementAt(2).text}");
                        print(
                            "pass${viewModel.fieldsNames.values.elementAt(3).text}");
                        viewModel.signupWithEmail(
                            email: viewModel.fieldsNames.values
                                .elementAt(2)
                                .text
                                .trim(),
                            password:
                                viewModel.fieldsNames.values.elementAt(3).text);
                      }
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a part?",
                      style: Theme.of(context).textTheme.titleSmall),
                  TextButton(
                      onPressed: () => viewModel.navigateToLogin(),
                      child: Text(
                        "Login",
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
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
