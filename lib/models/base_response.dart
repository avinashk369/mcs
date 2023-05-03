import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable(
    genericArgumentFactories: true,
    fieldRename: FieldRename.snake,
    includeIfNull: false)
class BaseResponse<T> {
  final String? message;
  final bool? status;
  final T? data;
  final int? newUser;
  BaseResponse(this.message, this.data,
      {this.status = false, this.newUser = 0});
  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}
