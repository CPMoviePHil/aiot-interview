// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductInfo> _$productInfoSerializer = _$ProductInfoSerializer();

class _$ProductInfoSerializer implements StructuredSerializer<ProductInfo> {
  @override
  final Iterable<Type> types = const [ProductInfo, _$ProductInfo];
  @override
  final String wireName = 'ProductInfo';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ProductInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'martId',
      serializers.serialize(
        object.productId,
        specifiedType: const FullType(String),
      ),
    ];
    Object? value;
    value = object.productFinalPrice;
    if (value != null) {
      result
        ..add('finalPrice')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.productMarketName;
    if (value != null) {
      result
        ..add('martName')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.productStockNumber;
    if (value != null) {
      result
        ..add('stockAvailable')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.productPrice;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.productMarketShortName;
    if (value != null) {
      result
        ..add('martShortName')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.productImage;
    if (value != null) {
      result
        ..add('imageUrl')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  ProductInfo deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProductInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'martId':
          result.productId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'finalPrice':
          result.productFinalPrice =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'martName':
          result.productMarketName =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'stockAvailable':
          result.productStockNumber =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'price':
          result.productPrice =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'martShortName':
          result.productMarketShortName =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'imageUrl':
          result.productImage =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductInfo extends ProductInfo {
  @override
  final String productId;
  @override
  final int? productFinalPrice;
  @override
  final String? productMarketName;
  @override
  final int? productStockNumber;
  @override
  final int? productPrice;
  @override
  final String? productMarketShortName;
  @override
  final String? productImage;

  factory _$ProductInfo([void Function(ProductInfoBuilder)? updates]) =>
      (ProductInfoBuilder()..update(updates))._build();

  _$ProductInfo._({
    required this.productId,
    this.productFinalPrice,
    this.productMarketName,
    this.productStockNumber,
    this.productPrice,
    this.productMarketShortName,
    this.productImage,
  }) : super._();
  @override
  ProductInfo rebuild(void Function(ProductInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductInfoBuilder toBuilder() => ProductInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductInfo &&
        productId == other.productId &&
        productFinalPrice == other.productFinalPrice &&
        productMarketName == other.productMarketName &&
        productStockNumber == other.productStockNumber &&
        productPrice == other.productPrice &&
        productMarketShortName == other.productMarketShortName &&
        productImage == other.productImage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, productFinalPrice.hashCode);
    _$hash = $jc(_$hash, productMarketName.hashCode);
    _$hash = $jc(_$hash, productStockNumber.hashCode);
    _$hash = $jc(_$hash, productPrice.hashCode);
    _$hash = $jc(_$hash, productMarketShortName.hashCode);
    _$hash = $jc(_$hash, productImage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductInfo')
          ..add('productId', productId)
          ..add('productFinalPrice', productFinalPrice)
          ..add('productMarketName', productMarketName)
          ..add('productStockNumber', productStockNumber)
          ..add('productPrice', productPrice)
          ..add('productMarketShortName', productMarketShortName)
          ..add('productImage', productImage))
        .toString();
  }
}

class ProductInfoBuilder implements Builder<ProductInfo, ProductInfoBuilder> {
  _$ProductInfo? _$v;

  String? _productId;
  String? get productId => _$this._productId;
  set productId(String? productId) => _$this._productId = productId;

  int? _productFinalPrice;
  int? get productFinalPrice => _$this._productFinalPrice;
  set productFinalPrice(int? productFinalPrice) =>
      _$this._productFinalPrice = productFinalPrice;

  String? _productMarketName;
  String? get productMarketName => _$this._productMarketName;
  set productMarketName(String? productMarketName) =>
      _$this._productMarketName = productMarketName;

  int? _productStockNumber;
  int? get productStockNumber => _$this._productStockNumber;
  set productStockNumber(int? productStockNumber) =>
      _$this._productStockNumber = productStockNumber;

  int? _productPrice;
  int? get productPrice => _$this._productPrice;
  set productPrice(int? productPrice) => _$this._productPrice = productPrice;

  String? _productMarketShortName;
  String? get productMarketShortName => _$this._productMarketShortName;
  set productMarketShortName(String? productMarketShortName) =>
      _$this._productMarketShortName = productMarketShortName;

  String? _productImage;
  String? get productImage => _$this._productImage;
  set productImage(String? productImage) => _$this._productImage = productImage;

  ProductInfoBuilder();

  ProductInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _productId = $v.productId;
      _productFinalPrice = $v.productFinalPrice;
      _productMarketName = $v.productMarketName;
      _productStockNumber = $v.productStockNumber;
      _productPrice = $v.productPrice;
      _productMarketShortName = $v.productMarketShortName;
      _productImage = $v.productImage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductInfo other) {
    _$v = other as _$ProductInfo;
  }

  @override
  void update(void Function(ProductInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductInfo build() => _build();

  _$ProductInfo _build() {
    final _$result =
        _$v ??
        _$ProductInfo._(
          productId: BuiltValueNullFieldError.checkNotNull(
            productId,
            r'ProductInfo',
            'productId',
          ),
          productFinalPrice: productFinalPrice,
          productMarketName: productMarketName,
          productStockNumber: productStockNumber,
          productPrice: productPrice,
          productMarketShortName: productMarketShortName,
          productImage: productImage,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
