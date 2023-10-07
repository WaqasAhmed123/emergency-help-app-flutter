import 'package:squip/app/app.locator.dart';
import 'package:squip/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  bool? isHospital;
  bool? isUser;
  final _navigationService = locator<NavigationService>();

  void navigateToLogin() => _navigationService.navigateToLoginView(
      isUser: isUser!, isHospital: isHospital!);
}
