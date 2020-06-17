import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/utils/app_localizations.dart';
import 'package:newsapp/viewmodels/news_article_vm.dart';
import 'package:newsapp/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends  StatefulWidget{
  @override
  _NewsScreenState createState() => _NewsScreenState();
}



class _NewsScreenState extends State<NewsScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context,listen: false).topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var vm=Provider.of<NewsArticleListViewModel>(context);

   return Scaffold(
      appBar: AppBar(
       actions: <Widget>[
         Icon(Icons.more_vert)
       ],
      ),
      body:SafeArea(child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,top: 5,bottom: 5),
            child: Text(AppLocalizations.of(context).translate('title'),
            style: TextStyle(fontSize: 50),
            ),
          ),
          Divider(
            height: 40,
            thickness: 10,
            color: Colors.deepOrangeAccent,
            indent: 30,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30,top: 5,bottom: 5),
            child: Text(AppLocalizations.of(context).translate("headline"),style: TextStyle(fontSize:30,fontWeight: FontWeight.bold ),),
          )


          ,
          Expanded(
            child: _buildList(context,vm),
          ),
        ],
      ))
    );
  }

  Widget _buildList(BuildContext context,NewsArticleListViewModel vs) {
    switch (vs.loadingStatus) {
      case LoadingStatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.completed:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: NewsGrid(
            articles: vs.articles,
          ),
        );
      case LoadingStatus.empty:
      default:
        return Center(
          child: Text("No results found"),
        );
    }
  }
}