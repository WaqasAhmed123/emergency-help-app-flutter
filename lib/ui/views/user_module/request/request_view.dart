import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/container_button.dart';
import '../../../widgets/dropdown_input.dart';
import 'request_viewmodel.dart';

// ignore: must_be_immutable
class RequestView extends StackedView<RequestViewModel> {
  double userLat;
  double userLng;
  RequestView({super.key, required this.userLat, required this.userLng});

  @override
  Widget builder(
    BuildContext context,
    RequestViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  'assets/help.png',
                  fit: BoxFit.fill, // Adjust the fit as per your needs
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      dropdownInput(
                          hintText: "Type of Service",
                          value: viewModel.selectedService,
                          items: viewModel.servicesList.keys
                              .map<DropdownMenuItem<String>>((String key) {
                            return DropdownMenuItem<String>(
                              value: key,
                              child: Text(
                                key,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: viewModel.onchangeServiceoption()),
                      dropdownInput(
                          hintText: "Incident",
                          value: viewModel.selectedServiceincident,
                          items: viewModel.selectedService == null
                              ? viewModel
                                  .servicesList[viewModel.selectedService]
                              : viewModel
                                  .servicesList[viewModel.selectedService]!
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                          onChanged: viewModel.onchangeIncident()),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              containerButton(
                  text: "Send A Request",
                  context: context,
                  onTap: () async {
                    if (viewModel.formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );

                      try {
                        await viewModel.request();
                        Navigator.of(context)
                            .pop(); // Close the progress indicator dialog

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Request Sent'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } catch (error) {
                        print(error);
                        Navigator.of(context)
                            .pop(); // Close the progress indicator dialog

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Failed to send request'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  @override
  RequestViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RequestViewModel(userLat: userLat, userLng: userLng);
}
