import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:saied_hn/models/NetworkHelper.dart';
import 'package:saied_hn/models/news_item.dart';

class HackerNewsBloc {

  HackerNewsBloc() {
    getArticles();
  }

  final _articleSubject = BehaviorSubject<UnmodifiableListView<NewsItem>>();

  Stream<List<NewsItem>> get articles => _articleSubject.stream;

  final List<int> _ids = [
    21655958,
    21667355,
    21665125,
    21649495,
    21647038,
    21660718,
    21647398,
    21652888,
    21651610,
    21657930,
    21648633
  ];

  getArticles() {
    Future.wait(_ids.map(getNewsItem)).then((list) {
      _articleSubject.add(UnmodifiableListView(list));
    });
  }

  dispose() {
    _articleSubject.close();
  }
}
