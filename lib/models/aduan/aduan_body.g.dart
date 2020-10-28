// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aduan_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AduanBody _$AduanBodyFromJson(Map<String, dynamic> json) {
  return AduanBody(
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as String,
    eventDate: json['eventDate'] as String,
    jenisAduan: json['jenisAduan'] as String,
    kronologi: json['kronologi'] as String,
  );
}

Map<String, dynamic> _$AduanBodyToJson(AduanBody instance) => <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'eventDate': instance.eventDate,
      'jenisAduan': instance.jenisAduan,
      'kronologi': instance.kronologi,
    };
