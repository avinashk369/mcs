// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProduct,
    required TResult Function(ProductModel productModel, bool isCart)
        addProduct,
    required TResult Function(ProductModel productModel) removeProduct,
    required TResult Function(ProductModel productModel) deleteProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadProduct,
    TResult Function(ProductModel productModel, bool isCart)? addProduct,
    TResult Function(ProductModel productModel)? removeProduct,
    TResult Function(ProductModel productModel)? deleteProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProduct,
    TResult Function(ProductModel productModel, bool isCart)? addProduct,
    TResult Function(ProductModel productModel)? removeProduct,
    TResult Function(ProductModel productModel)? deleteProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPrdoucts value) loadProduct,
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(DeleteProduct value) deleteProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadPrdoucts value)? loadProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(DeleteProduct value)? deleteProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPrdoucts value)? loadProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(DeleteProduct value)? deleteProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEventCopyWith<$Res> {
  factory $ProductEventCopyWith(
          ProductEvent value, $Res Function(ProductEvent) then) =
      _$ProductEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductEventCopyWithImpl<$Res> implements $ProductEventCopyWith<$Res> {
  _$ProductEventCopyWithImpl(this._value, this._then);

  final ProductEvent _value;
  // ignore: unused_field
  final $Res Function(ProductEvent) _then;
}

/// @nodoc
abstract class _$$LoadPrdouctsCopyWith<$Res> {
  factory _$$LoadPrdouctsCopyWith(
          _$LoadPrdoucts value, $Res Function(_$LoadPrdoucts) then) =
      __$$LoadPrdouctsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadPrdouctsCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res>
    implements _$$LoadPrdouctsCopyWith<$Res> {
  __$$LoadPrdouctsCopyWithImpl(
      _$LoadPrdoucts _value, $Res Function(_$LoadPrdoucts) _then)
      : super(_value, (v) => _then(v as _$LoadPrdoucts));

  @override
  _$LoadPrdoucts get _value => super._value as _$LoadPrdoucts;
}

/// @nodoc

class _$LoadPrdoucts with DiagnosticableTreeMixin implements LoadPrdoucts {
  const _$LoadPrdoucts();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductEvent.loadProduct()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ProductEvent.loadProduct'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadPrdoucts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProduct,
    required TResult Function(ProductModel productModel, bool isCart)
        addProduct,
    required TResult Function(ProductModel productModel) removeProduct,
    required TResult Function(ProductModel productModel) deleteProduct,
  }) {
    return loadProduct();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadProduct,
    TResult Function(ProductModel productModel, bool isCart)? addProduct,
    TResult Function(ProductModel productModel)? removeProduct,
    TResult Function(ProductModel productModel)? deleteProduct,
  }) {
    return loadProduct?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProduct,
    TResult Function(ProductModel productModel, bool isCart)? addProduct,
    TResult Function(ProductModel productModel)? removeProduct,
    TResult Function(ProductModel productModel)? deleteProduct,
    required TResult orElse(),
  }) {
    if (loadProduct != null) {
      return loadProduct();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPrdoucts value) loadProduct,
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(DeleteProduct value) deleteProduct,
  }) {
    return loadProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadPrdoucts value)? loadProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(DeleteProduct value)? deleteProduct,
  }) {
    return loadProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPrdoucts value)? loadProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(DeleteProduct value)? deleteProduct,
    required TResult orElse(),
  }) {
    if (loadProduct != null) {
      return loadProduct(this);
    }
    return orElse();
  }
}

abstract class LoadPrdoucts implements ProductEvent {
  const factory LoadPrdoucts() = _$LoadPrdoucts;
}

/// @nodoc
abstract class _$$AddProductCopyWith<$Res> {
  factory _$$AddProductCopyWith(
          _$AddProduct value, $Res Function(_$AddProduct) then) =
      __$$AddProductCopyWithImpl<$Res>;
  $Res call({ProductModel productModel, bool isCart});

  $ProductModelCopyWith<$Res> get productModel;
}

