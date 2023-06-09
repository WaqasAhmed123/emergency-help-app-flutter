import 'package:firebase_auth/firebase_auth.dart';
import 'package:squip/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/app.locator.dart';

class CustomNavigationService {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToLoginFromSignout({required key}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    await FirebaseAuth.instance.signOut();
    _navigationService.clearStackAndShow(Routes.startupView);
  }
}
