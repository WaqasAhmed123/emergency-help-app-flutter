import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:squip/models/serviceprovider_model.dart';
import 'package:squip/services/custom_navigation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

class DashboardServiceProviderViewModel extends BaseViewModel {
  // String? serviceTypeForData;

  final NavigationService _navigationService = locator<NavigationService>();
  final CustomNavigationService _customNavigationServiceService =
      locator<CustomNavigationService>();
  String? serviceproviderImage;

  // getImage()
  // if(ServiceProviderModel.currentServiceProvider.service==){

  // }
  Widget buildMarquee(context) {
    return Marquee(
      text: "Slide Right to Accept And Left to Decline the Request",
      style: const TextStyle(color: Colors.red, fontSize: 16),
      // style: Theme.of(context).textTheme.bodyLarge,

      velocity: 50.0,
      blankSpace: 50,
      pauseAfterRound: const Duration(seconds: 1),
    );
  }

  navigateToLogin() async {
    return _customNavigationServiceService.navigateToLoginFromSignout(
        key: "serviceProviderId");
  }

  void navigateToServiceproviderMap({destinationLocation}) {
    _navigationService.navigateToServiceprovidermapView(
        destinationLocation: destinationLocation);
  }

  // getService() async {
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('service provider')
  //       .doc(ServiceProviderModel.currentServiceProvider.id)
  //       .get();
  //   String service = snapshot.get(FieldPath(['service'])).toString();
  //   serviceTypeForData = service;
  //   print(serviceTypeForData);
  //   return service;
  // }

  (Stream<QuerySnapshot>, String imagePath) getData() {
    String? imagePath;
    Stream<QuerySnapshot> collectionReference = FirebaseFirestore.instance
        .collection('requests')
        .where("to",
            isEqualTo: ServiceProviderModel.currentServiceProvider.service)
        .snapshots();
    if (ServiceProviderModel.currentServiceProvider.service == 'police') {
      imagePath = 'assets/police_pic.jpg';
    } else if (ServiceProviderModel.currentServiceProvider.service ==
        'firebrigade') {
      imagePath = 'assets/firebrigade_pic.jpg';
    } else if (ServiceProviderModel.currentServiceProvider.service ==
        'ambulance') {
      imagePath = 'assets/ambulance_pic.jpg';
    }
    return (collectionReference, imagePath!);
  }

  deleteRequest(String id) async {
    await FirebaseFirestore.instance
        .collection('requests')
        .doc(id)
        .delete()
        .then((value) => print("req deleted"))
        .catchError((error) {
      print("Failed to delete document: $error");
    });
  }
}
