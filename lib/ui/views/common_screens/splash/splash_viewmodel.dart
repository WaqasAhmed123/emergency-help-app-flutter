import 'package:squip/ui/views/common_screens/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
// import '../../../../app/app.router.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  void navigateToStartup() =>
      _navigationService.clearStackAndShow(Routes.startupView);
}
