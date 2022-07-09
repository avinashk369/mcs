// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCategory,
    required TResult Function(String catId) loadSubcategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCategory,
    TResult Function(String catId)? loadSubcategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCategory,
    TResult Function(String catId)? loadSubcategory,
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
    TResult Function(LoadCategory value)? loadCategory,
    TResult Function(LoadSubcategory value)? loadSubcategory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCategory value)? loadCategory,
    TResult Function(LoadSubcategory value)? loadSubcategory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEventCopyWith<$Res> {
  factory $CategoryEventCopyWith(
          CategoryEvent value, $Res Function(CategoryEvent) then) =
      _$CategoryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryEventCopyWithImpl<$Res>
    implements $CategoryEventCopyWith<$Res> {
  _$CategoryEventCopyWithImpl(this._value, this._then);

  final CategoryEvent _value;
  // ignore: unused_field
  final $Res Function(CategoryEvent) _then;
}

/// @nodoc
abstract class _$$LoadCategoryCopyWith<$Res> {
  factory _$$LoadCategoryCopyWith(
          _$LoadCategory value, $Res Function(_$LoadCategory) then) =
      __$$LoadCategoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCategoryCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res>
    implements _$$LoadCategoryCopyWith<$Res> {
  __$$LoadCategoryCopyWithImpl(
      _$LoadCategory _value, $Res Function(_$LoadCategory) _then)
      : super(_value, (v) => _then(v as _$LoadCategory));

  @override
  _$LoadCategory get _value => super._value as _$LoadCategory;
}

/// @nodoc

class _$LoadCategory with DiagnosticableTreeMixin implements LoadCategory {
  const _$LoadCategory();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryEvent.loadCategory()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'CategoryEvent.loadCategory'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadCategory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCategory,
    required TResult Function(String catId) loadSubcategory,
  }) {
    return loadCategory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCategory,
    TResult Function(String catId)? loadSubcategory,
  }) {
    return loadCategory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCategory,
    TResult Function(String catId)? loadSubcategory,
    required TResult orElse(),
  }) {
    if (loadCategory != null) {
      return loadCategory();
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
    TResult Function(LoadCategory value)? loadCategory,
    TResult Function(LoadSubcategory value)? loadSubcategory,
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
  const factory LoadCategory() = _$LoadCategory;
}

/// @nodoc
abstract class _$$LoadSubcategoryCopyWith<$Res> {
  factory _$$LoadSubcategoryCopyWith(
          _$LoadSubcategory value, $Res Function(_$LoadSubcategory) then) =
      __$$LoadSubcategoryCopyWithImpl<$Res>;
  $Res call({String catId});
}

/// @nodoc
class __$$LoadSubcategoryCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res>
    implements _$$LoadSubcategoryCopyWith<$Res> {
  __$$LoadSubcategoryCopyWithImpl(
      _$LoadSubcategory _value, $Res Function(_$LoadSubcategory) _then)
      : super(_value, (v) => _then(v as _$LoadSubcategory));

  @override
  _$LoadSubcategory get _value => super._value as _$LoadSubcategory;

  @override
  $Res call({
    Object? catId = freezed,
  }) {
    return _then(_$LoadSubcategory(
      catId: catId == freezed
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
  const _$LoadSubcategory({required this.catId});

  @override
  final String catId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryEvent.loadSubcategory(catId: $catId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryEvent.loadSubcategory'))
      ..add(DiagnosticsProperty('catId', catId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSubcategory &&
            const DeepCollectionEquality().equals(other.catId, catId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(catId));

  @JsonKey(ignore: true)
  @override
  _$$LoadSubcategoryCopyWith<_$LoadSubcategory> get copyWith =>
      __$$LoadSubcategoryCopyWithImpl<_$LoadSubcategory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadCategory,
    required TResult Function(String catId) loadSubcategory,
  }) {
    return loadSubcategory(catId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadCategory,
    TResult Function(String catId)? loadSubcategory,
  }) {
    return loadSubcategory?.call(catId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadCategory,
    TResult Function(String catId)? loadSubcategory,
    required TResult orElse(),
  }) {
    if (loadSubcategory != null) {
      return loadSubcategory(catId);
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
    TResult Function(LoadCategory value)? loadCategory,
    TResult Function(LoadSubcategory value)? loadSubcategory,
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
  const factory LoadSubcategory({required final String catId}) =
      _$LoadSubcategory;

  String get catId => throw _privateConstructorUsedError;
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
    required TResult Function(List<SubcatModel> subcats) subCatLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubcatModel> subcats)? subCatLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubcatModel> subcats)? subCatLoaded,
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
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategoryError value)? error,
    TResult Function(SubcatLoaded value)? subCatLoaded,
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
      _$CategoryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  final CategoryState _value;
  // ignore: unused_field
  final $Res Function(CategoryState) _then;
}

/// @nodoc
abstract class _$$CategoryInitialCopyWith<$Res> {
  factory _$$CategoryInitialCopyWith(
          _$CategoryInitial value, $Res Function(_$CategoryInitial) then) =
      __$$CategoryInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoryInitialCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res>
    implements _$$CategoryInitialCopyWith<$Res> {
  __$$CategoryInitialCopyWithImpl(
      _$CategoryInitial _value, $Res Function(_$CategoryInitial) _then)
      : super(_value, (v) => _then(v as _$CategoryInitial));

  @override
  _$CategoryInitial get _value => super._value as _$CategoryInitial;
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
    required TResult Function(List<SubcatModel> subcats) subCatLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubcatModel> subcats)? subCatLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubcatModel> subcats)? subCatLoaded,
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
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategoryError value)? error,
    TResult Function(SubcatLoaded value)? subCatLoaded,
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
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class __$$CategoryLoadedCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res>
    implements _$$CategoryLoadedCopyWith<$Res> {
  __$$CategoryLoadedCopyWithImpl(
      _$CategoryLoaded _value, $Res Function(_$CategoryLoaded) _then)
      : super(_value, (v) => _then(v as _$CategoryLoaded));

  @override
  _$CategoryLoaded get _value => super._value as _$CategoryLoaded;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_$CategoryLoaded(
      categories: categories == freezed
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
  _$$CategoryLoadedCopyWith<_$CategoryLoaded> get copyWith =>
      __$$CategoryLoadedCopyWithImpl<_$CategoryLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(String message) error,
    required TResult Function(List<SubcatModel> subcats) subCatLoaded,
  }) {
    return loaded(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubcatModel> subcats)? subCatLoaded,
  }) {
    return loaded?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubcatModel> subcats)? subCatLoaded,
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
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategoryError value)? error,
    TResult Function(SubcatLoaded value)? subCatLoaded,
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

  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$CategoryLoadedCopyWith<_$CategoryLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryErrorCopyWith<$Res> {
  factory _$$CategoryErrorCopyWith(
          _$CategoryError value, $Res Function(_$CategoryError) then) =
      __$$CategoryErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$CategoryErrorCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res>
    implements _$$CategoryErrorCopyWith<$Res> {
  __$$CategoryErrorCopyWithImpl(
      _$CategoryError _value, $Res Function(_$CategoryError) _then)
      : super(_value, (v) => _then(v as _$CategoryError));

  @override
  _$CategoryError get _value => super._value as _$CategoryError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$CategoryError(
      message: message == freezed
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
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$CategoryErrorCopyWith<_$CategoryError> get copyWith =>
      __$$CategoryErrorCopyWithImpl<_$CategoryError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(String message) error,
    required TResult Function(List<SubcatModel> subcats) subCatLoaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubcatModel> subcats)? subCatLoaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubcatModel> subcats)? subCatLoaded,
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
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategoryError value)? error,
    TResult Function(SubcatLoaded value)? subCatLoaded,
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

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$CategoryErrorCopyWith<_$CategoryError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubcatLoadedCopyWith<$Res> {
  factory _$$SubcatLoadedCopyWith(
          _$SubcatLoaded value, $Res Function(_$SubcatLoaded) then) =
      __$$SubcatLoadedCopyWithImpl<$Res>;
  $Res call({List<SubcatModel> subcats});
}

/// @nodoc
class __$$SubcatLoadedCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res>
    implements _$$SubcatLoadedCopyWith<$Res> {
  __$$SubcatLoadedCopyWithImpl(
      _$SubcatLoaded _value, $Res Function(_$SubcatLoaded) _then)
      : super(_value, (v) => _then(v as _$SubcatLoaded));

  @override
  _$SubcatLoaded get _value => super._value as _$SubcatLoaded;

  @override
  $Res call({
    Object? subcats = freezed,
  }) {
    return _then(_$SubcatLoaded(
      subcats: subcats == freezed
          ? _value._subcats
          : subcats // ignore: cast_nullable_to_non_nullable
              as List<SubcatModel>,
    ));
  }
}

/// @nodoc

class _$SubcatLoaded with DiagnosticableTreeMixin implements SubcatLoaded {
  const _$SubcatLoaded({required final List<SubcatModel> subcats})
      : _subcats = subcats;

  final List<SubcatModel> _subcats;
  @override
  List<SubcatModel> get subcats {
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
  _$$SubcatLoadedCopyWith<_$SubcatLoaded> get copyWith =>
      __$$SubcatLoadedCopyWithImpl<_$SubcatLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(String message) error,
    required TResult Function(List<SubcatModel> subcats) subCatLoaded,
  }) {
    return subCatLoaded(subcats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubcatModel> subcats)? subCatLoaded,
  }) {
    return subCatLoaded?.call(subcats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(String message)? error,
    TResult Function(List<SubcatModel> subcats)? subCatLoaded,
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
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategoryError value)? error,
    TResult Function(SubcatLoaded value)? subCatLoaded,
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
  const factory SubcatLoaded({required final List<SubcatModel> subcats}) =
      _$SubcatLoaded;

  List<SubcatModel> get subcats => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SubcatLoadedCopyWith<_$SubcatLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
