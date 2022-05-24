import 'package:json_annotation/json_annotation.dart';
part 'test.g.dart';

@JsonSerializable()
class TestMaster {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;

  TestMaster();
  factory TestMaster.fromJson(Map<String, dynamic> json) =>
      _$TestMasterFromJson(json);
  Map<String, dynamic> toJson() => _$TestMasterToJson(this);
}
