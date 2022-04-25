// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication.dart';
import '../db/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:auto_route/auto_route.dart';
import 'package:my_app/routes/router.gr.dart';
import '../state/appState.dart';





class Registration extends StatefulWidget {
  final bool? usedGoogleOAuth;
  const Registration({Key? key, this.usedGoogleOAuth}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late TextEditingController textControllerEmail;
  late TextEditingController textControllerName;
  late TextEditingController textControllerDOB;
  late TextEditingController textControllerPassword;

  late FocusNode textFocusNodeEmail;
  late FocusNode textFocusNodeName;
  late FocusNode textFocusNodePassword;
  

  bool _isEditingEmail = false;
  bool _isEditingName = false;
  bool _isEditingPassword = false;

  DateTime selectedDate = DateTime.now();

  late bool _isRegisteringWithGoogle;

  GlobalKey globalKey = GlobalKey();


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

  String? _validateName(String value) {
    value = value.trim();

    if (textControllerEmail.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Name can\'t be empty';
      } else if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(value)) {
        return 'Invalid name!';
      }
    }

    return null;
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        textControllerDOB.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }


  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerName = TextEditingController();
    textControllerDOB = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = '';
    textControllerName.text = '';
    textControllerDOB.text = '';
    textControllerPassword.text = '';
    textFocusNodeEmail = FocusNode();
    textFocusNodeName = FocusNode();
    textFocusNodePassword = FocusNode();
    if (widget.usedGoogleOAuth == true) {
      User? user = getCurrentUser();
      textControllerName.text = user!.displayName!;
      textControllerEmail.text = user.email!;
      _isRegisteringWithGoogle = true;
    } else {
      _isRegisteringWithGoogle = false;
    }
    super.initState();
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
            enabled: _isRegisteringWithGoogle ? false : true,
            autofocus: false,
            onChanged: (value) {
              setState(() {
                _isEditingEmail = true;
              });
            },
            onSubmitted: (value) {
              textFocusNodeEmail.unfocus();
              FocusScope.of(context).requestFocus(textFocusNodeName);
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
          const Text('Name'),
          TextField(
            focusNode: textFocusNodeName,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            controller: textControllerName,
            enabled: _isRegisteringWithGoogle ? false : true,
            autofocus: false,
            onChanged: (value) {
              setState(() {
                _isEditingName = true;
              });
            },
            onSubmitted: (value) {
              textFocusNodeName.unfocus();
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
              hintText: "Name",
              fillColor: Colors.white,
              errorText: _isEditingName
                  ? _validateName(textControllerName.text)
                  : null,
              errorStyle: const TextStyle(
                fontSize: 12,
                color: Colors.redAccent,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text('Date of birth'),
          TextField(
            controller: textControllerDOB,
            autofocus: false,
            onChanged: (value) {
              setState(() {
                selectedDate = value as DateTime;
              });
            },
            enabled: false,
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
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xff0B3F24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () => _selectDate(context),
            child: const Padding(
              padding: EdgeInsets.only(
                top: 5.0,
                bottom: 5.0,
              ),
              child: Text(
                'Select date',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          _isRegisteringWithGoogle ? const SizedBox() : const Text('Password'),
          _isRegisteringWithGoogle ? const SizedBox()
          : TextField(
            focusNode: textFocusNodePassword,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            enabled: _isRegisteringWithGoogle ? false : true, // hacky way to prevent user from entering password when signing up through google oauth
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
                  ? _validatePassword(textControllerPassword.text)
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
                    onPressed: () {
                      AutoRouter.of(context).push(LoginRoute());
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                        top: 15.0,
                        bottom: 15.0,
                      ),
                      child: Text(
                        'Go back',
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
                    onPressed: () async {
                      try {
                        if (_isRegisteringWithGoogle) {
                          await addUser(FirebaseAuth.instance.currentUser!.uid, textControllerName.text, textControllerDOB.text, textControllerEmail.text);
                        } else {
                          await emailSignUp(textControllerEmail.text, textControllerPassword.text).then((user) =>  addUser(user!.uid, textControllerName.text, textControllerDOB.text, textControllerEmail.text));
                        }
                        await store.dispatch(getFirebaseUser);
                        AutoRouter.of(context).push(const DashboardRoute());
                      } catch (e) {
                        Fluttertoast.showToast(
                            msg: "Error registering",
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
        ],
      ),
    )));
  }
}
