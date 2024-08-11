import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/shared_prefs.dart';
import '../data/models/login_request_body.dart';
import '../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(const LoginState.loading());
      try {
        final response = await _loginRepo.login(
          LoginRequestBody(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
        SharedPreferencesService.saveData("isLoggedIn", true);

        emit(LoginState.success(response));
      } on FirebaseAuthException catch (e) {
        emit(LoginState.error(error: e.message!));
      } catch (e) {
        emit(LoginState.error(error: e.toString()));
      }
    }
  }

  void validEmail(bool isValid) {
    emit(LoginState.validEmail(isValid));
  }

  void toggleShowPassword(bool showPassword) {
    emit(LoginState.toggleShowPassword(showPassword));
  }

  bool handleShowPassword(LoginState state) {
    return state.maybeWhen(
      toggleShowPassword: (showPassword) => !showPassword,
      orElse: () => true,
    );
  }
}
