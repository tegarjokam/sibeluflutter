import 'package:json_annotation/json_annotation.dart';

part 'diagnostic.g.dart';

@JsonSerializable()
class Diagnostic {
  int status;
  String message;
  @JsonKey(name: 'unix_timestamp')
  String path;
  @JsonKey(ignore: true)
  String error;

  Diagnostic(this.status, this.message, this.path);

  factory Diagnostic.fromJson(Map<String, dynamic> json) =>
      _$DiagnosticFromJson(json);

  Diagnostic.withError(this.error);

  Map<String, dynamic> toJson() => _$DiagnosticToJson(this);

  @override
  String toString() {
    return 'Diagnostic{status: $status, path: $path, message: $message, error : $error';
  }
}