/// @nodoc
class __$$AddProductCopyWithImpl<$Res> extends _$ProductEventCopyWithImpl<$Res>
    implements _$$AddProductCopyWith<$Res> {
  __$$AddProductCopyWithImpl(
      _$AddProduct _value, $Res Function(_$AddProduct) _then)
      : super(_value, (v) => _then(v as _$AddProduct));

  @override
  _$AddProduct get _value => super._value as _$AddProduct;

  @override
  $Res call({
    Object? productModel = freezed,
    Object? isCart = freezed,
  }) {
    return _then(_$AddProduct(
      productModel: productModel == freezed
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      isCart: isCart == freezed
          ? _value.isCart
          : isCart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $ProductModelCopyWith<$Res> get productModel {
    return $ProductModelCopyWith<$Res>(_value.productModel, (value) {
      return _then(_value.copyWith(productModel: value));
    });
  }
}

/// @nodoc

class _$AddProduct with DiagnosticableTreeMixin implements AddProduct {
  const _$AddProduct({required this.productModel, required this.isCart});

  @override
  final ProductModel productModel;
  @override
  final bool isCart;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductEvent.addProduct(productModel: $productModel, isCart: $isCart)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductEvent.addProduct'))
      ..add(DiagnosticsProperty('productModel', productModel))
      ..add(DiagnosticsProperty('isCart', isCart));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProduct &&
            const DeepCollectionEquality()
                .equals(other.productModel, productModel) &&
            const DeepCollectionEquality().equals(other.isCart, isCart));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(productModel),
      const DeepCollectionEquality().hash(isCart));

  @JsonKey(ignore: true)
  @override
  _$$AddProductCopyWith<_$AddProduct> get copyWith =>
      __$$AddProductCopyWithImpl<_$AddProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProduct,
    required TResult Function(ProductModel productModel, bool isCart)
        addProduct,
    required TResult Function(ProductModel productModel) removeProduct,
    required TResult Function(ProductModel productModel) deleteProduct,
  }) {
    return addProduct(productModel, isCart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadProduct,
    TResult Function(ProductModel productModel, bool isCart)? addProduct,
    TResult Function(ProductModel productModel)? removeProduct,
    TResult Function(ProductModel productModel)? deleteProduct,
  }) {
    return addProduct?.call(productModel, isCart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProduct,
    TResult Function(ProductModel productModel, bool isCart)? addProduct,
    TResult Function(ProductModel productModel)? removeProduct,
    TResult Function(ProductModel productModel)? deleteProduct,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(productModel, isCart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPrdoucts value) loadProduct,
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(DeleteProduct value) deleteProduct,
  }) {
    return addProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadPrdoucts value)? loadProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(DeleteProduct value)? deleteProduct,
  }) {
    return addProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPrdoucts value)? loadProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(DeleteProduct value)? deleteProduct,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(this);
    }
    return orElse();
  }
}

abstract class AddProduct implements ProductEvent {
  const factory AddProduct(
      {required final ProductModel productModel,
      required final bool isCart}) = _$AddProduct;

