import 'package:flutter/material.dart';
import 'package:my_app/components/MenuController.dart';
import 'package:my_app/routes/route_guard.dart';
import 'package:redux/redux.dart';
import 'package:my_app/routes/router.gr.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'state/appState.dart';
import 'package:provider/provider.dart';

void main() {
  // Create your store as a final variable in the main function or inside a
  // State object. This works better with Hot Reload than creating it directly
  // in the `build` function.

  runApp(Root(
    title: 'A New Page',
    store: store,
  ));
}

class Root extends StatelessWidget {
  final Store<AppState> store;
  final String title;

  const Root({Key? key, required this.store, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
      ],
      child: App(
        store: store,
        title: title,
      ),
    );
  }
}

class App extends StatefulWidget {
  final Store<AppState> store;
  final String title;

  const App({Key? key, required this.store, required this.title})
      : super(key: key);

  static _AppState of(BuildContext context) =>
      context.findAncestorStateOfType<_AppState>()!;

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  late final _appRouter = AppRouter(routeGuard: RouteGuard(),loginGuard: LoginGuard());
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp.router(
          title: widget.title,
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate()),
    );
  }
}
