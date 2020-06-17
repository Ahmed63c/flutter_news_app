
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/news_article.dart';
import 'package:newsapp/screens/news_article_detail_screen.dart';
import 'package:newsapp/viewmodels/news_article_vm.dart';

import 'circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticle> articles;

  NewsGrid({this.articles});

  void _showNewsArticleDetails(BuildContext context, NewsArticle vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsArticleDetailScreen(
        article: vm,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: this.articles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
          (MediaQuery.of(context).orientation == Orientation.portrait)
              ? 2
              : 3),
      itemBuilder: (BuildContext _, int index) {
        final article = this.articles[index];

        return GestureDetector(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          child: GridTile(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: CircleImage(
                imageUrl: article.urlToImage,
              ),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Text(
                article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }
}