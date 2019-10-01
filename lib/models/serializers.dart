import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:saied_hn/models/news_item.dart';

part 'serializers.g.dart';

@SerializersFor(
  const [
    NewsItem,
  ]
)
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();