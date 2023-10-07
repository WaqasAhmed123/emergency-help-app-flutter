import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squip/models/serviceprovider_model.dart';
import 'package:stacked/stacked.dart';

import 'serviceprovidermap_viewmodel.dart';

class ServiceprovidermapView extends StackedView<ServiceprovidermapViewModel> {
  final LatLng destinationLocation;
  const ServiceprovidermapView({required this.destinationLocation});

  @override
  onViewModelReady(ServiceprovidermapViewModel viewModel) async {
    await viewModel.polyLinesForRoute();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    ServiceprovidermapViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: GoogleMap(
          polylines: viewModel.polylines,
          onMapCreated: (controller) {
            viewModel.mapController = controller;
          },
          initialCameraPosition:
              CameraPosition(zoom: 15, target: ServiceProviderModel.location!),
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          markers: Set<Marker>.of(viewModel.markers.values),
        ));
  }

  @override
  ServiceprovidermapViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ServiceprovidermapViewModel(destinationLocation: destinationLocation);
}
