// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subcat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubcatModel _$SubcatModelFromJson(Map<String, dynamic> json) {
  return _SubcatModel.fromJson(json);
}

/// @nodoc
mixin _$SubcatModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get catId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubcatModelCopyWith<SubcatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubcatModelCopyWith<$Res> {
  factory $SubcatModelCopyWith(
          SubcatModel value, $Res Function(SubcatModel) then) =
      _$SubcatModelCopyWithImpl<$Res>;
  $Res call({String? id, String? name, String? catId});
}

/// @nodoc
class _$SubcatModelCopyWithImpl<$Res> implements $SubcatModelCopyWith<$Res> {
  _$SubcatModelCopyWithImpl(this._value, this._then);

  final SubcatModel _value;
  // ignore: unused_field
  final $Res Function(SubcatModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? catId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      catId: catId == freezed
          ? _value.catId
          : catId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SubcatModelCopyWith<$Res>
    implements $SubcatModelCopyWith<$Res> {
  factory _$$_SubcatModelCopyWith(
          _$_SubcatModel value, $Res Function(_$_SubcatModel) then) =
      __$$_SubcatModelCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? name, String? catId});
}

/// @nodoc
class __$$_SubcatModelCopyWithImpl<$Res> extends _$SubcatModelCopyWithImpl<$Res>
    implements _$$_SubcatModelCopyWith<$Res> {
  __$$_SubcatModelCopyWithImpl(
      _$_SubcatModel _value, $Res Function(_$_SubcatModel) _then)
      : super(_value, (v) => _then(v as _$_SubcatModel));

  @override
  _$_SubcatModel get _value => super._value as _$_SubcatModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? catId = freezed,
  }) {
    return _then(_$_SubcatModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      catId: catId == freezed
          ? _value.catId
          : catId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    includeIfNull: false, explicitToJson: true, fieldRename: FieldRename.snake)
class _$_SubcatModel implements _SubcatModel {
  const _$_SubcatModel({this.id, this.name, this.catId});

  factory _$_SubcatModel.fromJson(Map<String, dynamic> json) =>
      _$$_SubcatModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? catId;

  @override
  String toString() {
    return 'SubcatModel(id: $id, name: $name, catId: $catId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubcatModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.catId, catId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(catId));

  @JsonKey(ignore: true)
  @override
  _$$_SubcatModelCopyWith<_$_SubcatModel> get copyWith =>
      __$$_SubcatModelCopyWithImpl<_$_SubcatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubcatModelToJson(this);
  }
}

abstract class _SubcatModel implements SubcatModel {
  const factory _SubcatModel(
      {final String? id,
      final String? name,
      final String? catId}) = _$_SubcatModel;

  factory _SubcatModel.fromJson(Map<String, dynamic> json) =
      _$_SubcatModel.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get catId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SubcatModelCopyWith<_$_SubcatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
