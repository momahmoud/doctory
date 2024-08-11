import 'package:firebase_auth/firebase_auth.dart';

import '../models/sign_up_request_body.dart';

class SignUpRepo {
  final auth = FirebaseAuth.instance;

  Future<UserCredential> register(SignUpRequestBody loginRequestBody) async {
    final response = await auth.createUserWithEmailAndPassword(
      email: loginRequestBody.email,
      password: loginRequestBody.password,
    );

    await response.user?.updateDisplayName(loginRequestBody.name);

    return response;
  }
}
