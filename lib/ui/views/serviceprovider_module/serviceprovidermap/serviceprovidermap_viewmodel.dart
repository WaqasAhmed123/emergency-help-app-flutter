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
      MarkerId("Police"): Marker(
        markerId: const MarkerId("Police"),
        position: destinationLocation,
        infoWindow: InfoWindow(title: "Police"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    };
  }

  final NavigationService _navigationService = locator<NavigationService>();
  void navigateToServiceproviderMap() =>
      _navigationService.navigateTo(Routes.serviceprovidermapView);

  GoogleMapController? mapController;

  Set<Polyline> polylines = {};
  //not working because billing is unable.
  // List<LatLng> polylineCoordinates = [];

  // final googleApiKey = "AIzaSyDCJx5xOx437xF-7cmfHa9zKcg8nGM_b2Q";

  // getPolyPoints() async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //       googleApiKey,
  //       PointLatLng(currentLocation.latitude,
  //           currentLocation.longitude), // Fixed the swapped values here
  //       PointLatLng(destinationLocation.latitude,
  //           destinationLocation.longitude),
  //           travelMode: TravelMode.driving,); // Fixed the swapped values here
  //   print(result);
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(
  //           point.latitude, point.longitude)); // Fixed the swapped values here
  //       rebuildUi();
  //     });
  //   }
  //   else {
  //        print(result.errorMessage);
  //     }
  //   print(polylineCoordinates);
  //   rebuildUi();
  // }

  // Future<void> getDirectionsAndDrawPolyline() async {
  //   // Replace YOUR_API_KEY with your actual Google Maps API key
  //   final apiKey = 'YOUR_API_KEY';
  //   final directionsApiUrl =
  //       'https://maps.googleapis.com/maps/api/directions/json?'
  //       'origin=${currentLocation.latitude},${currentLocation.longitude}&'
  //       'destination=24.893455,67.045637&key=$apiKey';

  //   final response = await http.get(Uri.parse(directionsApiUrl));
  //   final directions = jsonDecode(response.body);

  //   final points = <LatLng>[];
  //   for (final step in directions['routes'][0]['legs'][0]['steps']) {
  //     points.addAll(
  //       PolylinePoints().decodePolyline(step['polyline']['points']),
  //     );
  //   }

  polyLinesForRoute() {
    Polyline polyline = Polyline(
      polylineId: PolylineId("polyline_1"),
      points: <LatLng>[
        ServiceProviderModel.currentServiceProvider.location!,
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
