import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';

import 'product_info.dart';
import 'product_list_response.dart';

part 'serializers.g.dart';

@SerializersFor([
  ProductInfo,
  ProductListResponse
])

final Serializers serializers = (_$serializers.toBuilder()
  ..addBuilderFactory(
    const FullType(
      BuiltList,
      [FullType(ProductInfo)],
    ), () => ListBuilder<ProductInfo>(),
  )
  ..addPlugin(StandardJsonPlugin())
).build();