  ProductModel get productModel => throw _privateConstructorUsedError;
  bool get isCart => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$AddProductCopyWith<_$AddProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveProductCopyWith<$Res> {
  factory _$$RemoveProductCopyWith(
          _$RemoveProduct value, $Res Function(_$RemoveProduct) then) =
      __$$RemoveProductCopyWithImpl<$Res>;
  $Res call({ProductModel productModel});

  $ProductModelCopyWith<$Res> get productModel;
}

/// @nodoc
class __$$RemoveProductCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res>
    implements _$$RemoveProductCopyWith<$Res> {
  __$$RemoveProductCopyWithImpl(
      _$RemoveProduct _value, $Res Function(_$RemoveProduct) _then)
      : super(_value, (v) => _then(v as _$RemoveProduct));

  @override
  _$RemoveProduct get _value => super._value as _$RemoveProduct;

  @override
  $Res call({
    Object? productModel = freezed,
  }) {
    return _then(_$RemoveProduct(
      productModel == freezed
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }

  @override
  $ProductModelCopyWith<$Res> get productModel {
    return $ProductModelCopyWith<$Res>(_value.productModel, (value) {
      return _then(_value.copyWith(productModel: value));
    });
  }
}

/// @nodoc

class _$RemoveProduct with DiagnosticableTreeMixin implements RemoveProduct {
  const _$RemoveProduct(this.productModel);

  @override
  final ProductModel productModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductEvent.removeProduct(productModel: $productModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductEvent.removeProduct'))
      ..add(DiagnosticsProperty('productModel', productModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveProduct &&
            const DeepCollectionEquality()
                .equals(other.productModel, productModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(productModel));

  @JsonKey(ignore: true)
  @override
  _$$RemoveProductCopyWith<_$RemoveProduct> get copyWith =>
      __$$RemoveProductCopyWithImpl<_$RemoveProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProduct,
    required TResult Function(ProductModel productModel, bool isCart)
        addProduct,
    required TResult Function(ProductModel productModel) removeProduct,
    required TResult Function(ProductModel productModel) deleteProduct,
  }) {
    return removeProduct(productModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadProduct,
    TResult Function(ProductModel productModel, bool isCart)? addProduct,
    TResult Function(ProductModel productModel)? removeProduct,
    TResult Function(ProductModel productModel)? deleteProduct,
  }) {
    return removeProduct?.call(productModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProduct,
    TResult Function(ProductModel productModel, bool isCart)? addProduct,
    TResult Function(ProductModel productModel)? removeProduct,
    TResult Function(ProductModel productModel)? deleteProduct,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(productModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPrdoucts value) loadProduct,
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(DeleteProduct value) deleteProduct,
  }) {
    return removeProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadPrdoucts value)? loadProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(DeleteProduct value)? deleteProduct,
  }) {
    return removeProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPrdoucts value)? loadProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(DeleteProduct value)? deleteProduct,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(this);
    }
    return orElse();
  }
}

abstract class RemoveProduct implements ProductEvent {
  const factory RemoveProduct(final ProductModel productModel) =
      _$RemoveProduct;

  ProductModel get productModel => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RemoveProductCopyWith<_$RemoveProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteProductCopyWith<$Res> {
  factory _$$DeleteProductCopyWith(
          _$DeleteProduct value, $Res Function(_$DeleteProduct) then) =
      __$$DeleteProductCopyWithImpl<$Res>;
  $Res call({ProductModel productModel});

  $ProductModelCopyWith<$Res> get productModel;
}

/// @nodoc
class __$$DeleteProductCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res>
    implements _$$DeleteProductCopyWith<$Res> {
  __$$DeleteProductCopyWithImpl(
      _$DeleteProduct _value, $Res Function(_$DeleteProduct) _then)
      : super(_value, (v) => _then(v as _$DeleteProduct));

  @override
  _$DeleteProduct get _value => super._value as _$DeleteProduct;

  @override
  $Res call({
    Object? productModel = freezed,
  }) {
    return _then(_$DeleteProduct(
      productModel == freezed
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }

  @override
  $ProductModelCopyWith<$Res> get productModel {
    return $ProductModelCopyWith<$Res>(_value.productModel, (value) {
      return _then(_value.copyWith(productModel: value));
    });
  }
}

/// @nodoc

class _$DeleteProduct with DiagnosticableTreeMixin implements DeleteProduct {
  const _$DeleteProduct(this.productModel);

  @override
  final ProductModel productModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductEvent.deleteProduct(productModel: $productModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductEvent.deleteProduct'))
      ..add(DiagnosticsProperty('productModel', productModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteProduct &&
            const DeepCollectionEquality()
                .equals(other.productModel, productModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(productModel));

  @JsonKey(ignore: true)
  @override
  _$$DeleteProductCopyWith<_$DeleteProduct> get copyWith =>
      __$$DeleteProductCopyWithImpl<_$DeleteProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProduct,
    required TResult Function(ProductModel productModel, bool isCart)
        addProduct,
    required TResult Function(ProductModel productModel) removeProduct,
    required TResult Function(ProductModel productModel) deleteProduct,
  }) {
    return deleteProduct(productModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadProduct,
    TResult Function(ProductModel productModel, bool isCart)? addProduct,
    TResult Function(ProductModel productModel)? removeProduct,
    TResult Function(ProductModel productModel)? deleteProduct,
  }) {
    return deleteProduct?.call(productModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProduct,
    TResult Function(ProductModel productModel, bool isCart)? addProduct,
    TResult Function(ProductModel productModel)? removeProduct,
    TResult Function(ProductModel productModel)? deleteProduct,
    required TResult orElse(),
  }) {
    if (deleteProduct != null) {
      return deleteProduct(productModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPrdoucts value) loadProduct,
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(DeleteProduct value) deleteProduct,
  }) {
    return deleteProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadPrdoucts value)? loadProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(DeleteProduct value)? deleteProduct,
  }) {
    return deleteProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPrdoucts value)? loadProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(DeleteProduct value)? deleteProduct,
    required TResult orElse(),
  }) {
    if (deleteProduct != null) {
      return deleteProduct(this);
    }
    return orElse();
  }
}

