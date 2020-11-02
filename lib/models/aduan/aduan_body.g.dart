// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aduan_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AduanBody _$AduanBodyFromJson(Map<String, dynamic> json) {
  return AduanBody(
    id: json['id'] as String,
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as String,
    eventDate: json['eventDate'] as String,
    createdTime: json['createdTime'] as String,
    jenisAduan: json['jenisAduan'] as String,
    kronologi: json['kronologi'] as String,
    result: json['result'] as String,
  )
    ..statusTL = json['statusTL'] as String
    ..userId = json['userId'] as String
    ..fullName = json['fullName'] as String;
}

Map<String, dynamic> _$AduanBodyToJson(AduanBody instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'eventDate': instance.eventDate,
      'createdTime': instance.createdTime,
      'jenisAduan': instance.jenisAduan,
      'kronologi': instance.kronologi,
      'statusTL': instance.statusTL,
      'result': instance.result,
      'userId': instance.userId,
      'fullName': instance.fullName,
    };
