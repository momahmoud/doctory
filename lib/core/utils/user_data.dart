import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  //get FirebaseUser from FirebaseAuth and create singleton instance
  static UserData? _instance;
  static UserData get instance => _instance ??= UserData._init();
  UserData._init();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User get user => _auth.currentUser!;

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
