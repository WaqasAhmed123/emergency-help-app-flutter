import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:squip/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/app.locator.dart';

class CommonFunctionsService {
  final NavigationService _navigationService = locator<NavigationService>();

  navigateToLoginFromSignout({required key}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await FirebaseAuth.instance.signOut();
    _navigationService.clearStackAndShow(Routes.startupView);
  }

  deleteRequest({id, collection}) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .delete()
        .then((value) => print("req deleted"))
        .catchError((error) {
      print("Failed to delete document: $error");
    });
  }

  deleteUser({id, collection, localKey}) async {
    try {
      // First, delete the user from Firebase Authentication
      await FirebaseAuth.instance.currentUser?.delete();

      // Then, delete the user's data from Cloud Firestore
      await FirebaseFirestore.instance.collection(collection).doc(id).delete();
      await navigateToLoginFromSignout(key: localKey);
      QuerySnapshot requestSnapshot = await FirebaseFirestore.instance
          .collection('requests')
          .where(collection == "user" ? 'userId' : "spId", isEqualTo: id)
          .get();
      List<QueryDocumentSnapshot> requestDocs = requestSnapshot.docs;

      for (var requestDoc in requestDocs) {
        await requestDoc.reference.delete();
      }

      print('User deleted successfully.');
    } catch (error) {
      print('Error deleting user: $error');
    }
  }
}
