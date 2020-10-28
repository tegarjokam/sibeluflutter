import 'package:json_annotation/json_annotation.dart';

part 'aduan_body.g.dart';

@JsonSerializable()
class AduanBody {
  String email;
  String phoneNumber;
  String kronologi;
  String userId;
  @JsonKey(ignore: true)
  String error;

  AduanBody(
      {this.email, this.phoneNumber, this.kronologi, this.userId, this.error});

  factory AduanBody.fromJson(Map<String, dynamic> json) =>
      _$AduanBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AduanBodyToJson(this);

  AduanBody.withError(this.error);

  @override
  String toString() {
    return 'AduanBody{email: $email, phone number : $phoneNumber, kronologi : $kronologi, user id : $userId}';
  }
}
