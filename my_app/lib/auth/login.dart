// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'authentication.dart';
import '../state/appState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'googleButton.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:auto_route/auto_route.dart';
import 'package:my_app/routes/router.gr.dart';

class Login extends StatefulWidget {
  const Login({Key? key, this.onLoginCallback}) : super(key: key);

  final Function(bool loggedIn)? onLoginCallback;

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

  late Function(bool loggedIn) onLoginCallback;

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = '';
    textControllerPassword.text = '';
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    if (widget.onLoginCallback != null) {
      onLoginCallback = widget.onLoginCallback!;
    } else {
      onLoginCallback = (_) {
        AutoRouter.of(context).push(const DashboardRoute());
      };
    }
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
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("../assets/images/loginbg.png"),
                fit: BoxFit.cover,
                repeat: ImageRepeat.repeatY,
              ), /*color: Color(0xFFE0ECE6)*/
            ),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Center(
                        child: Container(
                            height: MediaQuery.of(context).size.height * .70,
                            width: MediaQuery.of(context).size.width * .81,
                            decoration: BoxDecoration(
                              color: new Color(0xFF0B3F24),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: (Image.asset(
                                      "assets/images/officialLogo.png",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .24,
                                      width: MediaQuery.of(context).size.width *
                                          .24,
                                    ))),
                                Padding(
                                    padding: EdgeInsets.only(left: 14),
                                    child: const Text("Log in",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20))),
                                Padding(
                                    padding: EdgeInsets.only(left: 24, top: 6),
                                    child: const Text(
                                      'Email address/Username',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 24, top: 2, right: 24),
                                    child: TextField(
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
                                        FocusScope.of(context).requestFocus(
                                            textFocusNodePassword);
                                      },
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.blueGrey[800]!,
                                            width: 3,
                                          ),
                                        ),
                                        filled: true,
                                        hintStyle: TextStyle(
                                          color: Colors.blueGrey[300],
                                        ),
                                        hintText: "Email/Username",
                                        fillColor: Colors.white,
                                        errorText: _isEditingEmail
                                            ? _validateEmail(
                                                textControllerEmail.text)
                                            : null,
                                        errorStyle: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    )),
                                const SizedBox(height: 10),
                                Padding(
                                    padding: EdgeInsets.only(left: 24, top: 6),
                                    child: const Text(
                                      'Password',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 24, top: 2, right: 24),
                                    child: TextField(
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
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                            ? _validatePassword(
                                                textControllerEmail.text)
                                            : null,
                                        errorStyle: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    )),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: SizedBox(
                                        width: double.maxFinite,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xff0B3F24),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          onPressed: () async {
                                            try {
                                              User? user = await emailSignIn(
                                                  textControllerEmail.text,
                                                  textControllerPassword.text);
                                              if (user == null) {
                                              } else {
                                                await store
                                                    .dispatch(getFirebaseUser);
                                                onLoginCallback.call(true);
                                              }
                                            } on FirebaseAuthException {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Incorrect password or email",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
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
                                            backgroundColor:
                                                const Color(0xff0B3F24),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          onPressed: () {
                                            AutoRouter.of(context).push(
                                                RegistrationRoute(
                                                    usedGoogleOAuth: false));
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
                            )))))));
  }
}
