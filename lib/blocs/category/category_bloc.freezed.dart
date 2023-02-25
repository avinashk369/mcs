// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryEvent {
  String get cityId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cityId) loadCategory,
    required TResult Function(String cityId, String catId) loadSubcategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cityId)? loadCategory,
    TResult? Function(String cityId, String catId)? loadSubcategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cityId)? loadCategory,
    TResult Function(String cityId, String catId)? loadSubcategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCategory value) loadCategory,
    required TResult Function(LoadSubcategory value) loadSubcategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCategory value)? loadCategory,
    TResult? Function(LoadSubcategory value)? loadSubcategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCategory value)? loadCategory,
    TResult Function(LoadSubcategory value)? loadSubcategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryEventCopyWith<CategoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEventCopyWith<$Res> {
  factory $CategoryEventCopyWith(
          CategoryEvent value, $Res Function(CategoryEvent) then) =
      _$CategoryEventCopyWithImpl<$Res, CategoryEvent>;
  @useResult
  $Res call({String cityId});
}

/// @nodoc
class _$CategoryEventCopyWithImpl<$Res, $Val extends CategoryEvent>
    implements $CategoryEventCopyWith<$Res> {
  _$CategoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityId = null,
  }) {
    return _then(_value.copyWith(
      cityId: null == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadCategoryCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$$LoadCategoryCopyWith(
          _$LoadCategory value, $Res Function(_$LoadCategory) then) =
      __$$LoadCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cityId});
}

/// @nodoc
class __$$LoadCategoryCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$LoadCategory>
    implements _$$LoadCategoryCopyWith<$Res> {
  __$$LoadCategoryCopyWithImpl(
      _$LoadCategory _value, $Res Function(_$LoadCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityId = null,
  }) {
    return _then(_$LoadCategory(
      cityId: null == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadCategory with DiagnosticableTreeMixin implements LoadCategory {
  const _$LoadCategory({required this.cityId});

  @override
  final String cityId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryEvent.loadCategory(cityId: $cityId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryEvent.loadCategory'))
      ..add(DiagnosticsProperty('cityId', cityId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadCategory &&
            (identical(other.cityId, cityId) || other.cityId == cityId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cityId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadCategoryCopyWith<_$LoadCategory> get copyWith =>
      __$$LoadCategoryCopyWithImpl<_$LoadCategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cityId) loadCategory,
    required TResult Function(String cityId, String catId) loadSubcategory,
  }) {
    return loadCategory(cityId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cityId)? loadCategory,
    TResult? Function(String cityId, String catId)? loadSubcategory,
  }) {
    return loadCategory?.call(cityId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cityId)? loadCategory,
    TResult Function(String cityId, String catId)? loadSubcategory,
    required TResult orElse(),
  }) {
    if (loadCategory != null) {
      return loadCategory(cityId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCategory value) loadCategory,
    required TResult Function(LoadSubcategory value) loadSubcategory,
  }) {
    return loadCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCategory value)? loadCategory,
    TResult? Function(LoadSubcategory value)? loadSubcategory,
  }) {
    return loadCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCategory value)? loadCategory,
    TResult Function(LoadSubcategory value)? loadSubcategory,
    required TResult orElse(),
  }) {
    if (loadCategory != null) {
      return loadCategory(this);
    }
    return orElse();
  }
}

abstract class LoadCategory implements CategoryEvent {
  const factory LoadCategory({required final String cityId}) = _$LoadCategory;

  @override
  String get cityId;
  @override
  @JsonKey(ignore: true)
  _$$LoadCategoryCopyWith<_$LoadCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSubcategoryCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$$LoadSubcategoryCopyWith(
          _$LoadSubcategory value, $Res Function(_$LoadSubcategory) then) =
      __$$LoadSubcategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cityId, String catId});
}

/// @nodoc
class __$$LoadSubcategoryCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$LoadSubcategory>
    implements _$$LoadSubcategoryCopyWith<$Res> {
  __$$LoadSubcategoryCopyWithImpl(
      _$LoadSubcategory _value, $Res Function(_$LoadSubcategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityId = null,
    Object? catId = null,
  }) {
    return _then(_$LoadSubcategory(
      cityId: null == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as String,
      catId: null == catId
          ? _value.catId
          : catId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadSubcategory
    with DiagnosticableTreeMixin
    implements LoadSubcategory {
  const _$LoadSubcategory({required this.cityId, required this.catId});

  @override
  final String cityId;
  @override
  final String catId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryEvent.loadSubcategory(cityId: $cityId, catId: $catId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryEvent.loadSubcategory'))
      ..add(DiagnosticsProperty('cityId', cityId))
      ..add(DiagnosticsProperty('catId', catId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSubcategory &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            (identical(other.catId, catId) || other.catId == catId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cityId, catId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSubcategoryCopyWith<_$LoadSubcategory> get copyWith =>
      __$$LoadSubcategoryCopyWithImpl<_$LoadSubcategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cityId) loadCategory,
    required TResult Function(String cityId, String catId) loadSubcategory,
  }) {
    return loadSubcategory(cityId, catId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cityId)? loadCategory,
    TResult? Function(String cityId, String catId)? loadSubcategory,
  }) {
    return loadSubcategory?.call(cityId, catId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cityId)? loadCategory,
    TResult Function(String cityId, String catId)? loadSubcategory,
    required TResult orElse(),
  }) {
    if (loadSubcategory != null) {
      return loadSubcategory(cityId, catId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCategory value) loadCategory,
    required TResult Function(LoadSubcategory value) loadSubcategory,
  }) {
    return loadSubcategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCategory value)? loadCategory,
    TResult? Function(LoadSubcategory value)? loadSubcategory,
  }) {
    return loadSubcategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCategory value)? loadCategory,
    TResult Function(LoadSubcategory value)? loadSubcategory,
    required TResult orElse(),
  }) {
    if (loadSubcategory != null) {
      return loadSubcategory(this);
    }
    return orElse();
  }
}

