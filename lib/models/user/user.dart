import 'package:json_annotation/json_annotation.dart';
import 'package:sibeluapp/models/diagnostic/diagnostic.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  Diagnostic diagnostic;
  List<ItemUser> users;
  @JsonKey(ignore: true)
  String error;

  User(this.diagnostic, this.users);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User.withError(this.error);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{diagnostic: $diagnostic, users: $users}';
  }
}

@JsonSerializable()
class ItemUser {
  String username;
  int age;

  ItemUser(this.username, this.age);

  factory ItemUser.fromJson(Map<String, dynamic> json) =>
      _$ItemUserFromJson(json);

  Map<String, dynamic> toJson() => _$ItemUserToJson(this);

  @override
  String toString() {
    return 'ItemUser{username: $username, age: $age}';
  }
}
