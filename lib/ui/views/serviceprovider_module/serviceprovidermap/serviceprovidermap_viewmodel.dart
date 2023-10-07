import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squip/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/serviceprovider_model.dart';

class ServiceprovidermapViewModel extends BaseViewModel {
  final LatLng destinationLocation;
  late Map<MarkerId, Marker> markers;
  ServiceprovidermapViewModel({required this.destinationLocation}) {
    markers = {
      const MarkerId("Police"): Marker(
        markerId: const MarkerId("Police"),
        position: destinationLocation,
        infoWindow: const InfoWindow(title: "Police"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    };
  }

  final NavigationService _navigationService = locator<NavigationService>();
  void navigateToServiceproviderMap() =>
      _navigationService.navigateTo(Routes.serviceprovidermapView);

  GoogleMapController? mapController;

  Set<Polyline> polylines = {};

  polyLinesForRoute() {
    Polyline polyline = Polyline(
      polylineId: const PolylineId("polyline_1"),
      points: <LatLng>[
        ServiceProviderModel.location!,
        destinationLocation,
      ],
      color: Colors.red,
      width: 5,
    );
    polylines.add(polyline);
    rebuildUi();
  }

  // Map<MarkerId, Marker> markers = {
  //   MarkerId("Police"): Marker(
  //     markerId: const MarkerId("Police"),
  //     position: destinationLocation,
  //     infoWindow: InfoWindow(title: "Police"),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //   ),
  // };
}