abstract class LoadSubcategory implements CategoryEvent {
  const factory LoadSubcategory(
      {required final String cityId,
      required final String catId}) = _$LoadSubcategory;

  @override
  String get cityId;
  String get catId;
  @override
  @JsonKey(ignore: true)
  _$$LoadSubcategoryCopyWith<_$LoadSubcategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(String message) error,
    required TResult Function(List<SubCateModel> subcats) subCatLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CategoryModel> categories)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(List<SubCateModel> subcats)? subCatLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubCateModel> subcats)? subCatLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryInitial value) initial,
    required TResult Function(CategoryLoaded value) loaded,
    required TResult Function(CategoryError value) error,
    required TResult Function(SubcatLoaded value) subCatLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryInitial value)? initial,
    TResult? Function(CategoryLoaded value)? loaded,
    TResult? Function(CategoryError value)? error,
    TResult? Function(SubcatLoaded value)? subCatLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategoryError value)? error,
    TResult Function(SubcatLoaded value)? subCatLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res, CategoryState>;
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res, $Val extends CategoryState>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CategoryInitialCopyWith<$Res> {
  factory _$$CategoryInitialCopyWith(
          _$CategoryInitial value, $Res Function(_$CategoryInitial) then) =
      __$$CategoryInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoryInitialCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryInitial>
    implements _$$CategoryInitialCopyWith<$Res> {
  __$$CategoryInitialCopyWithImpl(
      _$CategoryInitial _value, $Res Function(_$CategoryInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CategoryInitial
    with DiagnosticableTreeMixin
    implements CategoryInitial {
  const _$CategoryInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'CategoryState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoryInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(String message) error,
    required TResult Function(List<SubCateModel> subcats) subCatLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CategoryModel> categories)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(List<SubCateModel> subcats)? subCatLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubCateModel> subcats)? subCatLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryInitial value) initial,
    required TResult Function(CategoryLoaded value) loaded,
    required TResult Function(CategoryError value) error,
    required TResult Function(SubcatLoaded value) subCatLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryInitial value)? initial,
    TResult? Function(CategoryLoaded value)? loaded,
    TResult? Function(CategoryError value)? error,
    TResult? Function(SubcatLoaded value)? subCatLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategoryError value)? error,
    TResult Function(SubcatLoaded value)? subCatLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CategoryInitial implements CategoryState {
  const factory CategoryInitial() = _$CategoryInitial;
}

