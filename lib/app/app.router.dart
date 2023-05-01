// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i10;
import 'package:squip/ui/views/common_screens/login/login_view.dart' as _i3;
import 'package:squip/ui/views/common_screens/signup/signup_view.dart' as _i4;
import 'package:squip/ui/views/common_screens/startup/startup_view.dart' as _i2;
import 'package:squip/ui/views/serviceprovider_module/dashboard_service_provider/dashboard_service_provider_view.dart'
    as _i6;
import 'package:squip/ui/views/serviceprovider_module/serviceprovidermap/serviceprovidermap_view.dart'
    as _i7;
import 'package:squip/ui/views/user_module/home/home_view.dart' as _i5;
import 'package:squip/ui/views/user_module/request/request_view.dart' as _i8;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

class Routes {
  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const signupView = '/signup-view';

  static const homeView = '/home-view';


  static const dashboardServiceProviderView =
      '/dashboard-service-provider-view';

  static const serviceprovidermapView = '/serviceprovidermap-view';

  static const requestView = '/request-view';

  static const all = <String>{
    startupView,
    loginView,
    signupView,
    homeView,
    dashboardServiceProviderView,
    serviceprovidermapView,
    requestView,
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
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
        maintainState: false,
      );
    },
    _i3.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.LoginView(key: args.key, isUser: args.isUser),
        settings: data,
        maintainState: false,
      );
    },
    _i4.SignupView: (data) {
      final args = data.getArgs<SignupViewArguments>(
        orElse: () => const SignupViewArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.SignupView(key: args.key, isUser: args.isUser),
        settings: data,
        maintainState: false,
      );
    },
    _i5.HomeView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.HomeView(),
        settings: data,
        maintainState: false,
      );
    },
    _i6.DashboardServiceProviderView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.DashboardServiceProviderView(),
        settings: data,
        maintainState: false,
      );
    },
    _i7.ServiceprovidermapView: (data) {
      final args = data.getArgs<ServiceprovidermapViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.ServiceprovidermapView(
            destinationLocation: args.destinationLocation),
        settings: data,
        maintainState: false,
      );
    },
    _i8.RequestView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.RequestView(),
        settings: data,
        maintainState: false,
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

  final _i9.Key? key;

  final bool isUser;

  @override
  String toString() {
    return '{"key": "$key", "isUser": "$isUser"}';
  }
}

class SignupViewArguments {
  const SignupViewArguments({
    this.key,
    this.isUser = false,
  });

  final _i9.Key? key;

  final bool isUser;

  @override
  String toString() {
    return '{"key": "$key", "isUser": "$isUser"}';
  }
}

class ServiceprovidermapViewArguments {
  const ServiceprovidermapViewArguments({required this.destinationLocation});

  final _i10.LatLng destinationLocation;

  @override
  String toString() {
    return '{"destinationLocation": "$destinationLocation"}';
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
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
    _i9.Key? key,
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
    _i9.Key? key,
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
    required _i10.LatLng destinationLocation,
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
    _i9.Key? key,
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
    _i9.Key? key,
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
    required _i10.LatLng destinationLocation,
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
}
