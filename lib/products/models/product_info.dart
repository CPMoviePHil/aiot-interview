import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'product_info.g.dart';

abstract class ProductInfo implements Built<ProductInfo, ProductInfoBuilder> {

  @BuiltValueField(wireName: "martId")
  String get productId;

  @BuiltValueField(wireName: "finalPrice")
  int? get productFinalPrice;

  @BuiltValueField(wireName: "martName")
  String? get productMarketName;

  @BuiltValueField(wireName: "stockAvailable")
  int? get productStockNumber;

  @BuiltValueField(wireName: "price")
  int? get productPrice;

  @BuiltValueField(wireName: "martShortName")
  String? get productMarketShortName;

  @BuiltValueField(wireName: "imageUrl")
  String? get productImage;

  ProductInfo._();

  factory ProductInfo([Function(ProductInfoBuilder b) updates]) = _$ProductInfo;

  static Serializer<ProductInfo> get serializer => _$productInfoSerializer;


  Map<String, dynamic>? toJsonMap() {
    return serializers.serializeWith(ProductInfo.serializer, this) as Map<String, dynamic>?;
  }

  String? toJson() {
    return json.encode(toJsonMap());
  }

  static ProductInfo? fromJson(String data) {
    return serializers.deserializeWith(
      ProductInfo.serializer,
      json.decode(data),
    );
  }

  static ProductInfo? fromJsonMap(Map<String, dynamic> data) {
    return serializers.deserializeWith(ProductInfo.serializer, data);
  }
}