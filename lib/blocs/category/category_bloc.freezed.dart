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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cityId) loadCategory,
    required TResult Function(int current, int last) swapIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cityId)? loadCategory,
    TResult? Function(int current, int last)? swapIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cityId)? loadCategory,
    TResult Function(int current, int last)? swapIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCategory value) loadCategory,
    required TResult Function(SwapIndex value) swapIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCategory value)? loadCategory,
    TResult? Function(SwapIndex value)? swapIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCategory value)? loadCategory,
    TResult Function(SwapIndex value)? swapIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEventCopyWith<$Res> {
  factory $CategoryEventCopyWith(
          CategoryEvent value, $Res Function(CategoryEvent) then) =
      _$CategoryEventCopyWithImpl<$Res, CategoryEvent>;
}

/// @nodoc
class _$CategoryEventCopyWithImpl<$Res, $Val extends CategoryEvent>
    implements $CategoryEventCopyWith<$Res> {
  _$CategoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadCategoryCopyWith<$Res> {
  factory _$$LoadCategoryCopyWith(
          _$LoadCategory value, $Res Function(_$LoadCategory) then) =
      __$$LoadCategoryCopyWithImpl<$Res>;
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
    required TResult Function(int current, int last) swapIndex,
  }) {
    return loadCategory(cityId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cityId)? loadCategory,
    TResult? Function(int current, int last)? swapIndex,
  }) {
    return loadCategory?.call(cityId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cityId)? loadCategory,
    TResult Function(int current, int last)? swapIndex,
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
    required TResult Function(SwapIndex value) swapIndex,
  }) {
    return loadCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCategory value)? loadCategory,
    TResult? Function(SwapIndex value)? swapIndex,
  }) {
    return loadCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCategory value)? loadCategory,
    TResult Function(SwapIndex value)? swapIndex,
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

  String get cityId;
  @JsonKey(ignore: true)
  _$$LoadCategoryCopyWith<_$LoadCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SwapIndexCopyWith<$Res> {
  factory _$$SwapIndexCopyWith(
          _$SwapIndex value, $Res Function(_$SwapIndex) then) =
      __$$SwapIndexCopyWithImpl<$Res>;
  @useResult
  $Res call({int current, int last});
}

/// @nodoc
class __$$SwapIndexCopyWithImpl<$Res>
    extends _$CategoryEventCopyWithImpl<$Res, _$SwapIndex>
    implements _$$SwapIndexCopyWith<$Res> {
  __$$SwapIndexCopyWithImpl(
      _$SwapIndex _value, $Res Function(_$SwapIndex) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? last = null,
  }) {
    return _then(_$SwapIndex(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      last: null == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SwapIndex with DiagnosticableTreeMixin implements SwapIndex {
  const _$SwapIndex({required this.current, required this.last});

  @override
  final int current;
  @override
  final int last;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryEvent.swapIndex(current: $current, last: $last)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryEvent.swapIndex'))
      ..add(DiagnosticsProperty('current', current))
      ..add(DiagnosticsProperty('last', last));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwapIndex &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.last, last) || other.last == last));
  }

  @override
  int get hashCode => Object.hash(runtimeType, current, last);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwapIndexCopyWith<_$SwapIndex> get copyWith =>
      __$$SwapIndexCopyWithImpl<_$SwapIndex>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cityId) loadCategory,
    required TResult Function(int current, int last) swapIndex,
  }) {
    return swapIndex(current, last);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cityId)? loadCategory,
    TResult? Function(int current, int last)? swapIndex,
  }) {
    return swapIndex?.call(current, last);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cityId)? loadCategory,
    TResult Function(int current, int last)? swapIndex,
    required TResult orElse(),
  }) {
    if (swapIndex != null) {
      return swapIndex(current, last);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCategory value) loadCategory,
    required TResult Function(SwapIndex value) swapIndex,
  }) {
    return swapIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCategory value)? loadCategory,
    TResult? Function(SwapIndex value)? swapIndex,
  }) {
    return swapIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCategory value)? loadCategory,
    TResult Function(SwapIndex value)? swapIndex,
    required TResult orElse(),
  }) {
    if (swapIndex != null) {
      return swapIndex(this);
    }
    return orElse();
  }
}

