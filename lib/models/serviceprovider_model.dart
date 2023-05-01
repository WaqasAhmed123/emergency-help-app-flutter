import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceProviderModel {
  static ServiceProviderModel? _currentServiceProvider;

  late String id;

  String? name;
  String? service;
  String? email;
  LatLng? location;

  ServiceProviderModel._();

  static ServiceProviderModel get currentServiceProvider {
    _currentServiceProvider ??= ServiceProviderModel._();
    return _currentServiceProvider!;
  }

  getIdFromSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("serviceProviderId")!;
  }

  Map<String, dynamic> credentials = {};

  Future<void> getDataFromFirebase() async {
    print('Getting data from Firebase');
    id = await getIdFromSharedPreference();
    final userRef = FirebaseFirestore.instance.collection('service provider');
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await userRef.doc(id).get();
    Map<String, dynamic> data = documentSnapshot.data()!;
    if (_currentServiceProvider == null) {
      _currentServiceProvider = ServiceProviderModel._();
    }
    // data.forEach((key, value) {
    //   credentials[key] = value;
    // });
    _currentServiceProvider!.name = data['name'];
    _currentServiceProvider!.service = data['service'];
    _currentServiceProvider!.email = data['email'];
    _currentServiceProvider!.location = LatLng(
        double.parse(data['location latitude']),
        double.parse(data['location longitude']));
    print('Current service provider: ${_currentServiceProvider}');
  }

  // Future<void> saveCredentialsToSharedPrefs() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('name', credentials['name']);
  //   await prefs.setString('service', credentials['service']);
  //   await prefs.setString('email', credentials['email']);
  //   if (credentials.containsKey('location')) {
  //     // final LatLng location = credentials['location'];
  //     await prefs.setDouble(
  //         'location_latitude', credentials["location latitude"]);
  //     await prefs.setDouble(
  //         'location_longitude', credentials["location latitude"]);
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
//     // _currentServiceProvider!.id=data['id'];
//     _currentServiceProvider!.name=data['name'];
//     _currentServiceProvider!.service=data['service'];
//     _currentServiceProvider!.email=data['email'];
//     _currentServiceProvider!.location=data['location'];
  
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
