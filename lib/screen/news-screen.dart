/*Created By : Arjun Gautam
 *Date : 10/26/20
 *Time : 4:56 PM
 */
import 'dart:convert' as convert;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/model/news.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<News> newsData = new List();

  getNewsData() async {
    try {
      var url =
          'http://newsapi.org/v2/everything?q=bitcoin&from=2020-09-26&sortBy=publishedAt&apiKey=4dffbce6213e42b0aa14f0887866d894';

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);

        // log(jsonResponse['articles']);
        jsonResponse['articles'].forEach((v) {
          log(v.toString());
        });
        log("Api call is success");
        log(response.body);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      log(e);
    }
  }

  @override
  void initState() {
    getNewsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('News Screen'),
        ),
        body: Center(
          child: Text(
            "Hello this is news screen page. ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
