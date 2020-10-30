import 'package:json_annotation/json_annotation.dart';
import 'package:sibeluapp/models/aduan/aduan_body.dart';

part 'list_aduan.g.dart';

@JsonSerializable()
class ListAduan {
  List<AduanBody> result;
  @JsonKey(ignore: true)
  String error;

  ListAduan({this.result});

  factory ListAduan.fromJson(Map<String, dynamic> json) =>
      _$ListAduanFromJson(json);

  Map<String, dynamic> toJson() => _$ListAduanToJson(this);

  ListAduan.withError(this.error);

  @override
  String toString() {
    return 'ListAduan{result: $result}';
  }
}
