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
  static UserModel? _currentUser;
  late String id;
  String? name;
  String? email;
  LatLng? currentLocation;
  // String? to;
  // String? incident;
  String? locationLatitude;
  String? locationLongitude;
  UserModel._();

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

  Map<String, dynamic> request({to, incident}) => {
        'to': to,
        'incident': incident,
        'timestamp': DateTime.now(),
        // 'location': currentLocation as GeoPoint
        'by name': currentUser.name,
        'location latitude': currentLocation!.latitude,
        'location longitude': currentLocation!.longitude
      };

  getIdFromSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId")!;
  }

  Future<void> getDataFromFirebase() async {
    print('Getting data from Firebase');
    id = await getIdFromSharedPreference();

    final userRef = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await userRef.doc(id).get();
    Map<String, dynamic> data = documentSnapshot.data()!;
    if (_currentUser == null) {
      _currentUser = UserModel._();
    }
    _currentUser!.name = data['name'];
    _currentUser!.email = data['email'];

    print('Current service provider: ${_currentUser}');
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

  static UserModel get currentUser {
    _currentUser ??= UserModel._();

    return _currentUser!;
  }

  // static set currentUser(UserModel user) {
  //   _currentUser = user;
  // }
}
