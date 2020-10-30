// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_aduan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListAduan _$ListAduanFromJson(Map<String, dynamic> json) {
  return ListAduan(
    result: (json['result'] as List)
        ?.map((e) =>
            e == null ? null : AduanBody.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListAduanToJson(ListAduan instance) => <String, dynamic>{
      'result': instance.result,
    };
