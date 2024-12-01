// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i13;
import 'package:squip/ui/views/common_screens/login/login_view.dart' as _i3;
import 'package:squip/ui/views/common_screens/signup/signup_view.dart' as _i4;
import 'package:squip/ui/views/common_screens/splash/splash_view.dart' as _i9;
import 'package:squip/ui/views/common_screens/startup/startup_view.dart' as _i2;
import 'package:squip/ui/views/serviceprovider_module/dashboard_service_provider/dashboard_service_provider_view.dart'
    as _i6;
import 'package:squip/ui/views/serviceprovider_module/service_provider_review/service_provider_review_view.dart'
    as _i11;
import 'package:squip/ui/views/serviceprovider_module/serviceprovidermap/serviceprovidermap_view.dart'
    as _i7;
import 'package:squip/ui/views/user_module/all_requests/all_requests_view.dart'
    as _i10;
import 'package:squip/ui/views/user_module/home/home_view.dart' as _i5;
import 'package:squip/ui/views/user_module/request/request_view.dart' as _i8;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;

class Routes {
  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const signupView = '/signup-view';

  static const homeView = '/home-view';

  // static const homeView = '/home-view';

  static const dashboardServiceProviderView =
      '/dashboard-service-provider-view';

  static const serviceprovidermapView = '/serviceprovidermap-view';

  static const requestView = '/request-view';

  static const splashView = '/splash-view';

  static const allRequestsView = '/all-requests-view';

  static const serviceProviderReviewView = '/service-provider-review-view';

  static const all = <String>{
    startupView,
    loginView,
    signupView,
    homeView,
    dashboardServiceProviderView,
    serviceprovidermapView,
    requestView,
    splashView,
    allRequestsView,
    serviceProviderReviewView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i4.SignupView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i5.HomeView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i5.HomeView,
    ),
    _i1.RouteDef(
      Routes.dashboardServiceProviderView,
      page: _i6.DashboardServiceProviderView,
    ),
    _i1.RouteDef(
      Routes.serviceprovidermapView,
      page: _i7.ServiceprovidermapView,
    ),
    _i1.RouteDef(
      Routes.requestView,
      page: _i8.RequestView,
    ),
    _i1.RouteDef(
      Routes.splashView,
      page: _i9.SplashView,
    ),
    _i1.RouteDef(
      Routes.allRequestsView,
      page: _i10.AllRequestsView,
    ),
    _i1.RouteDef(
      Routes.serviceProviderReviewView,
      page: _i11.ServiceProviderReviewView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.LoginView(),
        settings: data,
      );
    },
    _i4.SignupView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.SignupView(),
        settings: data,
      );
    },
    _i5.HomeView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.HomeView(),
        settings: data,
      );
    },
    _i6.DashboardServiceProviderView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.DashboardServiceProviderView(),
        settings: data,
      );
    },
    _i7.ServiceprovidermapView: (data) {
      final args = data.getArgs<ServiceprovidermapViewArguments>(nullOk: false);
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.ServiceprovidermapView(
            destinationLocation: args.destinationLocation),
        settings: data,
      );
    },
    _i8.RequestView: (data) {
      final args = data.getArgs<RequestViewArguments>(nullOk: false);
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.RequestView(
            key: args.key, userLat: args.userLat, userLng: args.userLng),
        settings: data,
      );
    },
    _i9.SplashView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.SplashView(),
        settings: data,
      );
    },
    _i10.AllRequestsView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.AllRequestsView(),
        settings: data,
      );
    },
    _i11.ServiceProviderReviewView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.ServiceProviderReviewView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ServiceprovidermapViewArguments {
  const ServiceprovidermapViewArguments({required this.destinationLocation});

  final _i13.LatLng destinationLocation;

  @override
  String toString() {
    return '{"destinationLocation": "$destinationLocation"}';
  }

  @override
  bool operator ==(covariant ServiceprovidermapViewArguments other) {
    if (identical(this, other)) return true;
    return other.destinationLocation == destinationLocation;
  }

  @override
  int get hashCode {
    return destinationLocation.hashCode;
  }
}

class RequestViewArguments {
  const RequestViewArguments({
    this.key,
    required this.userLat,
    required this.userLng,
  });

  final _i12.Key? key;

  final double userLat;

  final double userLng;

  @override
  String toString() {
    return '{"key": "$key", "userLat": "$userLat", "userLng": "$userLng"}';
  }

  @override
  bool operator ==(covariant RequestViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.userLat == userLat &&
        other.userLng == userLng;
  }

  @override
  int get hashCode {
    return key.hashCode ^ userLat.hashCode ^ userLng.hashCode;
  }
}

extension NavigatorStateExtension on _i14.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  // Future<dynamic> navigateToHomeView([
  //   int? routerId,
  //   bool preventDuplicates = true,
  //   Map<String, String>? parameters,
  //   Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
  //       transition,
  // ]) async {
  //   return navigateTo<dynamic>(Routes.homeView,
  //       id: routerId,
  //       preventDuplicates: preventDuplicates,
  //       parameters: parameters,
  //       transition: transition);
  // }

  Future<dynamic> navigateToDashboardServiceProviderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardServiceProviderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToServiceprovidermapView({
    required _i13.LatLng destinationLocation,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.serviceprovidermapView,
        arguments: ServiceprovidermapViewArguments(
            destinationLocation: destinationLocation),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRequestView({
    _i12.Key? key,
    required double userLat,
    required double userLng,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.requestView,
        arguments:
            RequestViewArguments(key: key, userLat: userLat, userLng: userLng),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAllRequestsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.allRequestsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToServiceProviderReviewView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.serviceProviderReviewView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  // Future<dynamic> replaceWithHomeView([
  //   int? routerId,
  //   bool preventDuplicates = true,
  //   Map<String, String>? parameters,
  //   Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
  //       transition,
  // ]) async {
  //   return replaceWith<dynamic>(Routes.homeView,
  //       id: routerId,
  //       preventDuplicates: preventDuplicates,
  //       parameters: parameters,
  //       transition: transition);
  // }

  Future<dynamic> replaceWithDashboardServiceProviderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardServiceProviderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithServiceprovidermapView({
    required _i13.LatLng destinationLocation,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.serviceprovidermapView,
        arguments: ServiceprovidermapViewArguments(
            destinationLocation: destinationLocation),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRequestView({
    _i12.Key? key,
    required double userLat,
    required double userLng,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.requestView,
        arguments:
            RequestViewArguments(key: key, userLat: userLat, userLng: userLng),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAllRequestsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.allRequestsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithServiceProviderReviewView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.serviceProviderReviewView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
