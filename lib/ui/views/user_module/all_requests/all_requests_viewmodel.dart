import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:squip/models/user_model.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/custom_navigation.dart';

class AllRequestsViewModel extends BaseViewModel {
  final CommonFunctionsService _commonFunctionsService =
      locator<CommonFunctionsService>();
  Widget buildMarquee(context) {
    return Marquee(
      text: "Slide Right for Review And Left to Cancel the Request",
      style: const TextStyle(color: Colors.red, fontSize: 16),
      // style: Theme.of(context).textTheme.bodyLarge,

      velocity: 50.0,
      blankSpace: 50,
      pauseAfterRound: const Duration(seconds: 1),
    );
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserRequests() async {
    final String id = await UserModel.getIdFromSharedPreference();
    print("Current User ID: $id");

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('requests')
            .where("userId", isEqualTo: id)
            .get();

    return querySnapshot;
  }

  deleteRequest({id, collection}) async {
    print(id);
    await _commonFunctionsService.deleteRequest(id: id, collection: collection);
    rebuildUi();
  }

  postReview(rating, description, spId) async {
    final CollectionReference review =
        FirebaseFirestore.instance.collection('review');
    Map<String, dynamic> reviewCredentials = await UserModel.review(
        description: description, rating: rating, spId: spId);

    await review.doc().set(reviewCredentials);
  }
}
// Stream<QuerySnapshot<Map<String, dynamic>>> getUserRequests() async* {
//   final String id = await UserModel.getIdFromSharedPreference();
//   print("Current User ID: $id");

//   final QuerySnapshot<Map<String, dynamic>> querySnapshot =
//       await FirebaseFirestore.instance
//           .collection('requests')
//           .where("userId", isEqualTo: id)
//           .get();
//   print(querySnapshot);

//   yield* Stream.value(querySnapshot);
// }
