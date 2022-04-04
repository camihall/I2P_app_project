import 'package:my_app/auth/Registration.dart';
import 'package:my_app/auth/login.dart';
import 'package:my_app/routes/route_guard.dart';
import 'package:my_app/views/dashboard.dart';
import 'package:my_app/views/landing.dart';

import 'package:auto_route/auto_route.dart';
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