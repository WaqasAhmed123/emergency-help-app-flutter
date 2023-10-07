import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squip/ui/widgets/container_button.dart';
import 'package:stacked/stacked.dart';

import '../../../../models/user_model.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  onViewModelReady(HomeViewModel viewModel) async {
    print(viewModel.currentLocation.runtimeType);
    viewModel.currentLocation = await viewModel.getCurrentLocation();
     viewModel.fetchLocationsFromFirestore();
    print("updatd location ${viewModel.currentLocation.runtimeType} ");
    super.onViewModelReady(viewModel);
  }

  @override
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
                    const Center(
                      child: CircleAvatar(
                        radius: 80,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    ),
                    ListTile(title: Text("${UserModel.name}")),
                    InkWell(
                        onTap: () => viewModel.navigateToAllrequests(),
                        child: const ListTile(
                            title: Text(
                          "All Requests",
                        ))),
                    InkWell(
                      onTap: () => viewModel.navigateToLogin(),
                      child: ListTile(
                        title: const Text("Logout"),
                        trailing: IconButton(
                            onPressed: () => viewModel.navigateToLogin(),
                            icon: const Icon(Icons.logout)),
                      ),
                    ),
                    InkWell(
                      onTap: () => viewModel.deleteAccount(),
                      child: ListTile(
                        title: const Text(
                          "Delete Account",
                          style: TextStyle(color: Colors.red),
                        ),
                        trailing: IconButton(
                            onPressed: () => viewModel.deleteAccount(),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ),
                    )
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
              markers: Set<Marker>.of(viewModel.markersNew.values),
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
