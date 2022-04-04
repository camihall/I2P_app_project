import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/authentication.dart';
import '../state/appState.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<Map<String, dynamic>?> getUserData(String uid) async {
  QuerySnapshot<Map<String, dynamic>> query =
      await firestore.collection('users').where('uid', isEqualTo: uid).get();
  if (query.size > 1) {
    return null;
  }
  DocumentSnapshot documentSnapshot = query.docs[0];
  Map<String, dynamic> data = documentSnapshot.data()! as Map<String, dynamic>;
  return {
    'uid': data['uid'],
    'name': data['name'],
    'dob': data['dob'],
    'email': data['email'],
    'user_type': data['user_type'],
  };
}

Future<void> addUser(String uid, String name, String dob, String email) async {
  firestore
      .collection('users')
      .add({
        'uid': uid,
        'name': name,
        'dob': dob,
        'email': email,
        'user_type': 'common'
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
  return;
  
}

Future<bool> existsInDatabase(String uid) async {
  QuerySnapshot<Map<String, dynamic>> query =
      await firestore.collection('users').where('uid', isEqualTo: uid).get();
  return query.size > 0;
}
