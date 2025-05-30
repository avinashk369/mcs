// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    required TResult Function(String catId) loadProductByCatId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProduct,
    TResult? Function(ProductModel productModel, bool isCart)? addProduct,
    TResult? Function(ProductModel productModel)? removeProduct,
    TResult? Function(ProductModel productModel)? deleteProduct,
    TResult? Function(String catId)? loadProductByCatId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProduct,
    TResult Function(ProductModel productModel, bool isCart)? addProduct,
    TResult Function(ProductModel productModel)? removeProduct,
    TResult Function(ProductModel productModel)? deleteProduct,
    TResult Function(String catId)? loadProductByCatId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPrdoucts value) loadProduct,
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(RemoveProduct value) removeProduct,
    required TResult Function(DeleteProduct value) deleteProduct,
    required TResult Function(LoadProductByCatId value) loadProductByCatId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPrdoucts value)? loadProduct,
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(DeleteProduct value)? deleteProduct,
    TResult? Function(LoadProductByCatId value)? loadProductByCatId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPrdoucts value)? loadProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(DeleteProduct value)? deleteProduct,
    TResult Function(LoadProductByCatId value)? loadProductByCatId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEventCopyWith<$Res> {
  factory $ProductEventCopyWith(
          ProductEvent value, $Res Function(ProductEvent) then) =
      _$ProductEventCopyWithImpl<$Res, ProductEvent>;
}

/// @nodoc
class _$ProductEventCopyWithImpl<$Res, $Val extends ProductEvent>
    implements $ProductEventCopyWith<$Res> {
  _$ProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadPrdouctsCopyWith<$Res> {
  factory _$$LoadPrdouctsCopyWith(
          _$LoadPrdoucts value, $Res Function(_$LoadPrdoucts) then) =
      __$$LoadPrdouctsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadPrdouctsCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$LoadPrdoucts>
    implements _$$LoadPrdouctsCopyWith<$Res> {
  __$$LoadPrdouctsCopyWithImpl(
      _$LoadPrdoucts _value, $Res Function(_$LoadPrdoucts) _then)
      : super(_value, _then);
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
    required TResult Function(String catId) loadProductByCatId,
  }) {
    return loadProduct();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProduct,
    TResult? Function(ProductModel productModel, bool isCart)? addProduct,
    TResult? Function(ProductModel productModel)? removeProduct,
    TResult? Function(ProductModel productModel)? deleteProduct,
    TResult? Function(String catId)? loadProductByCatId,
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
    TResult Function(String catId)? loadProductByCatId,
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
    required TResult Function(LoadProductByCatId value) loadProductByCatId,
  }) {
    return loadProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPrdoucts value)? loadProduct,
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(DeleteProduct value)? deleteProduct,
    TResult? Function(LoadProductByCatId value)? loadProductByCatId,
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
    TResult Function(LoadProductByCatId value)? loadProductByCatId,
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
  @useResult
  $Res call({ProductModel productModel, bool isCart});

  $ProductModelCopyWith<$Res> get productModel;
}

