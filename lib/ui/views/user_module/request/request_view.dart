import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../widgets/container_button.dart';
import '../../../widgets/dropdown_input.dart';
import 'request_viewmodel.dart';

class RequestView extends StackedView<RequestViewModel> {
  Widget builder(
    BuildContext context,
    RequestViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
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
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: viewModel.onchangeServiceoption()),
              dropdownInput(
                  hintText: "Incident",
                  value: viewModel.selectedServiceincident,
                  items: viewModel.selectedService == null
                      ? viewModel.servicesList[viewModel.selectedService]
                      : viewModel.servicesList[viewModel.selectedService]!
                          .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                  onChanged: viewModel.onchangeIncident()),
              containerButton(
                  text: "Send A Request",
                  context: context,
                  onTap: () async {
                    await viewModel.addServices();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Request Sent'),
                        duration: Duration(seconds: 2),
                      ),
                    );
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
      RequestViewModel();
}
