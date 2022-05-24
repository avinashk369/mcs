import 'package:json_annotation/json_annotation.dart';
part 'review.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Reviews {
  String? id;
  String? name;
  String? review;
  int? rating;
  Reviews();
  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}
