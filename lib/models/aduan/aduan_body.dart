import 'package:json_annotation/json_annotation.dart';

part 'aduan_body.g.dart';

@JsonSerializable()
class AduanBody {
  String email;
  String phoneNumber;
  String eventDate;
  String jenisAduan;
  String kronologi;
  String statusTL;
  String result;
  String userId;
  String fullName;
  @JsonKey(ignore: true)
  String error;

  AduanBody(
      {this.email,
      this.phoneNumber,
      this.eventDate,
      this.jenisAduan,
      this.kronologi,
      this.result,
      this.error});

  factory AduanBody.fromJson(Map<String, dynamic> json) =>
      _$AduanBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AduanBodyToJson(this);

  AduanBody.withError(this.error);

  @override
  String toString() {
    return 'AduanBody{email: $email, phone number : $phoneNumber, event date : $eventDate, jenis aduan : $jenisAduan, chronology : $kronologi}';
  }
}
