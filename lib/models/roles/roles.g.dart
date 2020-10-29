// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RolesBody _$RolesBodyFromJson(Map<String, dynamic> json) {
  return RolesBody(
    roles: (json['roles'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RolesBodyToJson(RolesBody instance) => <String, dynamic>{
      'roles': instance.roles,
    };
