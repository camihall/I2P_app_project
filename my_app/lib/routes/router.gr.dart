// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../auth/login.dart' as _i3;
import '../auth/Registration.dart' as _i4;
import '../views/dashboard.dart' as _i2;
import '../views/landing.dart' as _i1;
import 'route_guard.dart' as _i7;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
      required this.routeGuard})
      : super(navigatorKey);

  final _i7.RouteGuard routeGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LandingPage.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LandingPage());
    },
    DashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Dashboard());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i3.Login(key: args.key, onLoginCallback: args.onLoginCallback));
    },
    RegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationRouteArgs>(
          orElse: () => const RegistrationRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.Registration(
              key: args.key, usedGoogleOAuth: args.usedGoogleOAuth));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(LandingPage.name, path: '/'),
        _i5.RouteConfig(DashboardRoute.name,
            path: '/dashboard', guards: [routeGuard]),
        _i5.RouteConfig(LoginRoute.name, path: '/login'),
        _i5.RouteConfig(RegistrationRoute.name, path: '/registration')
      ];
}

/// generated route for
/// [_i1.LandingPage]
class LandingPage extends _i5.PageRouteInfo<void> {
  const LandingPage() : super(LandingPage.name, path: '/');

  static const String name = 'LandingPage';
}

/// generated route for
/// [_i2.Dashboard]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '/dashboard');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i3.Login]
class LoginRoute extends _i5.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i6.Key? key, dynamic Function(bool)? onLoginCallback})
      : super(LoginRoute.name,
            path: '/login',
            args: LoginRouteArgs(key: key, onLoginCallback: onLoginCallback));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onLoginCallback});

  final _i6.Key? key;

  final dynamic Function(bool)? onLoginCallback;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginCallback: $onLoginCallback}';
  }
}

/// generated route for
/// [_i4.Registration]
class RegistrationRoute extends _i5.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({_i6.Key? key, bool? usedGoogleOAuth})
      : super(RegistrationRoute.name,
            path: '/registration',
            args: RegistrationRouteArgs(
                key: key, usedGoogleOAuth: usedGoogleOAuth));

  static const String name = 'RegistrationRoute';
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({this.key, this.usedGoogleOAuth});

  final _i6.Key? key;

  final bool? usedGoogleOAuth;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key, usedGoogleOAuth: $usedGoogleOAuth}';
  }
}
