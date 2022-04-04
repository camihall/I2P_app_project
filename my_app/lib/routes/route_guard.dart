import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/routes/router.gr.dart';

class RouteGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        router.push(
          LoginRoute(
            onLoginCallback: (_) {
              resolver.next();
              router.removeLast();
            },
          ),
        );
      } else {
        return resolver.next();
      }
    });
  }
}
