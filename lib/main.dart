import 'package:flutter/material.dart';
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
    17392995,
    17397852,
    17395342,
    17385291,
    17387851,
    17395675,
    17387438,
    17393560,
    17391971,
    17392455,
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
          return Text(id.toString());
        }).toList(),
      ), );
  }
}
