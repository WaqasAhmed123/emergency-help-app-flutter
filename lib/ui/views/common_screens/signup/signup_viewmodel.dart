import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

class SignupViewModel extends BaseViewModel {
  bool? isUser; //check whether its user or service provider

//services
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  CollectionReference _user = FirebaseFirestore.instance.collection('users');
  CollectionReference _serviceProvider =
      FirebaseFirestore.instance.collection('service provider');
  //navigation
  void navigateToLogin() => _navigationService.navigateTo(Routes.loginView);

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
      if (isUser == true) {
        _user
            .doc(userId)
            .set({
              "id": userId,
              "name": fieldsNames['Name'].text,
              "email": fieldsNames["Email"].text,
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      } else if (isUser == false) {
        addServices(userId: userId);
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
    "Email": TextEditingController(),
    "Password": TextEditingController(),
    "Location Latitude": TextEditingController(),
    "Location Longitude": TextEditingController(),
  };

  addServices({userId}) {
    _serviceProvider
        .doc(userId)
        .set({
          'id': userId,
          'name': fieldsNames["Name"].text,
          'email': fieldsNames["Email"].text,
          "service": selectedOption.toString().toLowerCase(),
          'location latitude': fieldsNames["Location Latitude"].text,
          'location longitude': fieldsNames["Location Longitude"].text,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
