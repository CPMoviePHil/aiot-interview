// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductListResponse> _$productListResponseSerializer =
    _$ProductListResponseSerializer();

class _$ProductListResponseSerializer
    implements StructuredSerializer<ProductListResponse> {
  @override
  final Iterable<Type> types = const [
    ProductListResponse,
    _$ProductListResponse,
  ];
  @override
  final String wireName = 'ProductListResponse';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ProductListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  ProductListResponse deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ProductListResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data =
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

class _$ProductListResponse extends ProductListResponse {
  @override
  final String? data;

  factory _$ProductListResponse([
    void Function(ProductListResponseBuilder)? updates,
  ]) => (ProductListResponseBuilder()..update(updates))._build();

  _$ProductListResponse._({this.data}) : super._();
  @override
  ProductListResponse rebuild(
    void Function(ProductListResponseBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ProductListResponseBuilder toBuilder() =>
      ProductListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductListResponse && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'ProductListResponse',
    )..add('data', data)).toString();
  }
}

class ProductListResponseBuilder
    implements Builder<ProductListResponse, ProductListResponseBuilder> {
  _$ProductListResponse? _$v;

  String? _data;
  String? get data => _$this._data;
  set data(String? data) => _$this._data = data;

  ProductListResponseBuilder();

  ProductListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductListResponse other) {
    _$v = other as _$ProductListResponse;
  }

  @override
  void update(void Function(ProductListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductListResponse build() => _build();

  _$ProductListResponse _build() {
    final _$result = _$v ?? _$ProductListResponse._(data: data);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
