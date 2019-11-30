import 'package:flutter/material.dart';
import 'package:saied_hn/models/NetworkHelper.dart';
import 'package:saied_hn/models/news_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _ids = [
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

//  Future<NewsItem> _getNewItem(int id) {
//
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _ids.map((id) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: getNewsItem(id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done)
                  try {
                    return _buildItem(snapshot.data);
                  } catch (err) {
                    return Text(err.toString(), style: TextStyle(color: Colors.red),);
                  }
                else
                  return Center(child: CircularProgressIndicator());
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildItem(NewsItem item) {
    return ExpansionTile(
      title: Text(item.title),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.launch),
            Text(item.type),
          ],
        )
      ],
    );
  }
}
