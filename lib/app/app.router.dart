// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i10;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i11;
import 'package:squip/ui/views/common_screens/login/login_view.dart' as _i3;
import 'package:squip/ui/views/common_screens/signup/signup_view.dart' as _i4;
import 'package:squip/ui/views/common_screens/splash/splash_view.dart' as _i9;
import 'package:squip/ui/views/common_screens/startup/startup_view.dart' as _i2;
import 'package:squip/ui/views/serviceprovider_module/dashboard_service_provider/dashboard_service_provider_view.dart'
    as _i6;
import 'package:squip/ui/views/serviceprovider_module/serviceprovidermap/serviceprovidermap_view.dart'
    as _i7;
import 'package:squip/ui/views/user_module/home/home_view.dart' as _i5;
import 'package:squip/ui/views/user_module/request/request_view.dart' as _i8;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;

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

  static const all = <String>{
    startupView,
    loginView,
    signupView,
    homeView,
    dashboardServiceProviderView,
    serviceprovidermapView,
    requestView,
    splashView,
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
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.LoginView(key: args.key, isUser: args.isUser),
        settings: data,
      );
    },
    _i4.SignupView: (data) {
      final args = data.getArgs<SignupViewArguments>(
        orElse: () => const SignupViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.SignupView(key: args.key, isUser: args.isUser),
        settings: data,
      );
    },
    _i5.HomeView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.HomeView(),
        settings: data,
      );
    },
    _i6.DashboardServiceProviderView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.DashboardServiceProviderView(),
        settings: data,
      );
    },
    _i7.ServiceprovidermapView: (data) {
      final args = data.getArgs<ServiceprovidermapViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.ServiceprovidermapView(
            destinationLocation: args.destinationLocation),
        settings: data,
      );
    },
    _i8.RequestView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.RequestView(),
        settings: data,
      );
    },
    _i9.SplashView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.SplashView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class LoginViewArguments {
  const LoginViewArguments({
    this.key,
    this.isUser = false,
  });

  final _i10.Key? key;

  final bool isUser;

  @override
  String toString() {
    return '{"key": "$key", "isUser": "$isUser"}';
  }

  @override
  bool operator ==(covariant LoginViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.isUser == isUser;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isUser.hashCode;
  }
}

class SignupViewArguments {
  const SignupViewArguments({
    this.key,
    this.isUser = false,
  });

  final _i10.Key? key;

  final bool isUser;

  @override
  String toString() {
    return '{"key": "$key", "isUser": "$isUser"}';
  }

  @override
  bool operator ==(covariant SignupViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.isUser == isUser;
  }

  @override
  int get hashCode {
    return key.hashCode ^ isUser.hashCode;
  }
}

class ServiceprovidermapViewArguments {
  const ServiceprovidermapViewArguments({required this.destinationLocation});

  final _i11.LatLng destinationLocation;

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

extension NavigatorStateExtension on _i12.NavigationService {
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

  Future<dynamic> navigateToLoginView({
    _i10.Key? key,
    bool isUser = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key, isUser: isUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView({
    _i10.Key? key,
    bool isUser = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.signupView,
        arguments: SignupViewArguments(key: key, isUser: isUser),
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
    required _i11.LatLng destinationLocation,
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

  Future<dynamic> navigateToRequestView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.requestView,
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

  Future<dynamic> replaceWithLoginView({
    _i10.Key? key,
    bool isUser = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key, isUser: isUser),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView({
    _i10.Key? key,
    bool isUser = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.signupView,
        arguments: SignupViewArguments(key: key, isUser: isUser),
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
    required _i11.LatLng destinationLocation,
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

  Future<dynamic> replaceWithRequestView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.requestView,
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
}
