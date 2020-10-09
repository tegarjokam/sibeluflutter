import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  String fullName;
  String username;
  String role;
  String phoneNumber;
  String address;
  String imageUrl;
  String title;
  @JsonKey(ignore: true)
  String error;

  User(
      {this.fullName,
      this.username,
      this.role,
      this.phoneNumber,
      this.address,
      this.imageUrl,
      this.title});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User.withError(this.error);

  @override
  String toString() {
    return 'User{users: $fullName}';
  }
}
