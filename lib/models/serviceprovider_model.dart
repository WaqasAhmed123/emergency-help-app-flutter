import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceProviderModel {
  static late String id;

  static String? name;
  static String? service;
  static String? email;
  static LatLng? location;

  static getIdFromSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("serviceProviderId")!;
  }

  static setService(service) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("service", service);
  }

  static getService() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("service")!;
  }

  static setSpName(spName) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("spName", spName);
  }

  static getSpName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("spName")!;
  }

  Map<String, dynamic> credentials = {};

  static Future getDataFromFirebase() async {
    print('Getting data from Firebase');
    id = await getIdFromSharedPreference();
    final userRef = FirebaseFirestore.instance.collection('service provider');
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await userRef.doc(id).get();
    Map<String, dynamic> data = documentSnapshot.data()!;

    // data.forEach((key, value) {
    //   credentials[key] = value;
    // });
    await setSpName(data['name']);
    await setService(data['service']);
    name = data['name'];
    service = data['service'];
    email = data['email'];
    location = LatLng((data['locationLatitude']), (data['locationLongitude']));
  }

  // Future<void> saveCredentialsToSharedPrefs() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('name', credentials['name']);
  //   await prefs.setString('service', credentials['service']);
  //   await prefs.setString('email', credentials['email']);
  //   if (credentials.containsKey('location')) {
  //     // final LatLng location = credentials['location'];
  //     await prefs.setDouble(
  //         'location_latitude', credentials["locationLatitude"]);
  //     await prefs.setDouble(
  //         'location_longitude', credentials["locationLatitude"]);
  //   }
  // }
  // ServiceProviderModel.fromData(Map<String, dynamic> data)
  //     : id = data['id'],
  //       name = data['name'],
  //       email = data['email'];

  // static ServiceProviderModel fromMap(Map<String, dynamic> map) {
  //   if (map == null) return null!;

  //   return ServiceProviderModel(
  //     id: map['id'],
  //     name: map['name'],
  //     email: map['email'],
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'email': email,
  //   };
  // }
}

//my code -------------------------------
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class ServiceProviderModel {
//   static ServiceProviderModel? _currentServiceProvider;

//   String? id;
//   String? name;
//   String? service;
//   String? email;
//   LatLng? location;

//   ServiceProviderModel(
//       {this.id, this.name, this.email, this.location, this.service});

//   static ServiceProviderModel get currentUser {
//     return _currentServiceProvider!;
//   }

//   static set currentUser(ServiceProviderModel user) {
//     _currentServiceProvider = user;
//   }
//  getDataFromFirebase()async{
//    final userRef = FirebaseFirestore.instance.collection('service provider');
//     DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
//         await userRef.doc(id).get();
//     Map<String, dynamic> data = documentSnapshot.data()!;
//     // id=data['id'];
//     name=data['name'];
//     service=data['service'];
//     email=data['email'];
//     location=data['location'];

//   }
//  }

//   // ServiceProviderModel.fromData(Map<String, dynamic> data)
//   //     : id = data['id'],
//   //       name = data['name'],
//   //       email = data['email'];

//   // static ServiceProviderModel fromMap(Map<String, dynamic> map) {
//   //   if (map == null) return null!;

//   //   return ServiceProviderModel(
//   //     id: map['id'],
//   //     name: map['name'],
//   //     email: map['email'],
//   //   );
//   // }

//   // Map<String, dynamic> toJson() {
//   //   return {
//   //     'id': id,
//   //     'name': name,
//   //     'email': email,
//   //   };
//   // }
