import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'product_list_response.g.dart';

abstract class ProductListResponse implements Built<ProductListResponse, ProductListResponseBuilder> {

  String? get data;

  ProductListResponse._();

  factory ProductListResponse([Function(ProductListResponseBuilder b) updates]) = _$ProductListResponse;

  static Serializer<ProductListResponse> get serializer => _$productListResponseSerializer;


  Map<String, dynamic>? toJsonMap() {
    return serializers.serializeWith(ProductListResponse.serializer, this)
    as Map<String, dynamic>?;
  }

  String? toJson() {
    return json.encode(toJsonMap());
  }

  static ProductListResponse? fromJson(String data) {
    return serializers.deserializeWith(
      ProductListResponse.serializer,
      json.decode(data),
    );
  }

  static ProductListResponse? fromJsonMap(Map<String, dynamic> data) {
    return serializers.deserializeWith(ProductListResponse.serializer, data);
  }
}