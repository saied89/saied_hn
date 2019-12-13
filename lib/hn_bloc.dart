import 'dart:async';
import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:saied_hn/models/NetworkHelper.dart';
import 'package:saied_hn/models/news_item.dart';

const List<int> _newIds = [
  21660718,
  21647398,
  21652888,
  21651610,
  21657930,
  21648633
];

const List<int> _topIds = [
  21655958,
  21667355,
  21665125,
  21649495,
  21647038,
];

extension StoryIds on StoriesType {
  List<int> get ids => this == StoriesType.topStories ? _topIds : _newIds;
}

enum StoriesType { topStories, newStories }

class HackerNewsBloc {
  final _storiesTypeController = StreamController<StoriesType>();

  final _subject = BehaviorSubject<UnmodifiableListView<NewsItem>>();

  Stream<List<NewsItem>> get articles => _subject.stream;

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;

  HackerNewsBloc() {
    _storiesTypeController.stream.listen(_getArticles);
  }

  _getArticles(StoriesType type) {
    Future.wait(type.ids.map(getNewsItem)).then((list) {
      _subject.add(UnmodifiableListView(list));
    });
  }

  dispose() {
    _storiesTypeController.close();
  }
}
