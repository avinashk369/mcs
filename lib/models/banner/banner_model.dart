import 'package:freezed_annotation/freezed_annotation.dart';
part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

@freezed
class BannerModel with _$BannerModel {
  @JsonSerializable(
      includeIfNull: false,
      explicitToJson: true,
      fieldRename: FieldRename.snake)
  const factory BannerModel({
    String? id,
    String? bannerImg,
    String? bannerLink,
    String? cityId,
    String? createdAt,
    String? updatedAt,
  }) = _BannerModel;
  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}
