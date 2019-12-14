import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:saied_hn/hn_bloc.dart';
import 'package:saied_hn/models/news_item.dart';

void main() {
  final hnBloc = HackerNewsBloc();
  runApp(MyApp(bloc: hnBloc));
}

class MyApp extends StatelessWidget {
  final HackerNewsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Hacker News',
        bloc: bloc,
      ),
    );
  }

  MyApp({this.bloc});
}

class MyHomePage extends StatefulWidget {
  final HackerNewsBloc bloc;

  MyHomePage({Key key, this.title, this.bloc}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  Future<NewsItem> _getNewItem(int id) {
//
//  }

  var _currentTab = 0;

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<UnmodifiableListView<NewsItem>>(
        initialData: UnmodifiableListView([]),
        stream: widget.bloc.articles,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done)
            return ListView(children: snapshot.data.map(_buildItem).toList());
          else if(snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else return Center(child: Text("Error: ${snapshot.error}", style: TextStyle(color: Colors.red),));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), title: Text("Top Stories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.new_releases), title: Text("New Stories"))
        ],
        onTap: (i) {
          if (i == 0)
            widget.bloc.storiesType.add(StoriesType.topStories);
          else
            widget.bloc.storiesType.add(StoriesType.newStories);
          setState(() {
            _currentTab = i;
          });
        },
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
