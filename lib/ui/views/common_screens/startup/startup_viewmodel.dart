import 'package:squip/app/app.locator.dart';
import 'package:squip/app/app.router.dart';
import 'package:squip/corePlatform/util/AppConstants.dart';
import 'package:squip/corePlatform/util/LocalStorage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  bool? isHospital;
  bool? isUser;
  final _navigationService = locator<NavigationService>();

  void navigateToLogin() async {
    // Determine the current module conditionally
    String currentModule =
        isUser == true ? AppConstants.USER : AppConstants.SERVICE_PROVIDER;
    _navigationService.navigateToLoginView();
    // isUser: isUser!, isHospital: isHospital!);
    await LocalStorage.saveCurrentModule(module: currentModule);
  }
}
