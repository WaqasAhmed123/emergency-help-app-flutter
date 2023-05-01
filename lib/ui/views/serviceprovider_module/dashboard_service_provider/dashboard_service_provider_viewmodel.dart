import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  navigateToLogin() async {
    return _customNavigationServiceService.navigateToLoginFromSignout();
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

  getData() {
    Stream<QuerySnapshot> collectionReference = FirebaseFirestore.instance
        .collection('requests')
        .where("to",
            isEqualTo: ServiceProviderModel.currentServiceProvider.service)
        .snapshots();
    return collectionReference;
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
