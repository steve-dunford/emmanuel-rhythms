import 'package:disposebag/disposebag.dart';
import 'package:emmanuel_rhythms_cms/common/disposer.dart';
import 'package:emmanuel_rhythms_cms/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier with Disposer {

  final AuthRepository _authRepository;

  User? currentUser;

  AuthModel(this._authRepository) {
    _authRepository.currentUserChanges().listen((user) {
      currentUser = user;
      notifyListeners();
    }).disposedBy(disposeBag);
  }


}