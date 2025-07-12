import 'package:built_value/serializer.dart';

class StringFromIntSerializer implements PrimitiveSerializer<String> {
  @override
  final Iterable<Type> types = const [String];

  @override
  final String wireName = 'StringFromInt';

  @override
  String deserialize(Serializers serializers, Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serialized.toString();
  }

  @override
  Object serialize(Serializers serializers, String value, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return value;
  }
}