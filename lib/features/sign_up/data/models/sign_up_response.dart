import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final String? message;
  final int? code;
  final bool? status;
  @JsonKey(name: 'data')
  final UserData? userData;

  SignUpResponse({this.message, this.code, this.status, this.userData});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final String? token;
  final String? username;

  UserData(this.token, this.username);
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
