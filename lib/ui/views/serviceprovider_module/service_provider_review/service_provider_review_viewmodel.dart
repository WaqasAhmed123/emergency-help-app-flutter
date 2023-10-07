import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/serviceprovider_model.dart';
import '../../../../services/custom_navigation.dart';

class ServiceProviderReviewViewModel extends BaseViewModel {
  final CommonFunctionsService _commonFunctionsService =
      locator<CommonFunctionsService>();

  Future<QuerySnapshot<Map<String, dynamic>>> getReviews() async {
    final String id = await ServiceProviderModel.getIdFromSharedPreference();
    print("Current User ID: $id");

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('review')
            .where("spId", isEqualTo: id)
            .get();

    return querySnapshot;
  }

  Future<List<Map<String, dynamic>>> getReviewsWithUserInfo() async {
    final String id = await ServiceProviderModel.getIdFromSharedPreference();
    print("Current User ID: $id");

    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection('review')
            .where("spId", isEqualTo: id)
            .get();
    print(querySnapshot.docs);
    List<Map<String, dynamic>> reviewsWithUserInfo = [];

    for (QueryDocumentSnapshot<Map<String, dynamic>> reviewDoc
        in querySnapshot.docs) {
      dynamic userId = reviewDoc['userId'];
      Map<String, dynamic> userInfo = await getUserInfo(userId);

      String userName = userInfo['name'];

      Map<String, dynamic> reviewWithUser = {
        'docId': reviewDoc.id,
        'userName': userName,
        'reviewData': reviewDoc.data(),
      };

      reviewsWithUserInfo.add(reviewWithUser);
    }
    print(reviewsWithUserInfo);
    return reviewsWithUserInfo;
  }

  Future<Map<String, dynamic>> getUserInfo(dynamic userId) async {
    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance.collection('user').doc(userId).get();

    if (userSnapshot.exists) {
      return userSnapshot.data()!;
    }

    return {};
  }

  deleteReview({id, collection}) async {
    print(id);
    await _commonFunctionsService.deleteRequest(id: id, collection: collection);
    rebuildUi();
  }
}
