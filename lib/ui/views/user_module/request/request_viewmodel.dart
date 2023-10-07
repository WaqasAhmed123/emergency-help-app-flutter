import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:squip/models/user_model.dart';
import 'package:stacked/stacked.dart';
import 'package:vector_math/vector_math.dart';

class RequestViewModel extends BaseViewModel {
  double userLat;
  double userLng;
  RequestViewModel({required this.userLat, required this.userLng});

  Object? selectedService;
  Object? selectedServiceincident;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); //handling fields

  Map<String, List<String>> servicesList = {
    "Ambulance": [
      "Medical Emergency",
      "Fire",
      "Accident",
    ],
    "Police": [
      "Fight/Fire",
      "Robbery",
      "Harassment",
    ],
    "Fire Brigade": [
      "Fire",
      "Cylinder Blast",
      "Short Circuit",
    ],
  };

  Function(Object) onchangeServiceoption() {
    return (Object? value) {
      selectedService = value;
      rebuildUi();
    };
  }

  Function(Object) onchangeIncident() {
    return (Object? value) {
      selectedServiceincident = value;
      rebuildUi();
    };
  }

  Future<void> request() async {
    final CollectionReference request =
        FirebaseFirestore.instance.collection('requests');
    Map<String, dynamic> requestMap = await UserModel.request(
        service: selectedService.toString().toLowerCase(),
        incident: selectedServiceincident.toString().toLowerCase(),
        spId: await findNearestProvider(userLat: userLat, userLng: userLat));

    await request.doc().set(requestMap);

    // await findNearestProvider(userLat: userLat, userLng: userLat);
  }

  Future<dynamic> findNearestProvider({double? userLat, double? userLng}
      // , String serviceType
      ) async {
    CollectionReference providersCollection =
        FirebaseFirestore.instance.collection('service provider');

    QuerySnapshot querySnapshot = await providersCollection
        .where('service', isEqualTo: selectedService.toString().toLowerCase())
        .get();
    print(querySnapshot.docs);

    String nearestProviderId = '';
    double minDistance = double.infinity;

    for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
      Map<String, dynamic> providerData =
          docSnapshot.data() as Map<String, dynamic>;

      double providerLat = providerData['locationLatitude'];
      double providerLng = providerData['locationLongitude'];

      // double providerLat = double.parse(providerLatString);
      // double providerLng = double.parse(providerLngString);

      double distance =
          calculateDistance(userLat!, userLng!, providerLat, providerLng);

      if (distance < minDistance) {
        minDistance = distance;
        nearestProviderId = docSnapshot.id;
      }
    }

    print("id: $nearestProviderId, 'distance': $minDistance");
    // return {'id': nearestProviderId, 'distance': minDistance};
    return (nearestProviderId);
  }

  double calculateDistance(
      double userLat, double userLng, double providerLat, double providerLng) {
    const double earthRadius = 6371.0; // Earth's radius in kilometers

    double dLat = radians(providerLat - userLat);
    double dLng = radians(providerLng - userLng);

    double a = pow(sin(dLat / 2), 2) +
        cos(radians(userLat)) *
            cos(radians(providerLat)) *
            pow(sin(dLng / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = earthRadius * c; // Distance in kilometers

    return distance;
  }
}