abstract class SwapIndex implements CategoryEvent {
  const factory SwapIndex(
      {required final int current, required final int last}) = _$SwapIndex;

  int get current;
  int get last;
  @JsonKey(ignore: true)
  _$$SwapIndexCopyWith<_$SwapIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(List<CategoryModel> categories) swaped,
    required TResult Function(String message) error,
    required TResult Function(List<CategoryModel> categories) swappedItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CategoryModel> categories)? loaded,
    TResult? Function(List<CategoryModel> categories)? swaped,
    TResult? Function(String message)? error,
    TResult? Function(List<CategoryModel> categories)? swappedItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(List<CategoryModel> categories)? swaped,
    TResult Function(String message)? error,
    TResult Function(List<CategoryModel> categories)? swappedItems,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryInitial value) initial,
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryLoaded value) loaded,
    required TResult Function(CategorySwaped value) swaped,
    required TResult Function(CategoryError value) error,
    required TResult Function(SwappedItems value) swappedItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryInitial value)? initial,
    TResult? Function(CategoryLoading value)? loading,
    TResult? Function(CategoryLoaded value)? loaded,
    TResult? Function(CategorySwaped value)? swaped,
    TResult? Function(CategoryError value)? error,
    TResult? Function(SwappedItems value)? swappedItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategorySwaped value)? swaped,
    TResult Function(CategoryError value)? error,
    TResult Function(SwappedItems value)? swappedItems,
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
    required TResult Function() loading,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(List<CategoryModel> categories) swaped,
    required TResult Function(String message) error,
    required TResult Function(List<CategoryModel> categories) swappedItems,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CategoryModel> categories)? loaded,
    TResult? Function(List<CategoryModel> categories)? swaped,
    TResult? Function(String message)? error,
    TResult? Function(List<CategoryModel> categories)? swappedItems,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(List<CategoryModel> categories)? swaped,
    TResult Function(String message)? error,
    TResult Function(List<CategoryModel> categories)? swappedItems,
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
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryLoaded value) loaded,
    required TResult Function(CategorySwaped value) swaped,
    required TResult Function(CategoryError value) error,
    required TResult Function(SwappedItems value) swappedItems,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryInitial value)? initial,
    TResult? Function(CategoryLoading value)? loading,
    TResult? Function(CategoryLoaded value)? loaded,
    TResult? Function(CategorySwaped value)? swaped,
    TResult? Function(CategoryError value)? error,
    TResult? Function(SwappedItems value)? swappedItems,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategorySwaped value)? swaped,
    TResult Function(CategoryError value)? error,
    TResult Function(SwappedItems value)? swappedItems,
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
abstract class _$$CategoryLoadingCopyWith<$Res> {
  factory _$$CategoryLoadingCopyWith(
          _$CategoryLoading value, $Res Function(_$CategoryLoading) then) =
      __$$CategoryLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoryLoadingCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategoryLoading>
    implements _$$CategoryLoadingCopyWith<$Res> {
  __$$CategoryLoadingCopyWithImpl(
      _$CategoryLoading _value, $Res Function(_$CategoryLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CategoryLoading
    with DiagnosticableTreeMixin
    implements CategoryLoading {
  const _$CategoryLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'CategoryState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoryLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(List<CategoryModel> categories) swaped,
    required TResult Function(String message) error,
    required TResult Function(List<CategoryModel> categories) swappedItems,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CategoryModel> categories)? loaded,
    TResult? Function(List<CategoryModel> categories)? swaped,
    TResult? Function(String message)? error,
    TResult? Function(List<CategoryModel> categories)? swappedItems,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(List<CategoryModel> categories)? swaped,
    TResult Function(String message)? error,
    TResult Function(List<CategoryModel> categories)? swappedItems,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryInitial value) initial,
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryLoaded value) loaded,
    required TResult Function(CategorySwaped value) swaped,
    required TResult Function(CategoryError value) error,
    required TResult Function(SwappedItems value) swappedItems,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryInitial value)? initial,
    TResult? Function(CategoryLoading value)? loading,
    TResult? Function(CategoryLoaded value)? loaded,
    TResult? Function(CategorySwaped value)? swaped,
    TResult? Function(CategoryError value)? error,
    TResult? Function(SwappedItems value)? swappedItems,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategorySwaped value)? swaped,
    TResult Function(CategoryError value)? error,
    TResult Function(SwappedItems value)? swappedItems,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CategoryLoading implements CategoryState {
  const factory CategoryLoading() = _$CategoryLoading;
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
    required TResult Function() loading,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(List<CategoryModel> categories) swaped,
    required TResult Function(String message) error,
    required TResult Function(List<CategoryModel> categories) swappedItems,
  }) {
    return loaded(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CategoryModel> categories)? loaded,
    TResult? Function(List<CategoryModel> categories)? swaped,
    TResult? Function(String message)? error,
    TResult? Function(List<CategoryModel> categories)? swappedItems,
  }) {
    return loaded?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(List<CategoryModel> categories)? swaped,
    TResult Function(String message)? error,
    TResult Function(List<CategoryModel> categories)? swappedItems,
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
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryLoaded value) loaded,
    required TResult Function(CategorySwaped value) swaped,
    required TResult Function(CategoryError value) error,
    required TResult Function(SwappedItems value) swappedItems,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryInitial value)? initial,
    TResult? Function(CategoryLoading value)? loading,
    TResult? Function(CategoryLoaded value)? loaded,
    TResult? Function(CategorySwaped value)? swaped,
    TResult? Function(CategoryError value)? error,
    TResult? Function(SwappedItems value)? swappedItems,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategorySwaped value)? swaped,
    TResult Function(CategoryError value)? error,
    TResult Function(SwappedItems value)? swappedItems,
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
abstract class _$$CategorySwapedCopyWith<$Res> {
  factory _$$CategorySwapedCopyWith(
          _$CategorySwaped value, $Res Function(_$CategorySwaped) then) =
      __$$CategorySwapedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class __$$CategorySwapedCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$CategorySwaped>
    implements _$$CategorySwapedCopyWith<$Res> {
  __$$CategorySwapedCopyWithImpl(
      _$CategorySwaped _value, $Res Function(_$CategorySwaped) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$CategorySwaped(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _$CategorySwaped with DiagnosticableTreeMixin implements CategorySwaped {
  const _$CategorySwaped({required final List<CategoryModel> categories})
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
    return 'CategoryState.swaped(categories: $categories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryState.swaped'))
      ..add(DiagnosticsProperty('categories', categories));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySwaped &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySwapedCopyWith<_$CategorySwaped> get copyWith =>
      __$$CategorySwapedCopyWithImpl<_$CategorySwaped>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(List<CategoryModel> categories) swaped,
    required TResult Function(String message) error,
    required TResult Function(List<CategoryModel> categories) swappedItems,
  }) {
    return swaped(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CategoryModel> categories)? loaded,
    TResult? Function(List<CategoryModel> categories)? swaped,
    TResult? Function(String message)? error,
    TResult? Function(List<CategoryModel> categories)? swappedItems,
  }) {
    return swaped?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(List<CategoryModel> categories)? swaped,
    TResult Function(String message)? error,
    TResult Function(List<CategoryModel> categories)? swappedItems,
    required TResult orElse(),
  }) {
    if (swaped != null) {
      return swaped(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryInitial value) initial,
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryLoaded value) loaded,
    required TResult Function(CategorySwaped value) swaped,
    required TResult Function(CategoryError value) error,
    required TResult Function(SwappedItems value) swappedItems,
  }) {
    return swaped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryInitial value)? initial,
    TResult? Function(CategoryLoading value)? loading,
    TResult? Function(CategoryLoaded value)? loaded,
    TResult? Function(CategorySwaped value)? swaped,
    TResult? Function(CategoryError value)? error,
    TResult? Function(SwappedItems value)? swappedItems,
  }) {
    return swaped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategorySwaped value)? swaped,
    TResult Function(CategoryError value)? error,
    TResult Function(SwappedItems value)? swappedItems,
    required TResult orElse(),
  }) {
    if (swaped != null) {
      return swaped(this);
    }
    return orElse();
  }
}