/// @nodoc
class __$$AddProductCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$AddProduct>
    implements _$$AddProductCopyWith<$Res> {
  __$$AddProductCopyWithImpl(
      _$AddProduct _value, $Res Function(_$AddProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productModel = null,
    Object? isCart = null,
  }) {
    return _then(_$AddProduct(
      productModel: null == productModel
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      isCart: null == isCart
          ? _value.isCart
          : isCart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
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
            (identical(other.productModel, productModel) ||
                other.productModel == productModel) &&
            (identical(other.isCart, isCart) || other.isCart == isCart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productModel, isCart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    required TResult Function(String catId) loadProductByCatId,
  }) {
    return addProduct(productModel, isCart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProduct,
    TResult? Function(ProductModel productModel, bool isCart)? addProduct,
    TResult? Function(ProductModel productModel)? removeProduct,
    TResult? Function(ProductModel productModel)? deleteProduct,
    TResult? Function(String catId)? loadProductByCatId,
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
    TResult Function(String catId)? loadProductByCatId,
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
    required TResult Function(LoadProductByCatId value) loadProductByCatId,
  }) {
    return addProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPrdoucts value)? loadProduct,
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(DeleteProduct value)? deleteProduct,
    TResult? Function(LoadProductByCatId value)? loadProductByCatId,
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
    TResult Function(LoadProductByCatId value)? loadProductByCatId,
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

  ProductModel get productModel;
  bool get isCart;
  @JsonKey(ignore: true)
  _$$AddProductCopyWith<_$AddProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveProductCopyWith<$Res> {
  factory _$$RemoveProductCopyWith(
          _$RemoveProduct value, $Res Function(_$RemoveProduct) then) =
      __$$RemoveProductCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductModel productModel});

  $ProductModelCopyWith<$Res> get productModel;
}

/// @nodoc
class __$$RemoveProductCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$RemoveProduct>
    implements _$$RemoveProductCopyWith<$Res> {
  __$$RemoveProductCopyWithImpl(
      _$RemoveProduct _value, $Res Function(_$RemoveProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productModel = null,
  }) {
    return _then(_$RemoveProduct(
      null == productModel
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
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
            (identical(other.productModel, productModel) ||
                other.productModel == productModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    required TResult Function(String catId) loadProductByCatId,
  }) {
    return removeProduct(productModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProduct,
    TResult? Function(ProductModel productModel, bool isCart)? addProduct,
    TResult? Function(ProductModel productModel)? removeProduct,
    TResult? Function(ProductModel productModel)? deleteProduct,
    TResult? Function(String catId)? loadProductByCatId,
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
    TResult Function(String catId)? loadProductByCatId,
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
    required TResult Function(LoadProductByCatId value) loadProductByCatId,
  }) {
    return removeProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPrdoucts value)? loadProduct,
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(DeleteProduct value)? deleteProduct,
    TResult? Function(LoadProductByCatId value)? loadProductByCatId,
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
    TResult Function(LoadProductByCatId value)? loadProductByCatId,
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

  ProductModel get productModel;
  @JsonKey(ignore: true)
  _$$RemoveProductCopyWith<_$RemoveProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteProductCopyWith<$Res> {
  factory _$$DeleteProductCopyWith(
          _$DeleteProduct value, $Res Function(_$DeleteProduct) then) =
      __$$DeleteProductCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductModel productModel});

  $ProductModelCopyWith<$Res> get productModel;
}

/// @nodoc
class __$$DeleteProductCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$DeleteProduct>
    implements _$$DeleteProductCopyWith<$Res> {
  __$$DeleteProductCopyWithImpl(
      _$DeleteProduct _value, $Res Function(_$DeleteProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productModel = null,
  }) {
    return _then(_$DeleteProduct(
      null == productModel
          ? _value.productModel
          : productModel // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
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
            (identical(other.productModel, productModel) ||
                other.productModel == productModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    required TResult Function(String catId) loadProductByCatId,
  }) {
    return deleteProduct(productModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProduct,
    TResult? Function(ProductModel productModel, bool isCart)? addProduct,
    TResult? Function(ProductModel productModel)? removeProduct,
    TResult? Function(ProductModel productModel)? deleteProduct,
    TResult? Function(String catId)? loadProductByCatId,
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
    TResult Function(String catId)? loadProductByCatId,
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
    required TResult Function(LoadProductByCatId value) loadProductByCatId,
  }) {
    return deleteProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPrdoucts value)? loadProduct,
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(DeleteProduct value)? deleteProduct,
    TResult? Function(LoadProductByCatId value)? loadProductByCatId,
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
    TResult Function(LoadProductByCatId value)? loadProductByCatId,
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

  ProductModel get productModel;
  @JsonKey(ignore: true)
  _$$DeleteProductCopyWith<_$DeleteProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadProductByCatIdCopyWith<$Res> {
  factory _$$LoadProductByCatIdCopyWith(_$LoadProductByCatId value,
          $Res Function(_$LoadProductByCatId) then) =
      __$$LoadProductByCatIdCopyWithImpl<$Res>;
  @useResult
  $Res call({String catId});
}

/// @nodoc
class __$$LoadProductByCatIdCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$LoadProductByCatId>
    implements _$$LoadProductByCatIdCopyWith<$Res> {
  __$$LoadProductByCatIdCopyWithImpl(
      _$LoadProductByCatId _value, $Res Function(_$LoadProductByCatId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catId = null,
  }) {
    return _then(_$LoadProductByCatId(
      catId: null == catId
          ? _value.catId
          : catId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadProductByCatId
    with DiagnosticableTreeMixin
    implements LoadProductByCatId {
  const _$LoadProductByCatId({required this.catId});

  @override
  final String catId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductEvent.loadProductByCatId(catId: $catId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductEvent.loadProductByCatId'))
      ..add(DiagnosticsProperty('catId', catId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProductByCatId &&
            (identical(other.catId, catId) || other.catId == catId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, catId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProductByCatIdCopyWith<_$LoadProductByCatId> get copyWith =>
      __$$LoadProductByCatIdCopyWithImpl<_$LoadProductByCatId>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProduct,
    required TResult Function(ProductModel productModel, bool isCart)
        addProduct,
    required TResult Function(ProductModel productModel) removeProduct,
    required TResult Function(ProductModel productModel) deleteProduct,
    required TResult Function(String catId) loadProductByCatId,
  }) {
    return loadProductByCatId(catId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProduct,
    TResult? Function(ProductModel productModel, bool isCart)? addProduct,
    TResult? Function(ProductModel productModel)? removeProduct,
    TResult? Function(ProductModel productModel)? deleteProduct,
    TResult? Function(String catId)? loadProductByCatId,
  }) {
    return loadProductByCatId?.call(catId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProduct,
    TResult Function(ProductModel productModel, bool isCart)? addProduct,
    TResult Function(ProductModel productModel)? removeProduct,
    TResult Function(ProductModel productModel)? deleteProduct,
    TResult Function(String catId)? loadProductByCatId,
    required TResult orElse(),
  }) {
    if (loadProductByCatId != null) {
      return loadProductByCatId(catId);
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
    required TResult Function(LoadProductByCatId value) loadProductByCatId,
  }) {
    return loadProductByCatId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPrdoucts value)? loadProduct,
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(RemoveProduct value)? removeProduct,
    TResult? Function(DeleteProduct value)? deleteProduct,
    TResult? Function(LoadProductByCatId value)? loadProductByCatId,
  }) {
    return loadProductByCatId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPrdoucts value)? loadProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(RemoveProduct value)? removeProduct,
    TResult Function(DeleteProduct value)? deleteProduct,
    TResult Function(LoadProductByCatId value)? loadProductByCatId,
    required TResult orElse(),
  }) {
    if (loadProductByCatId != null) {
      return loadProductByCatId(this);
    }
    return orElse();
  }
}

abstract class LoadProductByCatId implements ProductEvent {
  const factory LoadProductByCatId({required final String catId}) =
      _$LoadProductByCatId;

  String get catId;
  @JsonKey(ignore: true)
  _$$LoadProductByCatIdCopyWith<_$LoadProductByCatId> get copyWith =>
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
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<ProductModel> products,
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<ProductModel> products,
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)?
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
    TResult? Function(ProductInitial value)? initial,
    TResult? Function(ProductLoading value)? loading,
    TResult? Function(ProductLoaded value)? loaded,
    TResult? Function(ProductError value)? error,
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
      _$ProductStateCopyWithImpl<$Res, ProductState>;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProductInitialCopyWith<$Res> {
  factory _$$ProductInitialCopyWith(
          _$ProductInitial value, $Res Function(_$ProductInitial) then) =
      __$$ProductInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductInitialCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductInitial>
    implements _$$ProductInitialCopyWith<$Res> {
  __$$ProductInitialCopyWithImpl(
      _$ProductInitial _value, $Res Function(_$ProductInitial) _then)
      : super(_value, _then);
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
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<ProductModel> products,
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)?
        loaded,
    TResult? Function(String message)? error,
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
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)?
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
    TResult? Function(ProductInitial value)? initial,
    TResult? Function(ProductLoading value)? loading,
    TResult? Function(ProductLoaded value)? loaded,
    TResult? Function(ProductError value)? error,
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
    extends _$ProductStateCopyWithImpl<$Res, _$ProductLoading>
    implements _$$ProductLoadingCopyWith<$Res> {
  __$$ProductLoadingCopyWithImpl(
      _$ProductLoading _value, $Res Function(_$ProductLoading) _then)
      : super(_value, _then);
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
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<ProductModel> products,
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)?
        loaded,
    TResult? Function(String message)? error,
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
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)?
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
    TResult? Function(ProductInitial value)? initial,
    TResult? Function(ProductLoading value)? loading,
    TResult? Function(ProductLoaded value)? loaded,
    TResult? Function(ProductError value)? error,
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
  @useResult
  $Res call(
      {List<ProductModel> products,
      List<ProductModel>? addedProducts,
      List<ProductModel>? personalCare,
      List<ProductModel>? dailyNeeds,
      List<ProductModel>? dairyProducts});
}

/// @nodoc
class __$$ProductLoadedCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductLoaded>
    implements _$$ProductLoadedCopyWith<$Res> {
  __$$ProductLoadedCopyWithImpl(
      _$ProductLoaded _value, $Res Function(_$ProductLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? addedProducts = freezed,
    Object? personalCare = freezed,
    Object? dailyNeeds = freezed,
    Object? dairyProducts = freezed,
  }) {
    return _then(_$ProductLoaded(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      addedProducts: freezed == addedProducts
          ? _value._addedProducts
          : addedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      personalCare: freezed == personalCare
          ? _value._personalCare
          : personalCare // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      dailyNeeds: freezed == dailyNeeds
          ? _value._dailyNeeds
          : dailyNeeds // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      dairyProducts: freezed == dairyProducts
          ? _value._dairyProducts
          : dairyProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ));
  }
}

/// @nodoc

class _$ProductLoaded with DiagnosticableTreeMixin implements ProductLoaded {
  const _$ProductLoaded(
      {required final List<ProductModel> products,
      final List<ProductModel>? addedProducts,
      final List<ProductModel>? personalCare,
      final List<ProductModel>? dailyNeeds,
      final List<ProductModel>? dairyProducts})
      : _products = products,
        _addedProducts = addedProducts,
        _personalCare = personalCare,
        _dailyNeeds = dailyNeeds,
        _dairyProducts = dairyProducts;

  final List<ProductModel> _products;
  @override
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<ProductModel>? _addedProducts;
  @override
  List<ProductModel>? get addedProducts {
    final value = _addedProducts;
    if (value == null) return null;
    if (_addedProducts is EqualUnmodifiableListView) return _addedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductModel>? _personalCare;
  @override
  List<ProductModel>? get personalCare {
    final value = _personalCare;
    if (value == null) return null;
    if (_personalCare is EqualUnmodifiableListView) return _personalCare;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductModel>? _dailyNeeds;
  @override
  List<ProductModel>? get dailyNeeds {
    final value = _dailyNeeds;
    if (value == null) return null;
    if (_dailyNeeds is EqualUnmodifiableListView) return _dailyNeeds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductModel>? _dairyProducts;
  @override
  List<ProductModel>? get dairyProducts {
    final value = _dairyProducts;
    if (value == null) return null;
    if (_dairyProducts is EqualUnmodifiableListView) return _dairyProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
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
  @pragma('vm:prefer-inline')
  _$$ProductLoadedCopyWith<_$ProductLoaded> get copyWith =>
      __$$ProductLoadedCopyWithImpl<_$ProductLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<ProductModel> products,
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(
        products, addedProducts, personalCare, dailyNeeds, dairyProducts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<ProductModel> products,
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)?
        loaded,
    TResult? Function(String message)? error,
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
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)?
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
    TResult? Function(ProductInitial value)? initial,
    TResult? Function(ProductLoading value)? loading,
    TResult? Function(ProductLoaded value)? loaded,
    TResult? Function(ProductError value)? error,
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
      final List<ProductModel>? addedProducts,
      final List<ProductModel>? personalCare,
      final List<ProductModel>? dailyNeeds,
      final List<ProductModel>? dairyProducts}) = _$ProductLoaded;

  List<ProductModel> get products;
  List<ProductModel>? get addedProducts;
  List<ProductModel>? get personalCare;
  List<ProductModel>? get dailyNeeds;
  List<ProductModel>? get dairyProducts;
  @JsonKey(ignore: true)
  _$$ProductLoadedCopyWith<_$ProductLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductErrorCopyWith<$Res> {
  factory _$$ProductErrorCopyWith(
          _$ProductError value, $Res Function(_$ProductError) then) =
      __$$ProductErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ProductErrorCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductError>
    implements _$$ProductErrorCopyWith<$Res> {
  __$$ProductErrorCopyWithImpl(
      _$ProductError _value, $Res Function(_$ProductError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ProductError(
      message: null == message
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
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductErrorCopyWith<_$ProductError> get copyWith =>
      __$$ProductErrorCopyWithImpl<_$ProductError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<ProductModel> products,
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<ProductModel> products,
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)?
        loaded,
    TResult? Function(String message)? error,
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
            List<ProductModel>? addedProducts,
            List<ProductModel>? personalCare,
            List<ProductModel>? dailyNeeds,
            List<ProductModel>? dairyProducts)?
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
    TResult? Function(ProductInitial value)? initial,
    TResult? Function(ProductLoading value)? loading,
    TResult? Function(ProductLoaded value)? loaded,
    TResult? Function(ProductError value)? error,
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

  String get message;
  @JsonKey(ignore: true)
  _$$ProductErrorCopyWith<_$ProductError> get copyWith =>
      throw _privateConstructorUsedError;
}
