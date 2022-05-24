import 'package:json_annotation/json_annotation.dart';
part 'review_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ReviewModel {
  String? id;
  String? review;
  ReviewModel();
  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
