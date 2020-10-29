import 'package:json_annotation/json_annotation.dart';

part 'roles.g.dart';

@JsonSerializable()
class RolesBody {
  List<String> roles;
  @JsonKey(ignore: true)
  String error;

  RolesBody({this.roles});

  factory RolesBody.fromJson(Map<String, dynamic> json) =>
      _$RolesBodyFromJson(json);

  Map<String, dynamic> toJson() => _$RolesBodyToJson(this);

  RolesBody.withError(this.error);

  @override
  String toString() {
    return 'RolesBody{roles: $roles}';
  }
}
