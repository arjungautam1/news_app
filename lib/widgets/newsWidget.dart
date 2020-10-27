/*Created By : Arjun Gautam
 *Date : 10/27/20
 *Time : 8:17 AM
 */
import 'package:flutter/material.dart';
import 'package:news_api/model/news.dart';

class NewsWidget extends StatelessWidget {
  News news;

  NewsWidget({this.news});

  getDescription(String description) {
    if (description != null) {
      return Text(description);
    } else {
      return SizedBox.shrink();
    }
  }
  getImage(String imageUrl){
    if(imageUrl !=null){
      return Image.network(imageUrl);
    }
    else{
      return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          news.title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: getDescription(news.description),
                  )),
              Expanded(flex: 1, child:getImage(news.urlToImage)),
            ],
          ),
        ),
      ],
    );
  }
}
