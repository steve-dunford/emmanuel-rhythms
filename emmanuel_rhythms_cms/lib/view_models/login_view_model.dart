import 'package:emmanuel_rhythms_cms/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {

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
        }
      }

    } finally {
      isLoggingIn = false;
      notifyListeners();
    }

      return false;
  }

  bool _validate() {
    if (email?.isNotEmpty != true) {
      emailError = 'Please enter your email';
      return false;
    }
    if(password?.isNotEmpty != true) {
      password = 'Please enter your password';
      return false;
    }

    return true;
  }

}