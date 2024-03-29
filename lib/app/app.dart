import 'package:squip/services/custom_navigation.dart';
import 'package:squip/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:squip/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:squip/ui/views/common_screens/login/login_view.dart';
import 'package:squip/ui/views/common_screens/signup/signup_view.dart';
import 'package:squip/ui/views/common_screens/startup/startup_view.dart';
import 'package:squip/ui/views/serviceprovider_module/dashboard_service_provider/dashboard_service_provider_view.dart';
import 'package:squip/ui/views/serviceprovider_module/serviceprovidermap/serviceprovidermap_view.dart';
import 'package:squip/ui/views/user_module/home/home_view.dart';
import 'package:squip/ui/views/user_module/request/request_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/common_screens/splash/splash_view.dart';
import 'package:squip/ui/views/user_module/all_requests/all_requests_view.dart';

import 'package:squip/ui/views/serviceprovider_module/service_provider_review/service_provider_review_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: DashboardServiceProviderView),
    MaterialRoute(page: ServiceprovidermapView),
    MaterialRoute(page: RequestView),
    MaterialRoute(page: SplashView),
    MaterialRoute(page: AllRequestsView),
    // MaterialRoute(page: HospitaDashboardView),
    MaterialRoute(page: ServiceProviderReviewView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: CommonFunctionsService),
    // LazySingleton(classType: DatastorageService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}