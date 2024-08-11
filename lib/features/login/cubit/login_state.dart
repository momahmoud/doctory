import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.toggleShowPassword(bool showPassword) =
      _ToggleShowPassword;
  const factory LoginState.validEmail(bool isValid) = ValidEmail;
  const factory LoginState.success(T data) = Success<T>;
  const factory LoginState.error({required String error}) = Error;
  const factory LoginState.loading() = Loading;
}
