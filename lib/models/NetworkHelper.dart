import 'package:http/http.dart' as http;
import 'package:saied_hn/models/news_item.dart';

String _getItemUrl(int id) =>
    'https://hacker-news.firebaseio.com/v0/item/$id.json';

Future<NewsItem> getNewsItem(int id) async {
  final res = await http.get(_getItemUrl(id));
  if (res.statusCode == 200) return NewsItem.fromJson(res.body);
  else throw Exception("Network Failure: Status: ${res.statusCode}");
}
