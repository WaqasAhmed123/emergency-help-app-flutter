import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/dropdown_input.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/container_button.dart';
import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  bool isUser;
  SignupView({Key? key, this.isUser = false}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    viewModel.isUser = isUser;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Be the part of community",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "SignUp$isUser",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: viewModel.formKey,
                child: Container(
                  // height: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: isUser == true
                        ? 3
                        : viewModel.fieldsNames.keys.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 5) {
                        return dropdownInput(
                            hintText: "Type of Service",
                            value: viewModel.selectedOption,
                            items: viewModel.servicesList
                                .map<DropdownMenuItem<String>>((String key) {
                              return DropdownMenuItem<String>(
                                value: key,
                                child: Text(
                                  key,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            onChanged: viewModel.onChanged());
                      } else {
                        return inputField(
                            controller:
                                viewModel.fieldsNames.values.elementAt(index),
                            hintText:
                                viewModel.fieldsNames.keys.elementAt(index));
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
                        viewModel.signupWithEmail(
                            email:
                                viewModel.fieldsNames.values.elementAt(1).text.trim(),
                            password:
                                viewModel.fieldsNames.values.elementAt(2).text);
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