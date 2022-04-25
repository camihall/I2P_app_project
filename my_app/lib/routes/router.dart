import 'package:my_app/auth/Registration.dart';
import 'package:my_app/auth/login.dart';
import 'package:my_app/routes/route_guard.dart';
import 'package:my_app/views/dailyCheckIn.dart';
import 'package:my_app/views/dashboard.dart';
import 'package:my_app/views/dashboardMain.dart';
import 'package:my_app/views/exercises.dart';
import 'package:my_app/views/journal.dart';

import 'package:my_app/views/landing.dart';

import 'package:auto_route/auto_route.dart';
import 'package:my_app/views/mediatation.dart';
import 'package:my_app/views/progress.dart';
import 'package:my_app/views/resources.dart';
import '../views/landing.dart';


  
@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: LandingPage,
      name: 'LandingPage',
      path: '/',
      initial: true
    ),
    AutoRoute(
      page: Dashboard,
      name: 'DashboardRoute',
      path: '/dashboard',
      children: [
        AutoRoute(path: '', page: DashboardMain, initial: true, usesPathAsKey: true),
        AutoRoute(path: 'journal', page: Journal, usesPathAsKey: true),
        AutoRoute(path: 'checkin', page: CheckIn, usesPathAsKey: true),
        AutoRoute(path: 'progress', page: Progress, usesPathAsKey: true),
        AutoRoute(path: 'meditation', page: Meditation, usesPathAsKey: true),
        AutoRoute(path: 'resources', page: Resources, usesPathAsKey: true),
        AutoRoute(path: 'exercises', page: Exercises, usesPathAsKey: true),
      ],
      guards: [RouteGuard],
    ),
    AutoRoute(
      page: Login, 
      name: 'LoginRoute', 
      path: '/login'
    ),
    AutoRoute(
      page: Registration, 
      name: 'RegistrationRoute', 
      path: '/registration'
    ),
  ],
)
class $AppRouter {}