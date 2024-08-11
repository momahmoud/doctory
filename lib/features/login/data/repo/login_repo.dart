import 'package:firebase_auth/firebase_auth.dart';

import '../models/login_request_body.dart';

class LoginRepo {
  final auth = FirebaseAuth.instance;

  Future<UserCredential> login(LoginRequestBody loginRequestBody) async {
    return await auth.signInWithEmailAndPassword(
      email: loginRequestBody.email,
      password: loginRequestBody.password,
    );
  }
}
