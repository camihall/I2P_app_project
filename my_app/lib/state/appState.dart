// ignore_for_file: prefer_function_declarations_over_variables

import 'package:redux_thunk/redux_thunk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import '../db/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;

// AppState
class AppState {
  final User? _user;

  User? get user => _user;

  AppState(this._user);

  get index => null;
}

/* --------------------- USER AUTHENTICATION --------------------- */
// User information class
class UpdateUserAction {
  final User? _user;

  User? get user => _user;
  UpdateUserAction(this._user);
}

// Async function that pulls user profile from database
ThunkAction<AppState> getFirebaseUser = (Store<AppState> store) async {
  User currentUser = FirebaseAuth.instance.currentUser!;
  if (currentUser == null) {
    store.dispatch(UpdateUserAction(null));
  } else {
    final data = await getUserData(currentUser.uid);
    store.dispatch(UpdateUserAction(currentUser));
  }
};



/* --------------------- REDUCER: HANDLES ACTION TYPES  --------------------- */
AppState reducer(AppState prev, dynamic action) {
  if (action is UpdateUserAction) {
    AppState newAppState = AppState(action.user);
    return newAppState;
  } else {
    return prev;
  }
}

/* --------------------- INITIALIZATION OF STORE  --------------------- */
final store = Store<AppState>(reducer, initialState: AppState(null), middleware: [thunkMiddleware]);