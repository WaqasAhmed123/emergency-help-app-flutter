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
  final CommonFunctionsService _commonFunctionsService =
      locator<CommonFunctionsService>();
  String? serviceproviderImage;

  // getImage()
  // if(ServiceProviderModel.service==){

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
    return _commonFunctionsService.navigateToLoginFromSignout(
        key: "serviceProviderId");
  }

  void navigateToServiceproviderMap({destinationLocation}) {
    _navigationService.navigateToServiceprovidermapView(
        destinationLocation: destinationLocation);
    rebuildUi();
  }

  navigateToServiceproviderReviews() {
    return _navigationService.navigateToServiceProviderReviewView();
  }

  // getService() async {
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('service provider')
  //       .doc(ServiceProviderModel.id)
  //       .get();
  //   String service = snapshot.get(FieldPath(['service'])).toString();
  //   serviceTypeForData = service;
  //   print(serviceTypeForData);
  //   return service;
  // }

  // Future<Map<String, dynamic>> getData() async {
  //   String? imagePath;
  //   final QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //       await FirebaseFirestore.instance
  //           .collection('requests')
  //           .where("spId",
  //               isEqualTo:
  //                   await ServiceProviderModel.getIdFromSharedPreference())
  //           .get();
  //   if (ServiceProviderModel.service == 'police') {
  //     imagePath = 'assets/police_pic.jpg';
  //   } else if (ServiceProviderModel.service ==
  //       'firebrigade') {
  //     imagePath = 'assets/firebrigade_pic.jpg';
  //   } else if (ServiceProviderModel.service ==
  //       'ambulance') {
  //     imagePath = 'assets/ambulance_pic.jpg';
  //   }

  //   // Create a map to hold the values you want to return
  //   Map<String, dynamic> result = {
  //     'querySnapshot': querySnapshot,
  //     'imagePath': imagePath,
  //   };

  //   return result;
  // }
  Future<String?> getImage() async {
    String? imagePath;
    if (await ServiceProviderModel.getService() == 'police') {
      imagePath = 'assets/police_pic.jpg';
    } else if (await ServiceProviderModel.getService() == 'firebrigade') {
      imagePath = 'assets/firebrigade_pic.jpg';
    } else if (await ServiceProviderModel.getService() == 'ambulance') {
      imagePath = 'assets/ambulance_pic.jpg';
    }
    return imagePath = serviceproviderImage;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getRequests() async {
    final String id = await ServiceProviderModel.getIdFromSharedPreference();
    print("Current User ID: $id");

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('requests')
            .where("spId", isEqualTo: id)
            .where("status", isEqualTo: "pending")
            .get();

    return querySnapshot;
  }

  // (Stream<QuerySnapshot>, String imagePath) getData() {
  //   String? imagePath;
  //   Stream<QuerySnapshot> collectionReference = FirebaseFirestore.instance
  //       .collection('requests')
  //       .where("spId",
  //           isEqualTo: ServiceProviderModel.getIdFromSharedPreference())
  //       .snapshots();
  //   if (ServiceProviderModel.service == 'police') {
  //     imagePath = 'assets/police_pic.jpg';
  //   } else if (ServiceProviderModel.service == 'firebrigade') {
  //     imagePath = 'assets/firebrigade_pic.jpg';
  //   } else if (ServiceProviderModel.service == 'ambulance') {
  //     imagePath = 'assets/ambulance_pic.jpg';
  //   }
  //   return (collectionReference, imagePath!);
  // }
  updateRequestStatus(reqId) async {
    // Get the current user's ID (replace with your actual method to get the user ID)
    // String userId = await ServiceProviderModel.getIdFromSharedPreference();

    // Reference to the document you want to update
    DocumentReference requestDocument =
        FirebaseFirestore.instance.collection('requests').doc(reqId);

    // Update the specific field in the document
    await requestDocument.update({
      'status':
          'completed', // Replace 'fieldName' with the actual field name you want to update
    });
  }

  deleteRequest({id, collection}) async {
    await _commonFunctionsService.deleteRequest(id: id, collection: collection);
  }

  deleteAccount() async {
    // print(id);
    await _commonFunctionsService.deleteUser(
        id: await ServiceProviderModel.getIdFromSharedPreference(),
        collection: "service provider",
        localKey: "serviceProviderId");
    rebuildUi();
  }
}
