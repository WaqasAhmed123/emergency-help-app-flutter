import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squip/ui/widgets/container_button.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/user_model.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  @override
  onViewModelReady(HomeViewModel viewModel) async {
    viewModel.currentLocation = await viewModel.getCurrentLocation();
    super.onViewModelReady(viewModel);
  }

  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async {
        await SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
          drawer: SafeArea(
            child: Drawer(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(title: Text("${UserModel.currentUser.name}")),
                    IconButton(
                        onPressed: () => viewModel.navigateToLogin(),
                        icon: Icon(Icons.logout))
                  ],
                ),
              ),
            ),
          ),
          appBar: AppBar(),
          body: Stack(children: [
            GoogleMap(
              onMapCreated: (controller) {
                viewModel.mapController = controller;
              },
              initialCameraPosition:
                  CameraPosition(zoom: 15, target: viewModel.currentLocation),
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: Set<Marker>.of(viewModel.markers.values),
              // {
              //   viewModel.markers
              // // Marker(markerId: MarkerId("police"),
              // // position: LatLng(24.9010373, 67.0454682),
              // //  infoWindow: InfoWindow(title: "Police"),
              // // ),
              //   },
            ),
            // Align(
            //   alignment: Alignment.center,
            //   child: containerButton(
            //       text: "Request",
            //       context: context,
            //       onTap: () {
            //         viewModel.addServices();
            //       }),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: containerButton(
                  text: "Request For Help",
                  context: context,
                  onTap: () {
                    // viewModel.printLocation();
                    // viewModel.addLocationToModel();
                    viewModel.navigateToRequest();
                  }),
            )
          ])),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
