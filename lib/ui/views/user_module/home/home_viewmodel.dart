import 'package:squip/models/user_model.dart';
import 'package:stacked/stacked.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/custom_navigation.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
final CustomNavigationService _customNavigationServiceService =
      locator<CustomNavigationService>();
  void navigateToRequest() => _navigationService.navigateToRequestView();

  navigateToLogin() async {
    return _customNavigationServiceService.navigateToLoginFromSignout();
  }

  //map variables
  // void printLocation() {
  //   print(userInstanceInstance.id);
  // }

  LatLng currentLocation = LatLng(0, 0);
  GoogleMapController? mapController;
  // Object? selectedService = "Police";
  // final Set<Polyline> _polyline = {};
  //  _polyline.add(
  //         Polyline(
  //           polylineId: PolylineId('1'),
  //           points: latLen,
  //           color: Colors.green,
  //         )
  //     );
  // Map<MarkerId, Marker> markers = {};
  Map<MarkerId, Marker> markers = {
    MarkerId("Police"): Marker(
      markerId: MarkerId("Police"),
      position: LatLng(24.9010373, 67.0454682),
      infoWindow: InfoWindow(title: "Police"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    MarkerId("Ambulance"): Marker(
      markerId: MarkerId("Ambulance"),
      position: LatLng(24.8985201, 67.0416869),
      infoWindow: InfoWindow(title: "Ambulance"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    MarkerId("Fire Brigade"): Marker(
      markerId: MarkerId("Fire Brigade"),
      position: LatLng(24.899468, 67.045096),
      infoWindow: InfoWindow(title: "Fire Brigade"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
  };

  // markers[MarkerId("Police")],
  //  Marker(markerId: MarkerId("police"),
  //         position: LatLng(24.9010373, 67.0454682),
  //          infoWindow: InfoWindow(title: "Police"),
  //         ),

//methods for map

  _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // Handle the case when the userInstance has permanently denied
      // permission to access their location.
      return false;
    }

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  getCurrentLocation() async {
    bool locationGranted = await _requestLocationPermission();

    if (locationGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        currentLocation = LatLng(
          position.latitude,
          position.longitude,
        );

        // userInstanceInstance = userInstanceModel(
        //     currentLocation:
        //         LatLng(currentLocation.latitude, currentLocation.longitude));
        mapController?.animateCamera(CameraUpdate.newLatLng(currentLocation));
        UserModel.currentUser.currentLocation = currentLocation;
        // print(currentLocation);
        return (currentLocation);
      } catch (e) {
        print(e);
      }
    }
    rebuildUi();
  }

//----------------------------------------------------------
//database for request
  // addLocationToModel() {
  //   var addLocation = userInstanceModel(currentLocation: currentLocation);
  //   print(addLocation.currentLocation);
  // }
}
