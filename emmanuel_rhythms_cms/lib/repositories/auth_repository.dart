import 'package:emmanuel_rhythms_cms/common/log_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {

  Stream<User?> currentUserChanges();
  Future<bool> login(String email, String password);
}

class FirebaseAuthRepository extends AuthRepository {

  final LogService _logService;

  FirebaseAuthRepository(this._logService);

  @override
  Stream<User?> currentUserChanges() {
    return FirebaseAuth.instance.userChanges();
  }

  @override
  Future<bool> login(String email, String password) async {
    try {
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

     return true;
    } on Exception catch (e) {
      _logService.warn('Failed to log in', error: e);
    }

    return false;

  }


}