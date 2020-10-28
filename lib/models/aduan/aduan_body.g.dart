// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aduan_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AduanBody _$AduanBodyFromJson(Map<String, dynamic> json) {
  return AduanBody(
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as String,
    kronologi: json['kronologi'] as String,
    userId: json['userId'] as String,
  );
}

Map<String, dynamic> _$AduanBodyToJson(AduanBody instance) => <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'kronologi': instance.kronologi,
      'userId': instance.userId,
    };
