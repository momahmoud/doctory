import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String email;
  final String password;
  final String phone;
  final String name;

  SignUpRequestBody({
    required this.email,
    required this.password,
    required this.phone,
    required this.name,
  });

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);

  @override
  bool operator ==(covariant SignUpRequestBody other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.name == name;
  }

  @override
  int get hashCode =>
      email.hashCode ^ password.hashCode ^ phone.hashCode ^ name.hashCode;
}
