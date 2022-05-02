// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../auth/login.dart' as _i3;
import '../auth/Registration.dart' as _i4;
import '../views/dailyCheckIn.dart' as _i7;
import '../views/dashboard.dart' as _i2;
import '../views/dashboardMain.dart' as _i5;
import '../views/exercises.dart' as _i11;
import '../views/faq.dart' as _i14;
import '../views/journal.dart' as _i6;
import '../views/landing.dart' as _i1;
import '../views/mediatation.dart' as _i9;
import '../views/progress.dart' as _i8;
import '../views/resources.dart' as _i10;
import '../views/sos.dart' as _i12;
import '../views/Steps.dart' as _i13;
import 'route_guard.dart' as _i17;

class AppRouter extends _i15.RootStackRouter {
  AppRouter(
      {_i16.GlobalKey<_i16.NavigatorState>? navigatorKey,
      required this.routeGuard,
      required this.loginGuard})
      : super(navigatorKey);

  final _i17.RouteGuard routeGuard;

  final _i17.LoginGuard loginGuard;

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    LandingPage.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LandingPage());
    },
    DashboardRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Dashboard());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i3.Login(key: args.key, onLoginCallback: args.onLoginCallback));
    },
    RegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationRouteArgs>(
          orElse: () => const RegistrationRouteArgs());
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.Registration(
              key: args.key, usedGoogleOAuth: args.usedGoogleOAuth));
    },
    DashboardMainRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.DashboardMain());
    },
    JournalRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.Journal());
    },
    CheckInRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.CheckIn());
    },
    ProgressRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.Progress());
    },
    MeditationRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.Meditation());
    },
    ResourcesRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.Resources());
    },
    ExercisesRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.Exercises());
    },
    SOSRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.SOSRoute());
    },
    StepsRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.StepsRoute());
    },
    FAQRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.FAQ());
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(LandingPage.name, path: '/'),
        _i15.RouteConfig(DashboardRoute.name, path: '/dashboard', guards: [
          routeGuard
        ], children: [
          _i15.RouteConfig(DashboardMainRoute.name,
              path: '', parent: DashboardRoute.name, usesPathAsKey: true),
          _i15.RouteConfig(JournalRoute.name,
              path: 'journal',
              parent: DashboardRoute.name,
              usesPathAsKey: true),
          _i15.RouteConfig(CheckInRoute.name,
              path: 'checkin',
              parent: DashboardRoute.name,
              usesPathAsKey: true),
          _i15.RouteConfig(ProgressRoute.name,
              path: 'progress',
              parent: DashboardRoute.name,
              usesPathAsKey: true),
          _i15.RouteConfig(MeditationRoute.name,
              path: 'meditation',
              parent: DashboardRoute.name,
              usesPathAsKey: true),
          _i15.RouteConfig(ResourcesRoute.name,
              path: 'resources',
              parent: DashboardRoute.name,
              usesPathAsKey: true),
          _i15.RouteConfig(ExercisesRoute.name,
              path: 'exercises',
              parent: DashboardRoute.name,
              usesPathAsKey: true),
          _i15.RouteConfig(SOSRoute.name,
              path: 'sos', parent: DashboardRoute.name, usesPathAsKey: true),
          _i15.RouteConfig(StepsRoute.name,
              path: 'about', parent: DashboardRoute.name, usesPathAsKey: true),
          _i15.RouteConfig(FAQRoute.name,
              path: 'faq', parent: DashboardRoute.name, usesPathAsKey: true)
        ]),
        _i15.RouteConfig(LoginRoute.name, path: '/login', guards: [loginGuard]),
        _i15.RouteConfig(RegistrationRoute.name, path: '/registration')
      ];
}

/// generated route for
/// [_i1.LandingPage]
class LandingPage extends _i15.PageRouteInfo<void> {
  const LandingPage() : super(LandingPage.name, path: '/');

  static const String name = 'LandingPage';
}

/// generated route for
/// [_i2.Dashboard]
class DashboardRoute extends _i15.PageRouteInfo<void> {
  const DashboardRoute({List<_i15.PageRouteInfo>? children})
      : super(DashboardRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i3.Login]
class LoginRoute extends _i15.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i16.Key? key, dynamic Function(bool)? onLoginCallback})
      : super(LoginRoute.name,
            path: '/login',
            args: LoginRouteArgs(key: key, onLoginCallback: onLoginCallback));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onLoginCallback});

  final _i16.Key? key;

  final dynamic Function(bool)? onLoginCallback;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginCallback: $onLoginCallback}';
  }
}

/// generated route for
/// [_i4.Registration]
class RegistrationRoute extends _i15.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({_i16.Key? key, bool? usedGoogleOAuth})
      : super(RegistrationRoute.name,
            path: '/registration',
            args: RegistrationRouteArgs(
                key: key, usedGoogleOAuth: usedGoogleOAuth));

  static const String name = 'RegistrationRoute';
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({this.key, this.usedGoogleOAuth});

  final _i16.Key? key;

  final bool? usedGoogleOAuth;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key, usedGoogleOAuth: $usedGoogleOAuth}';
  }
}

/// generated route for
/// [_i5.DashboardMain]
class DashboardMainRoute extends _i15.PageRouteInfo<void> {
  const DashboardMainRoute() : super(DashboardMainRoute.name, path: '');

  static const String name = 'DashboardMainRoute';
}

/// generated route for
/// [_i6.Journal]
class JournalRoute extends _i15.PageRouteInfo<void> {
  const JournalRoute() : super(JournalRoute.name, path: 'journal');

  static const String name = 'JournalRoute';
}

/// generated route for
/// [_i7.CheckIn]
class CheckInRoute extends _i15.PageRouteInfo<void> {
  const CheckInRoute() : super(CheckInRoute.name, path: 'checkin');

  static const String name = 'CheckInRoute';
}

/// generated route for
/// [_i8.Progress]
class ProgressRoute extends _i15.PageRouteInfo<void> {
  const ProgressRoute() : super(ProgressRoute.name, path: 'progress');

  static const String name = 'ProgressRoute';
}

/// generated route for
/// [_i9.Meditation]
class MeditationRoute extends _i15.PageRouteInfo<void> {
  const MeditationRoute() : super(MeditationRoute.name, path: 'meditation');

  static const String name = 'MeditationRoute';
}

/// generated route for
/// [_i10.Resources]
class ResourcesRoute extends _i15.PageRouteInfo<void> {
  const ResourcesRoute() : super(ResourcesRoute.name, path: 'resources');

  static const String name = 'ResourcesRoute';
}

/// generated route for
/// [_i11.Exercises]
class ExercisesRoute extends _i15.PageRouteInfo<void> {
  const ExercisesRoute() : super(ExercisesRoute.name, path: 'exercises');

  static const String name = 'ExercisesRoute';
}

/// generated route for
/// [_i12.SOSRoute]
class SOSRoute extends _i15.PageRouteInfo<void> {
  const SOSRoute() : super(SOSRoute.name, path: 'sos');

  static const String name = 'SOSRoute';
}

/// generated route for
/// [_i13.StepsRoute]
class StepsRoute extends _i15.PageRouteInfo<void> {
  const StepsRoute() : super(StepsRoute.name, path: 'about');

  static const String name = 'StepsRoute';
}

/// generated route for
/// [_i14.FAQ]
class FAQRoute extends _i15.PageRouteInfo<void> {
  const FAQRoute() : super(FAQRoute.name, path: 'faq');

  static const String name = 'FAQRoute';
}
