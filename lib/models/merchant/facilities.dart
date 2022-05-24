import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'facilities.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Facilities {
  String? id;
  String? name;
  String? facilityIcon;

  Facilities();
  factory Facilities.fromJson(Map<String, dynamic> json) =>
      _$FacilitiesFromJson(json);
  Map<String, dynamic> toJson() => _$FacilitiesToJson(this);
}
