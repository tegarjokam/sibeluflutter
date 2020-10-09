// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    fullName: json['fullName'] as String,
    username: json['username'] as String,
    role: json['role'] as String,
    phoneNumber: json['phoneNumber'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'username': instance.username,
      'role': instance.role,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
    };
