import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';

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

  GoogleMapController? mapController;
  Set<Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  // Function to fetch directions from the Google Directions API
  Future<void> fetchDirections(
      {required LatLng origin, required LatLng destination}) async {
    const String apiKey = 'YOUR_GOOGLE_API_KEY'; // Replace with your API key
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=AIzaSyBN4BY06Dn8Fj7g7hddPCJ-n0KRd3hQNN8';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        debugPrint("directionsPoints $data");

        // Decode the polyline points
        String encodedPolyline =
            data['routes'][0]['overview_polyline']['points'];
        polylineCoordinates = _decodePolyline(encodedPolyline);

        _addPolyline();
        rebuildUi();
      } else {
        debugPrint('Failed to fetch directions: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching directions: $e');
    }
  }

  // Decode the polyline into a list of LatLng
  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> coordinates = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      coordinates.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return coordinates;
  }

  // Add the polyline to the map
  void _addPolyline() {
    Polyline polyline = Polyline(
      polylineId: const PolylineId('route'),
      points: polylineCoordinates,
      color: Colors.red,
      width: 5,
    );

    polylines.add(polyline);
    rebuildUi();
  }

  // Call this method to draw the route
   drawRoute() async {
    LatLng origin = ServiceProviderModel.location!;
    await fetchDirections(origin: origin, destination: destinationLocation);
  }
}


// class ServiceprovidermapViewModel extends BaseViewModel {
//   final LatLng destinationLocation;
//   late Map<MarkerId, Marker> markers;
//   ServiceprovidermapViewModel({required this.destinationLocation}) {
//     markers = {
//       const MarkerId("Police"): Marker(
//         markerId: const MarkerId("Police"),
//         position: destinationLocation,
//         infoWindow: const InfoWindow(title: "Police"),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//       ),
//     };
//   }

//   final NavigationService _navigationService = locator<NavigationService>();
//   void navigateToServiceproviderMap() =>
//       _navigationService.navigateTo(Routes.serviceprovidermapView);

//   GoogleMapController? mapController;

//   Set<Polyline> polylines = {};

//   polyLinesForRoute() {
//     Polyline polyline = Polyline(
//       polylineId: const PolylineId("polyline_1"),
//       points: <LatLng>[
//         ServiceProviderModel.location!,
//         destinationLocation,
//       ],
//       color: Colors.red,
//       width: 5,
//     );
//     polylines.add(polyline);
//     rebuildUi();
//   }

//   // Map<MarkerId, Marker> markers = {
//   //   MarkerId("Police"): Marker(
//   //     markerId: const MarkerId("Police"),
//   //     position: destinationLocation,
//   //     infoWindow: InfoWindow(title: "Police"),
//   //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//   //   ),
//   // };
// }