abstract class CategorySwaped implements CategoryState {
  const factory CategorySwaped(
      {required final List<CategoryModel> categories}) = _$CategorySwaped;

  List<CategoryModel> get categories;
  @JsonKey(ignore: true)
  _$$CategorySwapedCopyWith<_$CategorySwaped> get copyWith =>
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
    required TResult Function() loading,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(List<CategoryModel> categories) swaped,
    required TResult Function(String message) error,
    required TResult Function(List<CategoryModel> categories) swappedItems,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CategoryModel> categories)? loaded,
    TResult? Function(List<CategoryModel> categories)? swaped,
    TResult? Function(String message)? error,
    TResult? Function(List<CategoryModel> categories)? swappedItems,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(List<CategoryModel> categories)? swaped,
    TResult Function(String message)? error,
    TResult Function(List<CategoryModel> categories)? swappedItems,
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
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryLoaded value) loaded,
    required TResult Function(CategorySwaped value) swaped,
    required TResult Function(CategoryError value) error,
    required TResult Function(SwappedItems value) swappedItems,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryInitial value)? initial,
    TResult? Function(CategoryLoading value)? loading,
    TResult? Function(CategoryLoaded value)? loaded,
    TResult? Function(CategorySwaped value)? swaped,
    TResult? Function(CategoryError value)? error,
    TResult? Function(SwappedItems value)? swappedItems,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategorySwaped value)? swaped,
    TResult Function(CategoryError value)? error,
    TResult Function(SwappedItems value)? swappedItems,
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
abstract class _$$SwappedItemsCopyWith<$Res> {
  factory _$$SwappedItemsCopyWith(
          _$SwappedItems value, $Res Function(_$SwappedItems) then) =
      __$$SwappedItemsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class __$$SwappedItemsCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res, _$SwappedItems>
    implements _$$SwappedItemsCopyWith<$Res> {
  __$$SwappedItemsCopyWithImpl(
      _$SwappedItems _value, $Res Function(_$SwappedItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$SwappedItems(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _$SwappedItems with DiagnosticableTreeMixin implements SwappedItems {
  const _$SwappedItems({required final List<CategoryModel> categories})
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
    return 'CategoryState.swappedItems(categories: $categories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryState.swappedItems'))
      ..add(DiagnosticsProperty('categories', categories));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwappedItems &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwappedItemsCopyWith<_$SwappedItems> get copyWith =>
      __$$SwappedItemsCopyWithImpl<_$SwappedItems>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CategoryModel> categories) loaded,
    required TResult Function(List<CategoryModel> categories) swaped,
    required TResult Function(String message) error,
    required TResult Function(List<CategoryModel> categories) swappedItems,
  }) {
    return swappedItems(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CategoryModel> categories)? loaded,
    TResult? Function(List<CategoryModel> categories)? swaped,
    TResult? Function(String message)? error,
    TResult? Function(List<CategoryModel> categories)? swappedItems,
  }) {
    return swappedItems?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CategoryModel> categories)? loaded,
    TResult Function(List<CategoryModel> categories)? swaped,
    TResult Function(String message)? error,
    TResult Function(List<CategoryModel> categories)? swappedItems,
    required TResult orElse(),
  }) {
    if (swappedItems != null) {
      return swappedItems(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryInitial value) initial,
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryLoaded value) loaded,
    required TResult Function(CategorySwaped value) swaped,
    required TResult Function(CategoryError value) error,
    required TResult Function(SwappedItems value) swappedItems,
  }) {
    return swappedItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CategoryInitial value)? initial,
    TResult? Function(CategoryLoading value)? loading,
    TResult? Function(CategoryLoaded value)? loaded,
    TResult? Function(CategorySwaped value)? swaped,
    TResult? Function(CategoryError value)? error,
    TResult? Function(SwappedItems value)? swappedItems,
  }) {
    return swappedItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryInitial value)? initial,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryLoaded value)? loaded,
    TResult Function(CategorySwaped value)? swaped,
    TResult Function(CategoryError value)? error,
    TResult Function(SwappedItems value)? swappedItems,
    required TResult orElse(),
  }) {
    if (swappedItems != null) {
      return swappedItems(this);
    }
    return orElse();
  }
}

abstract class SwappedItems implements CategoryState {
  const factory SwappedItems({required final List<CategoryModel> categories}) =
      _$SwappedItems;

  List<CategoryModel> get categories;
  @JsonKey(ignore: true)
  _$$SwappedItemsCopyWith<_$SwappedItems> get copyWith =>
      throw _privateConstructorUsedError;
}
