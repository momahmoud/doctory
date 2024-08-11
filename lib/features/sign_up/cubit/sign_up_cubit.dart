import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_comp/core/utils/shared_prefs.dart';

import '../data/models/sign_up_request_body.dart';
import '../data/repo/sign_up_repo.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _loginRepo;
  SignUpCubit(this._loginRepo) : super(const SignUpState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool isRememberMe = false;

  void register(SignUpRequestBody loginRequestBody) async {
    emit(const SignUpState.loading());
    try {
      final response = await _loginRepo.register(loginRequestBody);
      SharedPreferencesService.saveData("isLoggedIn", true);
      emit(SignUpState.success(response));
    } on FirebaseAuthException catch (e) {
      emit(SignUpState.error(error: e.message!));
    } catch (e) {
      emit(SignUpState.error(error: e.toString()));
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    nameController.dispose();
  }
}