abstract class DeleteProduct implements ProductEvent {
  const factory DeleteProduct(final ProductModel productModel) =
      _$DeleteProduct;

  ProductModel get productModel => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DeleteProductCopyWith<_$DeleteProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)?
        loaded,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductInitial value) initial,
    required TResult Function(ProductLoading value) loading,
    required TResult Function(ProductLoaded value) loaded,
    required TResult Function(ProductError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductInitial value)? initial,
    TResult Function(ProductLoading value)? loading,
    TResult Function(ProductLoaded value)? loaded,
    TResult Function(ProductError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductInitial value)? initial,
    TResult Function(ProductLoading value)? loading,
    TResult Function(ProductLoaded value)? loaded,
    TResult Function(ProductError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res> implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  final ProductState _value;
  // ignore: unused_field
  final $Res Function(ProductState) _then;
}

/// @nodoc
abstract class _$$ProductInitialCopyWith<$Res> {
  factory _$$ProductInitialCopyWith(
          _$ProductInitial value, $Res Function(_$ProductInitial) then) =
      __$$ProductInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductInitialCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res>
    implements _$$ProductInitialCopyWith<$Res> {
  __$$ProductInitialCopyWithImpl(
      _$ProductInitial _value, $Res Function(_$ProductInitial) _then)
      : super(_value, (v) => _then(v as _$ProductInitial));

  @override
  _$ProductInitial get _value => super._value as _$ProductInitial;
}

/// @nodoc

class _$ProductInitial with DiagnosticableTreeMixin implements ProductInitial {
  const _$ProductInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ProductState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProductInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)?
        loaded,
    TResult Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)?
        loaded,
    TResult Function(String message)? error,
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
    required TResult Function(ProductInitial value) initial,
    required TResult Function(ProductLoading value) loading,
    required TResult Function(ProductLoaded value) loaded,
    required TResult Function(ProductError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductInitial value)? initial,
    TResult Function(ProductLoading value)? loading,
    TResult Function(ProductLoaded value)? loaded,
    TResult Function(ProductError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductInitial value)? initial,
    TResult Function(ProductLoading value)? loading,
    TResult Function(ProductLoaded value)? loaded,
    TResult Function(ProductError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProductInitial implements ProductState {
  const factory ProductInitial() = _$ProductInitial;
}

/// @nodoc
abstract class _$$ProductLoadingCopyWith<$Res> {
  factory _$$ProductLoadingCopyWith(
          _$ProductLoading value, $Res Function(_$ProductLoading) then) =
      __$$ProductLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductLoadingCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res>
    implements _$$ProductLoadingCopyWith<$Res> {
  __$$ProductLoadingCopyWithImpl(
      _$ProductLoading _value, $Res Function(_$ProductLoading) _then)
      : super(_value, (v) => _then(v as _$ProductLoading));

  @override
  _$ProductLoading get _value => super._value as _$ProductLoading;
}

/// @nodoc

class _$ProductLoading with DiagnosticableTreeMixin implements ProductLoading {
  const _$ProductLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ProductState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProductLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)?
        loaded,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)?
        loaded,
    TResult Function(String message)? error,
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
    required TResult Function(ProductInitial value) initial,
    required TResult Function(ProductLoading value) loading,
    required TResult Function(ProductLoaded value) loaded,
    required TResult Function(ProductError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductInitial value)? initial,
    TResult Function(ProductLoading value)? loading,
    TResult Function(ProductLoaded value)? loaded,
    TResult Function(ProductError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductInitial value)? initial,
    TResult Function(ProductLoading value)? loading,
    TResult Function(ProductLoaded value)? loaded,
    TResult Function(ProductError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProductLoading implements ProductState {
  const factory ProductLoading() = _$ProductLoading;
}

/// @nodoc
abstract class _$$ProductLoadedCopyWith<$Res> {
  factory _$$ProductLoadedCopyWith(
          _$ProductLoaded value, $Res Function(_$ProductLoaded) then) =
      __$$ProductLoadedCopyWithImpl<$Res>;
  $Res call(
      {List<ProductModel> products,
      List<ProductModel> addedProducts,
      List<ProductModel> personalCare,
      List<ProductModel> dailyNeeds,
      List<ProductModel> dairyProducts});
}

/// @nodoc
class __$$ProductLoadedCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res>
    implements _$$ProductLoadedCopyWith<$Res> {
  __$$ProductLoadedCopyWithImpl(
      _$ProductLoaded _value, $Res Function(_$ProductLoaded) _then)
      : super(_value, (v) => _then(v as _$ProductLoaded));

  @override
  _$ProductLoaded get _value => super._value as _$ProductLoaded;

  @override
  $Res call({
    Object? products = freezed,
    Object? addedProducts = freezed,
    Object? personalCare = freezed,
    Object? dailyNeeds = freezed,
    Object? dairyProducts = freezed,
  }) {
    return _then(_$ProductLoaded(
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      addedProducts: addedProducts == freezed
          ? _value._addedProducts
          : addedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      personalCare: personalCare == freezed
          ? _value._personalCare
          : personalCare // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      dailyNeeds: dailyNeeds == freezed
          ? _value._dailyNeeds
          : dailyNeeds // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      dairyProducts: dairyProducts == freezed
          ? _value._dairyProducts
          : dairyProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc

class _$ProductLoaded with DiagnosticableTreeMixin implements ProductLoaded {
  const _$ProductLoaded(
      {required final List<ProductModel> products,
      required final List<ProductModel> addedProducts,
      required final List<ProductModel> personalCare,
      required final List<ProductModel> dailyNeeds,
      required final List<ProductModel> dairyProducts})
      : _products = products,
        _addedProducts = addedProducts,
        _personalCare = personalCare,
        _dailyNeeds = dailyNeeds,
        _dairyProducts = dairyProducts;

  final List<ProductModel> _products;
  @override
  List<ProductModel> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<ProductModel> _addedProducts;
  @override
  List<ProductModel> get addedProducts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addedProducts);
  }

  final List<ProductModel> _personalCare;
  @override
  List<ProductModel> get personalCare {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_personalCare);
  }

  final List<ProductModel> _dailyNeeds;
  @override
  List<ProductModel> get dailyNeeds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyNeeds);
  }

  final List<ProductModel> _dairyProducts;
  @override
  List<ProductModel> get dairyProducts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dairyProducts);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductState.loaded(products: $products, addedProducts: $addedProducts, personalCare: $personalCare, dailyNeeds: $dailyNeeds, dairyProducts: $dairyProducts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductState.loaded'))
      ..add(DiagnosticsProperty('products', products))
      ..add(DiagnosticsProperty('addedProducts', addedProducts))
      ..add(DiagnosticsProperty('personalCare', personalCare))
      ..add(DiagnosticsProperty('dailyNeeds', dailyNeeds))
      ..add(DiagnosticsProperty('dairyProducts', dairyProducts));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductLoaded &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._addedProducts, _addedProducts) &&
            const DeepCollectionEquality()
                .equals(other._personalCare, _personalCare) &&
            const DeepCollectionEquality()
                .equals(other._dailyNeeds, _dailyNeeds) &&
            const DeepCollectionEquality()
                .equals(other._dairyProducts, _dairyProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_addedProducts),
      const DeepCollectionEquality().hash(_personalCare),
      const DeepCollectionEquality().hash(_dailyNeeds),
      const DeepCollectionEquality().hash(_dairyProducts));

  @JsonKey(ignore: true)
  @override
  _$$ProductLoadedCopyWith<_$ProductLoaded> get copyWith =>
      __$$ProductLoadedCopyWithImpl<_$ProductLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(
        products, addedProducts, personalCare, dailyNeeds, dairyProducts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)?
        loaded,
    TResult Function(String message)? error,
  }) {
    return loaded?.call(
        products, addedProducts, personalCare, dailyNeeds, dairyProducts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          products, addedProducts, personalCare, dailyNeeds, dairyProducts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductInitial value) initial,
    required TResult Function(ProductLoading value) loading,
    required TResult Function(ProductLoaded value) loaded,
    required TResult Function(ProductError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductInitial value)? initial,
    TResult Function(ProductLoading value)? loading,
    TResult Function(ProductLoaded value)? loaded,
    TResult Function(ProductError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductInitial value)? initial,
    TResult Function(ProductLoading value)? loading,
    TResult Function(ProductLoaded value)? loaded,
    TResult Function(ProductError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ProductLoaded implements ProductState {
  const factory ProductLoaded(
      {required final List<ProductModel> products,
      required final List<ProductModel> addedProducts,
      required final List<ProductModel> personalCare,
      required final List<ProductModel> dailyNeeds,
      required final List<ProductModel> dairyProducts}) = _$ProductLoaded;

  List<ProductModel> get products => throw _privateConstructorUsedError;
  List<ProductModel> get addedProducts => throw _privateConstructorUsedError;
  List<ProductModel> get personalCare => throw _privateConstructorUsedError;
  List<ProductModel> get dailyNeeds => throw _privateConstructorUsedError;
  List<ProductModel> get dairyProducts => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ProductLoadedCopyWith<_$ProductLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductErrorCopyWith<$Res> {
  factory _$$ProductErrorCopyWith(
          _$ProductError value, $Res Function(_$ProductError) then) =
      __$$ProductErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$ProductErrorCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res>
    implements _$$ProductErrorCopyWith<$Res> {
  __$$ProductErrorCopyWithImpl(
      _$ProductError _value, $Res Function(_$ProductError) _then)
      : super(_value, (v) => _then(v as _$ProductError));

  @override
  _$ProductError get _value => super._value as _$ProductError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ProductError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductError with DiagnosticableTreeMixin implements ProductError {
  const _$ProductError({required this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$ProductErrorCopyWith<_$ProductError> get copyWith =>
      __$$ProductErrorCopyWithImpl<_$ProductError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)?
        loaded,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ProductModel> products,
            List<ProductModel> addedProducts,
            List<ProductModel> personalCare,
            List<ProductModel> dailyNeeds,
            List<ProductModel> dairyProducts)?
        loaded,
    TResult Function(String message)? error,
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
    required TResult Function(ProductInitial value) initial,
    required TResult Function(ProductLoading value) loading,
    required TResult Function(ProductLoaded value) loaded,
    required TResult Function(ProductError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ProductInitial value)? initial,
    TResult Function(ProductLoading value)? loading,
    TResult Function(ProductLoaded value)? loaded,
    TResult Function(ProductError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductInitial value)? initial,
    TResult Function(ProductLoading value)? loading,
    TResult Function(ProductLoaded value)? loaded,
    TResult Function(ProductError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProductError implements ProductState {
  const factory ProductError({required final String message}) = _$ProductError;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ProductErrorCopyWith<_$ProductError> get copyWith =>
      throw _privateConstructorUsedError;
}
