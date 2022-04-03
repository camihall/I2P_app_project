// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'authentication.dart';
import '../db/database.dart';
import '../state/appState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'googleButton.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  late TextEditingController textControllerEmail;
  late TextEditingController textControllerPassword;
  late FocusNode textFocusNodeEmail;
  late FocusNode textFocusNodePassword;
  bool _isEditingEmail = false;
  bool _isEditingPassword = false;

  GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = '';
    textControllerPassword.text = '';
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    super.initState();
  }

  String? _validateEmail(String value) {
    value = value.trim();

    if (textControllerEmail.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }

    return null;
  }

  String? _validatePassword(String value) {
    value = value.trim();

    if (textControllerEmail.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (value.length < 8) {
        return 'Password must be at least 8 characters in length';
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Email address'),
          TextField(
            focusNode: textFocusNodeEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: textControllerEmail,
            autofocus: false,
            onChanged: (value) {
              setState(() {
                _isEditingEmail = true;
              });
            },
            onSubmitted: (value) {
              textFocusNodeEmail.unfocus();
              FocusScope.of(context).requestFocus(textFocusNodePassword);
            },
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.blueGrey[800]!,
                  width: 3,
                ),
              ),
              filled: true,
              hintStyle: TextStyle(
                color: Colors.blueGrey[300],
              ),
              hintText: "Email",
              fillColor: Colors.white,
              errorText: _isEditingEmail
                  ? _validateEmail(textControllerEmail.text)
                  : null,
              errorStyle: const TextStyle(
                fontSize: 12,
                color: Colors.redAccent,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text('Password'),
          TextField(
            focusNode: textFocusNodePassword,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            controller: textControllerPassword,
            autofocus: false,
            onChanged: (value) {
              setState(() {
                _isEditingPassword = true;
              });
            },
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.blueGrey[800]!,
                  width: 3,
                ),
              ),
              filled: true,
              hintStyle: TextStyle(
                color: Colors.blueGrey[300],
              ),
              hintText: "Password",
              fillColor: Colors.white,
              errorText: _isEditingPassword
                  ? _validatePassword(textControllerEmail.text)
                  : null,
              errorStyle: const TextStyle(
                fontSize: 12,
                color: Colors.redAccent,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: double.maxFinite,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff0B3F24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () async {
                      try {
                        User? user = await emailSignIn(textControllerEmail.text,
                            textControllerPassword.text);
                        if (user == null) {
                          print("lol");
                        } else {
                          print(user.displayName);
                          Navigator.pushNamed(context, '/dashboard');
                        }
                      } on FirebaseAuthException {
                        Fluttertoast.showToast(
                            msg: "Incorrect password or email",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            webPosition: "center",
                            webBgColor: "red",
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: 15.0,
                        bottom: 15.0,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: double.maxFinite,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff0B3F24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: 15.0,
                        bottom: 15.0,
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Center(child: GoogleButton()),
        ],
      ),
    )));
  }
}