/// @nodoc
abstract class _$$CategoryLoadedCopyWith<$Res> {
  factory _$$CategoryLoadedCopyWith(
          _$CategoryLoaded value, $Res Function(_$CategoryLoaded) then) =
      __$$CategoryLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class __$$CategoryLoadedCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryLoaded>
    implements _$$CategoryLoadedCopyWith<$Res> {
  __$$CategoryLoadedCopyWithImpl(
      _$CategoryLoaded _value, $Res Function(_$CategoryLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$CategoryLoaded(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _$CategoryLoaded with DiagnosticableTreeMixin implements CategoryLoaded {
  const _$CategoryLoaded({required final List<CategoryModel> categories})
      : _categories = categories;

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryState.loaded(categories: $categories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryState.loaded'))
      ..add(DiagnosticsProperty('categories', categories));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryLoaded &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryLoadedCopyWith<_$CategoryLoaded> get copyWith =>
      __$$CategoryLoadedCopyWithImpl<_$CategoryLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(String message) error,
    required TResult Function(List<SubCateModel> subcats) subCatLoaded,
  }) {
    return loaded(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CategoryModel> categories)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(List<SubCateModel> subcats)? subCatLoaded,
  }) {
    return loaded?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubCateModel> subcats)? subCatLoaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryInitial value) initial,
    required TResult Function(CategoryLoaded value) loaded,
    required TResult Function(CategoryError value) error,
    required TResult Function(SubcatLoaded value) subCatLoaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryInitial value)? initial,
    TResult? Function(CategoryLoaded value)? loaded,
    TResult? Function(CategoryError value)? error,
    TResult? Function(SubcatLoaded value)? subCatLoaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategoryError value)? error,
    TResult Function(SubcatLoaded value)? subCatLoaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CategoryLoaded implements CategoryState {
  const factory CategoryLoaded(
      {required final List<CategoryModel> categories}) = _$CategoryLoaded;

  List<CategoryModel> get categories;
  @JsonKey(ignore: true)
  _$$CategoryLoadedCopyWith<_$CategoryLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryErrorCopyWith<$Res> {
  factory _$$CategoryErrorCopyWith(
          _$CategoryError value, $Res Function(_$CategoryError) then) =
      __$$CategoryErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CategoryErrorCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryError>
    implements _$$CategoryErrorCopyWith<$Res> {
  __$$CategoryErrorCopyWithImpl(
      _$CategoryError _value, $Res Function(_$CategoryError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CategoryError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoryError with DiagnosticableTreeMixin implements CategoryError {
  const _$CategoryError({required this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryErrorCopyWith<_$CategoryError> get copyWith =>
      __$$CategoryErrorCopyWithImpl<_$CategoryError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(String message) error,
    required TResult Function(List<SubCateModel> subcats) subCatLoaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CategoryModel> categories)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(List<SubCateModel> subcats)? subCatLoaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubCateModel> subcats)? subCatLoaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryInitial value) initial,
    required TResult Function(CategoryLoaded value) loaded,
    required TResult Function(CategoryError value) error,
    required TResult Function(SubcatLoaded value) subCatLoaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryInitial value)? initial,
    TResult? Function(CategoryLoaded value)? loaded,
    TResult? Function(CategoryError value)? error,
    TResult? Function(SubcatLoaded value)? subCatLoaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategoryError value)? error,
    TResult Function(SubcatLoaded value)? subCatLoaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CategoryError implements CategoryState {
  const factory CategoryError({required final String message}) =
      _$CategoryError;

  String get message;
  @JsonKey(ignore: true)
  _$$CategoryErrorCopyWith<_$CategoryError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubcatLoadedCopyWith<$Res> {
  factory _$$SubcatLoadedCopyWith(
          _$SubcatLoaded value, $Res Function(_$SubcatLoaded) then) =
      __$$SubcatLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SubCateModel> subcats});
}

/// @nodoc
class __$$SubcatLoadedCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$SubcatLoaded>
    implements _$$SubcatLoadedCopyWith<$Res> {
  __$$SubcatLoadedCopyWithImpl(
      _$SubcatLoaded _value, $Res Function(_$SubcatLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subcats = null,
  }) {
    return _then(_$SubcatLoaded(
      subcats: null == subcats
          ? _value._subcats
          : subcats // ignore: cast_nullable_to_non_nullable
              as List<SubCateModel>,
    ));
  }
}

/// @nodoc

class _$SubcatLoaded with DiagnosticableTreeMixin implements SubcatLoaded {
  const _$SubcatLoaded({required final List<SubCateModel> subcats})
      : _subcats = subcats;

  final List<SubCateModel> _subcats;
  @override
  List<SubCateModel> get subcats {
    if (_subcats is EqualUnmodifiableListView) return _subcats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subcats);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryState.subCatLoaded(subcats: $subcats)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryState.subCatLoaded'))
      ..add(DiagnosticsProperty('subcats', subcats));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubcatLoaded &&
            const DeepCollectionEquality().equals(other._subcats, _subcats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_subcats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubcatLoadedCopyWith<_$SubcatLoaded> get copyWith =>
      __$$SubcatLoadedCopyWithImpl<_$SubcatLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(String message) error,
    required TResult Function(List<SubCateModel> subcats) subCatLoaded,
  }) {
    return subCatLoaded(subcats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CategoryModel> categories)? loaded,
    TResult? Function(String message)? error,
    TResult? Function(List<SubCateModel> subcats)? subCatLoaded,
  }) {
    return subCatLoaded?.call(subcats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubCateModel> subcats)? subCatLoaded,
    required TResult orElse(),
  }) {
    if (subCatLoaded != null) {
      return subCatLoaded(subcats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryInitial value) initial,
    required TResult Function(CategoryLoaded value) loaded,
    required TResult Function(CategoryError value) error,
    required TResult Function(SubcatLoaded value) subCatLoaded,
  }) {
    return subCatLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryInitial value)? initial,
    TResult? Function(CategoryLoaded value)? loaded,
    TResult? Function(CategoryError value)? error,
    TResult? Function(SubcatLoaded value)? subCatLoaded,
  }) {
    return subCatLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategoryError value)? error,
    TResult Function(SubcatLoaded value)? subCatLoaded,
    required TResult orElse(),
  }) {
    if (subCatLoaded != null) {
      return subCatLoaded(this);
    }
    return orElse();
  }
}

abstract class SubcatLoaded implements CategoryState {
  const factory SubcatLoaded({required final List<SubCateModel> subcats}) =
      _$SubcatLoaded;

  List<SubCateModel> get subcats;
  @JsonKey(ignore: true)
  _$$SubcatLoadedCopyWith<_$SubcatLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
