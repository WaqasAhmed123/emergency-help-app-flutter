import 'package:shared_preferences/shared_preferences.dart';
import 'package:squip/corePlatform/util/AppConstants.dart';

class LocalStorage {
  static saveCurrentModule({required String module}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.MODULE, module);
  }

  static getCurrentModule() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.MODULE);
  }
}
