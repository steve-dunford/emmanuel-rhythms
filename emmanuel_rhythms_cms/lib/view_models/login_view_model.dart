import 'package:emmanuel_rhythms_cms/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {

  static final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+");
  final AuthRepository _authRepository;

  LoginViewModel(this._authRepository);


  String? email;
  String? emailError;

  String? password;
  String? passwordError;

  bool isLoggingIn = false;

  Future<bool> login() async {
    try {
      isLoggingIn = true;
      notifyListeners();

      if (_validate()) {
        if(await _authRepository.login(email!, password!)) {
          return true;
        } else {
          emailError = 'Details not recognised';

        }
      }

    } finally {
      isLoggingIn = false;
      notifyListeners();
    }

      return false;
  }

  bool _validate() {
    emailError = null;
    passwordError = null;

    if (email?.isNotEmpty != true) {
      emailError = 'Please enter your email';
      return false;
    }

    if(!emailRegex.hasMatch(email!)) {
      emailError = 'Please enter a valid email address';
      return false;
    }

    if(password?.isNotEmpty != true) {
      passwordError = 'Please enter your password';
      return false;
    }

    return true;
  }

}