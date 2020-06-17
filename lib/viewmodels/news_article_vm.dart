import 'package:flutter/material.dart';
import 'package:newsapp/models/news_article.dart';
import 'package:newsapp/services/web_service.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticle> articles = new List<NewsArticle>();

  void topHeadlines() async {
    this.loadingStatus = LoadingStatus.searching;
    List<NewsArticle> newsArticle = await WebService().fetchTopHeadlines();
    notifyListeners();
    this.articles=newsArticle;
    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
      print("completed");
    }

    notifyListeners();
  }
}
