import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class GetId {
//   saveIdInSharedPreference() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString("userId");
//   }
// }

class UserModel {
  static late String id;
  static String? name;
  static String? email;
  static LatLng? currentLocation;
  // String? to;
  // String? incident;
  static double? locationLatitude;
  static double? locationLongitude;

  // UserModel(
  //     {this.id,
  //     this.name,
  //     this.email,
  //     this.currentLocation,
  //     // this.incident,
  //     // this.to,
  //     this.locationLatitude,
  //     this.locationLongitude});

  ///create

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
      };

  static Future<Map<String, dynamic>> request(
          {service, incident, spId}) async =>
      {
        // 'to': to,
        "userId": await getIdFromSharedPreference(),
        "spId": spId,
        "requestedService": service,
        'incident': incident,
        'timestamp': DateTime.now(),
        // 'location': currentLocation as GeoPoint
        'byName': name,
        'locationLatitude': currentLocation!.latitude,
        'locationLongitude': currentLocation!.longitude,
        'status': "pending"
      };
  static Future<Map<String, dynamic>> review(
          {rating, description, spId}) async =>
      {
        // 'to': to,
        "userId": await getIdFromSharedPreference(),
        "spId": spId,
        'rating': rating,
        'description': description,
      };

  static getIdFromSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId")!;
  }

  static Future getDataFromFirebase() async {
    print('Getting data from Firebase');
    id = await getIdFromSharedPreference();

    final userRef = FirebaseFirestore.instance.collection('user');
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await userRef.doc(id).get();
    Map<String, dynamic> data = documentSnapshot.data()!;
    name = data['name'];
    email = data['email'];
  }

  // factory UserModel.fromDocumentSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> snapshot) {
  //   Map<String, dynamic> data = snapshot.data()!;
  //   return UserModel(
  //     name: data['name'],
  //     id: data['id'],
  //     email: data['email'],
  //   );
  // }

  // static set currentUser(UserModel user) {
  //   _currentUser = user;
  // }
}
