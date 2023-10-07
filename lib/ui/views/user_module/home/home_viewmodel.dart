import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squip/models/user_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/custom_navigation.dart';

class HomeViewModel extends BaseViewModel {
  final CommonFunctionsService _commonFunctionsService =
      locator<CommonFunctionsService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final CommonFunctionsService _commonFunctionsServiceService =
      locator<CommonFunctionsService>();
  void navigateToRequest() => _navigationService.navigateToRequestView(
      userLat: currentLocation.latitude, userLng: currentLocation.longitude);
  void navigateToAllrequests() =>
      _navigationService.navigateToAllRequestsView();

  navigateToLogin() async {
    return _commonFunctionsServiceService.navigateToLoginFromSignout(
        key: "userId");
  }

  LatLng currentLocation = const LatLng(0, 0);
  GoogleMapController? mapController;

  // fetchMarkerPostions() {}

  Map<MarkerId, Marker> markers = {
    const MarkerId("Police"): Marker(
      markerId: const MarkerId("Police"),
      position: const LatLng(24.9010373, 67.0454682),
      infoWindow: const InfoWindow(title: "Police"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    const MarkerId("Ambulance"): Marker(
      markerId: const MarkerId("Ambulance"),
      position: const LatLng(24.8985201, 67.0416869),
      infoWindow: const InfoWindow(title: "Ambulance"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    const MarkerId("Fire Brigade"): Marker(
      markerId: const MarkerId("Fire Brigade"),
      position: const LatLng(24.899468, 67.045096),
      infoWindow: const InfoWindow(title: "Fire Brigade"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
  };

  _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
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

        mapController?.animateCamera(CameraUpdate.newLatLng(currentLocation));
        UserModel.currentLocation = currentLocation;
        return (currentLocation);
      } catch (e) {
        print(e);
      }
    }
    rebuildUi();
  }

  deleteAccount() async {
    // print(id);
    await _commonFunctionsService.deleteUser(
        id: await UserModel.getIdFromSharedPreference(),
        collection: "user",
        localKey: "userId");
    rebuildUi();
  }

  // getNearestServiceProvider(service)async{

  // }

//----------------------------------------------------------
//database for request
  // addLocationToModel() {
  //   var addLocation = userInstanceModel(currentLocation: currentLocation);
  //   print(addLocation.currentLocation);
  // }

Map<MarkerId, Marker> markersNew = {};

// Function to fetch and process data from Firestore
void fetchLocationsFromFirestore() async {
  final firestore = FirebaseFirestore.instance;
  final collectionName = 'service_provider'; // Replace with your Firestore collection name

  // Query Firestore to get documents based on service type
  final ambulanceQuery = await firestore
      .collection(collectionName)
      .where('service', isEqualTo: 'ambulance')
      .get();

  final policeQuery = await firestore
      .collection(collectionName)
      .where('service', isEqualTo: 'police')
      .get();

  final fireBrigadeQuery = await firestore
      .collection(collectionName)
      .where('service', isEqualTo: 'firebrigade')
      .get();

  // Process the data and create markers
  _createMarkersFromQuery(ambulanceQuery, BitmapDescriptor.hueGreen);
  _createMarkersFromQuery(policeQuery, BitmapDescriptor.hueRed);
  _createMarkersFromQuery(fireBrigadeQuery, BitmapDescriptor.hueOrange);
}

// Function to create markers from a Firestore query result
void _createMarkersFromQuery(QuerySnapshot querySnapshot, double markerHue) {
  for (var doc in querySnapshot.docs) {
    String entityId = doc.id;
    double locationLatitude = doc['locationLatitude'];
    double locationLongitude = doc['locationLongitude'];

    var markerId = MarkerId(entityId); // Unique marker ID
    var marker = Marker(
      markerId: markerId,
      position: LatLng(locationLatitude, locationLongitude),
      infoWindow: InfoWindow(title: entityId),
      icon: BitmapDescriptor.defaultMarkerWithHue(markerHue),
    );

    markers[markerId] = marker;
  }
}
}
