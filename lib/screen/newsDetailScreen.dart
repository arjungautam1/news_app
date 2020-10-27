/*Created By : Arjun Gautam
 *Date : 10/27/20
 *Time : 2:07 PM
 */
import 'package:flutter/material.dart';
import 'package:news_api/model/news.dart';

class NewsDetailScreen extends StatelessWidget {
  News news;

  NewsDetailScreen({this.news});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detailed News'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                'By ' + news.author,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
              child: Text(
                'Last updated on ' + news.publishedAt,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(news.description),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image.network(news.urlToImage),
            ),
          ],
        ),
      ),
    );
  }
}
