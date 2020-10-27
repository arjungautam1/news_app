import 'package:flutter/material.dart';
import 'package:news_api/screen/news-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  NewsScreen();
    //   // floatingActionButton: InkWell(
    //   //   onTap: () {
    //   //     Navigator.push(context,
    //   //         MaterialPageRoute(builder: (BuildContext context) {
    //   //       return NewsScreen();
    //   //     }));
    //   //   },
    //   //   child: FloatingActionButton(
    //   //     child: Icon(Icons.add_comment),
    //   //   ),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}
