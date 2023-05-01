import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squip/models/serviceprovider_model.dart';
import 'package:squip/models/user_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

class LoginViewModel extends BaseViewModel {
  bool? isUser;
  saveIdInSharedPreference(String module, String id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(module, id);
    prefs.setBool("isLoggedIn", true);
  }

  String? currentuserId = FirebaseAuth.instance.currentUser?.uid;

  Future<bool> isUserExistsInUsersCollection() async {
    final userRef = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot documentSnapshot = await userRef.doc(currentuserId).get();
    return documentSnapshot.exists;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData() async {
    final userRef = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await userRef.doc(currentuserId).get();
    return documentSnapshot;
  }

  Future<bool> isServiceProviderExistsInCollection() async {
    final userRef = FirebaseFirestore.instance.collection('service provider');
    DocumentSnapshot documentSnapshot = await userRef.doc(currentuserId).get();
    return documentSnapshot.exists;
  }

//services
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

//fields and validation form
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

// navigation and busy functions
  get currentState => null;
  void setModelBusy() {}

  void navigateToSignUp() =>
      _navigationService.navigateToSignupView(isUser: isUser!);

  void navigateToHome() => _navigationService.replaceWithHomeView();
  // void navigateToHome() => _navigationService.navigateTo(Routes.homeView);

  void navigateToServiceDashboard() =>
      _navigationService.replaceWithDashboardServiceProviderView();
  // void navigateToServiceDashboard() =>
  //     _navigationService.navigateTo(Routes.dashboardServiceProviderView);

//login
  Future loginWithEmail({String? email, String? password}) async {
    setBusy(true);
    bool isUserModule = false;

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      currentuserId = credential.user?.uid;

      if (await isUserExistsInUsersCollection() == true && isUser == true) {
        isUserModule = true;
        await saveIdInSharedPreference("userId", currentuserId!);
        await UserModel.currentUser.getDataFromFirebase();

        
        navigateToHome();
        setBusy(false);
        rebuildUi();
      } else if (await isServiceProviderExistsInCollection() == true &&
          isUser == false) {
        isUserModule = false;
        await saveIdInSharedPreference("serviceProviderId", currentuserId!);
        await ServiceProviderModel.currentServiceProvider.getDataFromFirebase();
        
        navigateToServiceDashboard();
        setBusy(false);
        rebuildUi();
      } else if (isUserModule == true) {
        _dialogService.showDialog(title: "User doesn't exist in user module");
      } else if (isUserModule == false) {
        _dialogService.showDialog(
            title: "Service Provider doesn't exist in Service Provider module");
      }
      setBusy(false);
      rebuildUi();
    } on FirebaseAuthException catch (e) {
      _dialogService.showDialog(
          title: "Login failure", description: e.code.toString());
      setBusy(false);
      rebuildUi();
    }
  }
}