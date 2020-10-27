/*Created By : Arjun Gautam
 *Date : 10/26/20
 *Time : 4:56 PM
 */
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/model/news.dart';
import 'package:news_api/widgets/newsWidget.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<News> newsData = new List();
  bool isLoading = true;

  getNewsData() async {
    try {
      var url =
          'http://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=4dffbce6213e42b0aa14f0887866d894';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);

        // log(jsonResponse['articles']);
        jsonResponse['articles'].forEach((v) {
          newsData.add(News.fromJson(v));
        });
        //  set state

        isLoading = false;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // log(e);
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
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: newsData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                      child: NewsWidget(
                        news: newsData[index],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    color: Colors.grey,
                  ),
                ),
              ),
      ),
    );
  }
}
