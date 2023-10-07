import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

class SignupViewModel extends BaseViewModel {
  bool? isUser; //check whether its user or service provider
  bool? isHospital; //check whether its user or service provider
  bool obscureText = true;
  togglePassword() {
    obscureText = !obscureText;
    // notifyListeners();
    rebuildUi();
  }

//services
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final CollectionReference _user =
      FirebaseFirestore.instance.collection('user');
  final CollectionReference _serviceProvider =
      FirebaseFirestore.instance.collection('service provider');
  final CollectionReference _hospital =
      FirebaseFirestore.instance.collection('hospital');
  //navigation
  void navigateToLogin() => _navigationService.navigateTo(Routes.loginView);

  TextEditingController address = TextEditingController();

//signup
  Future signupWithEmail({
    String? email,
    String? password,
  }) async {
    setBusy(true);
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (isUser == true && isHospital == false) {
        _user
            .doc(userId)
            .set({
              "id": userId,
              "name": fieldsNames['Name'].text,
              "email": fieldsNames["Email"].text,
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      } else if (isUser == false && isHospital == false) {
        addServices(userId: userId);
      } else if (isUser == false && isHospital == true) {
        addHospital(userId: userId);
      }

      setBusy(false);
      rebuildUi();
      _navigationService.replaceWithLoginView();
    } on FirebaseAuthException catch (e) {
      _dialogService.showDialog(
          title: "Signup failure", description: e.code.toString());
      setBusy(false);
      rebuildUi();
    }
  }

  //handling dropdowninput
  //-----------------------------------------
  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); //handling fields
  Object? selectedOption;
  List<String> servicesList = [
    "Ambulance",
    "Police",
    "Fire Brigade",
  ];

  void Function(Object?) onChanged() {
    return (Object? value) {
      selectedOption = value;
      rebuildUi();
    };
  }

  //fields
  Map<String, dynamic> fieldsNames = {
    "Name": TextEditingController(),
    "Phone": TextEditingController(),
    "Email": TextEditingController(),
    "Password": TextEditingController(),
    "locationLatitude": TextEditingController(),
    "locationLongitude": TextEditingController(),
  };

  addServices({userId}) {
    String latitudeText = fieldsNames["locationLatitude"].text;
    String longitudeText = fieldsNames["locationLongitude"].text;
    String contactText = fieldsNames["Phone"].text;
    int? contact = int.tryParse(contactText);

    double? latitude = double.tryParse(latitudeText);
    double? longitude = double.tryParse(longitudeText);
    _serviceProvider
        .doc(userId)
        .set({
          // 'id': userId,
          'email': fieldsNames["Email"].text,
          'name': fieldsNames["Name"].text,
          "contact": contact,
          "service": selectedOption.toString().toLowerCase(),
          'locationLatitude': latitude,
          'locationLongitude': longitude,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  addHospital({userId}) {
    String latitudeText = fieldsNames["locationLatitude"].text;
    String longitudeText = fieldsNames["locationLongitude"].text;
    String contactText = fieldsNames["Phone"].text;
    int? contact = int.tryParse(contactText);

    double? latitude = double.tryParse(latitudeText);
    double? longitude = double.tryParse(longitudeText);
    _hospital
        .doc(userId)
        .set({
          // 'id': userId,
          'email': fieldsNames["Email"].text,
          'name': fieldsNames["Name"].text,
          "contact": contact,
          'locationLatitude': latitude,
          'locationLongitude': longitude,
          'address': address.text
        })
        .then((value) => print("Hospital Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
