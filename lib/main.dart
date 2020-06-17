import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newsapp/screens/news_screen.dart';
import 'package:newsapp/utils/app_localizations.dart';
import 'package:newsapp/viewmodels/news_article_vm.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
        title: "News",
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xfffefdfd),
          appBarTheme: AppBarTheme(
            elevation: 0,
              color: Color(0xfffefdfd)),
              textTheme: TextTheme(
                title: TextStyle(color: Colors.black)
              ),
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          accentIconTheme: IconThemeData(
            color: Colors.black
          )
        ),
        home: MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) =>NewsArticleListViewModel(),
      )
    ],
    child: NewsScreen(),
    ),
    );
  }
}
