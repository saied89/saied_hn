library news_item;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:saied_hn/models/serializers.dart';

part 'news_item.g.dart';

abstract class NewsItem implements Built<NewsItem, NewsItemBuilder> {
  NewsItem._();

  factory NewsItem([updates(NewsItemBuilder b)]) = _$NewsItem;

  @BuiltValueField(wireName: 'by')
  String get by;
  @BuiltValueField(wireName: 'descendants')
  int get descendants;
  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'kids')
  BuiltList<int> get kids;
  @BuiltValueField(wireName: 'score')
  int get score;
  @BuiltValueField(wireName: 'time')
  int get time;
  @BuiltValueField(wireName: 'title')
  String get title;
  @BuiltValueField(wireName: 'type')
  String get type;
  @BuiltValueField(wireName: 'url')
  String get url;
  String toJson() {
    return json.encode(serializers.serializeWith(NewsItem.serializer, this));
  }

  static NewsItem fromJson(String jsonString) {
    return serializers.deserializeWith(
        NewsItem.serializer, json.decode(jsonString));
  }

  static Serializer<NewsItem> get serializer => _$newsItemSerializer;
}
